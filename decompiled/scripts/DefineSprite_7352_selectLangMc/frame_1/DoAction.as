l1.onRelease = function()
{
   _root.lang = 0;
   _root.playSound1("click");
   this._parent.setLang();
   this._parent.removeMovieClip();
};
l2.onRelease = function()
{
   _root.lang = 1;
   _root.playSound1("click");
   this._parent.setLang();
   this._parent.removeMovieClip();
};
l3.onRelease = function()
{
   _root.lang = 2;
   _root.playSound1("click");
   this._parent.setLang();
   this._parent.removeMovieClip();
};
l4.onRelease = function()
{
   _root.lang = 3;
   this._parent.setLang();
   _root.playSound1("click");
   this._parent.removeMovieClip();
};
l5.onRelease = function()
{
   _root.lang = 4;
   this._parent.setLang();
   _root.playSound1("click");
   this._parent.removeMovieClip();
};
l6.onRelease = function()
{
   _root.lang = 5;
   this._parent.setLang();
   _root.playSound1("click");
   this._parent.removeMovieClip();
};
l7.onRelease = function()
{
   _root.lang = 6;
   this._parent.setLang();
   _root.playSound1("click");
   this._parent.removeMovieClip();
};
setLang = function()
{
   _root.setSkillInfoText();
   _root.setQuest();
   var _loc2_ = 1;
   while(_loc2_ <= 7)
   {
      _root.game.map["npc" + _loc2_].showQuestStatus();
      _root.game.map["npc" + _loc2_].updateStore();
      _root.game.map["npc" + _loc2_].setDlg();
      _loc2_ = _loc2_ + 1;
   }
};
stop();
