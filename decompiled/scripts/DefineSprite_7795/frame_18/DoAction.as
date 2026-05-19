function confirmNewGame()
{
   _root.attachMovie("discardConfirm","confirm",_root.getNextHighestDepth());
   _root.mouseCursor.swapDepths(_root.getNextHighestDepth());
   _root.confirm.txt.text = "Your saved data will be erased,continue?";
   _root.confirm.btnYes.onRelease = function()
   {
      _root.btnPack.inputNewName();
      _root.confirm.removeMovieClip();
   };
   _root.confirm.btnNo.onRelease = function()
   {
      _root.confirm.removeMovieClip();
   };
}
function inputNewName()
{
   _root.attachMovie("inputName","inputName",_root.getNextHighestDepth());
   _root.mouseCursor.swapDepths(_root.getNextHighestDepth());
   _root.inputName.btnYes.onRelease = function()
   {
      if(_root.inputName.txt.text.length < 2)
      {
         return undefined;
      }
      var _loc2_;
      if(_root.usingMochiCoins)
      {
         _root.mochiCoinsSaveData = _root.getNewObject();
         _root.mochiCoinsSaveData.playerName = _root.inputName.txt.text;
         _root.mochiCoinsSaveData.totalPage = 3 + int(_root.mochiCoinsSaveData.extraPage);
         _root.mochiCoinsSaveData.totalPage = _root.mochiCoinsSaveData.totalPage <= 9 ? _root.mochiCoinsSaveData.totalPage : 9;
      }
      else
      {
         _loc2_ = SharedObject.getLocal("Arcuz");
         _loc2_.data.playerName = _root.inputName.txt.text;
         _loc2_.flush();
      }
      _root.btnPack.btnArea.onRelease = undefined;
      _root.btnPack.btnShop.onRelease = undefined;
      _root.btnPack.btnBack.onRelease = undefined;
      _root.btnPack.btnNewGame.onRelease = undefined;
      _root.btnPack.btnContinue.onRelease = undefined;
      _root.inputName.removeMovieClip();
      _root.gotoPage("intro");
   };
   _root.inputName.btnNo.onRelease = function()
   {
      _root.inputName.removeMovieClip();
   };
}
function continuef()
{
   _root.playSound1("click");
   var _loc3_ = _root.attachMovie("cutSceneMc","cutSceneMc",_root.getNextHighestDepth());
   _root.mouseCursor.swapDepths(_root.getNextHighestDepth());
   stopAllSounds();
   _root.playSound1("chapter开始.mp3");
   _root.now_music = undefined;
   mochi.as2.MochiSocial.hideLoginWidget();
   _loc3_.onEnterFrame = function()
   {
      var _loc3_;
      if(this._currentframe == 34)
      {
         if(_root.usingMochiCoins)
         {
            this.chapter.gotoAndStop(_root.mochiCoinsSaveData.chapter + 1);
         }
         else
         {
            _loc3_ = SharedObject.getLocal("Arcuz");
            this.chapter.gotoAndStop(_loc3_.data.chapter + 1);
         }
      }
      else if(this._currentframe == 165)
      {
         _root.gotoPage("newGame");
      }
      else if(this._currentframe == this._totalframes)
      {
         this.removeMovieClip();
      }
   };
   _root.btnPack.btnArea.onRelease = undefined;
   _root.btnPack.btnShop.onRelease = undefined;
   _root.btnPack.btnBack.onRelease = undefined;
   _root.btnPack.btnNewGame.onRelease = undefined;
   _root.btnPack.btnContinue.onRelease = undefined;
}
btnArea.onRelease = function()
{
   _root.playSound1("click");
   this._parent.play();
   this._parent.gotoPage = "selectArea";
};
btnShop.onRelease = function()
{
   _root.playSound1("click");
   this._parent.play();
   this._parent.gotoPage = "shop";
};
btnBack.onRelease = function()
{
   _root.playSound1("click");
   this._parent.play();
   this._parent.gotoPage = "title";
};
if(_root.usingMochiCoins && _root.mochiCoinsLoggedIn != true)
{
   btnNewGame.onRelease = function()
   {
      _root.playSound1("click");
      _root.attachMovie("mochicoinsconfirm","confirm",_root.getNextHighestDepth());
      for(var _loc3_ in _root)
      {
         if(_root.speicalMc(_root[_loc3_]))
         {
            _root[_loc3_].swapDepths(_root.getNextHighestDepth());
         }
      }
      mochi.as2.MochiSocial.showLoginWidget({x:85,y:240});
      _root.mouseCursor.swapDepths(_root.getNextHighestDepth());
      _root.confirm.btnYes.onRelease = function()
      {
         _root.btnPack.inputNewName();
         mochi.as2.MochiSocial.showLoginWidget({x:302,y:416});
         this._parent.removeMovieClip();
      };
      _root.confirm.btnNo.onRelease = function()
      {
         mochi.as2.MochiSocial.showLoginWidget({x:302,y:416});
         this._parent.removeMovieClip();
      };
   };
}
else if(so.data.level == undefined && !_root.usingMochiCoins || _root.usingMochiCoins & _root.mochiCoinsSaveData.level == undefined)
{
   btnNewGame.onRelease = function()
   {
      _root.playSound1("click");
      _root.btnPack.inputNewName();
   };
}
else
{
   btnNewGame.onRelease = function()
   {
      _root.playSound1("click");
      _root.btnPack.confirmNewGame();
   };
}
btnContinue.onRelease = function()
{
   var _loc2_;
   if(_root.usingMochiCoins)
   {
      _loc2_ = SharedObject.getLocal("Arcuz");
      if(_loc2_.data.user == _root.lastPlayer)
      {
         _root.attachMovie("discardConfirm","confirm",_root.getNextHighestDepth());
         _root.mouseCursor.swapDepths(_root.getNextHighestDepth());
         _root.confirm.txt.text = "Do you want to load your auto-saved game?";
         _root.confirm.btnYes.onRelease = function()
         {
            var _loc2_ = SharedObject.getLocal("Arcuz");
            _root.mochiCoinsSaveData = _root.copySavedata(_loc2_.data);
            _root.btnPack.continuef();
            _root.confirm.removeMovieClip();
         };
         _root.confirm.btnNo.onRelease = function()
         {
            _root.btnPack.continuef();
            _root.confirm.removeMovieClip();
         };
      }
      else
      {
         _root.btnPack.continuef();
      }
   }
   else
   {
      _root.btnPack.continuef();
   }
};
stop();
