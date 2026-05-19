btnBack.onRelease = function()
{
   playSound1("click");
   btnBack.onRelease = undefined;
   gotoPage("title");
};
mochi.as2.MochiSocial.hideLoginWidget();
