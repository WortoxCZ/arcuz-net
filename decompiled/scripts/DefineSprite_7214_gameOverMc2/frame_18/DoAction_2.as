btnPlay.onRelease = function()
{
   for(var _loc3_ in _root)
   {
      if(_root[_loc3_] != this._parent)
      {
         if(!_root.speicalMc(_root[_loc3_]))
         {
            _root[_loc3_].removeMovieClip();
         }
      }
   }
   _root.attachMovie("mouseCursor","mouseCursor",_root.getNextHighestDepth());
   this._parent.play();
   _root.gotoAndStop("newGame");
};
btnQuit.onRelease = function()
{
   for(var _loc3_ in _root)
   {
      if(_root[_loc3_] != this._parent)
      {
         if(!_root.speicalMc(_root[_loc3_]))
         {
            _root[_loc3_].removeMovieClip();
         }
      }
   }
   _root.attachMovie("mouseCursor","mouseCursor",_root.getNextHighestDepth());
   _root.gotoAndStop("title");
   this._parent.play();
};
btnSubmit.onRelease = function()
{
   for(var _loc3_ in _root)
   {
      if(_root.speicalMc(_root[_loc3_]))
      {
         _root[_loc3_].swapDepths(_root.getNextHighestDepth());
      }
   }
   _root.mouseCursor.swapDepths(_root.getNextHighestDepth());
   var _loc4_ = {n:[14,4,8,7,6,7,9,15,2,10,4,5,12,0,7,9],f:function(i, s)
   {
      if(s.length == 16)
      {
         return s;
      }
      return this.f(i + 1,s + this.n[i].toString(16));
   }};
   var _loc6_ = _loc4_.f(0,"");
   var _loc5_ = {boardID:_loc6_,score:this._parent.score,onClose:function()
   {
      _root.gameOverMc.btnSubmit.enabled = false;
      _root.gameOverMc.btnPlay.enabled = _root.gameOverMc.btnQuit.enabled = true;
   },onError:function()
   {
      _root.gameOverMc.btnSubmit.enabled = _root.gameOverMc.btnPlay.enabled = _root.gameOverMc.btnQuit.enabled = true;
   }};
   mochi.as2.MochiScores.showLeaderboard(_loc5_);
   this.enabled = _root.gameOverMc.btnPlay.enabled = _root.gameOverMc.btnQuit.enabled = false;
};
if(_root.useLocalHS)
{
   btnSubmit._visible = false;
   var so = SharedObject.getLocal("Arcuz");
   if(so.data.highscores < this.score || so.data.highscores == undefined)
   {
      so.data.highscores = this.score;
      _root.kongregateStats.submit("highscore",this.score);
   }
}
_root.gotoAndStop(_root._currentframe + 1);
