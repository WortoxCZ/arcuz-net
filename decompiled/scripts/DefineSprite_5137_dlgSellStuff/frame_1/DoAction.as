if(!_root.usingMochiCoins)
{
   btnShop._visible = false;
}
else
{
   btnShop.onRelease = function()
   {
      _root.playSound1("对话框");
      if(_root.areaMode == 0)
      {
         if(_root.usingMochiCoins)
         {
            _root.ui.attachMovie("inGameShop","inGameShop",_root.ui.getNextHighestDepth());
         }
      }
   };
}
