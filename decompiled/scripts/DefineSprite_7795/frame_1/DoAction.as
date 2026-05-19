var so = SharedObject.getLocal("Arcuz");
if(so.data.level == undefined && !_root.usingMochiCoins || _root.usingMochiCoins && _root.mochiCoinsSaveData.level == undefined)
{
   btnContinue._visible = false;
}
else
{
   btnContinue._visible = true;
}
