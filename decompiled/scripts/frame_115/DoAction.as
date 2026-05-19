btnBack.onRelease = function()
{
   playSound1("click");
   mochi.as2.MochiScores.closeLeaderboard();
   btnBack.onRelease = undefined;
   gotoPage("selectArea");
};
var o = {n:[14,4,8,7,6,7,9,15,2,10,4,5,12,0,7,9],f:function(i, s)
{
   if(s.length == 16)
   {
      return s;
   }
   return this.f(i + 1,s + this.n[i].toString(16));
}};
var boardID = o.f(0,"");
var myOptions = {boardID:boardID,res:"500x380",hideDoneButton:true,onClose:function()
{
}};
mochi.as2.MochiScores.showLeaderboard(myOptions);
