class LZW
{
   var xmlsafe = false;
   function LZW()
   {
   }
   function compress(str)
   {
      var _loc4_ = new Array();
      var _loc10_ = !this.xmlsafe ? 0 : 5;
      var _loc5_ = 0;
      while(_loc5_ < 256)
      {
         _loc4_[String.fromCharCode(_loc5_)] = _loc5_;
         _loc5_ = _loc5_ + 1;
      }
      if(this.xmlsafe)
      {
         _loc4_["<"] = 256;
         _loc4_[">"] = 257;
         _loc4_["&"] = 258;
         _loc4_["\""] = 259;
         _loc4_["\'"] = 260;
      }
      var _loc7_ = "";
      var _loc11_ = str;
      var _loc8_ = _loc11_.split("");
      var _loc9_ = _loc8_.length;
      var _loc6_ = 256 + _loc10_;
      var _loc3_ = "";
      _loc5_ = 0;
      var _loc2_;
      while(_loc5_ <= _loc9_)
      {
         _loc2_ = _loc8_[_loc5_];
         if(_loc4_[_loc3_ + _loc2_] !== undefined)
         {
            _loc3_ += _loc2_;
         }
         else
         {
            _loc7_ += String.fromCharCode(_loc4_[_loc3_]);
            _loc4_[_loc3_ + _loc2_] = _loc6_;
            _loc6_ = _loc6_ + 1;
            _loc3_ = _loc2_;
         }
         _loc5_ = _loc5_ + 1;
      }
      return _loc7_;
   }
   function decompress(str)
   {
      var _loc5_ = new Array();
      var _loc11_ = !this.xmlsafe ? 0 : 5;
      var _loc7_ = 0;
      var _loc10_;
      while(_loc7_ < 256)
      {
         _loc10_ = String.fromCharCode(_loc7_);
         _loc5_[_loc7_] = _loc10_;
         _loc7_ = _loc7_ + 1;
      }
      if(this.xmlsafe)
      {
         _loc5_[256] = "<";
         _loc5_[257] = ">";
         _loc5_[258] = "&";
         _loc5_[259] = "\"";
         _loc5_[260] = "\'";
      }
      var _loc12_ = str;
      var _loc14_ = _loc12_.split("");
      var _loc13_ = _loc14_.length;
      var _loc8_ = 256 + _loc11_;
      var _loc2_ = "";
      var _loc3_ = "";
      var _loc9_ = "";
      _loc7_ = 0;
      var _loc6_;
      var _loc4_;
      while(_loc7_ < _loc13_)
      {
         _loc6_ = _loc12_.charCodeAt(_loc7_);
         _loc4_ = _loc5_[_loc6_];
         if(_loc2_ == "")
         {
            _loc2_ = _loc4_;
            _loc9_ += _loc4_;
         }
         else if(_loc6_ <= 255 + _loc11_)
         {
            _loc9_ += _loc4_;
            _loc3_ = _loc2_ + _loc4_;
            _loc5_[_loc8_] = _loc3_;
            _loc8_ = _loc8_ + 1;
            _loc2_ = _loc4_;
         }
         else
         {
            _loc3_ = _loc5_[_loc6_];
            if(_loc3_ == undefined)
            {
               _loc3_ = _loc2_ + _loc2_.slice(0,1);
            }
            _loc9_ += _loc3_;
            _loc5_[_loc8_] = _loc2_ + _loc3_.slice(0,1);
            _loc8_ = _loc8_ + 1;
            _loc2_ = _loc3_;
         }
         _loc7_ = _loc7_ + 1;
      }
      return _loc9_;
   }
   function compress_fp6(str)
   {
      var _loc4_ = new Array();
      var _loc11_ = !this.xmlsafe ? 0 : 5;
      var _loc5_ = 0;
      while(_loc5_ < 256)
      {
         _loc4_[String(_loc5_)] = _loc5_;
         _loc5_ = _loc5_ + 1;
      }
      var _loc15_;
      var _loc12_;
      var _loc14_;
      var _loc16_;
      var _loc13_;
      if(this.xmlsafe)
      {
         _loc15_ = String(new String("<").charCodeAt(0));
         _loc12_ = String(new String(">").charCodeAt(0));
         _loc14_ = String(new String("&").charCodeAt(0));
         _loc16_ = String(new String("\"").charCodeAt(0));
         _loc13_ = String(new String("\'").charCodeAt(0));
         _loc4_[_loc15_] = 256;
         _loc4_[_loc12_] = 257;
         _loc4_[_loc14_] = 258;
         _loc4_[_loc16_] = 259;
         _loc4_[_loc13_] = 260;
      }
      var _loc8_ = "";
      var _loc17_ = str;
      var _loc9_ = _loc17_.split("");
      var _loc10_ = _loc9_.length;
      var _loc7_ = 256 + _loc11_;
      var _loc2_ = new Array();
      _loc5_ = 0;
      var _loc3_;
      var _loc6_;
      while(_loc5_ <= _loc10_)
      {
         _loc3_ = _loc9_[_loc5_];
         if(_loc2_.length == 0)
         {
            _loc6_ = String(_loc3_.charCodeAt(0));
         }
         else
         {
            _loc6_ = _loc2_.join("-") + "-" + String(_loc3_.charCodeAt(0));
         }
         if(_loc4_[_loc6_] !== undefined)
         {
            _loc2_.push(_loc3_.charCodeAt(0));
         }
         else
         {
            _loc8_ += String.fromCharCode(_loc4_[_loc2_.join("-")]);
            _loc4_[_loc6_] = _loc7_;
            _loc7_ = _loc7_ + 1;
            false;
            _loc2_ = new Array();
            _loc2_.push(_loc3_.charCodeAt(0));
         }
         _loc5_ = _loc5_ + 1;
      }
      return _loc8_;
   }
}
