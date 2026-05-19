class DropPotion extends MovieClip
{
   var controlMc;
   var count;
   var hp;
   var onEnterFrame;
   var sp;
   var uiMc;
   var val;
   var val1;
   var val2;
   function DropPotion()
   {
      super();
      this.onEnterFrame = function()
      {
         if(this._parent._parent.getDis(this._x,this._y,this._parent.player._x,this._parent.player._y) < 40)
         {
            this.works();
            this.removeMovieClip();
         }
      };
   }
   function init(frame1)
   {
      this.gotoAndStop(frame1); //unpopped
      switch(frame1)
      {
         case "potion1":
            this.works = this.sph;
            break;
         case "potion2":
            this.works = this.mph;
            break;
         case "potion3":
            this.works = this.lph;
            break;
         case "potion4":
            this.works = this.spm;
            break;
         case "potion5":
            this.works = this.mpm;
            break;
         case "potion6":
            this.works = this.lpm;
            break;
         case "potion7":
            this.works = this.spr;
            break;
         case "potion8":
            this.works = this.mpr;
            break;
         case "potion9":
            this.works = this.lpr;
            break;
         case "potion10":
            this.works = this.spa;
            break;
         case "potion11":
            this.works = this.mpa;
            break;
         case "potion12":
            this.works = this.lpa;
            break;
         case "potion13":
            this.works = this.pa;
            break;
         case "potion14":
            this.works = this.pod;
            break;
         case "potion15":
            this.works = this.poa;
            break;
         case "potion16":
            this.works = this.pomd;
            break;
         case "potion17":
            this.works = this.pob;
            break;
         case "potion18":
            this.works = this.pol;
         default:
            return;
      }
   }
   function works()
   {
   }
   function sph()
   {
      this.heal(5,5);
   }
   function mph()
   {
      this.heal(10,5);
   }
   function lph()
   {
      this.heal(15,5);
   }
   function heal(val, sec)
   {
      _root.playSound("加HP.mp3");
      var _loc4_ = _root.game.map.player.mc.getNextHighestDepth();
      var _loc6_ = _root.game.map.player.mc.attachMovie("加血","fx" + _loc4_,_loc4_);
      _loc6_.blendMode = 8;
      var _loc5_ = _root.getNextHighestDepth();
      this.controlMc = _root.createEmptyMovieClip("controlMc" + _loc5_,_loc5_);
      this.controlMc.count = sec * 35 + 10;
      var _loc3_ = _root.game.map.player.hp + (sec + 1) * val * _root.game.map.player.totalHp / 100;
      _root.game.map.player.recoverHp = _loc3_ <= _root.game.map.player.recoverHp ? _root.game.map.player.recoverHp : _loc3_;
      _root.game.map.player.recoverHp = _loc3_ <= _root.game.map.player.totalHp ? _root.game.map.player.recoverHp : _root.game.map.player.totalHp;
      _root.ui.recoverHp.mask._x = _root.game.map.player.recoverHp * 142 / _root.game.map.player.totalHp;
      this.controlMc.val = val;
      this.controlMc.onEnterFrame = function()
      {
         if(--this.count % 35 == 0)
         {
            _root.game.map.player.addHp(this.val * _root.game.map.player.totalHp / 100);
         }
         if(this.count < 0)
         {
            this.removeMovieClip();
         }
      };
   }
   function spm()
   {
      this.restoreSp(5,5);
   }
   function mpm()
   {
      this.restoreSp(10,5);
   }
   function lpm()
   {
      this.restoreSp(15,5);
   }
   function restoreSp(val, sec)
   {
      _root.playSound("加SP.mp3");
      var _loc3_ = _root.game.map.player.mc.getNextHighestDepth();
      var _loc5_ = _root.game.map.player.mc.attachMovie("加魔","fx" + _loc3_,_loc3_);
      _loc5_.blendMode = 8;
      var _loc4_ = _root.getNextHighestDepth();
      this.controlMc = _root.createEmptyMovieClip("controlMc" + _loc4_,_loc4_);
      this.controlMc.count = sec * 35 + 10;
      this.controlMc.val = val;
      this.controlMc.onEnterFrame = function()
      {
         if(--this.count % 35 == 0)
         {
            _root.game.map.player.addSp(this.val * _root.game.map.player.totalSp / 100);
         }
         if(this.count < 0)
         {
            this.removeMovieClip();
         }
      };
   }
   function spr()
   {
      this.restoreAll(30);
   }
   function mpr()
   {
      this.restoreAll(60);
   }
   function lpr()
   {
      this.restoreAll(100);
   }
   function restoreAll(val)
   {
      _root.playSound("加HP.mp3");
      _root.playSound("加SP.mp3");
      var _loc2_ = _root.game.map.player.mc.getNextHighestDepth();
      var _loc3_ = _root.game.map.player.mc.attachMovie("全加","fx" + _loc2_,_loc2_);
      _loc3_.blendMode = 8;
      _root.game.map.player.addHp(val * _root.game.map.player.totalHp / 100);
      _root.game.map.player.addSp(val * _root.game.map.player.totalSp / 100);
   }
   function spa()
   {
      this.archangle(1);
   }
   function mpa()
   {
      this.archangle(2);
   }
   function lpa()
   {
      this.archangle(3);
   }
   function archangle(level)
   {
      if(_root.game.map.player.revive)
      {
         return undefined;
      }
      _root.playSound("加HP.mp3");
      var _loc3_ = _root.game.map.player.mc.getNextHighestDepth();
      var _loc6_ = _root.game.map.player.mc.attachMovie("加状态","fx" + _loc3_,_loc3_);
      _root.game.map.player.addHp(0);
      _root.game.map.player.addSp(0);
      _root.game.map.player.decSp(0);
      _loc6_.blendMode = 8;
      var _loc5_;
      if(_root.archangle._name == undefined)
      {
         _loc5_ = _root.getNextHighestDepth();
         _root.createEmptyMovieClip("archangle",_loc5_);
         _root.archangle.count = level * 5 * 35 * 60;
         _root.archangle.hp = int(_root.game.map.player.totalHp * ((level - 1) * 35 + 30) / 100);
         _root.archangle.sp = int(_root.game.map.player.totalSp * ((level - 1) * 35 + 30) / 100);
         _root.game.map.player.totalHp1 += _root.archangle.hp;
         _root.game.map.player.totalSp1 += _root.archangle.sp;
         _root.game.map.player.setHPSP();
         _root.game.map.player.revive = true;
         _root.archangle.uiMc = _root.game.map.player.newStateShow(12);
         _root.archangle.onEnterFrame = function()
         {
            if(--this.count < 0)
            {
               _root.game.map.player.totalHp1 -= this.hp;
               _root.game.map.player.totalSp1 -= this.sp;
               _root.game.map.player.setHPSP();
               _root.game.map.player.revive = false;
               this.uiMc.remove();
               this.removeMovieClip();
            }
         };
      }
      else
      {
         _root.archangle.count = level * 5 * 35 * 60;
      }
   }
   function pa()
   {
      _root.playSound("加HP.mp3");
      var _loc2_ = _root.game.map.player.mc.getNextHighestDepth();
      var _loc3_ = _root.game.map.player.mc.attachMovie("解毒","fx" + _loc2_,_loc2_);
      _root.game.map.player.poisonDmg.removeMovieClip();
   }
   function pod()
   {
      _root.playSound("加HP.mp3");
      var _loc4_ = _root.game.map.player.mc.getNextHighestDepth();
      var _loc6_ = _root.game.map.player.mc.attachMovie("加状态","fx" + _loc4_,_loc4_);
      _loc6_.blendMode = 8;
      var _loc3_ = 60;
      var _loc5_;
      if(_root.pod._name == undefined)
      {
         _loc5_ = _root.getNextHighestDepth();
         _root.createEmptyMovieClip("pod",_loc5_);
         _root.pod.count = _loc3_ * 35 + 10;
         _root.pod.val = int(_root.game.map.player.defence / 2);
         _root.game.map.player.defence1 += _root.pod.val;
         _root.game.map.player.setDefence();
         _root.pod.uiMc = _root.game.map.player.newStateShow(14);
         _root.pod.onEnterFrame = function()
         {
            if(--this.count < 0)
            {
               _root.game.map.player.defence1 -= this.val;
               _root.game.map.player.setDefence();
               this.uiMc.remove();
               this.removeMovieClip();
            }
         };
      }
      else
      {
         _root.pod.count = _loc3_ * 35 + 10;
      }
   }
   function poa()
   {
      _root.playSound("加HP.mp3");
      var _loc4_ = _root.game.map.player.mc.getNextHighestDepth();
      var _loc6_ = _root.game.map.player.mc.attachMovie("加状态","fx" + _loc4_,_loc4_);
      _loc6_.blendMode = 8;
      var _loc3_ = 60;
      var _loc5_;
      if(_root.poa._name == undefined)
      {
         _loc5_ = _root.getNextHighestDepth();
         _root.createEmptyMovieClip("poa",_loc5_);
         _root.poa.count = _loc3_ * 35 + 10;
         _root.poa.val1 = int(_root.game.map.player.attack[0] / 2);
         _root.poa.val2 = int(_root.game.map.player.attack[1] / 2);
         _root.game.map.player.attackMin1 += _root.poa.val1;
         _root.game.map.player.attackMax1 += _root.poa.val2;
         _root.game.map.player.setAttack();
         _root.poa.uiMc = _root.game.map.player.newStateShow(13);
         _root.poa.onEnterFrame = function()
         {
            if(--this.count < 0)
            {
               _root.game.map.player.attackMin1 -= this.val1;
               _root.game.map.player.attackMax1 -= this.val2;
               _root.game.map.player.setAttack();
               this.uiMc.remove();
               this.removeMovieClip();
            }
         };
      }
      else
      {
         _root.poa.count = _loc3_ * 35 + 10;
      }
   }
   function pomd()
   {
      _root.playSound("加HP.mp3");
      var _loc4_ = _root.game.map.player.mc.getNextHighestDepth();
      var _loc6_ = _root.game.map.player.mc.attachMovie("加状态","fx" + _loc4_,_loc4_);
      _loc6_.blendMode = 8;
      var _loc3_ = 60;
      var _loc5_;
      if(_root.pomd._name == undefined)
      {
         _loc5_ = _root.getNextHighestDepth();
         _root.createEmptyMovieClip("pomd",_loc5_);
         _root.pomd.count = _loc3_ * 35 + 10;
         _root.pomd.val = 20;
         _root.game.map.player.magicResist += _root.pomd.val;
         _root.pomd.uiMc = _root.game.map.player.newStateShow(15);
         _root.pomd.onEnterFrame = function()
         {
            if(--this.count < 0)
            {
               _root.game.map.player.magicResist -= this.val;
               this.uiMc.remove();
               this.removeMovieClip();
            }
         };
      }
      else
      {
         _root.pomd.count = _loc3_ * 35 + 10;
      }
   }
   function pob()
   {
      _root.playSound("加HP.mp3");
      var _loc2_ = _root.game.map.player.mc.getNextHighestDepth();
      var _loc3_ = _root.game.map.player.mc.attachMovie("加状态","fx" + _loc2_,_loc2_);
      _loc3_.blendMode = 8;
      var _loc4_ = 60;
      if(_root.game.map.player.angryCounter._x == undefined)
      {
         _root.game.map.player.angry(15);
      }
      else
      {
         _root.game.map.player.angryCounter.counter = 525;
      }
   }
   function pol()
   {
      _root.playSound("加HP.mp3");
      var _loc4_ = _root.game.map.player.mc.getNextHighestDepth();
      var _loc6_ = _root.game.map.player.mc.attachMovie("加状态","fx" + _loc4_,_loc4_);
      _loc6_.blendMode = 8;
      var _loc3_ = 60;
      var _loc5_;
      if(_root.pol._name == undefined)
      {
         _loc5_ = _root.getNextHighestDepth();
         _root.createEmptyMovieClip("pol",_loc5_);
         _root.pol.count = _loc3_ * 35 + 10;
         _root.pol.val1 = 30;
         _root.game.map.player.dropRate1 += _root.pol.val1;
         _root.game.map.player.setLuck();
         _root.pol.uiMc = _root.game.map.player.newStateShow(16);
         _root.pol.onEnterFrame = function()
         {
            if(--this.count < 0)
            {
               _root.game.map.player.dropRate1 -= this.val1;
               _root.game.map.player.setLuck();
               this.uiMc.remove();
               this.removeMovieClip();
            }
         };
      }
      else
      {
         _root.pol.count = _loc3_ * 35 + 10;
      }
   }
}
