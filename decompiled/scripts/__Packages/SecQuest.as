class SecQuest
{
   var c;
   var currentNumber;
   var description;
   var dialog;
   var number;
   var object;
   var p;
   var questName;
   var rewardNpc;
   var statu;
   function SecQuest(dlg, ojn, n, nam, dcp, prc, rnpc, chapter, phase)
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
      this.c = chapter;
      this.p = phase;
   }
   function reset()
   {
      this.statu = "Wait";
      this.currentNumber = 0;
   }
   function accept()
   {
      this.statu = "Incomplete";
      _root.game.map.player.secondaryQuest[this.c][this.p]++;
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
      this.statu = "Incomplete ";
      _root.newMessage(_root.textSys[8][_root.lang]);
      _root.game.map.player.secondaryQuest[this.c][this.p]++;
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
      this.priceAction();
      _root.game.map.player.secondaryQuest[this.c][this.p]++;
      var _loc3_ = _root.ui.attachMovie("questCompleteMc","qcm",_root.ui.getNextHighestDepth());
      _loc3_.mc.txt.text = "Quest Completed!";
      this.statu = "Completed!";
      _root.playSound("任务完成.mp3");
      this.freshNpcQuestMark();
   }
   function priceAction()
   {
   }
}
