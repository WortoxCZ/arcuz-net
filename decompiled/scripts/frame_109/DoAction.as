function defaultTxt()
{
   if(_root.mochiCoinsLoggedIn)
   {
      txt.text = _root.textTutorial[24][_root.lang];
   }
   else
   {
      txt.text = _root.textTutorial[25][_root.lang];
   }
}
btnBack.onRelease = function()
{
   playSound1("click");
   btnBack.onRelease = undefined;
   gotoPage("play");
};
btnFalchion.onRelease = function()
{
   mochi.as2.MochiCoins.showStore({tags:["falchion"]});
};
btnSword.onRelease = function()
{
   mochi.as2.MochiCoins.showStore({tags:["sword"]});
};
btnAxe.onRelease = function()
{
   mochi.as2.MochiCoins.showStore({tags:["axe"]});
};
btnGlove.onRelease = function()
{
   mochi.as2.MochiCoins.showStore({tags:["gloves"]});
};
btnHelmet.onRelease = function()
{
   mochi.as2.MochiCoins.showStore({tags:["helmet"]});
};
btnArmor.onRelease = function()
{
   mochi.as2.MochiCoins.showStore({tags:["armor"]});
};
btnShield.onRelease = function()
{
   mochi.as2.MochiCoins.showStore({tags:["shield"]});
};
btnBoots.onRelease = function()
{
   mochi.as2.MochiCoins.showStore({tags:["boots"]});
};
btnBracelet.onRelease = function()
{
   mochi.as2.MochiCoins.showStore({tags:["bracelet"]});
};
btnBelt.onRelease = function()
{
   mochi.as2.MochiCoins.showStore({tags:["belt"]});
};
btnRing.onRelease = function()
{
   mochi.as2.MochiCoins.showStore({tags:["ring"]});
};
btnNecklace.onRelease = function()
{
   mochi.as2.MochiCoins.showStore({tags:["necklace"]});
};
btnSpecial.onRelease = function()
{
   mochi.as2.MochiCoins.showStore({tags:["special"]});
};
btnOthers.onRelease = function()
{
   mochi.as2.MochiCoins.showStore({tags:["Others"]});
};
btnOthers.onRollOver = function()
{
   this._parent.txt.text = "Buy Gold, Stones, Crystals, Experience, Attribute Points, Capacity Points!";
};
btnOthers.onRollOut = function()
{
   this._parent.defaultTxt();
};
mochi.as2.MochiSocial.showLoginWidget({x:90,y:405});
defaultTxt();
