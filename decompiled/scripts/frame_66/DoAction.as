btnBack.onRelease = function()
{
   playSound1("click");
   btnBack.onRelease = undefined;
   gotoPage("title");
};
_root.mouseCursor.swapDepths(_root.getNextHighestDepth());
playMusic("爆机.mp3");
