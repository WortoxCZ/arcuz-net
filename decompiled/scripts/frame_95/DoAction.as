btnBack.onRelease = function()
{
   playSound1("click");
   gotoAndStop("title");
};
btnLoad.onRelease = function()
{
   var _loc21_ = new LZW();
   var _loc24_ = _loc21_.decompress(txt.text);
   var _loc5_ = SharedObject.getLocal("Arcuz");
   var _loc20_ = _loc24_.split("$");
   var _loc12_ = _loc20_[0];
   var _loc19_ = Number(_loc20_[1]);
   var _loc11_ = 0;
   var _loc7_ = 0;
   var _loc8_;
   var _loc9_;
   while(_loc7_ < _loc12_.length)
   {
      _loc8_ = _loc12_.slice(_loc7_,_loc7_ + 1);
      _loc9_ = Number(_loc8_);
      if(!isNaN(_loc9_))
      {
         _loc11_ += _loc9_;
      }
      else
      {
         _loc11_ += _loc8_.charCodeAt(0);
      }
      _loc7_ = _loc7_ + 1;
   }
   _loc11_ += _loc12_.length;
   trace(_loc19_ + ">><<" + _loc11_);
   if(_loc19_ != _loc11_)
   {
      txt.text = "error!!!";
      return undefined;
   }
   var _loc6_ = _loc12_.split("|");
   _loc5_.data.level = Number(_loc6_[0]);
   _loc6_.shift();
   _loc5_.data.exp = Number(_loc6_[0]);
   _loc6_.shift();
   _loc5_.data.CP = Number(_loc6_[0]);
   _loc6_.shift();
   _loc5_.data.AP = Number(_loc6_[0]);
   _loc6_.shift();
   _loc5_.data.strength = Number(_loc6_[0]);
   _loc6_.shift();
   _loc5_.data.agility = Number(_loc6_[0]);
   _loc6_.shift();
   _loc5_.data.stamine = Number(_loc6_[0]);
   _loc6_.shift();
   _loc5_.data.luck = Number(_loc6_[0]);
   _loc6_.shift();
   _loc5_.data.money = Number(_loc6_[0]);
   _loc6_.shift();
   _loc5_.data.weight = Number(_loc6_[0]);
   _loc6_.shift();
   _loc5_.data.map16finish = Number(_loc6_[0]);
   _loc6_.shift();
   _loc5_.data.magicResist = Number(_loc6_[0]);
   _loc6_.shift();
   _loc5_.data.hpFromEmy = Number(_loc6_[0]);
   _loc6_.shift();
   _loc5_.data.spFromEmy = Number(_loc6_[0]);
   _loc6_.shift();
   _loc5_.data.chapter = Number(_loc6_[0]);
   _loc6_.shift();
   _loc5_.data.phase = Number(_loc6_[0]);
   _loc6_.shift();
   var _loc23_ = _loc6_.shift();
   var _loc16_ = _loc23_.split("#");
   _loc5_.data.tele = [_loc16_[0],Number(_loc16_[1]),Number(_loc16_[2])];
   var _loc26_ = _loc6_.shift();
   var _loc17_ = _loc26_.split("@");
   _loc5_.data.skillList = [];
   _loc7_ = 0;
   while(_loc7_ < 22)
   {
      _loc5_.data.skillList[_loc7_] = Number(_loc17_[_loc7_]);
      _loc7_ = _loc7_ + 1;
   }
   var _loc25_ = _loc6_.shift();
   var _loc13_ = _loc25_.split("@");
   _loc5_.data.inventoryList = [];
   _loc7_ = 0;
   var _loc2_;
   var _loc10_;
   var _loc3_;
   while(_loc7_ < _loc13_.length - 1)
   {
      _loc2_ = _loc13_[_loc7_].split("#");
      _loc10_ = Number(_loc2_.shift());
      _loc2_[0] = _root.saveTransNumToName(Number(_loc2_[0]));
      _loc3_ = 2;
      while(_loc3_ < _loc2_.length - 1)
      {
         _loc2_[_loc3_] = Number(_loc2_[_loc3_]);
         _loc3_ = _loc3_ + 1;
      }
      _loc5_.data.inventoryList[_loc10_] = _loc2_;
      _loc7_ = _loc7_ + 1;
   }
   var _loc27_ = _loc6_.shift();
   var _loc14_ = _loc27_.split("@");
   _loc5_.data.inventoryList1 = [];
   _loc7_ = 0;
   while(_loc7_ < _loc14_.length - 1)
   {
      _loc2_ = _loc14_[_loc7_].split("#");
      _loc10_ = Number(_loc2_.shift());
      _loc2_[0] = _root.saveTransNumToName(Number(_loc2_[0]));
      _loc3_ = 2;
      while(_loc3_ < _loc2_.length - 1)
      {
         _loc2_[_loc3_] = Number(_loc2_[_loc3_]);
         _loc3_ = _loc3_ + 1;
      }
      _loc5_.data.inventoryList1[_loc10_] = _loc2_;
      _loc7_ = _loc7_ + 1;
   }
   _loc23_ = _loc6_.shift();
   _loc16_ = _loc23_.split("#");
   _loc5_.data.secondaryQuest = [];
   _loc5_.data.secondaryQuest[1] = [Number(_loc16_[0]),Number(_loc16_[1]),Number(_loc16_[2])];
   _loc5_.data.secondaryQuest[2] = [Number(_loc16_[3]),Number(_loc16_[4]),Number(_loc16_[5])];
   _loc5_.data.secondaryQuest[3] = [Number(_loc16_[6])];
   var _loc22_ = _loc6_.shift();
   var _loc15_ = _loc22_.split("@");
   _loc5_.data.questList = [];
   _loc7_ = 0;
   var _loc4_;
   while(_loc7_ < _loc15_.length - 1)
   {
      _loc4_ = _loc15_[_loc7_].split("#");
      _loc4_[0] = Number(_loc4_[0]);
      _loc4_[1] = Number(_loc4_[1]);
      _loc4_[2] = Number(_loc4_[2]);
      _loc4_[4] = Number(_loc4_[4]);
      _loc5_.data.questList[_loc7_] = _loc4_;
      _loc7_ = _loc7_ + 1;
   }
   var _loc28_ = _loc6_.shift();
   var _loc18_ = _loc28_.split("#");
   _loc5_.data.mapVisit = [];
   _loc7_ = 0;
   while(_loc7_ < 16)
   {
      _loc5_.data.mapVisit[_loc7_ + 1] = _loc18_[_loc7_];
      _loc7_ = _loc7_ + 1;
   }
   txt.text = "done!!";
};
