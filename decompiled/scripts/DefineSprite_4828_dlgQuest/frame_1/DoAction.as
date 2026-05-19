btnClose.onRelease = function()
{
   _root.playSound1("对话框");
   _root.btnInfo.removeMovieClip();
   this._parent.removeMovieClip();
};
_root.setBtnInfo(btnClose,"CloseEsc");
