class DlgSkill extends MovieClip
{
   var AP;
   var APtxt;
   var btnAccept;
   var funcId;
   var id;
   var info;
   var l1;
   var l2;
   var l3;
   var l4;
   var l5;
   var l6;
   var l7;
   var skillList;
   function DlgSkill()
   {
      super();
      this.skillList = [];
      this.info.text = _root.textSys[24][_root.lang];
      this.clone();
      this.fresh();
   }
   function clone()
   {
      var _loc3_ = 0;
      while(_loc3_ < 22)
      {
         this.skillList[_loc3_] = _root.game.map.player.skillList[_loc3_];
         _loc3_ = _loc3_ + 1;
      }
      this.AP = _root.game.map.player.AP;
   }
   function setAP()
   {
      _root.game.map.player.uninstWeaponWithSkill();
      var _loc4_ = this.skillList[6] - _root.game.map.player.skillList[6];
      var _loc3_ = 0;
      while(_loc3_ < 22)
      {
         _root.game.map.player.skillList[_loc3_] = this.skillList[_loc3_];
         _loc3_ = _loc3_ + 1;
      }
      _root.game.map.player.AP = this.AP;
      _root.game.map.player.encumbrance0 = _root.game.map.player.strength * 5 + 50 + _root.game.map.player.skillList[3] * 50;
      _root.game.map.player.encumbrance = _root.game.map.player.encumbrance0 + _root.game.map.player.encumbrance1;
      _root.game.map.player.calcWeight();
      _root.game.map.player.setupWeaponWithSkill();
      _root.game.map.player.setHPSPregain();
      if(_loc4_ > 0)
      {
         _loc4_ *= 5;
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _root.game.map.player.strengthUp();
            _root.game.map.player.agilityUp();
            _root.game.map.player.stamineUp();
            _root.game.map.player.luckUp();
            _loc3_ = _loc3_ + 1;
         }
      }
      _root.game.map.player.CP += _loc4_ * 4;
      _root.ui.dlgSkill.fresh();
   }
   function fresh()
   {
      var _loc4_ = _root.game.map.player.level;
      this.l1.gotoAndStop(1);
      this.l2.gotoAndStop(1);
      this.l3.gotoAndStop(1);
      this.l4.gotoAndStop(1);
      this.l5.gotoAndStop(1);
      this.l6.gotoAndStop(1);
      this.l7.gotoAndStop(1);
      var _loc3_ = 1;
      var _loc6_;
      while(_loc3_ <= 22)
      {
         if(this.skillList[_loc3_ - 1] != 0)
         {
            this["s" + _loc3_].gotoAndStop(1);
         }
         else
         {
            this["s" + _loc3_].gotoAndStop(2);
         }
         this["btn" + _loc3_ + "Up"]._visible = this["btn" + _loc3_ + "Down"]._visible = false;
         _loc6_ = false;
         if(this.skillList[_loc3_ - 1] >= _root.skillMax[_loc3_ - 1])
         {
            this["skill" + _loc3_ + "Lv"].text = "Max";
         }
         else
         {
            this["skill" + _loc3_ + "Lv"].text = this.skillList[_loc3_ - 1];
         }
         if(_loc3_ <= 3)
         {
            if(_loc4_ <= this.skillList[_loc3_ - 1] * 2)
            {
               _loc6_ = true;
            }
         }
         if(_loc3_ == 4)
         {
            if(_loc4_ < 5)
            {
               _loc6_ = true;
            }
         }
         if(_loc3_ == 5)
         {
            if(_loc4_ < 10)
            {
               _loc6_ = true;
            }
         }
         if(_loc3_ == 6)
         {
            if(_loc4_ < 15)
            {
               _loc6_ = true;
            }
         }
         if(_loc3_ == 7)
         {
            if(_loc4_ < 20)
            {
               _loc6_ = true;
            }
         }
         if(_loc3_ == 11)
         {
            if(this.skillList[10] == 0)
            {
               if(this.skillList[7] < 3)
               {
                  _loc6_ = true;
               }
            }
            else if(this.skillList[10] == 1)
            {
               if(this.skillList[7] < 6)
               {
                  _loc6_ = true;
               }
            }
            else if(this.skillList[10] == 2)
            {
               if(this.skillList[7] < 9)
               {
                  _loc6_ = true;
               }
            }
            if(!_loc6_)
            {
               this.l1.gotoAndStop(2);
            }
         }
         if(_loc3_ == 12)
         {
            if(this.skillList[11] == 0)
            {
               if(this.skillList[8] < 3)
               {
                  _loc6_ = true;
               }
            }
            else if(this.skillList[11] == 1)
            {
               if(this.skillList[8] < 6)
               {
                  _loc6_ = true;
               }
            }
            else if(this.skillList[11] == 2)
            {
               if(this.skillList[8] < 9)
               {
                  _loc6_ = true;
               }
            }
            if(!_loc6_)
            {
               this.l2.gotoAndStop(2);
            }
         }
         if(_loc3_ == 13)
         {
            if(this.skillList[12] == 0)
            {
               if(this.skillList[9] < 3)
               {
                  _loc6_ = true;
               }
            }
            else if(this.skillList[12] == 1)
            {
               if(this.skillList[9] < 6)
               {
                  _loc6_ = true;
               }
            }
            else if(this.skillList[12] == 2)
            {
               if(this.skillList[9] < 9)
               {
                  _loc6_ = true;
               }
            }
            if(!_loc6_)
            {
               this.l3.gotoAndStop(2);
            }
         }
         if(_loc3_ == 14)
         {
            if(_loc4_ < 5)
            {
               _loc6_ = true;
            }
         }
         if(_loc3_ == 15)
         {
            if(_loc4_ < 15 || this.skillList[13] < 3)
            {
               _loc6_ = true;
            }
            else
            {
               this.l4.gotoAndStop(2);
            }
         }
         if(_loc3_ == 16)
         {
            if(_loc4_ < 25 || this.skillList[14] < 3)
            {
               _loc6_ = true;
            }
            else
            {
               this.l5.gotoAndStop(2);
            }
         }
         if(_loc3_ == 17)
         {
            if(_loc4_ < 5)
            {
               _loc6_ = true;
            }
         }
         if(_loc3_ == 18)
         {
            if(_loc4_ < 15 || this.skillList[16] < 3)
            {
               _loc6_ = true;
            }
            else
            {
               this.l6.gotoAndStop(2);
            }
         }
         if(_loc3_ == 19)
         {
            if(_loc4_ < 25 || this.skillList[17] < 3)
            {
               _loc6_ = true;
            }
            else
            {
               this.l7.gotoAndStop(2);
            }
         }
         if(_loc3_ == 20)
         {
            if(_loc4_ < this.skillList[_loc3_ - 1] * 5 + 5)
            {
               _loc6_ = true;
            }
         }
         if(_loc3_ == 21)
         {
            if(_loc4_ < this.skillList[_loc3_ - 1] * 5 + 10)
            {
               _loc6_ = true;
            }
         }
         if(_loc3_ == 22)
         {
            if(_loc4_ < 20 || _loc4_ <= this.skillList[_loc3_ - 1] * 3)
            {
               _loc6_ = true;
            }
         }
         if(!_loc6_)
         {
            if(_root.ui.dlgSkill.AP > 0)
            {
               this["btn" + _loc3_ + "Up"]._visible = true;
               this["btn" + _loc3_ + "Up"].id = _loc3_;
               this["btn" + _loc3_ + "Up"].onRelease = function()
               {
                  _root.playSound1("对话框");
                  _root.ui.dlgSkill.skillList[this.id - 1]++;
                  _root.ui.dlgSkill.AP--;
                  _root.ui.dlgSkill.fresh();
               };
            }
            if(_root.ui.dlgSkill.AP < _root.game.map.player.AP && _root.ui.dlgSkill.skillList[_loc3_ - 1] > _root.game.map.player.skillList[_loc3_ - 1])
            {
               this["btn" + _loc3_ + "Down"]._visible = true;
               this["btn" + _loc3_ + "Down"].id = _loc3_;
               this["btn" + _loc3_ + "Down"].onRelease = function()
               {
                  _root.playSound1("对话框");
                  _root.ui.dlgSkill.skillList[this.id - 1]--;
                  _root.ui.dlgSkill.AP++;
                  if(this.id == 8 || this.id == 9 || this.id == 10)
                  {
                     if(_root.ui.dlgSkill.skillList[this.id - 1] < 3)
                     {
                        if(_root.ui.dlgSkill.skillList[this.id + 2] > 0)
                        {
                           _root.ui.dlgSkill.AP += _root.ui.dlgSkill.skillList[this.id + 2] - 0;
                           _root.ui.dlgSkill.skillList[this.id + 2] = 0;
                        }
                     }
                     else if(_root.ui.dlgSkill.skillList[this.id - 1] < 6)
                     {
                        if(_root.ui.dlgSkill.skillList[this.id + 2] > 1)
                        {
                           _root.ui.dlgSkill.AP += _root.ui.dlgSkill.skillList[this.id + 2] - 1;
                           _root.ui.dlgSkill.skillList[this.id + 2] = 1;
                        }
                     }
                     else if(_root.ui.dlgSkill.skillList[this.id - 1] < 9)
                     {
                        if(_root.ui.dlgSkill.skillList[this.id + 2] > 2)
                        {
                           _root.ui.dlgSkill.AP += _root.ui.dlgSkill.skillList[this.id + 2] - 2;
                           _root.ui.dlgSkill.skillList[this.id + 2] = 2;
                        }
                     }
                  }
                  if(this.id == 14 && _root.ui.dlgSkill.skillList[this.id - 1] == 2)
                  {
                     _root.ui.dlgSkill.AP += _root.ui.dlgSkill.skillList[14] + _root.ui.dlgSkill.skillList[15];
                     _root.ui.dlgSkill.skillList[14] = 0;
                     _root.ui.dlgSkill.skillList[15] = 0;
                  }
                  else if(this.id == 15 && _root.ui.dlgSkill.skillList[this.id - 1] == 2)
                  {
                     _root.ui.dlgSkill.AP += _root.ui.dlgSkill.skillList[15];
                     _root.ui.dlgSkill.skillList[15] = 0;
                  }
                  else if(this.id == 17 && _root.ui.dlgSkill.skillList[this.id - 1] == 2)
                  {
                     _root.ui.dlgSkill.AP += _root.ui.dlgSkill.skillList[17] + _root.ui.dlgSkill.skillList[18];
                     _root.ui.dlgSkill.skillList[17] = 0;
                     _root.ui.dlgSkill.skillList[18] = 0;
                  }
                  else if(this.id == 18 && _root.ui.dlgSkill.skillList[this.id - 1] == 2)
                  {
                     _root.ui.dlgSkill.AP += _root.ui.dlgSkill.skillList[18];
                     _root.ui.dlgSkill.skillList[18] = 0;
                  }
                  _root.ui.dlgSkill.fresh();
               };
            }
            if(this.skillList[_loc3_ - 1] >= _root.skillMax[_loc3_ - 1])
            {
               this["btn" + _loc3_ + "Up"]._visible = false;
            }
         }
         if(_root.game.map.player.AP > 0)
         {
            this.btnAccept._visible = true;
            this.btnAccept.onRelease = function()
            {
               _root.playSound1("对话框");
               this._parent.setAP();
               this._visible = false;
            };
         }
         else
         {
            this.btnAccept._visible = false;
         }
         this["s" + _loc3_].id = _loc3_;
         if(_loc3_ > 10)
         {
            this["s" + _loc3_].onPress = function()
            {
               _root.playSound1("对话框");
               var _loc3_;
               if(_root.game.map.player.skillList[this.id - 1] > 0)
               {
                  _loc3_ = _root.ui.attachMovie("skillMc","skillMcHold",_root.ui.getNextHighestDepth());
                  _loc3_._x = this._x + 50;
                  _loc3_._y = this._y;
                  _loc3_.init(this.id,this.funcId);
               }
            };
         }
         this["s" + _loc3_].onRollOver = function()
         {
            this._parent.info.text = _root.skillInfo[this.id - 1] + _root.skillInfo2[this.id - 1][this._parent.skillList[this.id - 1]];
         };
         this["s" + _loc3_].onRollOut = function()
         {
            this._parent.info.text = _root.textSys[24][_root.lang];
         };
         _loc3_ = _loc3_ + 1;
      }
      this.APtxt.text = this.AP;
   }
}
