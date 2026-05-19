btnBack.onRelease = function()
{
   playSound1("click");
   gotoAndStop("title");
};
btnOutput.onRelease = function()
{
   var _loc2_ = SharedObject.getLocal("Arcuz");
   var _loc3_ = "";
   _loc3_ += _loc2_.data.level + "|";
   _loc3_ += _loc2_.data.exp + "|";
   _loc3_ += _loc2_.data.CP + "|";
   _loc3_ += _loc2_.data.AP + "|";
   _loc3_ += _loc2_.data.strength + "|";
   _loc3_ += _loc2_.data.agility + "|";
   _loc3_ += _loc2_.data.stamine + "|";
   _loc3_ += _loc2_.data.luck + "|";
   _loc3_ += _loc2_.data.money + "|";
   _loc3_ += _loc2_.data.weight + "|";
   _loc3_ += _loc2_.data.map16finish + "|";
   _loc3_ += _loc2_.data.magicResist + "|";
   _loc3_ += _loc2_.data.hpFromEmy + "|";
   _loc3_ += _loc2_.data.spFromEmy + "|";
   _loc3_ += _loc2_.data.chapter + "|";
   _loc3_ += _loc2_.data.phase + "|";
   _loc3_ += _loc2_.data.tele[0] + "#" + _loc2_.data.tele[1] + "#" + _loc2_.data.tele[2] + "|";
   var _loc6_ = 0;
   while(_loc6_ < 22)
   {
      _loc3_ += _loc2_.data.skillList[_loc6_];
      if(_loc6_ != 21)
      {
         _loc3_ += "@";
      }
      _loc6_ = _loc6_ + 1;
   }
   _loc3_ += "|";
   _loc6_ = 0;
   var _loc4_;
   while(_loc6_ < _loc2_.data.inventoryList.length)
   {
      if(_loc2_.data.inventoryList[_loc6_] != undefined)
      {
         _loc3_ += _loc6_ + "#";
         _loc4_ = 0;
         while(_loc4_ < _loc2_.data.inventoryList[_loc6_].length)
         {
            if(_loc4_ == _loc2_.data.inventoryList[_loc6_].length - 1)
            {
               _loc3_ += _loc2_.data.inventoryList[_loc6_][_loc4_];
            }
            else if(_loc4_ == 0)
            {
               _loc3_ += _root.saveTransNameToNum(_loc2_.data.inventoryList[_loc6_][_loc4_]) + "#";
            }
            else
            {
               _loc3_ += _loc2_.data.inventoryList[_loc6_][_loc4_] + "#";
            }
            _loc4_ = _loc4_ + 1;
         }
         _loc3_ += "@";
      }
      _loc6_ = _loc6_ + 1;
   }
   _loc3_ += "|";
   _loc6_ = 0;
   while(_loc6_ < _loc2_.data.inventoryList1.length)
   {
      if(_loc2_.data.inventoryList1[_loc6_] != undefined)
      {
         _loc3_ += _loc6_ + "#";
         _loc4_ = 0;
         while(_loc4_ < _loc2_.data.inventoryList1[_loc6_].length)
         {
            if(_loc4_ == _loc2_.data.inventoryList1[_loc6_].length - 1)
            {
               _loc3_ += _loc2_.data.inventoryList1[_loc6_][_loc4_];
            }
            else if(_loc4_ == 0)
            {
               _loc3_ += _root.saveTransNameToNum(_loc2_.data.inventoryList1[_loc6_][_loc4_]) + "#";
            }
            else
            {
               _loc3_ += _loc2_.data.inventoryList1[_loc6_][_loc4_] + "#";
            }
            _loc4_ = _loc4_ + 1;
         }
         _loc3_ += "@";
      }
      _loc6_ = _loc6_ + 1;
   }
   _loc3_ += "|";
   _loc3_ += _loc2_.data.secondaryQuest[1][0] + "#" + _loc2_.data.secondaryQuest[1][1] + "#" + _loc2_.data.secondaryQuest[1][2] + "#";
   _loc3_ += _loc2_.data.secondaryQuest[2][0] + "#" + _loc2_.data.secondaryQuest[2][1] + "#" + _loc2_.data.secondaryQuest[2][2] + "#";
   _loc3_ += _loc2_.data.secondaryQuest[3][0] + "|";
   var _loc5_;
   for(_loc6_ in _loc2_.data.questList)
   {
      _loc5_ = _loc2_.data.questList[_loc6_];
      _loc3_ += _loc5_[0] + "#" + _loc5_[1] + "#" + _loc5_[2] + "#" + _loc5_[3] + "#" + _loc5_[4] + "@";
   }
   _loc3_ += "|";
   _loc6_ = 1;
   while(_loc6_ < 17)
   {
      _loc3_ += _loc2_.data.mapVisit[_loc6_] + "#";
      _loc6_ = _loc6_ + 1;
   }
   var _loc9_ = 0;
   _loc6_ = 0;
   var _loc7_;
   var _loc8_;
   while(_loc6_ < _loc3_.length)
   {
      _loc7_ = _loc3_.slice(_loc6_,_loc6_ + 1);
      _loc8_ = Number(_loc7_);
      if(!isNaN(_loc8_))
      {
         _loc9_ += _loc8_;
      }
      else
      {
         _loc9_ += _loc7_.charCodeAt(0);
      }
      _loc6_ = _loc6_ + 1;
   }
   _loc9_ += _loc3_.length;
   _loc3_ += "$";
   _loc3_ += _loc9_;
   trace(_loc3_);
   var _loc10_ = new LZW();
   txt.text = _loc10_.compress(_loc3_);
   System.setClipboard(txt.text);
};
