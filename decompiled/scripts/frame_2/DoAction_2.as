var allSlime = 0;
var slimeKilled = 0;
var slimeRun = 0;
this.onEnterFrame = function()
{
   var _loc6_;
   if(!random(50))
   {
      _loc6_ = this.attachMovie("slimeIntro","slime" + allSlime,this.getNextHighestDepth());
      allSlime++;
      _loc6_.init();
   }
   minigameTxt.text = "Slime killed : " + slimeKilled + "\nSlime escaped : " + slimeRun;
   var _loc5_ = getBytesLoaded();
   var _loc4_ = getBytesTotal();
   bar._xscale = 100 * _loc5_ / _loc4_;
   loading.text = "loading..." + int(bar._xscale) + "%";
   if(_loc5_ >= _loc4_ && _loc4_ > 0)
   {
      for(var _loc3_ in _root)
      {
         if(_root[_loc3_].mtype == "slimeintro")
         {
            _root[_loc3_].removeMovieClip();
         }
      }
      if(_root.adstart == undefined)
      {
         this.play();
      }
      this.onEnterFrame = undefined;
   }
};
