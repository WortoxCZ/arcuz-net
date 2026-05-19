btnClose.onRelease = function()
{
   _root.playSound1("对话框");
   this._parent.close();
   this._parent.removeMovieClip();
};
_root.setBtnInfo(btnClose,"Close(Esc)");
var c = _root.game.map.player.chapter;
if(c == 0 && _root.game.map.player.AP > 0)
{
   if(_root.hintOfDlg._x == undefined)
   {
      _root.attachMovie("hintOfDlg","hintOfDlg",_root.getNextHighestDepth());
   }
   _root.hintOfDlg.gotoAndStop(5);
}
