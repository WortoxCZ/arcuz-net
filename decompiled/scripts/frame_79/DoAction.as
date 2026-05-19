btnOutput.onRelease = function()
{
   gotoAndStop("fileOutput");
};
btnLoad.onRelease = function()
{
   gotoAndStop("fileLoad");
};
btnBack.onRelease = function()
{
   playSound1("click");
   gotoAndStop("title");
};
