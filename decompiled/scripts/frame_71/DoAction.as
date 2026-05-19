// ============================================================
// Arcuz coop — net bootstrap. Lives here (small frame) rather than
// in frame_3: that frame is ~32k lines and adding to it overflows
// its action/constant-pool limits and corrupts the SWF.
// ============================================================
if(_root.netCtrl == undefined)
{
   _root.netInbox = [];
   _root.netId = -1;
   _root.netIsHost = false;
   _root.netConnected = false;
   _root.netReady = false;
   _root.netDisabled = false;
   _root.netCell = "";
   _root.netTick = 0;
   _root.netAvatars = {};
   _root.netViewer = false;
   _root.netPlayerCount = 1;
   _root.netVfxReplaying = false;
   // Whitelist of self-contained, logic-free skill VFX safe to replay anywhere.
   _root.netVfx = {};
   _root.netVfx["魔法使用特效"] = 1;
   _root.netVfx["fireBallExpl"] = 1;
   _root.netVfx["神圣之光"] = 1;
   _root.netVfx["加血"] = 1;
   _root.netVfx["加魔"] = 1;
   _root.netVfx["全加"] = 1;
   _root.netVfx["加状态"] = 1;
   _root.netVfx["解毒"] = 1;
   _root.netSend = function(m)
   {
      if(_root.netConnected)
      {
         _root.netSock.send(m);
      }
   };
   _root.netConnect = function()
   {
      var s = new XMLSocket();
      _root.netSock = s;
      s.onData = function(raw)
      {
         _root.netInbox.push(raw);
      };
      s.onConnect = function(ok)
      {
         if(ok)
         {
            _root.netConnected = true;
            _root.netSock.send("HELLO|" + _root.netName);
         }
         else
         {
            _root.netDisabled = true;
         }
      };
      s.onClose = function()
      {
         _root.netConnected = false;
      };
      s.connect(_root.netHost,Number(_root.netPort));
   };
   _root.netAvatar = function(id, x, y, dir, anim, att, wpn, shd, hlm, wer, def, lvl, mcf2)
   {
      if(_root.netAvOn != "on" || id == _root.netId)
      {
         return;
      }
      var key = "a" + id;
      var av = _root.netAvatars[key];
      if(av == undefined || av._name == undefined)
      {
         av = _root.game.map.attachMovie("player","instanceAv" + id,_root.game.map.getNextHighestDepth());
         _root.netAvatars[key] = av;
         av.netDir = -1;
         av.netAnim = -1;
         // Make the puppet a valid target for the authority's enemy AI.
         av.netPlayerId = id;
         av.h = 50;
         av.defenceM = 1;
         av.hitAction = function(dmg, type, hitHT, attckLv)
         {
            var hh = hitHT == undefined ? 0 : hitHT;
            var al = attckLv == undefined ? 5 : attckLv;
            _root.netSend("DMG|" + this.netPlayerId + "|" + Math.round(dmg) + "|" + type + "|" + hh + "|" + al);
         };
      }
      av._x = x;
      av._y = y;
      av.att = att;
      av.defence = def;
      av.level = lvl;
      if(av.netDir != dir)
      {
         av.netDir = dir;
         av.gotoAndStop(dir);
      }
      if(av.netAnim != anim)
      {
         av.netAnim = anim;
         av.mc.gotoAndStop(anim);
      }
      av.mc._y = att;
      // Mirror the inner animation frame exactly, so the puppet doesn't
      // free-run (which looped attack swings ~twice).
      var body = av.mc.mc;
      body.gotoAndStop(mcf2);
      // Pin equipment clips every frame, like Player.setWear(), or they
      // free-run through every item in the game.
      if(body.weapon != undefined)
      {
         body.weapon.gotoAndStop(wpn);
         body.shield.gotoAndStop(shd);
         body.helmet.gotoAndStop(hlm);
         body.wear.gotoAndStop(wer);
         body.wear.gotoAndStop(body.wear._currentframe + body._currentframe - 1);
      }
      av.netLastSeen = _root.netTick;
   };
   _root.netFV = function(v)
   {
      var n = Number(v);
      return !isNaN(n) ? n : v;
   };
   _root.netRemovePuppet = function(id)
   {
      var key = "a" + id;
      if(_root.netAvatars[key] != undefined)
      {
         _root.netAvatars[key].removeMovieClip();
         delete _root.netAvatars[key];
      }
   };
   // Remove every puppet's clip, THEN drop the dict — clearing the dict
   // alone leaves orphaned, untracked clips standing in the world.
   _root.netClearPuppets = function()
   {
      for(var k in _root.netAvatars)
      {
         _root.netAvatars[k].removeMovieClip();
      }
      _root.netAvatars = {};
   };
   _root.netExpirePuppets = function()
   {
      for(var k in _root.netAvatars)
      {
         var av = _root.netAvatars[k];
         if(av._name == undefined)
         {
            delete _root.netAvatars[k];
         }
         else if(_root.netTick - av.netLastSeen > 45)
         {
            av.removeMovieClip();
            delete _root.netAvatars[k];
         }
      }
   };
   // ---- Phase 3: shared enemies ----------------------------
   // An enemy is a unit with totalHp set (excludes player / NPCs / obstacles).
   _root.netIsEnemy = function(u)
   {
      return u._name != "player" && u._name != undefined && u.hp != "obstacle" && u.totalHp != undefined;
   };
   // Authority: serialise every live enemy as  name:x:y:dir:anim , ';'-joined.
   _root.netBuildSnapshot = function()
   {
      var s = "";
      var ua = _root.game.unitManager.unitAll;
      var i = 0;
      while(i < ua.length)
      {
         var u = ua[i];
         if(_root.netIsEnemy(u))
         {
            if(s.length > 0)
            {
               s += ";";
            }
            s += u.netIndex + ":" + Math.round(u._x) + ":" + Math.round(u._y) + ":" + u._currentframe + ":" + u.mc._currentframe + ":" + Math.round(u.hp / u.totalHp * 100);
         }
         i++;
      }
      return s;
   };
   // Viewer: drive local (frozen) enemies from the authority's snapshot,
   // and drop any the authority no longer reports (killed / despawned).
   _root.netApplySnapshot = function(rest)
   {
      var ua = _root.game.unitManager.unitAll;
      var byIdx = {};
      var k = 0;
      while(k < ua.length)
      {
         if(_root.netIsEnemy(ua[k]))
         {
            byIdx[ua[k].netIndex] = ua[k];
         }
         k++;
      }
      var seen = {};
      var arr = rest.split(";");
      var i = 0;
      while(i < arr.length)
      {
         var f = arr[i].split(":");
         seen[f[0]] = true;
         var e = byIdx[f[0]];
         if(e != undefined && e._name != undefined)
         {
            e._x = Number(f[1]);
            e._y = Number(f[2]);
            var dr = Number(f[3]);
            if(dr != 9)
            {
               e.gotoAndStop(dr);
               e.mc.gotoAndStop(Number(f[4]));
            }
            var hpct = Number(f[5]);
            if(e.netHpPct != undefined && hpct < e.netHpPct)
            {
               _root.netShowEnemyHp(e);
            }
            e.netHpPct = hpct;
         }
         i++;
      }
      var j = ua.length - 1;
      while(j >= 0)
      {
         var u = ua[j];
         if(u.netFrozen == true && seen[u.netIndex] != true)
         {
            // The enemy died on the authority — roll our own loot for it
            // (independent per-player drops), then clear it.
            u.dropSth();
            if(u.netHpBar != undefined)
            {
               u.netHpBar.removeMovieClip();
            }
            _root.game.delUnit(u);
            u.removeMovieClip();
         }
         j--;
      }
   };
   // Viewer-side enemy health bar (the real one is spawned by Enemy.hitAction,
   // which a frozen enemy never runs). Bar scale tracks the synced HP %.
   _root.netShowEnemyHp = function(e)
   {
      if(e._quality == "LOW")
      {
         return;
      }
      var b = e.netHpBar;
      if(b == undefined || b._x == undefined)
      {
         b = _root.game.map.attachMovie("enemyHpShow","netHp" + e._name,_root.game.map.getNextHighestDepth());
         e.netHpBar = b;
         b.name.text = "Lv." + e.level + " " + e.enemyName;
         b.link = e;
         b.onEnterFrame = function()
         {
            this._x = this.link._x;
            this._y = this.link._y + this.link.mc._y - this.link.hitMc._height;
            this.bar._xscale = this.link.netHpPct;
            if(--this.counter < 0)
            {
               this.removeMovieClip();
            }
         };
      }
      b.bar._xscale = e.netHpPct;
      b.counter = 70;
   };
   // Viewer: kill an enemy's AI so it only moves under snapshot control.
   _root.netFreezeEnemies = function()
   {
      var ua = _root.game.unitManager.unitAll;
      var i = 0;
      while(i < ua.length)
      {
         var u = ua[i];
         if(_root.netIsEnemy(u) && u.netFrozen != true)
         {
            u.netFrozen = true;
            // Keep the real AI tick so promotion to authority can restore it.
            u.netSavedEf = u.enterframe;
            u.enterframe = function(){};
            u.action = function(){};
            // A viewer's hit doesn't apply locally — it's sent to the authority,
            // which damages the real enemy; the result returns via the snapshot.
            u.hitAction = function(dmg, type, hitHT, attckLv)
            {
               var hh = hitHT == undefined ? 0 : hitHT;
               var al = attckLv == undefined ? 5 : attckLv;
               _root.netSend("CMD|HIT|" + this.netIndex + "|" + Math.round(dmg) + "|" + type + "|" + hh + "|" + al);
               this.showHitHp(Math.round(dmg),type);
               _root.netShowEnemyHp(this);
            };
         }
         i++;
      }
   };
   // Promotion to authority: give frozen enemies their AI back.
   _root.netRearmEnemies = function()
   {
      var ua = _root.game.unitManager.unitAll;
      var i = 0;
      while(i < ua.length)
      {
         var u = ua[i];
         if(u.netFrozen == true)
         {
            u.netFrozen = false;
            u.enterframe = u.netSavedEf;
            delete u.action;
            delete u.hitAction;
            u.action();
         }
         i++;
      }
   };
   // Authority: per-enemy targeting. Each enemy's AI tick runs with
   // map.player swapped to whichever player (real or remote puppet) is
   // nearest to it, so the unchanged AI chases/hits the right one. The
   // swap is restored immediately, so camera/input still see the real player.
   _root.netNearestPlayer = function(enemy, real)
   {
      var best = real;
      var dx = real._x - enemy._x;
      var dy = real._y - enemy._y;
      var bd = dx * dx + dy * dy;
      for(var k in _root.netAvatars)
      {
         var av = _root.netAvatars[k];
         if(av._name != undefined)
         {
            dx = av._x - enemy._x;
            dy = av._y - enemy._y;
            var d = dx * dx + dy * dy;
            if(d < bd)
            {
               bd = d;
               best = av;
            }
         }
      }
      return best;
   };
   _root.netEnemyWrap = function()
   {
      // A dying enemy: run its death code unswapped so kill XP / level
      // scaling resolve against the real local player, not a puppet.
      if(this.hp <= 0)
      {
         this.netAiFrame();
         return;
      }
      var real = _root.game.map.player;
      _root.game.map.player = _root.netNearestPlayer(this,real);
      this.netAiFrame();
      _root.game.map.player = real;
   };
   _root.netWrapEnemies = function()
   {
      if(_root.netEnemyOn != "on" || _root.netViewer)
      {
         return;
      }
      var ua = _root.game.unitManager.unitAll;
      var i = 0;
      while(i < ua.length)
      {
         var u = ua[i];
         if(_root.netIsEnemy(u) && u.enterframe != undefined && u.enterframe != _root.netEnemyWrap)
         {
            u.netAiFrame = u.enterframe;
            u.enterframe = _root.netEnemyWrap;
         }
         i++;
      }
   };
   // ---- Shared item box ------------------------------------
   // Serialise an item to/from the game's own save format (param array +
   // trailing times). No Item-class surgery; reuses getItem/fresh.
   _root.netItemToBlob = function(it)
   {
      it.setParam();
      var p = it.param.concat([it.times != undefined ? it.times : "c"]);
      return p.join("~");
   };
   _root.netItemFromBlob = function(blob)
   {
      var p = blob.split("~");
      var i = 0;
      while(i < p.length)
      {
         p[i] = _root.netFV(p[i]);
         i++;
      }
      var c = p[0];
      var it;
      if(c == "Weapon")
      {
         it = new Weapon(p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8],p[9],p[10],p[11],p[12],p[13]);
      }
      else if(c == "Armor")
      {
         it = new Armor(p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8],p[9],p[10],p[11],p[12],p[13]);
      }
      else if(c == "Helmet")
      {
         it = new Helmet(p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8],p[9],p[10],p[11],p[12],p[13]);
      }
      else if(c == "Glove")
      {
         it = new Glove(p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8],p[9],p[10],p[11],p[12],p[13]);
      }
      else if(c == "Boots")
      {
         it = new Boots(p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8],p[9],p[10],p[11],p[12],p[13]);
      }
      else if(c == "Shield")
      {
         it = new Shield(p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8],p[9],p[10],p[11],p[12],p[13]);
      }
      else if(c == "Wear")
      {
         it = new Wear(p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8],p[9],p[10],p[11],p[12],p[13]);
      }
      else if(c == "Belt")
      {
         it = new Belt(p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8],p[9],p[10],p[11],p[12],p[13]);
      }
      else if(c == "Bracelet")
      {
         it = new Bracelet(p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8],p[9],p[10],p[11],p[12],p[13]);
      }
      else if(c == "Necklace")
      {
         it = new Necklace(p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8],p[9],p[10],p[11],p[12],p[13]);
      }
      else if(c == "Ring")
      {
         it = new Ring(p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8],p[9],p[10],p[11],p[12],p[13]);
      }
      else if(c == "Potion")
      {
         it = new Potion(p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8],p[9],p[10],p[11],p[12],p[13]);
      }
      else if(c == "Crystal")
      {
         it = new Crystal(p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8],p[9],p[10],p[11],p[12],p[13]);
      }
      else if(c == "Book")
      {
         it = new Book(p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8],p[9],p[10],p[11],p[12],p[13]);
      }
      else if(c == "Teleporter")
      {
         it = new Teleporter(p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8],p[9],p[10],p[11],p[12],p[13]);
      }
      else if(c == "QuestItem")
      {
         it = new QuestItem(p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8],p[9],p[10],p[11],p[12],p[13]);
      }
      if(p[p.length - 1] != "c")
      {
         it.times = p[p.length - 1];
      }
      return it;
   };
   // G in the open inventory: hovering a bag item deposits it to the shared
   // box; over empty space, withdraws the next item from the box.
   _root.netStashAction = function()
   {
      var pl = _root.game.map.player;
      var n = 20;
      var found = -1;
      while(n < pl.inventoryList.length)
      {
         var clip = _root.ui["item" + n];
         if(clip._name != undefined && pl.inventoryList[n] != undefined && clip.hitTest(_root._xmouse,_root._ymouse,true))
         {
            found = n;
            break;
         }
         n++;
      }
      if(found >= 0)
      {
         _root.netSend("STASHADD|" + _root.netItemToBlob(pl.inventoryList[found]));
         pl.inventoryList[found] = undefined;
         var dc = _root.ui["item" + found];
         dc.itemInfo.loader.removeMovieClip();
         dc.removeMovieClip();
         pl.calcWeight();
         _root.ui.dlgInv.fresh();
         _root.newMessage("Item sent to the shared box");
      }
      else
      {
         _root.netSend("STASHTAKE");
      }
   };
   _root.applyNet = function(t, rest)
   {
      if(t == "AV")
      {
         var p = rest.split("|");
         _root.netAvatar(Number(p[0]),Number(p[1]),Number(p[2]),Number(p[3]),Number(p[4]),Number(p[5]),_root.netFV(p[6]),_root.netFV(p[7]),_root.netFV(p[8]),_root.netFV(p[9]),Number(p[10]),Number(p[11]),Number(p[12]));
      }
      else if(t == "LEFT" || t == "UNVIEW")
      {
         _root.netRemovePuppet(Number(rest));
      }
      else if(t == "SNAP")
      {
         if(_root.netViewer && _root.netEnemyOn == "on")
         {
            var sc = rest.indexOf("|");
            if(rest.substring(0,sc) == _root.netCell)
            {
               _root.netApplySnapshot(rest.substring(sc + 1));
            }
         }
      }
      else if(t == "CMD")
      {
         if(_root.netEnemyOn == "on" && !_root.netViewer)
         {
            var c = rest.split("|");
            if(c[1] == "HIT")
            {
               var en = _root.game.map["e" + c[2]];
               if(en._name != undefined && en.hp > 0)
               {
                  en.hitAction(Number(c[3]),c[4],Number(c[5]),Number(c[6]));
               }
            }
         }
      }
      else if(t == "DMG")
      {
         if(_root.netEnemyOn == "on" && _root.game.map.player._name != undefined)
         {
            var d = rest.split("|");
            _root.game.map.player.hitAction(Number(d[0]),d[1],Number(d[2]),Number(d[3]));
         }
      }
      else if(t == "EV")
      {
         var e = rest.split("|");
         if(e[1] == "kill" && _root.netEnemyOn == "on")
         {
            var ql = _root.game.map.player.questList;
            for(var qi in ql)
            {
               if(ql[qi].statu != "Completed!")
               {
                  ql[qi].update(e[2]);
               }
            }
            _root.game.map.player.getExp(Number(e[3]));
            // Keep every player's deadList identical, so createEnemy culls
            // the same enemies on re-entry regardless of who's authority.
            var dl = _root.game.deadList[Number(e[4])];
            if(dl != undefined)
            {
               dl.push(e[5]);
            }
         }
         else if(e[1] == "vfx" && _root.netVfxOn == "on" && e[2] == _root.netCell)
         {
            _root.netVfxReplaying = true;
            var vd = _root.game.map.getNextHighestDepth();
            _root.game.map.attachMovie(e[3],"netVfx" + vd,vd,{_x:Number(e[4]),_y:Number(e[5])});
            _root.netVfxReplaying = false;
         }
      }
   };
   _root.applyNetBoot = function(m)
   {
      var cut = m.indexOf("|");
      var t = cut == -1 ? m : m.substring(0,cut);
      var rest = cut == -1 ? "" : m.substring(cut + 1);
      if(t == "ID")
      {
         var p = rest.split("|");
         _root.netId = Number(p[0]);
         _root.netIsHost = p[1] == "1";
         _root.netReady = true;
      }
      else if(t == "STORY")
      {
         _root.netStory = rest;
      }
      else if(t == "STASHALL")
      {
         _root.netStash = rest;
      }
      else if(t == "STASHGOT")
      {
         _root.game.map.player.getItem(_root.netItemFromBlob(rest));
      }
      else if(t == "STASHEMPTY")
      {
         _root.newMessage("The shared box is empty");
      }
      else if(t == "ROSTER")
      {
         _root.netRoster = rest;
         var rc = rest.split("\"id\":").length - 1;
         _root.netPlayerCount = rc >= 1 ? rc : 1;
      }
      else if(t == "JOIN")
      {
         _root.netPlayerCount = _root.netPlayerCount + 1;
      }
      else if(t == "LEFT")
      {
         if(_root.netPlayerCount > 1)
         {
            _root.netPlayerCount = _root.netPlayerCount - 1;
         }
         _root.applyNet(t,rest);
      }
      else if(t == "AUTH")
      {
         var wasV = _root.netViewer;
         _root.netViewer = rest.substring(0,1) == "0";
         if(wasV && !_root.netViewer)
         {
            _root.netRearmEnemies();
         }
      }
      else if(t == "BECOMEAUTH")
      {
         if(_root.netViewer)
         {
            _root.netViewer = false;
            _root.netRearmEnemies();
         }
      }
      else
      {
         _root.applyNet(t,rest);
      }
   };
   // Stop the engine's stage culling from touching frozen (puppet) enemies —
   // they live wherever the snapshot says, not where the local camera is.
   if(_global.Game != undefined && _global.Game.prototype.netHook != true)
   {
      _global.Game.prototype.netHook = true;
      _global.Game.prototype.checkInStageOrig = _global.Game.prototype.checkInStage;
      _global.Game.prototype.checkInStage = function(unit)
      {
         if(unit.netFrozen == true)
         {
            return;
         }
         // Authority: never let an active enemy go off-stage. The engine's
         // camera-keyed culling sends it to frame 9 (a bodyless husk), which
         // desyncs viewers — notably fast/jumping enemies leaping out of view.
         if(_root.netEnemyOn == "on" && !_root.netViewer && unit.inStage && unit._name != "player" && unit.totalHp != undefined)
         {
            return;
         }
         this.checkInStageOrig(unit);
      };
   }
   // Re-wrap enemy AI enterframes immediately before each game loop, so the
   // per-enemy player swap is always in place when the loop ticks enemies.
   if(_global.Game != undefined && _global.Game.prototype.netHook2 != true)
   {
      _global.Game.prototype.netHook2 = true;
      _global.Game.prototype.mainLoopOrig = _global.Game.prototype.mainLoop;
      _global.Game.prototype.mainLoop = function()
      {
         this.mainLoopOrig();
         var gl = this.onEnterFrame;
         this.onEnterFrame = function()
         {
            _root.netWrapEnemies();
            gl.apply(this);
         };
      };
   }
   // Shared quests: the authority broadcasts every enemy kill so each
   // player's matching quests advance, even though the enemy (shared) can
   // only physically be killed once.
   if(_global.Enemy != undefined && _global.Enemy.prototype.netHook3 != true)
   {
      _global.Enemy.prototype.netHook3 = true;
      _global.Enemy.prototype.hitActionOrig = _global.Enemy.prototype.hitAction;
      _global.Enemy.prototype.hitAction = function(dmg, type, hitHT, attckLv, addDmg, criticalRate)
      {
         var wasAlive = this.hp > 0;
         var nm = this.enemyName;
         var lv = this.level;
         var xp = this.exp;
         var ar = _root.game.map.areaName;
         var dk = _root.game.map.mapName + "_" + this.setPoint[0] + "_" + this.setPoint[1];
         this.hitActionOrig(dmg,type,hitHT,attckLv,addDmg,criticalRate);
         if(wasAlive && this.hp <= 0 && _root.netConnected && _root.netEnemyOn == "on" && !_root.netViewer && nm != undefined)
         {
            _root.netSend("EV|kill|" + nm + lv + "|" + Math.round(xp) + "|" + ar + "|" + dk);
         }
      };
   }
   // Catch skill VFX wherever they're attached, and broadcast (cell-scoped)
   // so co-located players see each other's casts/finishers/buffs.
   if(MovieClip.prototype.netVfxHook != true)
   {
      MovieClip.prototype.netVfxHook = true;
      MovieClip.prototype.netAttachOrig = MovieClip.prototype.attachMovie;
      MovieClip.prototype.attachMovie = function(sym, nm, dp, io)
      {
         var clip = this.netAttachOrig(sym,nm,dp,io);
         if(clip != undefined)
         {
            // Stable spawn-point id for enemies. setPoint is the enemy's
            // map-defined origin — identical on every client regardless of
            // build order or deadList state, so snapshots key consistently.
            if(clip.setPoint != undefined && clip.hp != "obstacle")
            {
               clip.netIndex = clip.setPoint[0] + "_" + clip.setPoint[1];
               _root.game.map["e" + clip.netIndex] = clip;
            }
            if(_root.netConnected && _root.netVfxOn == "on" && !_root.netVfxReplaying && _root.netVfx[sym] == 1)
            {
               var pt = {x:clip._x,y:clip._y};
               this.localToGlobal(pt);
               _root.game.map.globalToLocal(pt);
               _root.netSend("EV|vfx|" + _root.netCell + "|" + sym + "|" + Math.round(pt.x) + "|" + Math.round(pt.y));
            }
         }
         return clip;
      };
   }
   // Preserve deadList across area changes while online. The engine wipes
   // the left area's deadList every time you leave it (single-player
   // respawn-on-revisit behaviour) — that desynced enemy sets between
   // players after a death. Save the leaving area's list and put it back.
   if(_global.Map != undefined && _global.Map.prototype.netHookCM != true)
   {
      _global.Map.prototype.netHookCM = true;
      _global.Map.prototype.changeMapOrig = _global.Map.prototype.changeMap;
      _global.Map.prototype.changeMap = function(mapObj, dir)
      {
         var a = Number(this.areaName);
         var saved = _root.game.deadList[a];
         this.changeMapOrig(mapObj,dir);
         if(_root.netConnected)
         {
            _root.game.deadList[a] = saved;
         }
      };
   }
   loadVariables("netcfg.txt",_root);
   _root.netCtrl = _root.createEmptyMovieClip("netCtrl",_root.getNextHighestDepth());
   _root.netCtrl.tries = 0;
   _root.netCtrl.onEnterFrame = function()
   {
      if(!_root.netDisabled && _root.netSock == undefined)
      {
         if(_root.netHost != undefined && _root.netHost != "")
         {
            _root.netConnect();
         }
         else if(++this.tries > 120)
         {
            _root.netDisabled = true;
         }
      }
      while(_root.netInbox.length > 0)
      {
         _root.applyNetBoot(_root.netInbox.shift());
      }
      _root.netTick = _root.netTick + 1;
      // A death reloads the whole game (new Game instance). Detect that and
      // force a cell re-registration so authority re-evaluates and the
      // reloaded player rejoins as a viewer (snapshot reconciles its enemies).
      if(_root.game != _root.netLastGame)
      {
         _root.netLastGame = _root.game;
         _root.netCell = "";
      }
      if(_root.netConnected && _root.netCellOn == "on" && _root.game.map.areaName != undefined)
      {
         var ck = _root.game.map.areaName + "_" + _root.game.map.mapName;
         if(ck != _root.netCell)
         {
            _root.netCell = ck;
            _root.netSend("CELL|" + ck);
            _root.netClearPuppets();
         }
      }
      if(_root.netConnected && _root.netBcastOn == "on" && _root.game.map.player._name != undefined)
      {
         var pl = _root.game.map.player;
         _root.netSend("AV|" + Math.round(pl._x) + "|" + Math.round(pl._y) + "|" + pl._currentframe + "|" + pl.mc._currentframe + "|" + Math.round(pl.att) + "|" + pl.weaponFrame + "|" + pl.shieldFrame + "|" + pl.helmetFrame + "|" + pl.wearFrame + "|" + pl.defence + "|" + pl.level + "|" + pl.mc.mc._currentframe);
         _root.netExpirePuppets();
      }
      if(_root.netConnected && _root.netEnemyOn == "on" && _root.game.map.player._name != undefined)
      {
         if(_root.netViewer)
         {
            _root.netFreezeEnemies();
         }
         else
         {
            _root.netSend("SNAP|" + _root.netCell + "|" + _root.netBuildSnapshot());
         }
      }
      if(_root.netConnected && _root.netStashOn == "on" && _root.ui.dlgInv._x != undefined)
      {
         if(Key.isDown(71))
         {
            if(!_root.netGKey)
            {
               _root.netGKey = true;
               _root.netStashAction();
            }
         }
         else
         {
            _root.netGKey = false;
         }
      }
   };
}
// ============================================================
if(_root.allsound == undefined)
{
   _root.allsound = new Sound(_root);
   _root.allsound.attachSound("slime死");
}
setQuest();
attachMovie("game","game",this.getNextHighestDepth());
attachMovie("ui","ui",this.getNextHighestDepth());
initUI();
if(areaMode == 0)
{
   var tmp = _root.attachMovie("chapterIntro","chapterIntro",_root.getNextHighestDepth());
   tmp.gotoAndStop(_root.game.map.player.chapter + 1);
   var txtChapter = ["Chapter I","Chapter II","Chapter III","Chapter IV","Chapter V"];
   tmp.textMc.text1.text = txtChapter[_root.game.map.player.chapter];
   switch(_root.lang)
   {
      case 0:
         tmp.chapterTxt.gotoAndStop("chs");
         break;
      case 1:
         tmp.chapterTxt.gotoAndStop("chn");
         break;
      case 2:
         tmp.chapterTxt.gotoAndStop("eng");
         break;
      case 3:
         tmp.chapterTxt.gotoAndStop("jpn");
         break;
      case 4:
         tmp.chapterTxt.gotoAndStop("koe");
         break;
      case 5:
         tmp.chapterTxt.gotoAndStop("fra");
         break;
      case 6:
         tmp.chapterTxt.gotoAndStop("ger");
   }
   tmp.chapterTxt.gotoAndStop(tmp.chapterTxt._currentframe + _root.game.map.player.chapter);
   tmp.onRelease = function()
   {
      _root.game.continueCharacters();
      this.count = 50;
      this.onEnterFrame = function()
      {
         if(--this.count < 0)
         {
            this._alpha -= 5;
            if(this._alpha < 5)
            {
               this.removeMovieClip();
            }
         }
      };
      this.onRelease = undefined;
   };
   _root.game.pauseCharacters();
}
_root.cutSceneMc.swapDepths(this.getNextHighestDepth());
_root.mouseCursor.swapDepths(_root.getNextHighestDepth());
mochi.as2.MochiSocial.hideLoginWidget();
stop();
