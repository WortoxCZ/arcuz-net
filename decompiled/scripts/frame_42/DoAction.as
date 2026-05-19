if(_root.usingMochiCoins)
{
   var level = _root.mochiCoinsSaveData.level;
}
else
{
   var so = SharedObject.getLocal("Arcuz");
   var level = so.data.level;
}
level = level != undefined ? level : 0;
areaMode = 0;
playMusic("06基诺山脉&09神秘山洞&游戏开始菜单.mp3",true);
if(level >= 35)
{
   area4.onRelease = function()
   {
      playSound1("click");
      _root.areaMode = 4;
      btnBack.onRelease = area1.onRelease = area2.onRelease = area3.onRelease = area4.onRelease = area5.onRelease = undefined;
      _root.gotoPage("newGame");
   };
}
else
{
   area4.enabled = false;
   setSaturation(area4,0);
}
if(level >= 28)
{
   area3.onRelease = function()
   {
      playSound1("click");
      _root.areaMode = 3;
      btnBack.onRelease = area1.onRelease = area2.onRelease = area3.onRelease = area4.onRelease = area5.onRelease = undefined;
      _root.gotoPage("newGame");
   };
}
else
{
   area3.enabled = false;
   setSaturation(area3,0);
}
if(level >= 18)
{
   area2.onRelease = function()
   {
      playSound1("click");
      _root.areaMode = 2;
      btnBack.onRelease = area1.onRelease = area2.onRelease = area3.onRelease = area4.onRelease = area5.onRelease = undefined;
      _root.gotoPage("newGame");
   };
}
else
{
   area2.enabled = false;
   setSaturation(area2,0);
}
if(level >= 8)
{
   area1.onRelease = function()
   {
      playSound1("click");
      _root.areaMode = 1;
      btnBack.onRelease = area1.onRelease = area2.onRelease = area3.onRelease = area4.onRelease = area5.onRelease = undefined;
      _root.gotoPage("newGame");
   };
}
else
{
   area1.enabled = false;
   setSaturation(area1,0);
}
btnBack.onRelease = function()
{
   playSound1("click");
   btnHighscores.onRelease = btnBack.onRelease = area1.onRelease = area2.onRelease = area3.onRelease = area4.onRelease = area5.onRelease = undefined;
   gotoPage("play");
};
hs.text = "";
if(_root.useLocalHS)
{
   btnHighscores._visible = false;
   var so = SharedObject.getLocal("Arcuz");
   if(so.data.highscores == undefined)
   {
      so.data.highscores = 0;
   }
   hs.text = "Highscores : " + so.data.highscores;
}
else
{
   btnHighscores.onRelease = function()
   {
      playSound1("click");
      btnHighscores.onRelease = btnBack.onRelease = area1.onRelease = area2.onRelease = area3.onRelease = area4.onRelease = area5.onRelease = undefined;
      gotoPage("highscores");
   };
}
mochi.as2.MochiSocial.hideLoginWidget();
