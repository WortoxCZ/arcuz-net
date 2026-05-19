class ComposeDialog extends MovieClip
{
   var btnClose;
   var btnCompose;
   var btnHelp;
   var cmpArr;
   var composePos;
   var crystalArr;
   var hl1;
   var hl2;
   var hl3;
   var hl4;
   var onEnterFrame;
   var potionArr;
   var resultItem;
   var resultPos;
   var stoneArr;
   function ComposeDialog()
   {
      super();
      this.composePos = [[137,23],[71,94],[204,94],[137,94]];
      this.resultPos = [137,231];
      this.potionArr = [];
      this.stoneArr = [];
      this.crystalArr = [];
      this.cmpArr = [];
      this.hl1.gotoAndStop(this.hl1._totalframes);
      this.hl2.gotoAndStop(this.hl2._totalframes);
      this.hl3.gotoAndStop(this.hl3._totalframes);
      this.hl4.gotoAndStop(this.hl4._totalframes);
      this.btnCompose.onRelease = function()
      {
         _root.playSound1("对话框");
         if(this._parent.ani._currentframe == 1)
         {
            _root.ui.createEmptyMovieClip("fakebtn",_root.ui.getNextHighestDepth());
            _root.ui.fakebtn.attachMovie("btnDCfakebutton","fake",_root.ui.fakebtn.getNextHighestDepth());
            _root.ui.fakebtn._alpha = 0;
            this._parent.ani.gotoAndPlay(2);
            this._parent.gotoAndStop(2);
            _root.playSound1("合成过程.mp3");
            this._parent.ani.onEnterFrame = function()
            {
               if(this._currentframe == this._totalframes)
               {
                  delete this.onEnterFrame;
                  _root.ui.fakebtn.removeMovieClip();
                  this._parent.Compose();
                  _root.game.map.player.calcWeight();
               }
            };
         }
      };
      _root.setBtnInfo(this.btnHelp,"Manual");
      this.btnHelp.onRelease = function()
      {
         _root.playSound1("对话框");
         var _loc2_ = _root.ui.attachMovie("composeHelp","composeHelp",_root.ui.getNextHighestDepth());
      };
      _root.setBtnInfo(this.btnClose,"Close");
      this.btnClose.onRelease = function()
      {
         _root.playSound1("对话框");
         this._parent.close();
         _root.btnInfo.removeMovieClip();
      };
   }
   function close()
   {
      var _loc3_ = 0;
      while(_loc3_ <= 5)
      {
         _root.ui["composeItem" + _loc3_].findAPlace();
         _loc3_ = _loc3_ + 1;
      }
      _root.game.map.player.saveStatus();
      _root.ui.dialog.closeDlg();
      this.removeMovieClip();
   }
   function cmpArray(array1, array2)
   {
      var _loc1_ = 0;
      while(_loc1_ < array1.length)
      {
         if(array1[_loc1_] != array2[_loc1_])
         {
            return false;
         }
         _loc1_ = _loc1_ + 1;
      }
      return true;
   }
   function Compose()
   {
      this.potionArr = [];
      this.stoneArr = [];
      this.crystalArr = [];
      this.cmpArr = [0,0,0,0];
      this.resultItem = undefined;
      trace(_root.ui.composeItem3.attrib.Type);
      var _loc17_;
      var _loc10_;
      var _loc5_;
      var _loc8_;
      var _loc21_;
      var _loc18_;
      var _loc19_;
      var _loc16_;
      var _loc9_;
      var _loc15_;
      var _loc20_;
      var _loc14_;
      var _loc22_;
      var _loc6_;
      var _loc25_;
      var _loc26_;
      var _loc24_;
      var _loc7_;
      var _loc13_;
      var _loc12_;
      var _loc4_;
      var _loc3_;
      var _loc23_;
      var _loc0_;
      if(_root.ui.composeItem3.attrib.Type == "Potion" || _root.ui.composeItem3.attrib.Type == "Crystal" || _root.ui.composeItem3.attrib.Type == undefined)
      {
         _loc17_ = 0;
         while(_loc17_ < 4)
         {
            if(_root.ui["composeItem" + _loc17_].attrib.Type == "Potion")
            {
               this.potionArr.push(_root.ui["composeItem" + _loc17_]);
            }
            else if(_root.ui["composeItem" + _loc17_].attrib.attrib[1] == "crystal")
            {
               this.crystalArr.push(_root.ui["composeItem" + _loc17_]);
            }
            else if(_root.ui["composeItem" + _loc17_].attrib.attrib[1] == "stone")
            {
               this.stoneArr.push(_root.ui["composeItem" + _loc17_]);
            }
            _loc17_ = _loc17_ + 1;
         }
         trace(this.potionArr + "..." + this.crystalArr + "..." + this.stoneArr);
         if(this.stoneArr.length == 0 && this.potionArr.length == 0)
         {
            switch(this.crystalArr.length)
            {
               case 0:
                  break;
               case 1:
                  _loc10_ = this.crystalArr[0].attrib.attrib[0];
                  _loc5_ = _loc10_.slice(0,-1);
                  _loc8_ = Number(_loc10_.slice(-1));
                  if(_loc8_ < 3)
                  {
                     if(_root.game.map.player.chapter == 0 && _root.game.map.player.phase == 13)
                     {
                        _root.newMessage(_root.textSys[12][_root.lang]);
                        return undefined;
                     }
                     if(random(100) < 25)
                     {
                        _loc8_ = _loc8_ + 1;
                        this.crystalArr[0].setAttrib(new §[this.crystalArr[0].attrib.Type]§(_loc5_ + _loc8_));
                        this.resultItem = this.crystalArr[0];
                     }
                     else
                     {
                        this.crystalArr[0].removeMovieClip();
                     }
                  }
                  break;
               case 2:
                  _loc21_ = this.crystalArr[0].attrib.attrib[0];
                  _loc18_ = this.crystalArr[1].attrib.attrib[0];
                  if(_loc21_ == _loc18_)
                  {
                     _loc5_ = _loc21_.slice(0,-1);
                     _loc8_ = Number(_loc21_.slice(-1));
                     if(_loc8_ < 3)
                     {
                        if(_root.game.map.player.chapter == 0 && _root.game.map.player.phase == 13)
                        {
                           _root.newMessage(_root.textSys[12][_root.lang]);
                           return undefined;
                        }
                        if(random(100) < 50)
                        {
                           _loc8_ = _loc8_ + 1;
                           this.crystalArr[0].setAttrib(new §[this.crystalArr[0].attrib.Type]§(_loc5_ + _loc8_));
                           this.crystalArr[1].removeMovieClip();
                           this.resultItem = this.crystalArr[0];
                        }
                        else
                        {
                           this.crystalArr[0].removeMovieClip();
                           this.crystalArr[1].removeMovieClip();
                        }
                     }
                  }
                  break;
               case 3:
                  _loc21_ = this.crystalArr[0].attrib.attrib[0];
                  _loc18_ = this.crystalArr[1].attrib.attrib[0];
                  _loc19_ = this.crystalArr[2].attrib.attrib[0];
                  if(_loc21_ == _loc18_ && _loc19_ == _loc18_)
                  {
                     _loc5_ = _loc21_.slice(0,-1);
                     _loc8_ = Number(_loc21_.slice(-1));
                     if(_loc8_ < 3)
                     {
                        if(_root.game.map.player.chapter == 0 && _root.game.map.player.phase == 13)
                        {
                           _root.newMessage(_root.textSys[12][_root.lang]);
                           return undefined;
                        }
                        _loc8_ = _loc8_ + 1;
                        this.crystalArr[0].setAttrib(new §[this.crystalArr[0].attrib.Type]§(_loc5_ + _loc8_));
                        this.crystalArr[1].removeMovieClip();
                        this.crystalArr[2].removeMovieClip();
                        this.resultItem = this.crystalArr[0];
                     }
                  }
                  else if(_loc21_ != _loc18_ && _loc19_ != _loc18_ && _loc19_ != _loc21_)
                  {
                     _loc16_ = _loc21_.slice(0,-1);
                     _loc9_ = Number(_loc21_.slice(-1));
                     _loc15_ = _loc18_.slice(0,-1);
                     _loc20_ = Number(_loc18_.slice(-1));
                     _loc14_ = _loc19_.slice(0,-1);
                     _loc22_ = Number(_loc19_.slice(-1));
                     if(_loc9_ == _loc20_ && _loc20_ == _loc22_)
                     {
                        _loc6_ = ["ec","fc","wc","wdc"];
                        for(_loc17_ in _loc6_)
                        {
                           if(_loc16_ != _loc6_[_loc17_] && _loc15_ != _loc6_[_loc17_] && _loc14_ != _loc6_[_loc17_])
                           {
                              if(_loc9_ < 3)
                              {
                                 _loc9_ = _loc9_ + 1;
                                 this.crystalArr[0].setAttrib(new §[this.crystalArr[0].attrib.Type]§(_loc6_[_loc17_] + _loc9_));
                                 this.crystalArr[1].removeMovieClip();
                                 this.crystalArr[2].removeMovieClip();
                                 this.resultItem = this.crystalArr[0];
                              }
                              break;
                           }
                        }
                     }
                  }
            }
         }
         else if(this.crystalArr.length == 0 && this.potionArr.length == 0)
         {
            switch(this.stoneArr.length)
            {
               case 0:
                  break;
               case 1:
                  _loc10_ = this.stoneArr[0].attrib.attrib[0];
                  _loc5_ = _loc10_.slice(0,-1);
                  _loc8_ = Number(_loc10_.slice(-1));
                  if(_loc8_ < 3)
                  {
                     if(_root.game.map.player.chapter == 0 && _root.game.map.player.phase == 13)
                     {
                        _root.newMessage(_root.textSys[12][_root.lang]);
                        return undefined;
                     }
                     if(random(100) < 25)
                     {
                        _loc8_ = _loc8_ + 1;
                        this.stoneArr[0].setAttrib(new §[this.stoneArr[0].attrib.Type]§(_loc5_ + _loc8_));
                        this.resultItem = this.stoneArr[0];
                     }
                     else
                     {
                        this.stoneArr[0].removeMovieClip();
                     }
                  }
                  break;
               case 2:
                  _loc21_ = this.stoneArr[0].attrib.attrib[0];
                  _loc18_ = this.stoneArr[1].attrib.attrib[0];
                  if(_loc21_ == _loc18_)
                  {
                     if(_root.game.map.player.chapter == 0 && _root.game.map.player.phase == 13)
                     {
                        _root.newMessage(_root.textSys[12][_root.lang]);
                        return undefined;
                     }
                     _loc5_ = _loc21_.slice(0,-1);
                     _loc8_ = Number(_loc21_.slice(-1));
                     if(_loc8_ < 3)
                     {
                        if(random(100) < 50)
                        {
                           _loc8_ = _loc8_ + 1;
                           this.stoneArr[0].setAttrib(new §[this.stoneArr[0].attrib.Type]§(_loc5_ + _loc8_));
                           this.stoneArr[1].removeMovieClip();
                           this.resultItem = this.stoneArr[0];
                        }
                        else
                        {
                           this.stoneArr[0].removeMovieClip();
                           this.stoneArr[1].removeMovieClip();
                        }
                     }
                  }
                  break;
               case 3:
                  _loc21_ = this.stoneArr[0].attrib.attrib[0];
                  _loc18_ = this.stoneArr[1].attrib.attrib[0];
                  _loc19_ = this.stoneArr[2].attrib.attrib[0];
                  if(_loc21_ == _loc18_ && _loc19_ == _loc18_)
                  {
                     if(_root.game.map.player.chapter == 0 && _root.game.map.player.phase == 13)
                     {
                        _root.newMessage(_root.textSys[12][_root.lang]);
                        return undefined;
                     }
                     _loc5_ = _loc21_.slice(0,-1);
                     _loc8_ = Number(_loc21_.slice(-1));
                     if(_loc8_ < 3)
                     {
                        _loc8_ = _loc8_ + 1;
                        this.stoneArr[0].setAttrib(new §[this.stoneArr[0].attrib.Type]§(_loc5_ + _loc8_));
                        this.stoneArr[1].removeMovieClip();
                        this.stoneArr[2].removeMovieClip();
                        this.resultItem = this.stoneArr[0];
                     }
                  }
            }
         }
         else if(this.stoneArr.length == 0 && this.crystalArr.length == 0 && this.potionArr.length != 0)
         {
            trace(this.potionArr.length + "-" + this.potionArr[0].attrib.attrib[0] + "-" + this.potionArr[1].attrib.attrib[0]);
            switch(this.potionArr.length)
            {
               case 1:
                  _loc21_ = this.potionArr[0].attrib.attrib[0];
                  if(_loc21_ == "potion1")
                  {
                     this.potionArr[0].setAttrib(new Potion("potion2"));
                     _loc25_ = true;
                  }
                  else if(_loc21_ == "potion2")
                  {
                     this.potionArr[0].setAttrib(new Potion("potion3"));
                     _loc25_ = true;
                  }
                  else if(_loc21_ == "potion4")
                  {
                     this.potionArr[0].setAttrib(new Potion("potion5"));
                     _loc25_ = true;
                  }
                  else if(_loc21_ == "potion5")
                  {
                     this.potionArr[0].setAttrib(new Potion("potion6"));
                     _loc25_ = true;
                  }
                  else if(_loc21_ == "potion7")
                  {
                     this.potionArr[0].setAttrib(new Potion("potion8"));
                     _loc25_ = true;
                  }
                  else if(_loc21_ == "potion8")
                  {
                     this.potionArr[0].setAttrib(new Potion("potion9"));
                     _loc25_ = true;
                  }
                  if(_loc25_)
                  {
                     if(random(100) > 30)
                     {
                        this.potionArr[0].removeMovieClip();
                     }
                     else
                     {
                        this.resultItem = this.potionArr[0];
                     }
                  }
                  break;
               case 2:
                  _loc21_ = this.potionArr[0].attrib.attrib[0];
                  _loc18_ = this.potionArr[1].attrib.attrib[0];
                  if(_loc21_ == "potion1" && _loc18_ == "potion1")
                  {
                     this.potionArr[0].setAttrib(new Potion("potion2"));
                     _loc25_ = true;
                  }
                  else if(_loc21_ == "potion2" && _loc18_ == "potion2")
                  {
                     this.potionArr[0].setAttrib(new Potion("potion3"));
                     _loc25_ = true;
                  }
                  else if(_loc21_ == "potion4" && _loc18_ == "potion4")
                  {
                     this.potionArr[0].setAttrib(new Potion("potion5"));
                     _loc25_ = true;
                  }
                  else if(_loc21_ == "potion5" && _loc18_ == "potion5")
                  {
                     this.potionArr[0].setAttrib(new Potion("potion6"));
                     _loc25_ = true;
                  }
                  else if(_loc21_ == "potion7" && _loc18_ == "potion7")
                  {
                     this.potionArr[0].setAttrib(new Potion("potion8"));
                     _loc25_ = true;
                  }
                  else if(_loc21_ == "potion8" && _loc18_ == "potion8")
                  {
                     this.potionArr[0].setAttrib(new Potion("potion9"));
                     _loc25_ = true;
                  }
                  else if(_loc21_ == "potion1" && _loc18_ == "potion4" || _loc21_ == "potion4" && _loc18_ == "potion1")
                  {
                     this.potionArr[0].setAttrib(new Potion("potion7"));
                     _loc25_ = true;
                  }
                  else if(_loc21_ == "potion2" && _loc18_ == "potion5" || _loc21_ == "potion5" && _loc18_ == "potion2")
                  {
                     this.potionArr[0].setAttrib(new Potion("potion8"));
                     _loc25_ = true;
                  }
                  else if(_loc21_ == "potion3" && _loc18_ == "potion6" || _loc21_ == "potion6" && _loc18_ == "potion3")
                  {
                     this.potionArr[0].setAttrib(new Potion("potion9"));
                     _loc25_ = true;
                  }
                  if(_loc25_)
                  {
                     this.potionArr[1].removeMovieClip();
                     this.resultItem = this.potionArr[0];
                  }
                  break;
               case 4:
                  _loc21_ = this.potionArr[0].attrib.attrib[0];
                  _loc18_ = this.potionArr[1].attrib.attrib[0];
                  _loc19_ = this.potionArr[2].attrib.attrib[0];
                  _loc26_ = this.potionArr[3].attrib.attrib[0];
                  if(_loc21_ == "potion9" && _loc18_ == "potion9" && _loc21_ == "potion9" && _loc18_ == "potion9")
                  {
                     this.potionArr[0].setAttrib(new Potion("potion12"));
                     this.potionArr[1].removeMovieClip();
                     this.potionArr[2].removeMovieClip();
                     this.potionArr[3].removeMovieClip();
                     this.resultItem = this.potionArr[0];
                  }
            }
         }
      }
      else if(this.potionArr.length == 0)
      {
         this.stoneArr = [];
         _loc17_ = 0;
         while(_loc17_ < 4)
         {
            if(_root.ui["composeItem" + _loc17_].attrib.attrib[1] == "stone")
            {
               this.stoneArr.push(_root.ui["composeItem" + _loc17_]);
            }
            _loc17_ = _loc17_ + 1;
         }
         trace(this.stoneArr.length + " - " + _root.ui.composeItem3.attrib.times);
         if(_root.ui.composeItem3.attrib.level != undefined && this.stoneArr.length == 3)
         {
            if(_root.ui.composeItem3.attrib.level < 5)
            {
               _loc21_ = this.stoneArr[0].attrib.attrib[0];
               _loc18_ = this.stoneArr[1].attrib.attrib[0];
               _loc19_ = this.stoneArr[2].attrib.attrib[0];
               if(_loc21_ != _loc18_ && _loc19_ != _loc18_ && _loc19_ != _loc21_)
               {
                  switch(_root.ui.composeItem3.attrib.level)
                  {
                     case 0:
                        _root.ui.composeItem3.attrib.level++;
                        break;
                     case 1:
                        if(random(100) < 100)
                        {
                           _root.ui.composeItem3.attrib.level++;
                        }
                        else
                        {
                           _loc24_ = true;
                        }
                        break;
                     case 2:
                        if(random(100) < 100)
                        {
                           _root.ui.composeItem3.attrib.level++;
                        }
                        else
                        {
                           _loc24_ = true;
                        }
                        break;
                     case 3:
                        if(random(100) < 100)
                        {
                           _root.ui.composeItem3.attrib.level++;
                        }
                        else
                        {
                           _loc24_ = true;
                           _root.ui.composeItem3.attrib.level = 0;
                        }
                        break;
                     case 4:
                        if(random(100) < 100)
                        {
                           _root.ui.composeItem3.attrib.level++;
                        }
                        else
                        {
                           _loc24_ = true;
                           _root.ui.composeItem3.attrib.level = 0;
                        }
                  }
                  _root.ui.composeItem1.removeMovieClip();
                  _root.ui.composeItem2.removeMovieClip();
                  _root.ui.composeItem0.removeMovieClip();
                  this.resultItem = _root.ui.composeItem3;
               }
            }
         }
         else if(Number(_root.ui.composeItem3.attrib.times) <= 0)
         {
            trace("到达合成次数上限");
            _root.newMessage(_root.textSys[13][_root.lang]);
            return undefined;
         }
         trace("合成次数" + _root.ui.composeItem3.attrib.times);
         _loc7_ = -1;
         _loc17_ = 0;
         while(_loc17_ < 4)
         {
            if(_root.ui["composeItem" + _loc17_].attrib.attrib[1] == "crystal")
            {
               _loc10_ = _root.ui["composeItem" + _loc17_].attrib.attrib[0];
               _loc5_ = _loc10_.slice(0,-1);
               _loc8_ = Number(_loc10_.slice(-1));
               if(_loc7_ == -1)
               {
                  _loc7_ = _loc8_;
               }
               else if(_loc7_ != _loc8_)
               {
                  _loc13_ = true;
               }
               if(_loc5_ == "ec")
               {
                  this.cmpArr[0]++;
               }
               else if(_loc5_ == "fc")
               {
                  this.cmpArr[1]++;
               }
               else if(_loc5_ == "wc")
               {
                  this.cmpArr[2]++;
               }
               else if(_loc5_ == "wdc")
               {
                  this.cmpArr[3]++;
               }
            }
            else if(_root.ui["composeItem" + _loc17_].attrib.attrib[1] == "stone")
            {
               _loc10_ = _root.ui["composeItem" + _loc17_].attrib.attrib[0];
               _loc12_ = Number(_loc10_.slice(-1));
            }
            _loc17_ = _loc17_ + 1;
         }
         if(!_loc13_)
         {
            if(_loc7_ == 1 && _loc12_ == 1)
            {
               _loc4_ = 1;
            }
            else if(_loc7_ == 2 && _loc12_ == 1)
            {
               _loc4_ = 2;
            }
            else if(_loc7_ == 3 && _loc12_ == 2)
            {
               _loc4_ = 3;
            }
            else if(_loc7_ == 3 && _loc12_ == 3)
            {
               if(random(100) > 100)
               {
                  _loc3_ = _root.ui.composeItem3.attrib.Type;
                  if(_loc3_ == "Weapon")
                  {
                     _loc17_ = 5;
                     while(_loc17_ <= 14)
                     {
                        _root.ui.composeItem3.attrib.attrib[_loc17_] = 0;
                        _loc17_ = _loc17_ + 1;
                     }
                  }
                  else if(_loc3_ == "Boots" || _loc3_ == "Glove" || _loc3_ == "Shield" || _loc3_ == "Helmet" || _loc3_ == "Wear")
                  {
                     _loc17_ = 3;
                     while(_loc17_ <= 11)
                     {
                        _root.ui.composeItem3.attrib.attrib[_loc17_] = 0;
                        _loc17_ = _loc17_ + 1;
                     }
                     if(_loc3_ == "Shield")
                     {
                        _root.ui.composeItem3.attrib.attrib[12] = 0;
                     }
                  }
                  else
                  {
                     _loc17_ = 3;
                     while(_loc17_ <= 9)
                     {
                        _root.ui.composeItem3.attrib.attrib[_loc17_] = 0;
                        _loc17_ = _loc17_ + 1;
                     }
                  }
                  _loc24_ = true;
                  _loc23_ = true;
               }
               else
               {
                  _loc4_ = 4;
               }
            }
         }
         if(_loc4_ != undefined)
         {
            _loc3_ = _root.ui.composeItem3.attrib.Type;
            if(_root.game.map.player.chapter == 0 && _root.game.map.player.phase == 13)
            {
               if(!this.cmpArray(this.cmpArr,[0,2,0,0]))
               {
                  _root.newMessage(_root.textSys[12][_root.lang]);
                  return undefined;
               }
            }
            if(this.cmpArray(this.cmpArr,[0,2,0,0]))
            {
               if(_loc3_ == "Weapon")
               {
                  if(_root.ui.composeItem3.attrib.attrib[5] == _loc4_ - 1)
                  {
                     _root.ui.composeItem3.attrib.attrib[5] = _loc4_;
                     var _temp_4 = _root.ui.composeItem3.attrib.attrib;
                     var _temp_3 = 6;
                     var _temp_2 = _root.ui.composeItem3.attrib.attrib;
                     var _temp_1 = 7;
                     _root.ui.composeItem3.attrib.attrib[8] = _loc0_ = 0;
                     _temp_2[_temp_1] = _loc0_;
                     _temp_4[_temp_3] = _loc0_;
                     _loc23_ = true;
                  }
               }
               else if(_loc3_ == "Boots" || _loc3_ == "Glove" || _loc3_ == "Shield" || _loc3_ == "Helmet" || _loc3_ == "Wear")
               {
                  if(_root.ui.composeItem3.attrib.attrib[3] == _loc4_ - 1)
                  {
                     _root.ui.composeItem3.attrib.attrib[3] = _loc4_;
                     _loc23_ = true;
                  }
               }
               else if(_root.ui.composeItem3.attrib.attrib[4] == _loc4_ - 1)
               {
                  _root.ui.composeItem3.attrib.attrib[4] = _loc4_;
                  _loc23_ = true;
               }
            }
            else if(this.cmpArray(this.cmpArr,[0,0,2,0]))
            {
               if(_loc3_ == "Weapon")
               {
                  if(_root.ui.composeItem3.attrib.attrib[6] == _loc4_ - 1)
                  {
                     _root.ui.composeItem3.attrib.attrib[6] = _loc4_;
                     var _temp_8 = _root.ui.composeItem3.attrib.attrib;
                     var _temp_7 = 5;
                     var _temp_6 = _root.ui.composeItem3.attrib.attrib;
                     var _temp_5 = 7;
                     _root.ui.composeItem3.attrib.attrib[8] = _loc0_ = 0;
                     _temp_6[_temp_5] = _loc0_;
                     _temp_8[_temp_7] = _loc0_;
                     _loc23_ = true;
                  }
               }
               else if(_loc3_ == "Boots" || _loc3_ == "Glove" || _loc3_ == "Shield" || _loc3_ == "Helmet" || _loc3_ == "Wear")
               {
                  if(_root.ui.composeItem3.attrib.attrib[4] == _loc4_ - 1)
                  {
                     _root.ui.composeItem3.attrib.attrib[4] = _loc4_;
                     _loc23_ = true;
                  }
               }
               else if(_root.ui.composeItem3.attrib.attrib[3] == _loc4_ - 1)
               {
                  _root.ui.composeItem3.attrib.attrib[3] = _loc4_;
                  _loc23_ = true;
               }
            }
            else if(this.cmpArray(this.cmpArr,[0,0,1,1]))
            {
               if(_loc3_ == "Weapon")
               {
                  if(_root.ui.composeItem3.attrib.attrib[7] == _loc4_ - 1)
                  {
                     _root.ui.composeItem3.attrib.attrib[7] = _loc4_;
                     var _temp_12 = _root.ui.composeItem3.attrib.attrib;
                     var _temp_11 = 5;
                     var _temp_10 = _root.ui.composeItem3.attrib.attrib;
                     var _temp_9 = 6;
                     _root.ui.composeItem3.attrib.attrib[8] = _loc0_ = 0;
                     _temp_10[_temp_9] = _loc0_;
                     _temp_12[_temp_11] = _loc0_;
                     _loc23_ = true;
                  }
               }
               else if(_loc3_ == "Boots" || _loc3_ == "Glove" || _loc3_ == "Shield" || _loc3_ == "Helmet" || _loc3_ == "Wear")
               {
                  if(_root.ui.composeItem3.attrib.attrib[5] == _loc4_ - 1)
                  {
                     _root.ui.composeItem3.attrib.attrib[5] = _loc4_;
                     _loc23_ = true;
                  }
               }
            }
            else if(this.cmpArray(this.cmpArr,[1,0,0,1]))
            {
               if(_loc3_ == "Weapon")
               {
                  if(_root.ui.composeItem3.attrib.attrib[8] == _loc4_ - 1)
                  {
                     _root.ui.composeItem3.attrib.attrib[8] = _loc4_;
                     var _temp_16 = _root.ui.composeItem3.attrib.attrib;
                     var _temp_15 = 6;
                     var _temp_14 = _root.ui.composeItem3.attrib.attrib;
                     var _temp_13 = 7;
                     _root.ui.composeItem3.attrib.attrib[5] = _loc0_ = 0;
                     _temp_14[_temp_13] = _loc0_;
                     _temp_16[_temp_15] = _loc0_;
                     _loc23_ = true;
                  }
               }
               else if(_loc3_ == "Boots" || _loc3_ == "Glove" || _loc3_ == "Shield" || _loc3_ == "Helmet" || _loc3_ == "Wear")
               {
                  if(_root.ui.composeItem3.attrib.attrib[8] == _loc4_ - 1)
                  {
                     _root.ui.composeItem3.attrib.attrib[8] = _loc4_;
                     _loc23_ = true;
                  }
               }
            }
            else if(this.cmpArray(this.cmpArr,[1,1,0,0]))
            {
               if(_loc3_ == "Weapon")
               {
                  if(_root.ui.composeItem3.attrib.attrib[13] == _loc4_ - 1)
                  {
                     _root.ui.composeItem3.attrib.attrib[13] = _loc4_;
                     _loc23_ = true;
                  }
               }
               else if(_loc3_ == "Shield")
               {
                  if(_root.ui.composeItem3.attrib.attrib[12] == _loc4_ - 1)
                  {
                     _root.ui.composeItem3.attrib.attrib[12] = _loc4_;
                     _loc23_ = true;
                  }
               }
               else if(!(_loc3_ == "Boots" || _loc3_ == "Glove" || _loc3_ == "Helmet" || _loc3_ == "Wear"))
               {
                  if(_root.ui.composeItem3.attrib.attrib[5] == _loc4_ - 1)
                  {
                     _root.ui.composeItem3.attrib.attrib[5] = _loc4_;
                     _loc23_ = true;
                  }
               }
            }
            else if(this.cmpArray(this.cmpArr,[0,1,1,0]))
            {
               if(_loc3_ == "Weapon")
               {
                  if(_root.ui.composeItem3.attrib.attrib[14] == _loc4_ - 1)
                  {
                     _root.ui.composeItem3.attrib.attrib[14] = _loc4_;
                     _loc23_ = true;
                  }
               }
               else if(_loc3_ == "Boots" || _loc3_ == "Glove" || _loc3_ == "Shield" || _loc3_ == "Helmet" || _loc3_ == "Wear")
               {
                  if(_root.ui.composeItem3.attrib.attrib[10] == _loc4_ - 1)
                  {
                     _root.ui.composeItem3.attrib.attrib[10] = _loc4_;
                     _loc23_ = true;
                  }
               }
               else if(_root.ui.composeItem3.attrib.attrib[6] == _loc4_ - 1)
               {
                  _root.ui.composeItem3.attrib.attrib[6] = _loc4_;
                  _loc23_ = true;
               }
            }
            else if(this.cmpArray(this.cmpArr,[2,0,0,0]))
            {
               if(_loc3_ == "Weapon")
               {
                  if(_root.ui.composeItem3.attrib.attrib[9] == _loc4_ - 1)
                  {
                     _root.ui.composeItem3.attrib.attrib[9] = _loc4_;
                     _loc23_ = true;
                  }
               }
               else if(_loc3_ == "Boots" || _loc3_ == "Glove" || _loc3_ == "Shield" || _loc3_ == "Helmet" || _loc3_ == "Wear")
               {
                  if(_root.ui.composeItem3.attrib.attrib[7] == _loc4_ - 1)
                  {
                     _root.ui.composeItem3.attrib.attrib[7] = _loc4_;
                     _loc23_ = true;
                  }
               }
               else if(_root.ui.composeItem3.attrib.attrib[9] == _loc4_ - 1)
               {
                  _root.ui.composeItem3.attrib.attrib[9] = _loc4_;
                  _loc23_ = true;
               }
            }
            else if(this.cmpArray(this.cmpArr,[0,1,0,1]))
            {
               if(_loc3_ == "Weapon")
               {
                  if(_root.ui.composeItem3.attrib.attrib[10] == _loc4_ - 1)
                  {
                     _root.ui.composeItem3.attrib.attrib[10] = _loc4_;
                     _loc23_ = true;
                  }
               }
               else if(_loc3_ == "Boots" || _loc3_ == "Glove" || _loc3_ == "Shield" || _loc3_ == "Helmet" || _loc3_ == "Wear")
               {
                  if(_root.ui.composeItem3.attrib.attrib[6] == _loc4_ - 1)
                  {
                     _root.ui.composeItem3.attrib.attrib[6] = _loc4_;
                     _loc23_ = true;
                  }
               }
            }
            else if(this.cmpArray(this.cmpArr,[0,0,0,2]))
            {
               if(_loc3_ == "Weapon")
               {
                  if(_root.ui.composeItem3.attrib.attrib[11] == _loc4_ - 1)
                  {
                     _root.ui.composeItem3.attrib.attrib[11] = _loc4_;
                     _loc23_ = true;
                  }
               }
               else if(_loc3_ == "Boots" || _loc3_ == "Glove" || _loc3_ == "Shield" || _loc3_ == "Helmet" || _loc3_ == "Wear")
               {
                  if(_root.ui.composeItem3.attrib.attrib[9] == _loc4_ - 1)
                  {
                     _root.ui.composeItem3.attrib.attrib[9] = _loc4_;
                     _loc23_ = true;
                  }
               }
               else if(_root.ui.composeItem3.attrib.attrib[7] == _loc4_ - 1)
               {
                  _root.ui.composeItem3.attrib.attrib[7] = _loc4_;
                  _loc23_ = true;
               }
            }
            else if(this.cmpArray(this.cmpArr,[1,0,1,0]))
            {
               if(_loc3_ == "Weapon")
               {
                  if(_root.ui.composeItem3.attrib.attrib[12] == _loc4_ - 1)
                  {
                     _root.ui.composeItem3.attrib.attrib[12] = _loc4_;
                     _loc23_ = true;
                  }
               }
               else if(_loc3_ == "Boots" || _loc3_ == "Glove" || _loc3_ == "Shield" || _loc3_ == "Helmet" || _loc3_ == "Wear")
               {
                  if(_root.ui.composeItem3.attrib.attrib[11] == _loc4_ - 1)
                  {
                     _root.ui.composeItem3.attrib.attrib[11] = _loc4_;
                     _loc23_ = true;
                  }
               }
               else if(_root.ui.composeItem3.attrib.attrib[8] == _loc4_ - 1)
               {
                  _root.ui.composeItem3.attrib.attrib[8] = _loc4_;
                  _loc23_ = true;
               }
            }
            if(_loc23_)
            {
               _root.ui.composeItem3.attrib.times--;
               _root.ui.composeItem1.removeMovieClip();
               _root.ui.composeItem2.removeMovieClip();
               _root.ui.composeItem0.removeMovieClip();
               this.resultItem = _root.ui.composeItem3;
            }
         }
      }
      if(this.resultItem != undefined)
      {
         this.resultItem.attrib.setParam();
         this.resultItem.attrib.setString();
         if(!_root.ui.composeItem5._x)
         {
            this.resultItem._name = "composeItem5";
         }
         else
         {
            _root.ui.composeItem5.findAPlace();
            this.resultItem._name = "composeItem5";
         }
         if(_loc24_)
         {
            _root.newMessage(_root.textSys[14][_root.lang]);
            _root.playSound1("合成失败.mp3");
         }
         else
         {
            _root.newMessage(_root.textSys[15][_root.lang] + _root.ui.composeItem5.attrib.itemName);
            _root.playSound1("合成成功.mp3");
            if(_root.game.map.player.ach[13][0] == 0)
            {
               _root.game.map.player.ach[13][1] = _loc0_ = _root.game.map.player.ach[13][1] + 1;
               if(_loc0_ >= 50)
               {
                  _root.game.map.player.ach[13][0] = 1;
                  _root.newMessage("New Archievement Unlocked!");
               }
            }
            if(_root.game.map.player.ach[14][0] == 0)
            {
               _root.game.map.player.ach[14][1] = _loc0_ = _root.game.map.player.ach[14][1] + 1;
               if(_loc0_ >= 300)
               {
                  _root.game.map.player.ach[14][0] = 1;
                  _root.newMessage("New Archievement Unlocked!");
               }
            }
            if(_root.game.map.player.ach[15][0] == 0)
            {
               _root.game.map.player.ach[15][1] = _loc0_ = _root.game.map.player.ach[15][1] + 1;
               if(_loc0_ >= 1000)
               {
                  _root.game.map.player.ach[15][0] = 1;
                  _root.newMessage("New Archievement Unlocked!");
               }
            }
         }
         if(_root.game.map.player.chapter == 0 && _root.game.map.player.phase == 13)
         {
            if(_root.ui.composeItem5.attrib.Type == "Weapon")
            {
               if(_root.ui.composeItem5.attrib.attrib[5] == 1)
               {
                  for(_loc17_ in _root.game.map.player.questList)
                  {
                     if(_root.game.map.player.questList[_loc17_].object == "获得一把合成好的剑")
                     {
                        _root.ui.attachMovie("pointAndHint","pointAndHint",_root.ui.getNextHighestDepth());
                        _root.ui.pointAndHint.init(1067,300,_root.textTutorial[20][_root.lang]);
                        _root.game.map.player.questList[_loc17_].accomplish();
                        break;
                     }
                  }
               }
            }
         }
         if(_root.game.map.player.secondaryQuest[2][2] == 1)
         {
            if(_root.ui.composeItem5.attrib.attrib[0] == "potion9")
            {
               for(_loc17_ in _root.game.map.player.questList)
               {
                  if(_root.game.map.player.questList[_loc17_].object == "大型特效药剂")
                  {
                     _root.game.map.player.questList[_loc17_].accomplish();
                     break;
                  }
               }
            }
         }
         if(_root.game.map.player.secondaryQuest[3][0] == 1)
         {
            if(_root.ui.composeItem5.attrib.Type == "Shield" && _root.ui.composeItem5.attrib.attrib[8] == 2 && _root.ui.composeItem5.attrib.attrib[12] == 2)
            {
               for(_loc17_ in _root.game.map.player.questList)
               {
                  if(_root.game.map.player.questList[_loc17_].object == "铁匠的盾牌")
                  {
                     _root.game.map.player.questList[_loc17_].accomplish();
                     break;
                  }
               }
            }
         }
         this.resultItem._x = this.resultPos[0];
         this.resultItem._y = this.resultPos[1];
      }
      else
      {
         _root.newMessage(_root.textSys[16][_root.lang]);
         _root.playSound1("合成失败.mp3");
      }
      _root.game.map.player.saveStatus();
      var _loc11_ = _root.getNextHighestDepth();
      _root.attachMovie("合成特效","fx" + _loc11_,_loc11_,{_x:this.resultPos[0],_y:this.resultPos[1]});
      _loc11_ = _root.getNextHighestDepth();
      _root.attachMovie("合成特效","fx" + _loc11_,_loc11_,{_x:this.composePos[0][0],_y:this.composePos[0][1]});
      _loc11_ = _root.getNextHighestDepth();
      _root.attachMovie("合成特效","fx" + _loc11_,_loc11_,{_x:this.composePos[1][0],_y:this.composePos[1][1]});
      _loc11_ = _root.getNextHighestDepth();
      _root.attachMovie("合成特效","fx" + _loc11_,_loc11_,{_x:this.composePos[2][0],_y:this.composePos[2][1]});
      _loc11_ = _root.getNextHighestDepth();
      _root.attachMovie("合成特效","fx" + _loc11_,_loc11_,{_x:this.composePos[3][0],_y:this.composePos[3][1]});
   }
}
