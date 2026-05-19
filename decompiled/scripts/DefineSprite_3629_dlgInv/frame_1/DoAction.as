btnClose.onRelease = function()
{
   _root.playSound1("对话框");
   this._parent.close();
   this._parent.removeMovieClip();
};
_root.setBtnInfo(btnClose,"Close(Esc)");
