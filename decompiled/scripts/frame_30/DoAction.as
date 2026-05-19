areaMode = 0;
playMusic("06基诺山脉&09神秘山洞&游戏开始菜单.mp3",true);
npc1firstTalking = false;
btnFile.onRelease = function()
{
   playSound1("click");
   gotoAndStop("file");
};
mochi.as2.MochiSocial.showLoginWidget({x:302,y:416});
