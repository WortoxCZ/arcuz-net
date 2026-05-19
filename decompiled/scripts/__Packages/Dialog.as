class Dialog extends MovieClip
{
   var btnBuy;
   var btnComb;
   var btnNo;
   var btnYes;
   var currIndex;
   var keyD;
   var npc;
   var onEnterFrame;
   var quest;
   var speaker;
   var spk;
   var str;
   var strings;
   function Dialog()
   {
      super();
      this.btnYes._visible = this.btnNo._visible = this.btnBuy._visible = this.btnComb._visible = false;
      this.btnYes.enabled = this.btnNo.enabled = this.btnBuy.enabled = this.btnComb.enabled = false;
      this.btnYes.txt.text = _root.textSys[10][_root.lang];
      this.btnNo.txt.text = _root.textSys[11][_root.lang];
   }
   function init(str1, arr)
   {
      this._x = 60;
      this._y = 10;
      this.init2(str1,arr);
      this.openDlg();
   }
   function init2(str1, arr)
   {
      this.speaker = str1;
      this.strings = arr;
      this.currIndex = 0;
      this.showString();
   }
   function openDlg()
   {
      this._y = - this._height;
      _root.playSound1("对话框");
      this.onEnterFrame = function()
      {
         this._y += Math.round((11 - this._y) / 2);
         if(this._y >= 10)
         {
            this._y = 10;
            this.onEnterFrame = undefined;
            this.lonelyDialog();
         }
      };
   }
   function closeDlg()
   {
      _root.playSound1("对话框");
      if(_root.game.map.special == "town")
      {
         _root.game.map.player.action();
      }
      var _loc3_ = 1;
      while(_loc3_ <= 7)
      {
         _root.game.map["npc" + _loc3_].showQuestStatus();
         _root.game.map["npc" + _loc3_].talking = false;
         _loc3_ = _loc3_ + 1;
      }
      this.onEnterFrame = function()
      {
         this._y += Math.round((- this._height - 10 - this._y) / 2);
         if(this._y <= - this._height)
         {
            this.removeMovieClip();
         }
      };
   }
   function nextText()
   {
      if(++this.currIndex < this.strings.length)
      {
         this.showString();
         return undefined;
      }
      return "end";
   }
   function confirmOption()
   {
      this.btnYes._visible = this.btnYes.enabled = true;
      this.btnNo._visible = this.btnNo.enabled = true;
      this.keyD = true;
      this.onEnterFrame = function()
      {
         if(Key.isDown(74))
         {
            if(!this.keyD)
            {
               this.keyD = true;
               this.acceptQuest();
            }
         }
         else if(Key.isDown(75))
         {
            if(!this.keyD)
            {
               this.keyD = true;
               this.rejectQuest();
            }
         }
         else
         {
            this.keyD = false;
         }
      };
      this.btnYes.onPress = function()
      {
         this._parent.acceptQuest();
      };
      this.btnNo.onPress = function()
      {
         this._parent.rejectQuest();
      };
   }
   function acceptQuest()
   {
      var _loc3_ = _root.quest[_root.game.map.player.chapter][_root.game.map.player.phase].dialog[1];
      _root.game.map.player.questListInfo.push([1,_root.game.map.player.chapter,_root.game.map.player.phase,0,0]);
      _root.game.map.player.questList.push(_root.quest[_root.game.map.player.chapter][_root.game.map.player.phase]);
      _root.ui.dialog.init2(this.speaker,_loc3_);
      this.btnYes._visible = this.btnNo._visible = this.btnBuy._visible = this.btnComb._visible = false;
      this.btnYes.enabled = this.btnNo.enabled = this.btnBuy.enabled = this.btnComb.enabled = false;
      this.quest.accept();
      this.onEnterFrame = undefined;
   }
   function rejectQuest()
   {
      var _loc3_ = _root.quest[_root.game.map.player.chapter][_root.game.map.player.phase].dialog[2];
      _root.ui.dialog.init2(this.speaker,_loc3_);
      this.btnYes._visible = this.btnNo._visible = this.btnBuy._visible = this.btnComb._visible = false;
      this.btnYes.enabled = this.btnNo.enabled = this.btnBuy.enabled = this.btnComb.enabled = false;
      this.onEnterFrame = undefined;
   }
   function confirmOption1(npc1)
   {
      this.btnYes._visible = this.btnYes.enabled = true;
      this.btnNo._visible = this.btnNo.enabled = true;
      this.keyD = true;
      this.npc = npc1;
      this.onEnterFrame = function()
      {
         if(Key.isDown(74))
         {
            if(!this.keyD)
            {
               this.keyD = true;
               this.acceptQuest1();
            }
         }
         else if(Key.isDown(75) || Key.isDown(27))
         {
            if(!this.keyD)
            {
               this.keyD = true;
               this.rejectQuest1();
            }
         }
         else
         {
            this.keyD = false;
         }
      };
      this.btnYes.onPress = function()
      {
         this._parent.acceptQuest1();
      };
      this.btnNo.onPress = function()
      {
         this._parent.rejectQuest1();
      };
   }
   function acceptQuest1()
   {
      var _loc3_ = _root.sQuest[_root.game.map.player.chapter][this.npc.subQuestId[_root.game.map.player.chapter]].dialog[1];
      _root.game.map.player.questListInfo.push([2,_root.game.map.player.chapter,this.npc.subQuestId[_root.game.map.player.chapter],0,0]);
      _root.game.map.player.questList.push(_root.sQuest[_root.game.map.player.chapter][this.npc.subQuestId[_root.game.map.player.chapter]]);
      _root.ui.dialog.init2(this.speaker,_loc3_);
      this.btnYes._visible = this.btnNo._visible = this.btnBuy._visible = this.btnComb._visible = false;
      this.btnYes.enabled = this.btnNo.enabled = this.btnBuy.enabled = this.btnComb.enabled = false;
      this.quest.accept();
      this.onEnterFrame = undefined;
   }
   function rejectQuest1()
   {
      var _loc3_ = _root.sQuest[_root.game.map.player.chapter][this.npc.subQuestId[_root.game.map.player.chapter]].dialog[2];
      _root.ui.dialog.init2(this.speaker,_loc3_);
      this.btnYes._visible = this.btnNo._visible = this.btnBuy._visible = this.btnComb._visible = false;
      this.btnYes.enabled = this.btnNo.enabled = this.btnBuy.enabled = this.btnComb.enabled = false;
      this.onEnterFrame = undefined;
   }
   function showString()
   {
      this.spk.text = this.speaker + ":";
      this.str.text = this.strings[this.currIndex];
      var _loc3_ = 190;
      var _loc4_;
      var _loc2_;
      var _loc5_;
      var _loc6_;
      if(this.str.text.length > _loc3_)
      {
         _loc4_ = true;
         do
         {
            _loc2_ = this.strings[this.currIndex].charAt(_loc3_ - 1);
            if(_loc2_ == " " || _loc2_ == "?" || _loc2_ == "？" || _loc2_ == "。" || _loc2_ == "、" || _loc2_ == "." || _loc2_ == "!" || _loc2_ == "！")
            {
               _loc4_ = false;
            }
            else
            {
               _loc3_ = _loc3_ - 1;
            }
         }
         while(_loc4_);
         _loc5_ = this.str.text.substring(0,_loc3_);
         _loc6_ = this.str.text.substring(_loc3_,this.str.text.length);
         this.str.text = _loc5_;
         this.strings[this.currIndex] = _loc5_;
         this.strings.splice(this.currIndex + 1,0,_loc6_);
      }
   }
   function lonelyDialog()
   {
      this.keyD = true;
      this.onEnterFrame = function()
      {
         if(Key.isDown(74) || _root.mouseCursor.down)
         {
            if(!this.keyD || _root.mouseCursor.down)
            {
               this.keyD = true;
               _root.mouseCursor.down = false;
               if(this.nextText() == "end")
               {
                  this.closeDlg();
               }
            }
         }
         else
         {
            this.keyD = false;
         }
      };
   }
}
