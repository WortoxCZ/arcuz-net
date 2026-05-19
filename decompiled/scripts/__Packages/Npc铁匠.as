class Npc铁匠 extends Npc
{
   var _name;
   var goods;
   var keyD;
   var npcName;
   var onEnterFrame;
   var questId;
   var str;
   var subQuestId;
   var updateSpeech;
   function Npc铁匠()
   {
      super();
      if(this._name.slice(0,8) != "instance")
      {
         this.npcName = _root.textNpcName[1][_root.lang];
         this.setDlg();
         this.updateSpeech();
         this.questId = [];
         this.questId[0] = [];
         this.questId[4] = [];
         this.subQuestId = [];
         this.subQuestId[2] = 1;
         this.subQuestId[3] = 0;
         this.updateStore();
      }
   }
   function checkPastSecQuest()
   {
      if(_root.game.map.player.chapter > 2)
      {
         if(_root.game.map.player.secondaryQuest[2][1] == 2)
         {
            return _root.sQuest[2][1];
         }
      }
      if(_root.game.map.player.chapter > 3)
      {
         if(_root.game.map.player.secondaryQuest[3][0] == 2)
         {
            return _root.sQuest[3][0];
         }
      }
      return false;
   }
   function updateStore()
   {
      var _loc12_ = _root.game.map.player.chapter;
      var _loc3_ = _root.game.map.player.phase;
      this.goods = [];
      if(_loc12_ == 0 && _loc3_ == 1)
      {
         this.goods[0] = new Weapon("s1",0,1,0,0,0,0,0,0,0,0,0,0);
         this.goods[1] = new Weapon("a1",0,1,0,0,0,0,0,0,0,0,0,0);
         this.goods[2] = new Weapon("b1",0,1,0,0,0,0,0,0,0,0,0,0);
      }
      var _loc11_;
      var _loc4_;
      var _loc5_;
      var _loc8_;
      var _loc7_;
      var _loc6_;
      var _loc10_;
      var _loc9_;
      if(_loc12_ > 0)
      {
         if(Math.ceil(_root.game.map.player.level / 5) > 1)
         {
            _loc11_ = 2;
         }
         else
         {
            _loc11_ = 1;
         }
         _loc4_ = 1;
         while(_loc4_ <= 12 * _loc11_)
         {
            _loc5_ = Math.ceil(_root.game.map.player.level / 5);
            _loc5_ = _loc4_ <= 12 ? _loc5_ : _loc5_ - 1;
            _loc5_ = _loc5_ <= 10 ? _loc5_ : 10;
            _loc8_ = random(100);
            if(_loc8_ < 15)
            {
               _loc7_ = 2;
            }
            else if(_loc8_ < 10)
            {
               _loc7_ = 1;
            }
            else
            {
               _loc7_ = 0;
            }
            _loc6_ = 1;
            _loc10_ = random(15);
            _loc3_ = [0,0,0,0,0,0,0,0,0,0];
            if(_loc4_ == 1 || _loc4_ == 13)
            {
               _loc9_ = new Weapon("b" + _loc5_,_loc7_,_loc6_,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9]);
            }
            else if(_loc4_ == 2 || _loc4_ == 14)
            {
               _loc9_ = new Weapon("s" + _loc5_,_loc7_,_loc6_,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9]);
            }
            else if(_loc4_ == 3 || _loc4_ == 15)
            {
               _loc9_ = new Weapon("a" + _loc5_,_loc7_,_loc6_,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9]);
            }
            else if(_loc4_ == 4 || _loc4_ == 16)
            {
               _loc9_ = new Shield("shield" + _loc5_,_loc7_,_loc6_,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9]);
            }
            else if(_loc4_ == 5 || _loc4_ == 17)
            {
               _loc9_ = new Wear("w" + _loc5_,_loc7_,_loc6_,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8]);
            }
            else if(_loc4_ == 6 || _loc4_ == 18)
            {
               _loc9_ = new Helmet("hel" + _loc5_,_loc7_,_loc6_,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8]);
            }
            else if(_loc4_ == 7 || _loc4_ == 19)
            {
               _loc9_ = new Glove("g" + _loc5_,_loc7_,_loc6_,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8]);
            }
            else if(_loc4_ == 8 || _loc4_ == 20)
            {
               _loc9_ = new Boots("bt" + _loc5_,_loc7_,_loc6_,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8]);
            }
            else if(_loc4_ == 9 || _loc4_ == 21)
            {
               _loc9_ = new Belt("blt" + _loc5_,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6]);
            }
            else if(_loc4_ == 10 || _loc4_ == 22)
            {
               _loc5_ = _loc5_ <= 8 ? _loc5_ : 8;
               _loc9_ = new Bracelet("bl" + _loc5_,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6]);
            }
            else if(_loc4_ == 11 || _loc4_ == 23)
            {
               _loc5_ = _loc5_ <= 8 ? _loc5_ : 8;
               _loc9_ = new Necklace("nl" + _loc5_,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6]);
            }
            else if(_loc4_ == 12 || _loc4_ == 24)
            {
               _loc9_ = new Ring("r" + _loc5_,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6]);
            }
            this.goods.push(_loc9_);
            _loc4_ = _loc4_ + 1;
         }
      }
   }
   function setDlg()
   {
      this.npcName = _root.textNpcName[1][_root.lang];
      this.str = [];
      this.str[0] = [];
      this.str[0][0] = [[_root.textNpc2[0][_root.lang],_root.textNpc2[1][_root.lang],_root.textNpc2[2][_root.lang]]];
      this.str[0][1] = [[_root.textNpc2[3][_root.lang],_root.textNpc2[4][_root.lang]]];
      this.str[0][2] = this.str[0][3] = this.str[0][4] = this.str[0][5] = [[_root.textNpc2[5][_root.lang]]];
      this.str[1] = [];
      this.str[1][0] = [[_root.textNpc2[6][_root.lang]],[_root.textNpc2[7][_root.lang]]];
      this.str[2] = [];
      this.str[2][0] = [];
      this.str[2][0][0] = [_root.textNpc2[8][_root.lang]];
      this.str[2][0][1] = [_root.textNpc2[9][_root.lang]];
      this.str[3] = [];
      this.str[3][0] = [];
      this.str[3][0][0] = [_root.textNpc2[10][_root.lang]];
      this.str[3][0][1] = [_root.textNpc2[11][_root.lang]];
      this.str[4] = [];
      this.str[4][0] = [];
      if(_root.game.map.player.chapter == 4 && _root.game.map.player.phase >= 9)
      {
         this.str[4][0][0] = [_root.textNpc2[14][_root.lang]];
         this.str[4][0][1] = [_root.textNpc2[15][_root.lang]];
      }
      else
      {
         this.str[4][0][0] = [_root.textNpc2[12][_root.lang]];
         this.str[4][0][1] = [_root.textNpc2[13][_root.lang]];
      }
      this.str[5] = [];
      this.str[6] = [];
      this.str[7] = [];
      this.str[8] = [];
      this.str[9] = [];
   }
   function showStore()
   {
      var _loc5_;
      var _loc3_;
      var _loc4_;
      var _loc6_;
      var _loc7_;
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
         _root.ui.pointAndHint.removeMovieClip();
         _loc6_ = _root.game.map.player.chapter;
         _loc7_ = _root.game.map.player.phase;
         if(_loc6_ == 0 && _loc7_ == 1)
         {
            if(_root.hintOfDlg._x == undefined)
            {
               _root.attachMovie("hintOfDlg","hintOfDlg",_root.getNextHighestDepth());
            }
            _root.hintOfDlg.gotoAndStop(1);
         }
      }
   }
   function specialEnd()
   {
      var _loc3_ = _root.game.map.player.chapter;
      var _loc5_ = _root.game.map.player.phase;
      var _loc4_;
      if(_loc3_ > 0)
      {
         _loc4_ = [_root.textNpc2[16][_root.lang]];
         _root.ui.dialog.init2(this.npcName,_loc4_);
         _root.ui.dialog.keyD = true;
         _root.ui.dialog.onEnterFrame = function()
         {
            if(Key.isDown(74) || _root.mouseCursor.down)
            {
               if(!this.keyD || _root.mouseCursor.down)
               {
                  _root.mouseCursor.down = false;
                  this.keyD = true;
                  _root.game.map.npc2.showStore();
                  this.onEnterFrame = undefined;
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
}
