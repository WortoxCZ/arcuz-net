function sitelock()
{
   var _loc6_ = _url.split("://");
   var _loc4_ = _loc6_[1].split("/");
   var _loc2_ = "armorgames.com";
   var _loc3_ = _loc4_[0];
   var _loc5_ = _loc3_.lastIndexOf(_loc2_) + _loc2_.length == _loc3_.length;
   if(!_loc5_)
   {
      _root.gotoAndStop("logo");
      _root.gotoAndStop("sitelocked");
   }
}
this._lockroot = true;
// sitelock() disabled -- standalone coop build runs outside armorgames.com
// ============================================================
// Coop net extensions (Phase 7+). frame_71's net block is at its
// compiled-size ceiling, so new net code lives here and extends that
// layer once frame_71's applyNet and the engine classes exist.
// ============================================================
// Viewer: re-run an enemy attack on the local copy of the enemy.
// Directional projectiles (arrows/fireballs) fly by the enemy's facing
// and ignore x,y. Position-targeted spells spawn at x,y -- supplied by
// briefly swapping map.player, the same trick the enemy AI itself uses.
_root.netReplayAtk = function(en, method, x, y, arg)
{
   var rp = _root.game.map.player;
   _root.game.map.player = {_x:x,_y:y,x:x,y:y};
   if(arg == "" || arg == undefined)
   {
      en[method]();
   }
   else
   {
      en[method](Number(arg));
   }
   _root.game.map.player = rp;
};
// Authority: after an enemy spawn-method runs, broadcast it (with the
// current target position) so every viewer replays it locally.
_root.netWrapAtk = function(cls, m)
{
   cls.prototype[m + "_ao"] = cls.prototype[m];
   cls.prototype[m] = function()
   {
      this[m + "_ao"].apply(this,arguments);
      if(_root.netConnected && _root.netEnemyOn == "on" && !_root.netViewer && this.netIndex != undefined)
      {
         var p = _root.game.map.player;
         var a0 = arguments[0] != undefined ? arguments[0] : "";
         _root.netSend("EV|atk|" + _root.netCell + "|" + this.netIndex + "|" + m + "|" + Math.round(p._x) + "|" + Math.round(p._y) + "|" + a0);
      }
   };
};
_root.netHookAtk = function(cls, methods)
{
   if(cls == undefined || cls.prototype.netAtkHook == true)
   {
      return;
   }
   cls.prototype.netAtkHook = true;
   var i = 0;
   while(i < methods.length)
   {
      _root.netWrapAtk(cls,methods[i]);
      i = i + 1;
   }
};
// Ghost split: the authority's ghost spawns N decoys mid-fight. Broadcast
// it with the (integer-rounded) origin so every viewer re-runs split() on
// its own ghost at the exact same spot -- decoys then land on identical
// coords, so their netIndex matches and the snapshot drives them normally.
_root.netHookSplit = function(cls)
{
   if(cls == undefined || cls.prototype.netSplitHook == true)
   {
      return;
   }
   cls.prototype.netSplitHook = true;
   cls.prototype.splitNetOrig = cls.prototype.split;
   cls.prototype.split = function(num)
   {
      this._x = Math.round(this._x);
      this._y = Math.round(this._y);
      var ox = this._x;
      var oy = this._y;
      var idx = this.netIndex;
      this.splitNetOrig(num);
      if(_root.netConnected && _root.netEnemyOn == "on" && !_root.netViewer && idx != undefined)
      {
         _root.netSend("EV|gsplit|" + _root.netCell + "|" + idx + "|" + num + "|" + ox + "|" + oy);
      }
   };
};
// Boss rage-mode ghost summon: the boss summons ghosts via initAreaMode(),
// which RANDOMISES their position -- so re-running it on a viewer would
// place them elsewhere. Instead the authority broadcasts each summoned
// ghost's final (rounded) position + element; the viewer spawns a matching
// one. Rounding the position also repairs the netIndex (attachMovie ran
// before initAreaMode, so it was keyed off the placeholder 0,0 origin).
_root.netHookSummon = function(cls)
{
   if(cls == undefined || cls.prototype.netSummonHook == true)
   {
      return;
   }
   cls.prototype.netSummonHook = true;
   cls.prototype.initAreaModeNetOrig = cls.prototype.initAreaMode;
   cls.prototype.initAreaMode = function()
   {
      this.initAreaModeNetOrig();
      if(_root.netConnected && _root.netEnemyOn == "on" && !_root.netViewer)
      {
         this._x = Math.round(this._x);
         this._y = Math.round(this._y);
         this.netIndex = this._x + "_" + this._y;
         _root.game.map["e" + this.netIndex] = this;
         _root.netSend("EV|gsummon|" + _root.netCell + "|" + this._x + "|" + this._y + "|" + this.addDmgType[0]);
      }
   };
};
// Viewer side: spawn a boss-summoned ghost matching the authority's.
_root.netSpawnGhost = function(x, y, element)
{
   var m = _root.game.map;
   var d = m.getNextHighestDepth();
   var gh = m.attachMovie("ghost","enemy" + d,d,{_x:x,_y:y});
   gh.setLevel(29);
   gh.hp = gh.totalHp *= 5;
   gh._xscale = gh._yscale = 110;
   gh.addDmgType = [element,4];
};
_root.createEmptyMovieClip("netExt",_root.getNextHighestDepth());
_root.netExt.onEnterFrame = function()
{
   if(_root.applyNet == undefined || _global.GoblinArcher == undefined || _global.GoblinMage == undefined)
   {
      return;
   }
   // Viewer side: intercept EV|atk and replay the attack on the local enemy.
   if(_root.netApplyExt != true)
   {
      _root.netApplyExt = true;
      _root.applyNetExtOrig = _root.applyNet;
      _root.applyNet = function(t, rest)
      {
         if(t == "EV")
         {
            var e = rest.split("|");
            if(e[1] == "atk")
            {
               if(_root.netEnemyOn == "on" && _root.netViewer && e[2] == _root.netCell)
               {
                  var en = _root.game.map["e" + e[3]];
                  if(en._name != undefined)
                  {
                     _root.netReplayAtk(en,e[4],Number(e[5]),Number(e[6]),e[7]);
                  }
               }
               return;
            }
            if(e[1] == "gsplit")
            {
               if(_root.netEnemyOn == "on" && _root.netViewer && e[2] == _root.netCell)
               {
                  var gh = _root.game.map["e" + e[3]];
                  if(gh._name != undefined)
                  {
                     gh._x = Number(e[5]);
                     gh._y = Number(e[6]);
                     gh.split(Number(e[4]));
                  }
               }
               return;
            }
            if(e[1] == "gsummon")
            {
               if(_root.netEnemyOn == "on" && _root.netViewer && e[2] == _root.netCell)
               {
                  _root.netSpawnGhost(Number(e[3]),Number(e[4]),e[5]);
               }
               return;
            }
         }
         _root.applyNetExtOrig(t,rest);
      };
   }
   // Authority side: broadcast ranged-enemy attacks (archer, mage, boss),
   // the ghost's split, and the boss's rage-mode ghost summon.
   _root.netHookAtk(_global.GoblinArcher,["newArrow"]);
   _root.netHookAtk(_global.GoblinMage,["newFireMagic","newPoisonBall","newFireSetPostion","newIceSetPostion","newThunderSetPostion"]);
   _root.netHookAtk(_global.DualHeadGiant,["newFireSetPostion","newiceMagic1","iceRingAttack"]);
   _root.netHookSplit(_global.Ghost);
   _root.netHookSummon(_global.Ghost);
   // Gameplay tweak: the chapter-2 centaur quest item drops 100% of the
   // time (vanilla 20% -- otherwise hours of farming).
   if(_global.Centaur != undefined && _global.Centaur.prototype.netChestTweak != true)
   {
      _global.Centaur.prototype.netChestTweak = true;
      _global.Centaur.prototype.dropSpecialItem = function()
      {
         if(_root.game.map.player.chapter == 2 && _root.game.map.player.phase == 1)
         {
            var d = _root.game.map.getNextHighestDepth();
            var c = _root.game.map.attachMovie("chest","chest" + d,d,{_x:this._x,_y:this._y - 3});
            c.init("任务箱子",new QuestItem("brmzj"));
            return true;
         }
         return false;
      };
   }
   // The DualHeadGiant boss registers into bossArr (its own tick loop),
   // not unitAll -- so the net snapshot system never saw it and each
   // client ran an independent boss. Move it to unitAll on setLevel: it
   // then ticks once, pauses/resumes via the unitAll path, and the
   // snapshot/freeze/authority machinery drives it like any enemy.
   if(_global.DualHeadGiant != undefined && _global.DualHeadGiant.prototype.netBossHook != true)
   {
      _global.DualHeadGiant.prototype.netBossHook = true;
      _global.DualHeadGiant.prototype.setLevelBossOrig = _global.DualHeadGiant.prototype.setLevel;
      _global.DualHeadGiant.prototype.setLevel = function(num)
      {
         this.setLevelBossOrig(num);
         if(this.netBossMoved != true)
         {
            this.netBossMoved = true;
            var g = _root.game;
            var bi = 0;
            while(bi < g.bossArr.length)
            {
               if(g.bossArr[bi] == this)
               {
                  g.bossArr.splice(bi,1);
               }
               else
               {
                  bi = bi + 1;
               }
            }
            g.unitManager.unitAll.push(this);
         }
      };
   }
   this.onEnterFrame = undefined;
};
stop();
