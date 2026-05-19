btnClose.onRelease = function()
{
   _root.playSound1("对话框");
   _root.btnInfo.removeMovieClip();
   this._parent.close();
};
_root.setBtnInfo(btnClose,"Close(Esc)");
this.close = function()
{
   _root.hintOfDlg.removeMovieClip();
   var _loc3_;
   if(this._name == "dlgSellStuff")
   {
      _loc3_ = 0;
      while(_loc3_ < this.goods.length)
      {
         _root.ui["storeItem" + _loc3_].removeMovieClip();
         _loc3_ = _loc3_ + 1;
      }
   }
   else
   {
      _loc3_ = 0;
      while(_loc3_ < _root.game.map.player.inventoryList1.length)
      {
         _root.ui["itemS" + _loc3_].removeMovieClip();
         _loc3_ = _loc3_ + 1;
      }
   }
   _root.ui.dialog.closeDlg();
   this.removeMovieClip();
};
stop();
