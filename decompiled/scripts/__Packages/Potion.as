class Potion
{
   var Type;
   var _name;
   var attrib;
   var attribName;
   var controlMc;
   var count;
   var counter;
   var dura;
   var frame;
   var hp;
   var itemName;
   var param;
   var price;
   var removeMovieClip;
   var sp;
   var uiMc;
   var val;
   var val1;
   var val2;
   function Potion(frame1)
   {
      this.param = ["",frame1];
      this.Type = this.param[0] = "Potion";
      this.frame = frame1;
      this.dura = 150;
      this.attrib = this.attribName = [];
      this.attrib[0] = frame1;
      this.attribName[1] = "Double-click to use";
      switch(frame1)
      {
         case "potion1":
            this.itemName = _root.textPotion[0][_root.lang];
            this.works = this.sph;
            this.price = 20;
            break;
         case "potion2":
            this.itemName = _root.textPotion[1][_root.lang];
            this.works = this.mph;
            this.price = 50;
            break;
         case "potion3":
            this.itemName = _root.textPotion[2][_root.lang];
            this.works = this.lph;
            this.price = 200;
            break;
         case "potion4":
            this.itemName = _root.textPotion[3][_root.lang];
            this.works = this.spm;
            this.price = 15;
            break;
         case "potion5":
            this.itemName = _root.textPotion[4][_root.lang];
            this.works = this.mpm;
            this.price = 45;
            break;
         case "potion6":
            this.itemName = _root.textPotion[5][_root.lang];
            this.works = this.lpm;
            this.price = 120;
            break;
         case "potion7":
            this.itemName = _root.textPotion[6][_root.lang];
            this.works = this.spr;
            this.price = 50;
            break;
         case "potion8":
            this.itemName = _root.textPotion[7][_root.lang];
            this.works = this.mpr;
            this.price = 120;
            break;
         case "potion9":
            this.itemName = _root.textPotion[8][_root.lang];
            this.works = this.lpr;
            this.price = 400;
            break;
         case "potion10":
            this.itemName = _root.textPotion[9][_root.lang];
            this.works = this.spa;
            this.price = 500;
            break;
         case "potion11":
            this.itemName = _root.textPotion[10][_root.lang];
            this.works = this.mpa;
            this.price = 1000;
            break;
         case "potion12":
            this.itemName = _root.textPotion[11][_root.lang];
            this.works = this.lpa;
            this.price = 1500;
            break;
         case "potion13":
            this.itemName = _root.textPotion[12][_root.lang];
            this.works = this.pa;
            this.price = 20;
            break;
         case "potion14":
            this.itemName = _root.textPotion[13][_root.lang];
            this.works = this.pod;
            this.price = 80;
            break;
         case "potion15":
            this.itemName = _root.textPotion[14][_root.lang];
            this.works = this.poa;
            this.price = 80;
            break;
         case "potion16":
            this.itemName = _root.textPotion[15][_root.lang];
            this.works = this.pomd;
            this.price = 80;
            break;
         case "potion17":
            this.itemName = _root.textPotion[16][_root.lang];
            this.works = this.pob;
            this.price = 80;
            break;
         case "potion18":
            this.itemName = _root.textPotion[17][_root.lang];
            this.works = this.pol;
            this.price = 80;
            break;
         case "potionSp":
            this.itemName = "Roast Turkey";
            this.works = this.lpr;
            this.price = 500;
      }
      this.price = int(this.price * (_root.game.map.player.chapter * 0.5 + 1));
   }
   function work()
   {
      var _loc5_;
      if(_root.game[this.attrib[0]]._x == undefined)
      {
         _loc5_ = _root.game.createEmptyMovieClip(this.attrib[0],_root.game.getNextHighestDepth());
         _loc5_.counter = this.dura;
         _loc5_.dura = this.dura;
         _loc5_.onEnterFrame = function()
         {
            var _loc4_ = 33 - int(33 * (this.counter / this.dura));
            var _loc3_ = 1;
            while(_loc3_ < 4)
            {
               if(_root.ui["item" + _loc3_ + "Mc"].attrib.attrib[0] == this._name)
               {
                  _root.ui["item" + _loc3_ + "Mc"].duraMc.gotoAndStop(_loc4_);
               }
               _loc3_ = _loc3_ + 1;
            }
            if(_root.ui.dlgInv._x)
            {
               _loc3_ = 20;
               while(_loc3_ < _root.game.map.player.inventoryList.length)
               {
                  if(_root.game.map.player.inventoryList[_loc3_].attrib[0] == this._name)
                  {
                     _root.ui["item" + _loc3_].duraMc.gotoAndStop(_loc4_);
                  }
                  _loc3_ = _loc3_ + 1;
               }
            }
            if(--this.counter <= 0)
            {
               if(_root.ui.dlgInv._x)
               {
                  _loc3_ = 1;
                  while(_loc3_ < 4)
                  {
                     if(_root.ui["item" + _loc3_ + "Mc"].attrib.attrib[0] == this._name)
                     {
                        _root.ui["item" + _loc3_ + "Mc"].duraMc.gotoAndStop(33);
                     }
                     _loc3_ = _loc3_ + 1;
                  }
                  _loc3_ = 20;
                  while(_loc3_ < _root.game.map.player.inventoryList.length)
                  {
                     if(_root.game.map.player.inventoryList[_loc3_].attrib[0] == this._name)
                     {
                        _root.ui["item" + _loc3_].duraMc.gotoAndStop(33);
                     }
                     _loc3_ = _loc3_ + 1;
                  }
               }
               this.removeMovieClip();
            }
         };
         this.works();
         if(_root.game.map.player.ach[18][0] == 0)
         {
            if(++_root.game.map.player.ach[18][1] >= 10000)
            {
               _root.game.map.player.ach[18][0] = 1;
               _root.newMessage(_root.textSys[23][_root.lang]);
            }
         }
         return true;
      }
      return false;
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
      var _loc3_ = int(_root.game.map.player.hp + (sec + 1) * val * _root.game.map.player.totalHp / 100);
      _root.game.map.player.recoverHp = _loc3_ <= _root.game.map.player.recoverHp ? _root.game.map.player.recoverHp : _loc3_;
      _root.game.map.player.recoverHp = _loc3_ <= _root.game.map.player.totalHp ? _root.game.map.player.recoverHp : _root.game.map.player.totalHp;
      _root.ui.recoverHp.mask._x = _root.game.map.player.recoverHp * 142 / _root.game.map.player.totalHp;
      this.controlMc.val = val;
      this.controlMc.onEnterFrame = function()
      {
         if(--this.count % 35 == 0)
         {
            _root.game.map.player.addHp(int(this.val * _root.game.map.player.totalHp / 100));
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
            _root.game.map.player.addSp(int(this.val * _root.game.map.player.totalSp / 100));
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
      _root.game.map.player.addHp(int(val * _root.game.map.player.totalHp / 100));
      _root.game.map.player.addSp(int(val * _root.game.map.player.totalSp / 100));
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
   function archangle($level)
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
         _root.archangle.count = $level * 5 * 35 * 60;
         _root.archangle.hp = int(_root.game.map.player.totalHp * (($level - 1) * 35 + 30) / 100);
         _root.archangle.sp = int(_root.game.map.player.totalSp * (($level - 1) * 35 + 30) / 100);
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
         _root.archangle.count = $level * 5 * 35 * 60;
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
         _root.pod.val = int(_root.game.map.player.defence);
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
