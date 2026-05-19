btnPlay.onRelease = function()
{
   _root.playSound1("click");
   this._parent.play();
   this._parent.gotoPage = "play";
};
btnAch.onRelease = function()
{
   _root.playSound1("click");
   this._parent.play();
   this._parent.gotoPage = "Achievement";
};
btnHighscores.onRelease = function()
{
   _root.playSound1("click");
   this._parent.play();
   this._parent.gotoPage = "highscores";
};
btnHelp.onRelease = function()
{
   _root.playSound1("click");
   this._parent.play();
   this._parent.gotoPage = "help";
};
btnCredit.onRelease = function()
{
   _root.playSound1("click");
   this._parent.play();
   this._parent.gotoPage = "credit";
};
stop();
