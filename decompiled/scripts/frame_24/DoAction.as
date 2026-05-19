stop();
setSkillInfoText();
btnPlay.onRelease = function()
{
   playSound1("click");
   gotoPage("play");
};
btnAch.onRelease = function()
{
   playSound1("click");
   gotoPage("Achievement");
};
btnHighscores.onRelease = function()
{
   playSound1("click");
   gotoPage("highscores");
};
btnHelp.onRelease = function()
{
   playSound1("click");
   gotoPage("help");
};
btnCredit.onRelease = function()
{
   playSound1("click");
   gotoPage("credit");
};
playMusic("06基诺山脉&09神秘山洞&游戏开始菜单.mp3",true);
mochi.as2.MochiSocial.showLoginWidget({x:302,y:416});
