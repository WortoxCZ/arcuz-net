btnSkipIntro.onRelease = function()
{
   playSound1("click");
   var _loc3_;
   var _loc4_;
   if(!_root.usingMochiCoins)
   {
      _loc3_ = SharedObject.getLocal("Arcuz");
      if(_loc3_.flush(1000) != true)
      {
         return undefined;
      }
      _loc4_ = _loc3_.data.playerName;
      _loc3_.clear();
      _loc3_.data.playerName = _loc4_;
   }
   var _loc5_ = _root.attachMovie("cutSceneMc","cutSceneMc",_root.getNextHighestDepth());
   _root.mouseCursor.swapDepths(_root.getNextHighestDepth());
   stopAllSounds();
   _root.now_music = undefined;
   _root.playSound1("chapter开始.mp3");
   _loc5_.onEnterFrame = function()
   {
      if(this._currentframe == 34)
      {
         this.chapter.gotoAndStop(1);
      }
      else if(this._currentframe == 165)
      {
         _root.gotoPage("newGame");
      }
      else if(this._currentframe == this._totalframes)
      {
         this.removeMovieClip();
      }
   };
   this.onRelease = undefined;
};
playMusic("12悲伤森林&13废弃矿坑.mp3",true);
mochi.as2.MochiSocial.hideLoginWidget();
