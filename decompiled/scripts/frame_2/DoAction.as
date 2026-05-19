function sitelock()
{
   var _loc6_ = _url.split("://");
   var _loc4_ = _loc6_[1].split("/");
   var _loc2_ = "armorgames.com";
   var _loc3_ = _loc4_[0];
   var _loc5_ = _loc3_.lastIndexOf(_loc2_) + _loc2_.length == _loc3_.length;
   if(!_loc5_)
   {
      _root.gotoAndStop("logo");
      _root.gotoAndStop("sitelocked");
   }
}
this._lockroot = true;
// sitelock() disabled — standalone coop build runs outside armorgames.com
stop();
