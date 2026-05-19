class Npc骑士 extends Npc
{
   var _name;
   var keyD;
   var npcName;
   var onEnterFrame;
   var questId;
   var str;
   var subQuestId;
   var updateSpeech;
   function Npc骑士()
   {
      super();
      if(this._name.slice(0,8) != "instance")
      {
         this.npcName = _root.textNpcName[4][_root.lang];
         this.setDlg();
         this.updateSpeech();
         this.questId = [];
         this.questId[1] = [];
         this.questId[1][0] = 1;
         this.questId[3] = [];
         this.questId[3][9] = 1;
         this.questId[4] = [];
         this.questId[4][0] = 1;
         this.questId[4][3] = 1;
         this.questId[4][6] = 1;
         this.questId[4][9] = 1;
         this.questId[4][12] = 1;
         this.subQuestId = [];
      }
   }
   function setDlg()
   {
      this.npcName = _root.textNpcName[4][_root.lang];
      this.str = [];
      this.str[0] = [];
      this.str[0][0] = [[_root.textNpc5[0][_root.lang]]];
      this.str[1] = [];
      this.str[1][0] = [[_root.textNpc5[0][_root.lang]],[_root.textNpc5[1][_root.lang],_root.textNpc5[2][_root.lang]]];
      this.str[2] = [];
      this.str[2][0] = [];
      this.str[2][0][0] = [_root.textNpc5[3][_root.lang]];
      this.str[2][0][1] = [_root.textNpc5[4][_root.lang],_root.textNpc5[5][_root.lang]];
      this.str[2][0][2] = [_root.textNpc5[6][_root.lang]];
      this.str[2][0][3] = [_root.textNpc5[7][_root.lang]];
      this.str[3] = [];
      this.str[3][0] = [];
      this.str[3][0][0] = [_root.textNpc5[8][_root.lang]];
      this.str[3][0][1] = [_root.textNpc5[9][_root.lang]];
      this.str[3][0][2] = [_root.textNpc5[10][_root.lang],_root.textNpc5[11][_root.lang]];
      this.str[4] = [];
      this.str[4][0] = [[_root.textNpc5[13][_root.lang]]];
      this.str[4][2] = [[_root.textNpc5[14][_root.lang]]];
      this.str[4][8] = [[_root.textNpc5[15][_root.lang]]];
      this.str[4][9] = [[_root.textNpc5[16][_root.lang]]];
      this.str[5] = [];
      this.str[6] = [];
      this.str[7] = [];
      this.str[8] = [];
      this.str[9] = [];
   }
   function specialEnd()
   {
      var _loc3_ = _root.game.map.player.chapter;
      var _loc5_ = _root.game.map.player.phase;
      var _loc4_;
      if(_loc3_ > 1)
      {
         _loc4_ = [_root.textNpc5[17][_root.lang]];
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
                  _root.game.map.npc5.showStore();
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
   function showStore()
   {
      var _loc5_;
      var _loc2_;
      var _loc3_;
      if(!_root.ui.dlgStore._x)
      {
         _loc5_ = _root.ui.attachMovie("dlgSellStuff","dlgStore",_root.ui.getNextHighestDepth(),{_x:50});
         if(!_root.ui.dlgInv._x)
         {
            _root.ui.newInv();
         }
         else
         {
            _root.ui.dlgInv.swapDepths(_root.ui.getNextHighestDepth());
            _loc2_ = 10;
            while(_loc2_ < _root.game.map.player.inventoryList.length)
            {
               _root.ui["item" + _loc2_].swapDepths(_root.ui.getNextHighestDepth());
               _loc2_ = _loc2_ + 1;
            }
         }
         _loc2_ = 0;
         while(_loc2_ < _root.game.map.player.inventoryList1.length)
         {
            if(_root.game.map.player.inventoryList1[_loc2_] != undefined)
            {
               _loc3_ = _root.ui.attachMovie("item","itemS" + _loc2_,_root.ui.getNextHighestDepth());
               _loc3_.store = true;
               _loc3_.setAttrib(_root.game.map.player.inventoryList1[_loc2_]);
               _loc3_.setPosition(_loc2_);
            }
            _loc2_ = _loc2_ + 1;
         }
      }
   }
}
