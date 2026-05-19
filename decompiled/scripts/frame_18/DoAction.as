l1.onRelease = function()
{
   _root.lang = 0;
   playSound1("click");
   gotoPage("title");
};
l2.onRelease = function()
{
   _root.lang = 1;
   playSound1("click");
   gotoPage("title");
};
l3.onRelease = function()
{
   _root.lang = 2;
   playSound1("click");
   gotoPage("title");
};
l4.onRelease = function()
{
   _root.lang = 3;
   playSound1("click");
   gotoPage("title");
};
l5.onRelease = function()
{
   _root.lang = 4;
   playSound1("click");
   gotoPage("title");
};
l6.onRelease = function()
{
   _root.lang = 5;
   playSound1("click");
   gotoPage("title");
};
l7.onRelease = function()
{
   _root.lang = 6;
   playSound1("click");
   gotoPage("title");
};
playMusic("06基诺山脉&09神秘山洞&游戏开始菜单.mp3",true);
if(_root.mouseCursor._x == undefined)
{
   _root.attachMovie("mouseCursor","mouseCursor",_root.getNextHighestDepth());
}
stop();
