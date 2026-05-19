class Npc巫女 extends Npc
{
   var _name;
   var chapter;
   var goods;
   var ifEmptyStore;
   var keyD;
   var npcName;
   var onEnterFrame;
   var phase;
   var questId;
   var speech;
   var str;
   var subQuestId;
   function Npc巫女()
   {
      super();
      if(this._name.slice(0,8) != "instance")
      {
         this.npcName = _root.textNpcName[2][_root.lang];
         this.setDlg();
         this.updateSpeech();
         this.questId = [];
         this.questId[1] = [];
         this.questId[1][3] = 1;
         this.questId[3] = [];
         this.questId[3][6] = 1;
         this.subQuestId = [];
         this.subQuestId[2] = 2;
         this.updateStore();
      }
   }
   function updateStore()
   {
      var _loc8_ = _root.game.map.player.chapter;
      var _loc9_ = _root.game.map.player.phase;
      this.goods = [];
      if(_loc8_ == 0 && _loc9_ == 7)
      {
         this.goods[0] = new Potion("potion1");
         this.goods[1] = new Potion("potion1");
         this.goods[2] = new Potion("potion1");
         this.goods[3] = new Potion("potion1");
         this.goods[4] = new Potion("potion1");
      }
      var _loc0_;
      var _loc7_;
      var _loc4_;
      var _loc3_;
      var _loc5_;
      var _loc6_;
      if(_loc8_ > 0)
      {
         switch(_loc8_)
         {
            case 4:
            case 5:
            case 3:
               var _temp_8 = this.goods;
               var _temp_7 = 0;
               var _temp_6 = this.goods;
               var _temp_5 = 1;
               var _temp_4 = this.goods;
               var _temp_3 = 2;
               var _temp_2 = this.goods;
               var _temp_1 = 3;
               this.goods[4] = _loc0_ = new Potion("potion1");
               _temp_2[_temp_1] = _loc0_;
               _temp_4[_temp_3] = _loc0_;
               _temp_6[_temp_5] = _loc0_;
               _temp_8[_temp_7] = _loc0_;
               var _temp_16 = this.goods;
               var _temp_15 = 5;
               var _temp_14 = this.goods;
               var _temp_13 = 6;
               var _temp_12 = this.goods;
               var _temp_11 = 7;
               var _temp_10 = this.goods;
               var _temp_9 = 8;
               this.goods[9] = _loc0_ = new Potion("potion2");
               _temp_10[_temp_9] = _loc0_;
               _temp_12[_temp_11] = _loc0_;
               _temp_14[_temp_13] = _loc0_;
               _temp_16[_temp_15] = _loc0_;
               var _temp_24 = this.goods;
               var _temp_23 = 10;
               var _temp_22 = this.goods;
               var _temp_21 = 11;
               var _temp_20 = this.goods;
               var _temp_19 = 12;
               var _temp_18 = this.goods;
               var _temp_17 = 13;
               this.goods[14] = _loc0_ = new Potion("potion3");
               _temp_18[_temp_17] = _loc0_;
               _temp_20[_temp_19] = _loc0_;
               _temp_22[_temp_21] = _loc0_;
               _temp_24[_temp_23] = _loc0_;
               var _temp_32 = this.goods;
               var _temp_31 = 15;
               var _temp_30 = this.goods;
               var _temp_29 = 16;
               var _temp_28 = this.goods;
               var _temp_27 = 17;
               var _temp_26 = this.goods;
               var _temp_25 = 18;
               this.goods[19] = _loc0_ = new Potion("potion4");
               _temp_26[_temp_25] = _loc0_;
               _temp_28[_temp_27] = _loc0_;
               _temp_30[_temp_29] = _loc0_;
               _temp_32[_temp_31] = _loc0_;
               var _temp_40 = this.goods;
               var _temp_39 = 20;
               var _temp_38 = this.goods;
               var _temp_37 = 21;
               var _temp_36 = this.goods;
               var _temp_35 = 22;
               var _temp_34 = this.goods;
               var _temp_33 = 23;
               this.goods[24] = _loc0_ = new Potion("potion5");
               _temp_34[_temp_33] = _loc0_;
               _temp_36[_temp_35] = _loc0_;
               _temp_38[_temp_37] = _loc0_;
               _temp_40[_temp_39] = _loc0_;
               var _temp_48 = this.goods;
               var _temp_47 = 25;
               var _temp_46 = this.goods;
               var _temp_45 = 26;
               var _temp_44 = this.goods;
               var _temp_43 = 27;
               var _temp_42 = this.goods;
               var _temp_41 = 28;
               this.goods[29] = _loc0_ = new Potion("potion6");
               _temp_42[_temp_41] = _loc0_;
               _temp_44[_temp_43] = _loc0_;
               _temp_46[_temp_45] = _loc0_;
               _temp_48[_temp_47] = _loc0_;
               break;
            case 2:
               var _temp_56 = this.goods;
               var _temp_55 = 0;
               var _temp_54 = this.goods;
               var _temp_53 = 1;
               var _temp_52 = this.goods;
               var _temp_51 = 2;
               var _temp_50 = this.goods;
               var _temp_49 = 3;
               this.goods[4] = _loc0_ = new Potion("potion1");
               _temp_50[_temp_49] = _loc0_;
               _temp_52[_temp_51] = _loc0_;
               _temp_54[_temp_53] = _loc0_;
               _temp_56[_temp_55] = _loc0_;
               var _temp_64 = this.goods;
               var _temp_63 = 5;
               var _temp_62 = this.goods;
               var _temp_61 = 6;
               var _temp_60 = this.goods;
               var _temp_59 = 7;
               var _temp_58 = this.goods;
               var _temp_57 = 8;
               this.goods[9] = _loc0_ = new Potion("potion2");
               _temp_58[_temp_57] = _loc0_;
               _temp_60[_temp_59] = _loc0_;
               _temp_62[_temp_61] = _loc0_;
               _temp_64[_temp_63] = _loc0_;
               var _temp_72 = this.goods;
               var _temp_71 = 10;
               var _temp_70 = this.goods;
               var _temp_69 = 11;
               var _temp_68 = this.goods;
               var _temp_67 = 12;
               var _temp_66 = this.goods;
               var _temp_65 = 13;
               this.goods[14] = _loc0_ = new Potion("potion4");
               _temp_66[_temp_65] = _loc0_;
               _temp_68[_temp_67] = _loc0_;
               _temp_70[_temp_69] = _loc0_;
               _temp_72[_temp_71] = _loc0_;
               var _temp_80 = this.goods;
               var _temp_79 = 15;
               var _temp_78 = this.goods;
               var _temp_77 = 16;
               var _temp_76 = this.goods;
               var _temp_75 = 17;
               var _temp_74 = this.goods;
               var _temp_73 = 18;
               this.goods[19] = _loc0_ = new Potion("potion5");
               _temp_74[_temp_73] = _loc0_;
               _temp_76[_temp_75] = _loc0_;
               _temp_78[_temp_77] = _loc0_;
               _temp_80[_temp_79] = _loc0_;
               break;
            case 1:
               var _temp_88 = this.goods;
               var _temp_87 = 0;
               var _temp_86 = this.goods;
               var _temp_85 = 1;
               var _temp_84 = this.goods;
               var _temp_83 = 2;
               var _temp_82 = this.goods;
               var _temp_81 = 3;
               this.goods[4] = _loc0_ = new Potion("potion1");
               _temp_82[_temp_81] = _loc0_;
               _temp_84[_temp_83] = _loc0_;
               _temp_86[_temp_85] = _loc0_;
               _temp_88[_temp_87] = _loc0_;
               var _temp_96 = this.goods;
               var _temp_95 = 5;
               var _temp_94 = this.goods;
               var _temp_93 = 6;
               var _temp_92 = this.goods;
               var _temp_91 = 7;
               var _temp_90 = this.goods;
               var _temp_89 = 8;
               this.goods[9] = _loc0_ = new Potion("potion4");
               _temp_90[_temp_89] = _loc0_;
               _temp_92[_temp_91] = _loc0_;
               _temp_94[_temp_93] = _loc0_;
               _temp_96[_temp_95] = _loc0_;
         }
         this.goods.push(new Potion("potion13"));
         this.goods.push(new Potion("potion14"));
         this.goods.push(new Potion("potion15"));
         this.goods.push(new Potion("potion16"));
         this.goods.push(new Potion("potion17"));
         this.goods.push(new Potion("potion18"));
         this.goods.push(new Teleporter());
         this.goods.push(new Teleporter());
         _loc7_ = random(5);
         _loc4_ = 0;
         while(_loc4_ < _loc7_)
         {
            if(!random(5))
            {
               _loc3_ = random(100);
               if(_loc3_ < 5)
               {
                  _loc5_ = 3;
               }
               else if(_loc3_ < 20)
               {
                  _loc5_ = 2;
               }
               else
               {
                  _loc5_ = 1;
               }
               switch(random(5))
               {
                  case 0:
                     _loc6_ = "fc";
                     break;
                  case 1:
                     _loc6_ = "wdc";
                     break;
                  case 2:
                     _loc6_ = "ec";
                     break;
                  case 3:
                     _loc6_ = "wc";
                     break;
                  case 4:
                     _loc6_ = "stone";
               }
               this.goods.push(new Crystal(_loc6_ + _loc5_));
            }
            _loc4_ = _loc4_ + 1;
         }
      }
   }
   function setDlg()
   {
      this.npcName = _root.textNpcName[2][_root.lang];
      this.str = [];
      this.str[0] = [];
      this.str[0][0] = [[_root.textNpc3[0][_root.lang]]];
      if(this.ifEmptyStore() == false)
      {
         this.str[0][7] = [[_root.textNpc3[1][_root.lang]]];
      }
      else
      {
         this.str[0][7] = [[_root.textNpc3[2][_root.lang],_root.textNpc3[3][_root.lang]]];
      }
      this.str[0][8] = this.str[0][9] = this.str[0][10] = [[_root.textNpc3[2][_root.lang],_root.textNpc3[3][_root.lang]]];
      var _loc3_;
      if(_root.game.map.player.chapter == 0 && _root.game.map.player.phase == 13)
      {
         for(var _loc4_ in _root.game.map.player.inventoryList)
         {
            if(_root.game.map.player.inventoryList[_loc4_].Type == "Weapon")
            {
               if(_root.game.map.player.inventoryList[_loc4_].attrib[5] == 1)
               {
                  _loc3_ = true;
                  break;
               }
            }
         }
         if(_loc3_)
         {
            this.str[0][13] = [[_root.textNpc3[4][_root.lang]]];
         }
         else
         {
            this.str[0][13] = [[_root.textNpc3[5][_root.lang]]];
         }
      }
      this.str[0][13] = [[_root.textNpc3[5][_root.lang]]];
      this.str[1] = [];
      this.str[1][0] = [[_root.textNpc3[6][_root.lang],_root.textNpc3[7][_root.lang]],[_root.textNpc3[8][_root.lang],_root.textNpc3[9][_root.lang]]];
      this.str[2] = [];
      this.str[2][0] = [];
      this.str[2][0][0] = [_root.textNpc3[10][_root.lang],_root.textNpc3[11][_root.lang]];
      this.str[2][0][1] = [_root.textNpc3[12][_root.lang]];
      this.str[2][0][2] = [_root.textNpc3[13][_root.lang],_root.textNpc3[14][_root.lang],_root.textNpc3[15][_root.lang]];
      this.str[3] = [];
      this.str[3][0] = [];
      this.str[3][0][0] = [_root.textNpc3[16][_root.lang]];
      this.str[3][0][1] = [_root.textNpc3[17][_root.lang],_root.textNpc3[18][_root.lang]];
      this.str[4] = [];
      this.str[4][0] = [];
      if(_root.game.map.player.chapter == 4 && _root.game.map.player.phase >= 9)
      {
         this.str[4][0][0] = [_root.textNpc3[23][_root.lang]];
         this.str[4][0][1] = [_root.textNpc3[24][_root.lang]];
      }
      else
      {
         this.str[4][0][0] = [_root.textNpc3[19][_root.lang]];
         this.str[4][0][1] = [_root.textNpc3[20][_root.lang]];
         this.str[4][0][2] = [_root.textNpc3[21][_root.lang],_root.textNpc3[22][_root.lang]];
      }
      this.str[5] = [];
      this.str[6] = [];
      this.str[7] = [];
      this.str[8] = [];
      this.str[9] = [];
   }
   function updateSpeech()
   {
      if(this.ifEmptyStore() == false)
      {
         this.str[0][7] = [[_root.textNpc3[1][_root.lang]]];
      }
      else
      {
         this.str[0][7] = [[_root.textNpc3[2][_root.lang]]];
      }
      this.chapter = _root.game.map.player.chapter;
      this.phase = _root.game.map.player.phase;
      if(this.str[this.chapter][this.phase] == undefined)
      {
         this.speech = this.str[this.chapter][0];
      }
      else
      {
         this.speech = this.str[this.chapter][this.phase];
      }
   }
   function showStore()
   {
      var _loc5_;
      var _loc3_;
      var _loc6_;
      var _loc7_;
      var _loc4_;
      if(!_root.ui.dlgSellStuff._x)
      {
         _loc5_ = _root.ui.attachMovie("dlgSellStuff","dlgSellStuff",_root.ui.getNextHighestDepth(),{_x:50});
         if(!_root.ui.dlgInv._x)
         {
            _root.ui.newInv();
         }
         else
         {
            _root.ui.dlgInv.swapDepths(_root.ui.getNextHighestDepth());
            _loc3_ = 10;
            while(_loc3_ < _root.game.map.player.inventoryList.length)
            {
               _root.ui["item" + _loc3_].swapDepths(_root.ui.getNextHighestDepth());
               _loc3_ = _loc3_ + 1;
            }
         }
         _loc5_.init("store");
         _loc5_.gotoAndStop(2);
         _loc5_.goods = this.goods;
         _root.ui.pointAndHint.removeMovieClip();
         _loc6_ = _root.game.map.player.chapter;
         _loc7_ = _root.game.map.player.phase;
         if(_loc6_ == 0 && _loc7_ == 7)
         {
            if(_root.hintOfDlg._x == undefined)
            {
               _root.attachMovie("hintOfDlg","hintOfDlg",_root.getNextHighestDepth());
            }
            _root.hintOfDlg.gotoAndStop(2);
         }
         _loc3_ = 0;
         while(_loc3_ < this.goods.length)
         {
            if(this.goods[_loc3_] != undefined)
            {
               _loc4_ = _root.ui.attachMovie("item","storeItem" + _loc3_,_root.ui.getNextHighestDepth());
               _loc4_.storeItem = true;
               _loc4_.npc = this;
               _loc4_.setAttrib(this.goods[_loc3_]);
               _loc4_.setPosition(_loc3_);
            }
            _loc3_ = _loc3_ + 1;
         }
      }
   }
   function specialEnd()
   {
      var _loc4_ = _root.game.map.player.chapter;
      var _loc6_ = _root.game.map.player.phase;
      var _loc3_;
      if(_loc4_ == 0 && _loc6_ == 13)
      {
         if(!_root.ui.dlgCompose._x)
         {
            _root.ui.pointAndHint.removeMovieClip();
            if(_root.hintOfDlg._x == undefined)
            {
               _root.attachMovie("hintOfDlg","hintOfDlg",_root.getNextHighestDepth());
            }
            _root.hintOfDlg.gotoAndStop(6);
            _root.ui.attachMovie("dlgCompose","dlgCompose",_root.ui.getNextHighestDepth(),{_x:50});
            if(!_root.ui.dlgInv._x)
            {
               _root.ui.newInv();
            }
            else
            {
               _root.ui.dlgInv.swapDepths(_root.ui.getNextHighestDepth());
               _loc3_ = 10;
               while(_loc3_ < _root.game.map.player.inventoryList.length)
               {
                  _root.ui["item" + _loc3_].swapDepths(_root.ui.getNextHighestDepth());
                  _loc3_ = _loc3_ + 1;
               }
            }
         }
         return true;
      }
      var _loc5_;
      if(_loc4_ > 0)
      {
         _loc5_ = [_root.textNpc3[25][_root.lang]];
         _root.ui.dialog.init2(this.npcName,_loc5_);
         _root.ui.dialog.keyD = true;
         _root.ui.dialog.onEnterFrame = function()
         {
            var _loc3_;
            if(Key.isDown(74) || _root.mouseCursor.down)
            {
               if(!this.keyD || _root.mouseCursor.down)
               {
                  _root.mouseCursor.down = false;
                  this.keyD = true;
                  if(!_root.ui.dlgCompose._x)
                  {
                     _root.game.map.npc3.showStore();
                  }
                  this.onEnterFrame = undefined;
               }
            }
            else if(Key.isDown(75))
            {
               if(!this.keyD)
               {
                  this.keyD = true;
                  if(!_root.ui.dlgCompose._x && !_root.ui.dlgSellStuff._x)
                  {
                     _root.ui.attachMovie("dlgCompose","dlgCompose",_root.ui.getNextHighestDepth(),{_x:50});
                     if(!_root.ui.dlgInv._x)
                     {
                        _root.ui.newInv();
                     }
                     else
                     {
                        _root.ui.dlgInv.swapDepths(_root.ui.getNextHighestDepth());
                        _loc3_ = 10;
                        while(_loc3_ < _root.game.map.player.inventoryList.length)
                        {
                           _root.ui["item" + _loc3_].swapDepths(_root.ui.getNextHighestDepth());
                           _loc3_ = _loc3_ + 1;
                        }
                     }
                  }
                  this.onEnterFrame = undefined;
               }
            }
            else if(Key.isDown(27))
            {
               if(!this.keyD)
               {
                  this.keyD = true;
                  _root.ui.dialog.closeDlg();
                  return false;
               }
            }
            else
            {
               this.keyD = false;
            }
         };
         return true;
      }
      return false;
   }
   function checkPastSecQuest()
   {
      if(_root.game.map.player.chapter > 2)
      {
         if(_root.game.map.player.secondaryQuest[2][2] == 2)
         {
            return _root.sQuest[2][2];
         }
      }
      return false;
   }
}
