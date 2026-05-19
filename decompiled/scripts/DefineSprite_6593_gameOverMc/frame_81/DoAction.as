_root.game.pauseCharacters();
btnBack.onRelease = function()
{
   _root.game.map.player.cleanAllstatus();
   var _loc4_ = int(_root.game.map.player.levelUpExp * (random(8) + 4) / 100);
   _loc4_ = _loc4_ <= _root.game.map.player.exp ? _loc4_ : _root.game.map.player.exp;
   _root.game.map.player.exp -= _loc4_;
   _root.game.map.player.exp = _root.game.map.player.exp >= 0 ? _root.game.map.player.exp : 0;
   var _loc9_ = int(_root.game.map.player.money * (random(8) + 4) / 100);
   _root.game.map.player.money -= _loc9_;
   _root.newMessage("-" + _loc4_ + " Exp");
   _root.newMessage("-" + _loc9_ + " Gold");
   var _loc8_ = _root["map_" + _root.game.map.areaName + "_in"][0];
   var _loc3_ = _root["map_" + _root.game.map.areaName + "_in"][1];
   if(_loc3_ == "left")
   {
      _loc3_ = "right";
   }
   else if(_loc3_ == "right")
   {
      _loc3_ = "left";
   }
   else if(_loc3_ == "top")
   {
      _loc3_ = "bottom";
   }
   else if(_loc3_ == "bottom")
   {
      _loc3_ = "top";
   }
   var _loc7_ = _root[_loc8_].Exit[_loc3_ + "In"][0];
   var _loc6_ = _root[_loc8_].Exit[_loc3_ + "In"][1];
   if(_loc3_ == "left")
   {
      _loc7_ += 150;
   }
   else if(_loc3_ == "right")
   {
      _loc7_ -= 150;
   }
   else if(_loc3_ == "top")
   {
      _loc6_ += 150;
   }
   else if(_loc3_ == "bottom")
   {
      _loc6_ -= 150;
   }
   _root.game.map.player.tele = [_root["map_" + _root.game.map.areaName + "_in"][0],_loc7_,_loc6_];
   _root.game.map.changeMap(_root.map_01_0101);
   _root.game.map.player.hit = false;
   _root.game.map.player.hp = _root.game.map.player.recoverHp = int(_root.game.map.player.totalHp / 2);
   _root.game.map.player.action();
   _root.game.map.player._x = 967;
   _root.game.map.player._y = 452;
   _root.ui.exp.mask._xscale = 100 * _root.game.map.player.exp / _root.game.map.player.levelUpExp;
   _root.ui.hp.mask._x = _root.game.map.player.hp * 142 / _root.game.map.player.totalHp;
   _root.ui.recoverHp.mask._x = _root.game.map.player.recoverHp * 142 / _root.game.map.player.totalHp;
   for(var _loc5_ in _root.ui.uiPlayerState)
   {
      _root.ui.uiPlayerState[_loc5_].removeMovieClip();
   }
   _root.ui.uiPlayerState.mcNum = 0;
   _root.game.map.player.calcWeight();
   _root.game.continueCharacters();
   if(_root.game.map.player.ach[22][0] == 0)
   {
      if(++_root.game.map.player.ach[22][1] >= 99)
      {
         _root.game.map.player.ach[22][0] = 1;
         _root.newMessage(_root.textSys[23][_root.lang]);
      }
   }
   _root.kongregateStats.submit("revive",1);
   this._parent.gotoAndPlay(160);
};
btnQuit.onRelease = function()
{
   _root.game.map.player.hp = _root.game.map.player.recoverHp = 1;
   _root.game.map.player.saveStatus();
   var _loc3_ = _root.attachMovie("dialog2","dialog2",_root.getNextHighestDepth());
   _root.mouseCursor.swapDepths(_root.getNextHighestDepth());
   var _loc5_ = ["saving..."];
   _loc3_.init(_loc5_);
   _loc3_.btnClose.onRelease = function()
   {
      this._parent.closeDlg();
      mochi.as2.MochiSocial.hideLoginWidget();
      _root.saveGameCounter.removeMovieClip();
      _root.gameOverMc.btnBack.enabled = _root.gameOverMc.btnQuit.enabled = true;
   };
   if(_root.usingMochiCoins)
   {
      _loc3_.enterframe = function()
      {
         if(_root.saving != "now")
         {
            if(_root.mochiCoinsLoggedIn)
            {
               if(_root.saving == "done")
               {
                  this.showString("saving...done!");
               }
               else if(_root.saving == "IOError")
               {
                  _root.saveGameCounter.removeMovieClip();
                  this.showString("There was a network error.!");
               }
               else if(_root.saving == "timeOut")
               {
                  this.showString("Server connection failed, data has been saved to local temporarily");
               }
               this.count = 0;
               this.enterframe = function()
               {
                  if(++this.count > 30)
                  {
                     this.closeDlg();
                  }
               };
            }
            else
            {
               this.showString("To save your game, you\'ll need to make a MochiGames account, or use your existing Facebook account.\nIt\'s simple! Free! And youl\'ll get a free hat and a shield too! \nClick \"register\" to make your own account. Click \"x\" to close this dialog.");
               for(var _loc3_ in _root)
               {
                  if(_root.speicalMc(_root[_loc3_]))
                  {
                     _root[_loc3_].swapDepths(_root.getNextHighestDepth());
                  }
               }
               _root.mouseCursor.swapDepths(_root.getNextHighestDepth());
               mochi.as2.MochiSocial.showLoginWidget({x:160,y:120});
               this.enterframe = undefined;
            }
         }
      };
   }
   else
   {
      _loc3_.count = 0;
      _loc3_.enterframe = function()
      {
         if(++this.count == 20)
         {
            this.showString("saving...done!");
         }
         else if(this.count > 50)
         {
            this.closeDlg();
         }
      };
   }
   var _loc6_ = _root.createEmptyMovieClip("saveGameCounter",_root.getNextHighestDepth());
   _loc6_.onEnterFrame = function()
   {
      if(!_root.dialog2._x)
      {
         for(var _loc2_ in _root)
         {
            if(_root[_loc2_] != _root.gameOverMc)
            {
               if(!_root.speicalMc(_root[_loc2_]))
               {
                  _root[_loc2_].removeMovieClip();
               }
            }
         }
         _root.attachMovie("mouseCursor","mouseCursor",_root.getNextHighestDepth());
         _root.gotoAndStop("title");
         _root.gameOverMc.gotoAndPlay(155);
      }
   };
   _root.gameOverMc.btnBack.enabled = _root.gameOverMc.btnQuit.enabled = false;
};
stop();
