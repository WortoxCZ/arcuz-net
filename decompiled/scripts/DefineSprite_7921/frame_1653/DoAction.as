stop();
var tmp = _root.attachMovie("cutSceneMc","cutSceneMc",_root.getNextHighestDepth());
tmp.onEnterFrame = function()
{
   if(this._currentframe == 34)
   {
      this.chapter.gotoAndStop("nothing");
   }
   else if(this._currentframe == 120)
   {
      _root.gotoAndStop("title");
   }
   else if(this._currentframe == this._totalframes)
   {
      this.removeMovieClip();
   }
};
