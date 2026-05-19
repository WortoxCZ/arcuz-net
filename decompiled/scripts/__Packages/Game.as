class Game extends MovieClip
{
   var bossArr;
   var count;
   var deadList;
   var keyArr;
   var layerArr;
   var map;
   var onEnterFrame;
   var pauseAllCharacters;
   var pauseHitCounter;
   var pauseWhenHit;
   var setlayerCounter;
   var unitManager;
   function Game()
   {
      super();
      var _loc3_;
      if(this._name.slice(0,8) != "instance")
      {
         this._x = 50;
         this._y = 0;
         this.unitManager = new Object();
         this.unitManager.unitArray = [];
         this.unitManager.unitAll = [];
         this.unitManager.unitR2 = 10000;
         this.layerArr = [];
         this.map = this.attachMovie("map","map",this.getNextHighestDepth());
         this.deadList = [];
         this.deadList.length = 17;
         _loc3_ = 0;
         while(_loc3_ < this.deadList.length)
         {
            this.deadList[_loc3_] = [];
            _loc3_ = _loc3_ + 1;
         }
         this.bossArr = [];
         this.keyArr = [];
         this.setlayerCounter = 0;
         this.mainLoop();
      }
   }
   function get xPos()
   {
      return this._x;
   }
   function set xPos(where)
   {
      this._x = where;
   }
   function get yPos()
   {
      return this._y;
   }
   function set yPos(where)
   {
      this._y = where;
   }
   function getDis(Ax, Ay, Bx, By)
   {
      Ax = int(Ax);
      Ay = int(Ay);
      Bx = int(Bx);
      By = int(By);
      return Math.sqrt((Ax - Bx) * (Ax - Bx) + (Ay - By) * (Ay - By));
   }
   function getDis2(Ax, Ay, Bx, By)
   {
      Ax = int(Ax);
      Ay = int(Ay);
      Bx = int(Bx);
      By = int(By);
      return (Ax - Bx) * (Ax - Bx) + (Ay - By) * (Ay - By);
   }
   function getRotation(Ax, Ay, Bx, By)
   {
      Ax = int(Ax);
      Ay = int(Ay);
      Bx = int(Bx);
      By = int(By);
      var _loc5_ = Bx - Ax;
      var _loc6_ = By - Ay;
      return Math.round(Math.atan2(_loc6_,_loc5_) * 57.33);
   }
   function getDegree1(a, b)
   {
      if(a > 0 && b > 0 || a < 0 && b < 0)
      {
         return Math.abs(a - b);
      }
      var _loc2_ = Math.abs(a);
      var _loc1_ = Math.abs(b);
      if(_loc2_ + _loc1_ > 180)
      {
         return 360 - _loc2_ - _loc1_;
      }
      return _loc2_ + _loc1_;
   }
   function setUnitDis()
   {
      var _loc10_ = this.unitManager.unitArray.length;
      var _loc9_ = 0;
      var _loc3_;
      var _loc6_;
      var _loc2_;
      var _loc8_;
      var _loc7_;
      var _loc5_;
      var _loc4_;
      while(_loc9_ < _loc10_)
      {
         _loc3_ = this.unitManager.unitArray[_loc9_];
         _loc6_ = _loc9_ + 1;
         while(_loc6_ < _loc10_)
         {
            _loc2_ = this.unitManager.unitArray[_loc6_];
            _loc3_.tx = _loc3_.ty = 0;
            _loc2_.tx = _loc2_.ty = 0;
            _loc8_ = this.getDis2(_loc3_._x,_loc3_._y,_loc2_._x,_loc2_._y);
            if(_loc8_ < this.unitManager.unitR2)
            {
               if(_loc3_._name == "player")
               {
                  if(!_loc3_.canJump)
                  {
                     if(_loc3_.jumpSpeed > 0)
                     {
                        if(- _loc3_.att < _loc2_.h + 20 - _loc2_.att && - _loc3_.att > - _loc2_.att)
                        {
                           _loc3_.canJump = true;
                        }
                        else
                        {
                           _loc3_.canJump = false;
                        }
                     }
                  }
               }
               else if(_loc2_._name == "player")
               {
                  if(!_loc2_.canJump)
                  {
                     if(_loc2_.jumpSpeed > 0)
                     {
                        if(- _loc2_.att < _loc3_.h + 20 - _loc3_.att && - _loc2_.att > - _loc3_.att)
                        {
                           _loc2_.canJump = true;
                        }
                        else
                        {
                           _loc2_.canJump = false;
                        }
                     }
                  }
               }
               if(!(_loc3_.h < - _loc2_.att || _loc2_.h < - _loc3_.att))
               {
                  _loc7_ = Math.sqrt(_loc8_) - _loc3_.rUnit - _loc2_.rUnit;
                  if(_loc7_ < 5)
                  {
                     _loc7_ = 5;
                  }
                  _loc5_ = 100 / Math.pow(_loc7_,2.2);
                  _loc4_ = this.getRotation(_loc3_._x,_loc3_._y,_loc2_._x,_loc2_._y);
                  if(_loc3_.resist == _loc2_.resist)
                  {
                     _loc3_.tx -= Math.round(_loc5_ * Math.cos(_loc4_ * 0.0174));
                     _loc3_.ty -= Math.round(_loc5_ * Math.sin(_loc4_ * 0.0174));
                     _loc2_.tx += Math.round(_loc5_ * Math.cos(_loc4_ * 0.0174));
                     _loc2_.ty += Math.round(_loc5_ * Math.sin(_loc4_ * 0.0174));
                  }
                  else if(_loc3_.resist > _loc2_.resist)
                  {
                     _loc2_.tx += 2 * Math.round(_loc5_ * Math.cos(_loc4_ * 0.0174));
                     _loc2_.ty += 2 * Math.round(_loc5_ * Math.sin(_loc4_ * 0.0174));
                  }
                  else if(_loc3_.resist < _loc2_.resist)
                  {
                     _loc3_.tx -= 2 * Math.round(_loc5_ * Math.cos(_loc4_ * 0.0174));
                     _loc3_.ty -= 2 * Math.round(_loc5_ * Math.sin(_loc4_ * 0.0174));
                  }
                  if(_loc3_.go)
                  {
                     _loc3_.blocked = _loc3_.blocked + 1;
                  }
                  if(_loc2_.go)
                  {
                     _loc2_.blocked = _loc2_.blocked + 1;
                  }
                  _loc3_._x += _loc3_.tx;
                  _loc3_._y += _loc3_.ty;
                  _loc2_._x += _loc2_.tx;
                  _loc2_._y += _loc2_.ty;
               }
            }
            _loc6_ = _loc6_ + 1;
         }
         _loc9_ = _loc9_ + 1;
      }
   }
   function firstTimeInMap(unit)
   {
      var _loc5_ = unit._x + this.map._x - 50;
      var _loc4_ = unit._y + this.map._y;
      this.unitManager.unitAll.push(unit);
      if(_loc5_ < - unit._width || _loc5_ > 450 + unit._width || _loc4_ < - unit._height - 40 || _loc4_ > 400 + unit._height)
      {
         unit.inStage = false;
         if(unit.hp != "obstacle")
         {
            unit.gotoAndStop(9);
         }
         unit.enterframe = function()
         {
            _root.game.checkInStage(this);
         };
      }
      else
      {
         unit.inStage = true;
         if(unit.hp != "obstacle")
         {
            unit.gotoAndStop(unit.translateDegreeToFrame(unit.moveDir));
         }
         unit.action();
         this.pushUnit(unit);
      }
   }
   function checkInStage(unit)
   {
      var _loc6_ = Math.floor(unit._x / 128);
      var _loc5_ = Math.floor(unit._y / 128);
      var _loc4_;
      if(unit.inStage)
      {
         if(this.map["tileW" + _loc6_ + "-" + _loc5_]._x == undefined)
         {
            unit.inStage = false;
            if(unit.hp > 0)
            {
               if(unit._name != "player")
               {
                  unit.gotoAndStop(9);
               }
               unit.enterframe = function()
               {
                  _root.game.checkInStage(this);
               };
               this.delUnit1(unit);
            }
            else if(unit.hp == "obstacle")
            {
               unit.enterframe = function()
               {
                  _root.game.checkInStage(this);
               };
               this.delUnit1(unit);
            }
         }
      }
      else if(this.map["tileW" + _loc6_ + "-" + _loc5_]._x != undefined)
      {
         unit.inStage = true;
         if(unit.hp > 0)
         {
            if(unit._name != "player")
            {
               _loc4_ = unit.translateDegreeToFrame(unit.moveDir);
               if(isNaN(_loc4_))
               {
                  unit.gotoAndStop(4);
               }
               else
               {
                  unit.gotoAndStop(_loc4_);
               }
            }
            unit.action();
            if(this.pauseAllCharacters)
            {
               unit.mc.mc.stop();
               unit.mc.mc.sword.gotoAndStop(unit.weaponFrame);
               unit.setWear();
            }
            this.pushUnit(unit);
         }
         else if(unit.hp == "obstacle")
         {
            unit.action();
            this.pushUnit(unit);
         }
      }
   }
   function pushUnit(unit)
   {
      this.unitManager.unitArray.push(unit);
      this.layerArr.push(unit);
   }
   function delUnit(unit)
   {
      this.delUnit1(unit);
      for(var _loc3_ in this.unitManager.unitAll)
      {
         if(this.unitManager.unitAll[_loc3_] == unit)
         {
            this.unitManager.unitAll.splice(_loc3_,1);
         }
      }
   }
   function delUnit1(unit)
   {
      for(var _loc3_ in this.layerArr)
      {
         if(this.layerArr[_loc3_] == unit)
         {
            this.layerArr.splice(int(_loc3_),1);
         }
      }
      for(var _loc4_ in this.unitManager.unitArray)
      {
         if(this.unitManager.unitArray[_loc4_] == unit)
         {
            this.unitManager.unitArray.splice(_loc4_,1);
         }
      }
   }
   function delUnitButPlayer()
   {
      for(var _loc3_ in this.unitManager.unitArray)
      {
         if(this.unitManager.unitArray[_loc3_]._name != "player")
         {
            this.unitManager.unitArray.splice(_loc3_,1);
         }
      }
      for(_loc3_ in this.unitManager.unitAll)
      {
         if(this.unitManager.unitAll[_loc3_]._name != "player")
         {
            this.unitManager.unitAll.splice(_loc3_,1);
         }
      }
      for(var _loc2_ in this.layerArr)
      {
         if(this.layerArr[_loc2_]._name != "player")
         {
            this.layerArr.splice(int(_loc2_),1);
         }
      }
      for(_loc2_ in this.bossArr)
      {
         this.bossArr.splice(int(_loc2_),1);
      }
   }
   function pauseHit()
   {
      this.pauseWhenHit = true;
      this.pauseHitCounter = _root.createEmptyMovieClip("pauseHitCounter",_root.getNextHighestDepth());
      this.pauseHitCounter.count = 0;
      this.pauseHitCounter.onEnterFrame = function()
      {
         if(++this.count > 10)
         {
            _root.game.pauseWhenHit = true;
            _root.game.continueHit();
            this.removeMovieClip();
         }
         else if(this.count == 1)
         {
            _root.game.pauseCharacters();
         }
      };
   }
   function continueHit()
   {
      this.pauseWhenHit = false;
      this.continueCharacters();
   }
   function pauseCharacters()
   {
      trace("pause");
      this.pauseAllCharacters = true;
      var _loc2_;
      for(var _loc3_ in this.unitManager.unitAll)
      {
         _loc2_ = this.unitManager.unitAll[_loc3_];
         _loc2_.mc.mc.stop();
         _loc2_.mc.mc.sword.gotoAndStop(_loc2_.weaponFrame);
      }
      this.map.player.mc.mc.stop();
      for(_loc3_ in this.bossArr)
      {
         this.bossArr[_loc3_].mc.mc.stop();
      }
      this.map.player.setWear();
   }
   function continueCharacters()
   {
      trace("continue");
      this.pauseAllCharacters = false;
      var _loc2_;
      for(var _loc3_ in this.unitManager.unitAll)
      {
         _loc2_ = this.unitManager.unitAll[_loc3_];
         _loc2_.mc.mc.play();
      }
      this.map.player.mc.mc.play();
      for(_loc3_ in this.bossArr)
      {
         this.bossArr[_loc3_].mc.mc.play();
      }
      this.map.player.setWear();
   }
   function hitUnit(unit, dmg)
   {
      unit.hitAction(dmg);
   }
   function mainLoop()
   {
      this.onEnterFrame = function()
      {
         var _loc3_;
         if(!this.pauseAllCharacters)
         {
            this.checkInStage(this.map.player);
            this.map.player.enterframe();
            _loc3_ = 0;
            while(_loc3_ < this.unitManager.unitAll.length)
            {
               this.checkInStage(this.unitManager.unitAll[_loc3_]);
               this.unitManager.unitAll[_loc3_].enterframe();
               _loc3_ = _loc3_ + 1;
            }
            _loc3_ = 0;
            while(_loc3_ < this.bossArr.length)
            {
               this.bossArr[_loc3_].enterframe();
               _loc3_ = _loc3_ + 1;
            }
         }
         else
         {
            _loc3_ = 0;
            while(_loc3_ < this.unitManager.unitAll.length)
            {
               this.checkInStage(this.unitManager.unitAll[_loc3_]);
               _loc3_ = _loc3_ + 1;
            }
         }
         this.map.player.setWear();
         this.setUnitDis();
         if(++this.setlayerCounter > 5)
         {
            this.setlayerCounter = 0;
            if(this.layerSort())
            {
               this.refreshLayerArray();
            }
            this.setLayer();
         }
         if(_root.ui.dlgMenu._x == undefined && _root.ui.discardConfirm._x == undefined && _root.gameOverMc._x == undefined && _root.ui.inGameShop._x == undefined)
         {
            if(Key.isDown(67))
            {
               if(!this.keyArr[0])
               {
                  this.keyArr[0] = 1;
                  if(_root.ui.fakebtn._x == undefined && _root.ui.dialog2._x == undefined)
                  {
                     if(_root.ui.dlgChar._x)
                     {
                        _root.ui.dlgChar.close();
                     }
                     else
                     {
                        _root.ui.btnChar.onRelease();
                     }
                  }
               }
            }
            else
            {
               this.keyArr[0] = 0;
            }
            if(Key.isDown(86))
            {
               if(!this.keyArr[1])
               {
                  this.keyArr[1] = 1;
                  if(_root.ui.fakebtn._x == undefined && _root.ui.dialog2._x == undefined)
                  {
                     if(_root.ui.dlgSkill._x)
                     {
                        _root.ui.dlgSkill.close();
                     }
                     else
                     {
                        _root.ui.btnSkill.onRelease();
                     }
                  }
               }
            }
            else
            {
               this.keyArr[1] = 0;
            }
            if(Key.isDown(66))
            {
               if(!this.keyArr[2])
               {
                  this.keyArr[2] = 1;
                  if(_root.ui.fakebtn._x == undefined && _root.itemInfo._x == undefined && _root.ui.dialog2._x == undefined)
                  {
                     if(_root.ui.dlgInv._x)
                     {
                        _root.ui.dlgInv.close();
                     }
                     else
                     {
                        _root.ui.btnInv.onRelease();
                     }
                  }
               }
            }
            else
            {
               this.keyArr[2] = 0;
            }
            if(Key.isDown(78))
            {
               if(!this.keyArr[3])
               {
                  this.keyArr[3] = 1;
                  if(_root.ui.fakebtn._x == undefined && _root.ui.dialog2._x == undefined)
                  {
                     if(_root.ui.dlgQuest._x)
                     {
                        _root.ui.dlgQuest.close();
                     }
                     else
                     {
                        _root.ui.btnQuests.onRelease();
                     }
                  }
               }
            }
            else
            {
               this.keyArr[3] = 0;
            }
            if(Key.isDown(77))
            {
               if(!this.keyArr[4])
               {
                  this.keyArr[4] = 1;
                  if(_root.ui.fakebtn._x == undefined && _root.ui.dialog2._x == undefined)
                  {
                     if(_root.ui.dlgMap._x)
                     {
                        if(_root.ui.dlgMap._currentframe == 1)
                        {
                           _root.ui.btnMap.onRelease();
                        }
                        else
                        {
                           _root.ui.dlgMap.close();
                        }
                     }
                     else
                     {
                        _root.ui.btnMap.onRelease();
                     }
                  }
               }
            }
            else
            {
               this.keyArr[4] = 0;
            }
         }
         if(Key.isDown(188))
         {
            if(!this.keyArr[5])
            {
               this.keyArr[5] = 1;
               if(_root.ui.fakebtn._x == undefined && _root.gameOverMc._x == undefined && _root.ui.dialog2._x == undefined && _root.ui.inGameShop._x == undefined)
               {
                  if(_root.ui.dlgMenu._x != undefined)
                  {
                     _root.game.continueCharacters();
                     _root.ui.dlgMenu.removeMovieClip();
                  }
                  else
                  {
                     _root.ui.btnMenu.onRelease();
                  }
               }
            }
         }
         else
         {
            this.keyArr[5] = 0;
         }
         if(Key.isDown(27))
         {
            if(!this.keyArr[6])
            {
               this.keyArr[6] = 1;
               if(_root.itemInfo._x != undefined || _root.ui.fakebtn._x != undefined || _root.ui.discardConfirm._x != undefined || _root.ui.dialog2._x != undefined || _root.ui.inGameShop._x != undefined || _root.gameOverMc._x != undefined)
               {
                  return undefined;
               }
               _root.btnInfo.removeMovieClip();
               _root.ui.dlgChar.close();
               _root.ui.dlgSkill.close();
               _root.ui.dlgInv.close();
               _root.ui.dlgQuest.close();
               _root.ui.dlgMap.close();
               _root.ui.dlgCompose.close();
               _root.ui.dlgSellStuff.close();
               _root.ui.dlgStore.close();
               trace("hd:   " + this.map.getNextHighestDepth());
            }
         }
         else
         {
            this.keyArr[6] = 0;
         }
      };
   }
   function layerSort()
   {
      var _loc7_ = false;
      var _loc6_;
      var _loc4_;
      var _loc3_;
      var _loc5_ = 1;
      var _loc2_;
      while(_loc5_ < this.layerArr.length)
      {
         _loc2_ = this.layerArr.length - 1;
         while(_loc2_ >= _loc5_)
         {
            if(this.layerArr[_loc2_].mcType == "tileW")
            {
               _loc4_ = this.layerArr[_loc2_]._y + this.layerArr[_loc2_].dy;
            }
            else
            {
               _loc4_ = this.layerArr[_loc2_]._y;
            }
            if(this.layerArr[_loc2_ - 1].mcType == "tileW")
            {
               _loc3_ = this.layerArr[_loc2_ - 1]._y + this.layerArr[_loc2_ - 1].dy;
            }
            else
            {
               _loc3_ = this.layerArr[_loc2_ - 1]._y;
            }
            if(_loc4_ == undefined || _loc3_ == undefined)
            {
               _loc7_ = true;
            }
            if(_loc4_ < _loc3_)
            {
               _loc6_ = this.layerArr[_loc2_ - 1];
               this.layerArr[_loc2_ - 1] = this.layerArr[_loc2_];
               this.layerArr[_loc2_] = _loc6_;
            }
            _loc2_ = _loc2_ - 1;
         }
         _loc5_ = _loc5_ + 1;
      }
      return _loc7_;
   }
   function refreshLayerArray()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.layerArr.length)
      {
         if(this.layerArr[_loc2_]._name == undefined)
         {
            this.layerArr.splice(_loc2_,1);
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function setLayer()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.layerArr.length)
      {
         this.layerArr[_loc2_].swapDepths(_loc2_ + 100);
         _loc2_ = _loc2_ + 1;
      }
   }
}
