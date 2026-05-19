class Quest
{
   var _alpha;
   var _currentframe;
   var _totalframes;
   var chapter;
   var count;
   var currentNumber;
   var description;
   var dialog;
   var number;
   var object;
   var onEnterFrame;
   var onRelease;
   var questName;
   var removeMovieClip;
   var rewardNpc;
   var statu;
   function Quest(dlg, ojn, n, nam, dcp, prc, rnpc)
   {
      this.dialog = dlg;
      this.statu = "Wait";
      this.object = ojn;
      this.number = n;
      this.currentNumber = 0;
      this.questName = nam;
      this.description = dcp;
      this.priceAction = prc;
      this.rewardNpc = rnpc;
   }
   function reset()
   {
      this.statu = "Wait";
      this.currentNumber = 0;
   }
   function accept()
   {
      this.statu = "Incomplete";
      _root.game.map.player.phase++;
      this.freshNpcQuestMark();
      _root.ui.btnQuests.play();
      _root.playSound1("接任务问号变感叹号.mp3");
      this.accept1();
   }
   function freshNpcQuestMark()
   {
      var _loc2_ = 1;
      while(_loc2_ <= 7)
      {
         _root.game.map["npc" + _loc2_].showQuestStatus();
         _loc2_ = _loc2_ + 1;
      }
   }
   function accept1()
   {
   }
   function update(dead)
   {
      trace(this.currentNumber + ":" + this.number + ":" + this.object);
      if(this.statu == "Incomplete")
      {
         if(dead == this.object)
         {
            this.currentNumber += 1;
            if(this.currentNumber >= this.number)
            {
               this.accomplish();
            }
         }
      }
   }
   function accomplish()
   {
      this.freshNpcQuestMark();
      this.statu = "Incomplete ";
      _root.newMessage(_root.textSys[8][_root.lang]);
      _root.ui.btnQuests.play();
      _root.game.map.player.phase++;
      _root.game.map.npc2.updateStore();
      _root.game.map.npc3.updateStore();
      _root.game.map.npc4.updateStore();
   }
   function getPrice()
   {
      this.update();
      if(this.statu == "Incomplete ")
      {
         return this.dialog[4];
      }
      return this.dialog[3];
   }
   function freshPhase()
   {
      _root.game.map.player.phase++;
      var _loc4_;
      if(_root.game.map.player.chapter == 0 && _root.game.map.player.phase == 15)
      {
         _root.game.map.player.phase = 0;
         _root.game.map.player.chapter++;
         _loc4_ = true;
      }
      if(_root.game.map.player.chapter == 1 && _root.game.map.player.phase == 6)
      {
         _root.game.map.player.phase = 0;
         _root.game.map.player.chapter++;
         _loc4_ = true;
      }
      if(_root.game.map.player.chapter == 2 && _root.game.map.player.phase == 6)
      {
         _root.game.map.player.phase = 0;
         _root.game.map.player.chapter++;
         _loc4_ = true;
      }
      if(_root.game.map.player.chapter == 3 && _root.game.map.player.phase == 12)
      {
         _root.game.map.player.phase = 0;
         _root.game.map.player.chapter++;
         _loc4_ = true;
      }
      this.priceAction();
      this.statu = "Completed!";
      var _loc3_ = _root.ui.attachMovie("questCompleteMc","qcm",_root.ui.getNextHighestDepth());
      _loc3_.mc.txt.text = "Quest Completed!";
      if(_loc4_)
      {
         _loc3_.onEnterFrame = function()
         {
            var _loc3_;
            if(this._currentframe == this._totalframes - 1)
            {
               _loc3_ = _root.attachMovie("cutSceneMc","cutSceneMc",_root.getNextHighestDepth());
               _root.game.pauseCharacters();
               _root.game.map.npc2.updateStore();
               _root.game.map.npc3.updateStore();
               _root.game.map.npc4.updateStore();
               _root[_root.now_music].stop();
               _root.playSound1("chapter开始.mp3");
               _loc3_.onEnterFrame = function()
               {
                  var _loc3_;
                  var _loc4_;
                  if(this._currentframe == 34)
                  {
                     this.chapter.gotoAndStop(_root.game.map.player.chapter + 1);
                  }
                  else if(this._currentframe == 165)
                  {
                     _loc3_ = _root.attachMovie("chapterIntro","chapterIntro",_root.getNextHighestDepth());
                     _root.cutSceneMc.swapDepths(_root.getNextHighestDepth());
                     _root.mouseCursor.swapDepths(_root.getNextHighestDepth());
                     _loc3_.gotoAndStop(_root.game.map.player.chapter + 1);
                     _loc4_ = ["Chapter I","Chapter II","Chapter III","Chapter IV","Chapter V"];
                     _loc3_.textMc.text1.text = _loc4_[_root.game.map.player.chapter];
                     switch(_root.lang)
                     {
                        case 0:
                           _loc3_.chapterTxt.gotoAndStop("chs");
                           break;
                        case 1:
                           _loc3_.chapterTxt.gotoAndStop("chn");
                           break;
                        case 2:
                           _loc3_.chapterTxt.gotoAndStop("eng");
                           break;
                        case 3:
                           _loc3_.chapterTxt.gotoAndStop("jpn");
                           break;
                        case 4:
                           _loc3_.chapterTxt.gotoAndStop("koe");
                           break;
                        case 5:
                           _loc3_.chapterTxt.gotoAndStop("fra");
                           break;
                        case 6:
                           _loc3_.chapterTxt.gotoAndStop("ger");
                     }
                     _loc3_.chapterTxt.gotoAndStop(_loc3_.chapterTxt._currentframe + _root.game.map.player.chapter);
                     _loc3_.onRelease = function()
                     {
                        _root.game.continueCharacters();
                        this.count = 50;
                        this.onEnterFrame = function()
                        {
                           if(--this.count < 0)
                           {
                              this._alpha -= 5;
                              if(this._alpha < 5)
                              {
                                 this.removeMovieClip();
                              }
                           }
                        };
                        this.onRelease = undefined;
                     };
                     _root.game.pauseCharacters();
                  }
                  else if(this._currentframe == this._totalframes)
                  {
                     _root[_root.now_music].start(0,999);
                     this.removeMovieClip();
                  }
               };
            }
         };
      }
      _root.playSound1("任务完成.mp3");
      this.freshNpcQuestMark();
   }
   function priceAction()
   {
   }
}
