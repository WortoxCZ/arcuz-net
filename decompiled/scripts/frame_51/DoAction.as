btnBack.onRelease = function()
{
   playSound1("click");
   btnBack.onRelease = undefined;
   gotoPage("title");
};
if(_root.usingMochiCoins)
{
   var so = _root.mochiCoinsSaveData;
   if(so.ach != undefined)
   {
      var i = 0;
      while(i < 24)
      {
         this["ach" + i].gotoAndStop(Number(so.ach[i][0]) + 1);
         this["txt" + i].text = Number(so.ach[i][1]) + "/500";
         i++;
      }
      txt13.text = Number(so.ach[13][1]) + "/50";
      txt14.text = Number(so.ach[14][1]) + "/300";
      txt15.text = Number(so.ach[15][1]) + "/1000";
      txt17.text = Number(so.ach[17][1]) + "/200";
      txt18.text = Number(so.ach[18][1]) + "/10000";
      txt19.text = Number(so.ach[19][1]) + "/100000";
      txt20.text = Number(so.ach[20][1]) + "/50";
      txt21.text = Number(so.ach[21][1]) + "/50";
      var t = so.totalPlayTime;
   }
   else
   {
      var i = 0;
      while(i < 24)
      {
         this["ach" + i].gotoAndStop(1);
         this["txt" + i].text = "0/500";
         i++;
      }
      txt13.text = "0/50";
      txt14.text = "0/300";
      txt15.text = "0/1000";
      txt17.text = "0/200";
      txt18.text = "0/10000";
      txt19.text = "0/100000";
      txt20.text = "0/50";
      txt21.text = "0/50";
      var t = 0;
   }
}
else
{
   var so = SharedObject.getLocal("Arcuz");
   if(so.data.ach != undefined)
   {
      var i = 0;
      while(i < 24)
      {
         this["ach" + i].gotoAndStop(Number(so.data.ach[i][0]) + 1);
         this["txt" + i].text = Number(so.data.ach[i][1]) + "/500";
         i++;
      }
      txt13.text = Number(so.data.ach[13][1]) + "/50";
      txt14.text = Number(so.data.ach[14][1]) + "/300";
      txt15.text = Number(so.data.ach[15][1]) + "/1000";
      txt17.text = Number(so.data.ach[17][1]) + "/200";
      txt18.text = Number(so.data.ach[18][1]) + "/10000";
      txt19.text = Number(so.data.ach[19][1]) + "/100000";
      txt20.text = Number(so.data.ach[20][1]) + "/50";
      txt21.text = Number(so.data.ach[21][1]) + "/50";
      var t = so.data.totalPlayTime;
   }
   else
   {
      var i = 0;
      while(i < 24)
      {
         this["ach" + i].gotoAndStop(1);
         this["txt" + i].text = "0/500";
         i++;
      }
      txt13.text = "0/50";
      txt14.text = "0/300";
      txt15.text = "0/1000";
      txt17.text = "0/200";
      txt18.text = "0/10000";
      txt19.text = "0/100000";
      txt20.text = "0/50";
      txt21.text = "0/50";
      var t = 0;
   }
}
if(ach22._currentframe == 1)
{
   txt22.text = "???";
}
else
{
   txt22.text = "Revive 99 times";
}
if(ach23._currentframe == 1)
{
   txt23.text = "???";
}
else
{
   txt23.text = "Beat the final arena";
}
var hour = Math.floor(t / 3600);
var minute = Math.floor((t - hour * 3600) / 60);
var second = t - hour * 3600 - minute * 60;
hour = hour >= 10 ? hour : "0" + hour;
minute = minute >= 10 ? minute : "0" + minute;
second = second >= 10 ? second : "0" + second;
totalplaytime.text = "Total play time : " + hour + ":" + minute + ":" + second;
mochi.as2.MochiSocial.hideLoginWidget();
