class Item extends MovieClip
{
   var attrib;
   var drag;
   var duraMc;
   var id;
   var invOffX;
   var invOffY;
   var invStartX;
   var invStartY;
   var iqc;
   var itemInfo;
   var npc;
   var onPress;
   var onReleaseOutside;
   var onRollOut;
   var onRollOver;
   var pos2;
   var pos3;
   var px;
   var py;
   var questItem;
   var store;
   var storeEndX;
   var storeEndY;
   var storeItem;
   var storeOffX;
   var storeOffY;
   var storeStartX;
   var storeStartY;
   var timer;
   function Item()
   {
      super();
      this._x = this.px = 0;
      this._y = this.py = 0;
      this.duraMc.gotoAndStop(33);
      var _loc3_ = 0;
      while(_loc3_ < 20)
      {
         this.pos2[_loc3_] = [273 + 32 * (_loc3_ % 5),191 + Math.floor(_loc3_ / 5) * 30];
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 1;
      while(_loc3_ <= 3)
      {
         this.pos3[_loc3_] = [228 + 29 * (_loc3_ - 1),371];
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 1;
      while(_loc3_ <= 3)
      {
         this.pos3[_loc3_] = [228 + 29 * (_loc3_ - 1),371];
         _loc3_ = _loc3_ + 1;
      }
      this.storeStartX = 72;
      this.storeStartY = 46;
      this.storeEndX = 204;
      this.storeEndY = 314;
      this.storeOffX = 33;
      this.storeOffY = 35;
      this.invStartX = 273;
      this.invStartY = 191;
      this.invOffX = 32;
      this.invOffY = 30;
      this.setOnPress();
   }
   function setAttrib(att)
   {
      this.attrib = att;
      this.questItem = att.questItem;
      this.gotoAndStop(att.attrib[0]); //unpopped
      if(this.attrib.grade == 2)
      {
         this.iqc.gotoAndStop(2);
      }
      else if(this.attrib.grade == 3)
      {
         this.iqc.gotoAndStop(3);
      }
   }
   function setPosition(i)
   {
      var _loc3_;
      if(this.storeItem)
      {
         this.id = i - 100;
         this._x = this.px = this.storeStartX + this.storeOffX * (i % 5);
         this._y = this.py = this.storeStartY + Math.floor(i / 5) * this.storeOffY;
      }
      else if(this.store)
      {
         this.id = i;
         this._x = this.px = this.storeStartX + this.storeOffX * (i % 5);
         this._y = this.py = this.storeStartY + Math.floor(i / 5) * this.storeOffY;
      }
      else
      {
         this.id = i;
         _loc3_ = i % 20;
         this._x = this.px = this.invStartX + this.invOffX * (_loc3_ % 5);
         this._y = this.py = this.invStartY + Math.floor(_loc3_ / 5) * this.invOffY;
         if(i >= 10 && i <= 19)
         {
            this._x = this.px = this.attrib.setPosX;
            this._y = this.py = this.attrib.setPosY;
         }
      }
   }
   function setOnPress()
   {
      this.drag = false;
      this.onPress = function()
      {
         var _loc3_;
         if(!this.drag)
         {
            this.pickUp();
         }
         else
         {
            _loc3_ = this.drop();
         }
         if(getTimer() - this.timer < 250)
         {
            trace("doubleClick");
            if(!_loc3_)
            {
               this.doubleClickAction();
            }
         }
         this.timer = getTimer();
         if(_root.ui.dlgChar)
         {
            _root.ui.dlgChar.clone();
            _root.ui.dlgChar.cout();
         }
      };
      this.onRollOver = function()
      {
         if(this.storeItem)
         {
            this.itemInfo = new ItemInfo(this,"buy");
         }
         else
         {
            this.itemInfo = new ItemInfo(this,"sell");
         }
      };
      this.onRollOut = this.onReleaseOutside = function()
      {
         this.itemInfo.loader.removeMovieClip();
      };
   }
   function destory()
   {
      if(!this.questItem)
      {
         _root.game.map.player.inventoryList[this.id] = undefined;
         this.itemInfo.loader.removeMovieClip();
         this.removeMovieClip();
      }
   }
   function getEmptyNum()
   {
      var _loc3_ = 20;
      while(_loc3_ <= _root.game.map.player.inventoryList.length)
      {
         if(_root.game.map.player.inventoryList[_loc3_] == undefined)
         {
            break;
         }
         _loc3_ = _loc3_ + 1;
      }
      var _loc4_;
      var _loc5_;
      if(_root.usingMochiCoins)
      {
         _loc4_ = _root.mochiCoinsSaveData.totalPage * 20;
      }
      else
      {
         _loc5_ = SharedObject.getLocal("Arcuz");
         _loc4_ = _loc5_.data.totalPage * 20;
      }
      if(_loc3_ >= _loc4_ + 20)
      {
         _root.newMessage(_root.textSys[19][_root.lang]);
         this._x = this.px;
         this._y = this.py;
         if(this.id <= -10 && this.id > -20)
         {
            _root.game.map.player.inventoryList[this.attrib.setPosNum] = this.attrib;
            this._name = "item" + this.attrib.setPosNum;
            this.id = this.attrib.setPosNum;
            this.attrib.setup();
         }
         this.itemInfo.loader.removeMovieClip();
         return "full";
      }
      return _loc3_;
   }
   function findAPlace()
   {
      var _loc3_ = this.getEmptyNum();
      this.store = false;
      _root.game.map.player.inventoryList[_loc3_] = this.attrib;
      if(_root.ui.dlgInv.currentPage != Math.floor(_loc3_ / 20) || !_root.ui.dlgInv._x)
      {
         this.itemInfo.loader.removeMovieClip();
         this.removeMovieClip();
      }
      this.id = _loc3_;
      this._name = "item" + _loc3_;
      _loc3_ %= 20;
      this._x = 273 + 32 * (_loc3_ % 5);
      this._y = 191 + Math.floor(_loc3_ / 5) * 30;
      this.itemInfo.loader.removeMovieClip();
   }
   function pickUp()
   {
      this.swapDepths(_root.ui.getNextHighestDepth());
      this._x = _root._xmouse - 12;
      this._y = _root._ymouse - 11;
      this.startDrag();
      this.drag = true;
      if(this.store)
      {
         _root.game.map.player.inventoryList1[this.id] = undefined;
      }
      else if(!this.storeItem)
      {
         if(this.id > 0)
         {
            _root.game.map.player.inventoryList[this.id] = undefined;
         }
         if(this.id >= 10 && this.id < 20)
         {
            this.attrib.remove();
            this._name = "item" + (- random(100) - 100);
            this.id *= -1;
         }
         else
         {
            this.id = -1;
         }
      }
      if(this.attrib.Type == "Weapon")
      {
         _root.ui.dlgInv.hl10.gotoAndPlay(1);
         _root.ui.dlgCompose.hl4.gotoAndPlay(1);
      }
      else if(this.attrib.Type == "Helmet")
      {
         _root.ui.dlgInv.hl11.gotoAndPlay(1);
         _root.ui.dlgCompose.hl4.gotoAndPlay(1);
      }
      else if(this.attrib.Type == "Necklace")
      {
         _root.ui.dlgInv.hl12.gotoAndPlay(1);
         _root.ui.dlgCompose.hl4.gotoAndPlay(1);
      }
      else if(this.attrib.Type == "Glove")
      {
         _root.ui.dlgInv.hl13.gotoAndPlay(1);
         _root.ui.dlgCompose.hl4.gotoAndPlay(1);
      }
      else if(this.attrib.Type == "Wear")
      {
         _root.ui.dlgInv.hl14.gotoAndPlay(1);
         _root.ui.dlgCompose.hl4.gotoAndPlay(1);
      }
      else if(this.attrib.Type == "Shield")
      {
         _root.ui.dlgInv.hl15.gotoAndPlay(1);
         _root.ui.dlgCompose.hl4.gotoAndPlay(1);
      }
      else if(this.attrib.Type == "Ring")
      {
         _root.ui.dlgInv.hl16.gotoAndPlay(1);
         _root.ui.dlgCompose.hl4.gotoAndPlay(1);
      }
      else if(this.attrib.Type == "Belt")
      {
         _root.ui.dlgInv.hl17.gotoAndPlay(1);
         _root.ui.dlgCompose.hl4.gotoAndPlay(1);
      }
      else if(this.attrib.Type == "Bracelet")
      {
         _root.ui.dlgInv.hl18.gotoAndPlay(1);
         _root.ui.dlgCompose.hl4.gotoAndPlay(1);
      }
      else if(this.attrib.Type == "Boots")
      {
         _root.ui.dlgCompose.hl4.gotoAndPlay(1);
         _root.ui.dlgInv.hl19.gotoAndPlay(1);
      }
      else if(this.attrib.Type == "Crystal")
      {
         _root.ui.dlgCompose.hl1.gotoAndPlay(1);
         _root.ui.dlgCompose.hl2.gotoAndPlay(1);
         _root.ui.dlgCompose.hl3.gotoAndPlay(1);
         _root.ui.dlgCompose.hl4.gotoAndPlay(1);
      }
      else if(this.attrib.Type != "")
      {
         if(this.attrib.Type != "")
         {
            if(this.attrib.Type != "")
            {
               if(this.attrib.Type != "")
               {
                  if(this.attrib.Type != "")
                  {
                     if(this.attrib.Type != "")
                     {
                        if(this.attrib.Type == "Potion" || this.attrib.Type == "Teleporter")
                        {
                           _root.ui.dlgCompose.hl1.gotoAndPlay(1);
                           _root.ui.dlgCompose.hl2.gotoAndPlay(1);
                           _root.ui.dlgCompose.hl3.gotoAndPlay(1);
                           _root.ui.dlgCompose.hl4.gotoAndPlay(1);
                           _root.ui.itemHighlight.gotoAndPlay(1);
                        }
                     }
                  }
               }
            }
         }
      }
   }
   function drop()
   {
      this.dropSound();
      this.drag = false;
      this.stopDrag();
      this.highlightOff();
      return this.checkDropArea();
   }
   function dropSound()
   {
      if(this.attrib.Type == "Weapon" || this.attrib.Type == "Helmet" || this.attrib.Type == "Necklace" || this.attrib.Type == "Glove" || this.attrib.Type == "Wear" || this.attrib.Type == "Shield" || this.attrib.Type == "Ring" || this.attrib.Type == "Belt" || this.attrib.Type == "Bracelet" || this.attrib.Type == "Boots")
      {
         _root.playSound1("放碎片结晶精华.mp3");
      }
      else if(this.attrib.Type == "Crystal")
      {
         if(this.attrib.attrib[1] == "crystal")
         {
            _root.playSound1("放碎片结晶精华2.mp3");
         }
         else
         {
            _root.playSound1("放宝石.mp3");
         }
      }
      else if(this.attrib.Type == "Potion")
      {
         _root.playSound1("放药瓶.wav");
      }
   }
   function highlightOff()
   {
      var _loc2_ = 10;
      while(_loc2_ < 20)
      {
         _root.ui.dlgInv["hl" + _loc2_].gotoAndStop(_root.ui.dlgInv["hl" + _loc2_]._totalframes);
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 1;
      while(_loc2_ < 5)
      {
         _root.ui.dlgCompose["hl" + _loc2_].gotoAndStop(_root.ui.dlgCompose["hl" + _loc2_]._totalframes);
         _loc2_ = _loc2_ + 1;
      }
      _root.ui.itemHighlight.gotoAndStop(_root.ui.itemHighlight._totalframes);
      _root.ui.skillHighlight.gotoAndStop(_root.ui.skillHighlight._totalframes);
   }
   function buyItem(xnum, ynum)
   {
      var _loc3_;
      if(xnum != undefined)
      {
         _loc3_ = xnum + ynum * 5 + 20;
         _loc3_ += 20 * (_root.ui.dlgInv.currentPage - 1);
         this.px = this.invStartX + xnum * this.invOffX;
         this.py = this.invStartY + ynum * this.invOffY;
         this._x = this.px;
         this._y = this.py;
         this.id = _loc3_;
         this._name = "item" + _loc3_;
         _root.game.map.player.inventoryList[_loc3_] = this.attrib;
         this.cleanStoreStatus();
      }
      else
      {
         this.highlightOff();
         if(this.getEmptyNum() != "full")
         {
            this.cleanStoreStatus();
            this.findAPlace();
         }
      }
   }
   function cleanStoreStatus()
   {
      this.npc.goods[100 + this.id] = undefined;
      this.storeItem = false;
      _root.game.map.player.money -= this.attrib.price;
      _root.ui.dlgInv.money.text = _root.game.map.player.money;
      if(_root.game.map.player.ach[19][0] == 0)
      {
         _root.game.map.player.ach[19][1] += this.attrib.price;
         if(_root.game.map.player.ach[19][1] >= 100000)
         {
            _root.game.map.player.ach[19][0] = 1;
            _root.game.map.player.ach[19][1] = 100000;
            _root.newMessage(_root.textSys[23][_root.lang]);
         }
      }
      _root.game.map.player.calcWeight();
      var _loc3_ = _root.game.map.player.chapter;
      var _loc4_ = _root.game.map.player.phase;
      if(_loc3_ == 0 && _loc4_ == 1)
      {
         if(_root.ui.pointAndHint._x == undefined)
         {
            _root.ui.attachMovie("pointAndHint","pointAndHint",_root.ui.getNextHighestDepth());
         }
         _root.ui.pointAndHint.init(1067,300,_root.textTutorial[19][_root.lang]);
         _root.game.map.player.phase++;
      }
      if(_loc3_ == 0 && _loc4_ == 7)
      {
         if(_root.ui.pointAndHint._x == undefined)
         {
            _root.ui.attachMovie("pointAndHint","pointAndHint",_root.ui.getNextHighestDepth());
         }
         _root.ui.pointAndHint.init(1030,1600,_root.textTutorial[23][_root.lang]);
      }
   }
   function checkDropArea()
   {
      var _loc5_ = false;
      var _loc6_ = false;
      var _loc8_;
      var _loc9_;
      var _loc7_;
      var _loc3_;
      var _loc12_;
      var _loc11_;
      var _loc4_;
      var _loc10_;
      if(this.storeItem && 0)
      {
         if(!_root.ui.dlgInv._x)
         {
            this._x = this.px;
            this._y = this.py;
            return undefined;
         }
         if(!(257 < this._x && this._x < 442 && 175 < this._y && this._y < 320))
         {
            this._x = this.px;
            this._y = this.py;
            return undefined;
         }
         _loc8_ = Math.floor((this._x - 273 + 16) / 30);
         _loc9_ = Math.floor((this._y - 191 + 15) / 28);
         if(_loc8_ > 4)
         {
            _loc8_ = 4;
         }
         if(_loc9_ > 3)
         {
            _loc9_ = 3;
         }
         _loc7_ = _loc8_ + _loc9_ * 5 + 20;
         _loc7_ += 20 * (_root.ui.dlgInv.currentPage - 1);
         if(_root.game.map.player.inventoryList[_loc7_] != undefined || _root.game.map.player.money >= this.attrib.price)
         {
            this._x = this.px;
            this._y = this.py;
            return undefined;
         }
         if(_root.game.map.player.money < this.attrib.price)
         {
            _root.newMessage(_root.textSys[20][_root.lang]);
            return undefined;
         }
         this.buyItem(_loc8_,_loc9_);
         _loc5_ = true;
      }
      else
      {
         if(this.attrib.Type == "Potion" || this.attrib.Type == "Teleporter")
         {
            _loc3_ = 1;
            while(_loc3_ <= 3)
            {
               if(228 + 29 * (_loc3_ - 1) - 15 < this._x && this._x < 228 + 29 * (_loc3_ - 1) + 15)
               {
                  if(346 < this._y && this._y < 396)
                  {
                     if(this.storeItem)
                     {
                        if(_root.game.map.player.money < this.attrib.price)
                        {
                           _root.newMessage(_root.textSys[20][_root.lang]);
                           this._x = this.px;
                           this._y = this.py;
                           return undefined;
                        }
                        this.cleanStoreStatus();
                     }
                     this._x = this.px = 228 + 29 * (_loc3_ - 1);
                     this._y = this.py = 371;
                     if(_root.ui["item" + _loc3_ + "Mc"] && _root.ui["item" + _loc3_ + "Mc"] != this)
                     {
                        _loc12_ = _root.ui["item" + _loc3_ + "Mc"];
                        _loc12_._name = "item" + (- random(100) - 100);
                        _loc12_.pickUp();
                     }
                     this.id = _loc3_ - 1;
                     _root.game.map.player.inventoryList[this.id] = this.attrib;
                     this._name = "item" + _loc3_ + "Mc";
                     _loc5_ = true;
                     this.store = false;
                     _loc6_ = true;
                     break;
                  }
               }
               _loc3_ = _loc3_ + 1;
            }
         }
         else if(!(this.attrib.Type == "Crystal" || this.attrib.Type == "Book"))
         {
            if(this.attrib.setPosX - 15 < this._x && this._x < this.attrib.setPosX + 15)
            {
               if(this.attrib.setPosY - 25 < this._y && this._y < this.attrib.setPosY + 25)
               {
                  if(_root.game.map.player.level < this.attrib.levelRequire)
                  {
                     _root.newMessage("Higher level is required!");
                     if(this.storeItem)
                     {
                        this._x = this.px;
                        this._y = this.py;
                     }
                     else
                     {
                        this._x = this.px;
                        this._y = this.py;
                        if(this.store)
                        {
                           _root.game.map.player.inventoryList1[this.id] = this.attrib;
                        }
                        else
                        {
                           _root.game.map.player.inventoryList[this.id] = this.attrib;
                        }
                     }
                     _root.game.map.player.calcWeight();
                     return undefined;
                  }
                  if(this.storeItem)
                  {
                     if(this._parent["item" + this.attrib.setPosNum] && this._parent["item" + this.attrib.setPosNum] != this)
                     {
                        if(this.getEmptyNum() == "full")
                        {
                           this._x = this.px;
                           this._y = this.py;
                           return undefined;
                        }
                     }
                     if(_root.game.map.player.money < this.attrib.price)
                     {
                        _root.newMessage(_root.textSys[20][_root.lang]);
                        this._x = this.px;
                        this._y = this.py;
                        return undefined;
                     }
                     this.cleanStoreStatus();
                  }
                  this._x = this.px = this.attrib.setPosX;
                  this._y = this.py = this.attrib.setPosY;
                  if(this._parent["item" + this.attrib.setPosNum] && this._parent["item" + this.attrib.setPosNum] != this)
                  {
                     _loc12_ = this._parent["item" + this.attrib.setPosNum];
                     _loc12_._name = "item" + (- random(100) - 100);
                     _loc12_.pickUp();
                  }
                  if(this._parent["item" + this.attrib.setPosNum] != this)
                  {
                     if(this.store)
                     {
                        this.store = false;
                        _root.game.map.player.inventoryList1[this.id] = undefined;
                     }
                     else
                     {
                        _root.game.map.player.inventoryList[this.id] = undefined;
                     }
                     _root.game.map.player.inventoryList[this.attrib.setPosNum] = this.attrib;
                     this._name = "item" + this.attrib.setPosNum;
                     this.id = this.attrib.setPosNum;
                     this.attrib.setup();
                  }
                  _loc5_ = true;
               }
            }
         }
         if(257 < this._x && this._x < 442 && 175 < this._y && this._y < 320 && _root.ui.dlgInv._x)
         {
            _loc8_ = Math.floor((this._x - 273 + 16) / 30);
            _loc9_ = Math.floor((this._y - 191 + 15) / 28);
            if(_loc8_ > 4)
            {
               _loc8_ = 4;
            }
            if(_loc9_ > 3)
            {
               _loc9_ = 3;
            }
            if(this.storeItem)
            {
               if(_root.game.map.player.money < this.attrib.price)
               {
                  _root.newMessage(_root.textSys[20][_root.lang]);
                  this._x = this.px;
                  this._y = this.py;
                  return undefined;
               }
               _loc7_ = _loc8_ + _loc9_ * 5 + 20;
               _loc7_ += 20 * (_root.ui.dlgInv.currentPage - 1);
               if(_root.game.map.player.inventoryList[_loc7_] != undefined)
               {
                  _loc12_ = _root.ui["item" + _loc7_];
                  _loc12_._name = "item" + (- random(100) - 100);
                  _loc12_.pickUp();
               }
               this.buyItem(_loc8_,_loc9_);
               _loc5_ = true;
            }
            else
            {
               _loc7_ = _loc8_ + _loc9_ * 5 + 20;
               _loc7_ += 20 * (_root.ui.dlgInv.currentPage - 1);
               this.px = 273 + _loc8_ * 32;
               this.py = 191 + _loc9_ * 30;
               if(_root.game.map.player.inventoryList[_loc7_] != undefined)
               {
                  _loc12_ = _root.ui["item" + _loc7_];
                  _loc12_._name = "item" + (- random(100) - 100);
                  _loc12_.pickUp();
                  _loc6_ = true;
               }
               this.id = _loc7_;
               this._name = "item" + _loc7_;
               this.store = false;
               _root.game.map.player.inventoryList[_loc7_] = this.attrib;
               _loc5_ = true;
               this._x = this.px;
               this._y = this.py;
            }
         }
         else if(_root.ui.dlgSellStuff._x)
         {
            if(this.storeStartX < this._x && this._x < this.storeEndX && this.storeStartY < this._y && this._y < this.storeEndY)
            {
               if(this.storeItem)
               {
                  this._x = this.px;
                  this._y = this.py;
                  return undefined;
               }
               if(_root.game.map.player.chapter == 0 && _root.game.map.player.phase < 3)
               {
                  _root.newMessage(_root.textSys[21][_root.lang]);
                  this.findAPlace();
                  return undefined;
               }
               if(!this.questItem)
               {
                  this.attrib.abandoned = true;
                  _loc11_ = _root.ui.attachMovie("discardConfirm","discardConfirm",_root.ui.getNextHighestDepth());
                  _loc11_.txt.text = "Are you sure to sell this item?";
                  _loc11_.item = this;
                  _loc11_.itemPrice = Math.ceil(this.attrib.price / 5);
                  _loc11_.btnYes.onRelease = function()
                  {
                     if(!isNaN(this._parent.itemPrice))
                     {
                        _root.game.map.player.money += this._parent.itemPrice;
                     }
                     _root.ui.dlgInv.money.text = _root.game.map.player.money;
                     this.itemInfo.loader.removeMovieClip();
                     _root.playSound("卖东西得金钱.wav");
                     trace(this._parent.item._x + "::" + this._parent.item);
                     if(this._parent.item.id >= 10 && this._parent.item.id < 20)
                     {
                        this._parent.item.attrib.remove();
                     }
                     if(this._parent.item._x != undefined)
                     {
                        this._parent.item.destory();
                     }
                     else
                     {
                        for(var _loc3_ in _root.game.map.player.inventoryList)
                        {
                           trace(_root.game.map.player.inventoryList[_loc3_] + "::" + _root.game.map.player.inventoryList[_loc3_].abandoned);
                           if(_root.game.map.player.inventoryList[_loc3_].abandoned == true)
                           {
                              _root.game.map.player.inventoryList[_loc3_] = undefined;
                              break;
                           }
                        }
                     }
                     _root.game.map.player.calcWeight();
                     this._parent.removeMovieClip();
                  };
                  _loc11_.btnNo.onRelease = function()
                  {
                     _root.playSound1("对话框");
                     for(var _loc3_ in _root.game.map.player.inventoryList)
                     {
                        if(_root.game.map.player.inventoryList[_loc3_].abandoned == true)
                        {
                           _root.game.map.player.inventoryList[_loc3_].abandoned = false;
                        }
                     }
                     this._parent.removeMovieClip();
                  };
                  _loc6_ = true;
               }
               else
               {
                  _root.newMessage(_root.textSys[22][_root.lang]);
               }
            }
            else if(this.storeItem)
            {
               this._x = this.px;
               this._y = this.py;
               return undefined;
            }
         }
         else if(_root.ui.dlgStore._x)
         {
            if(this.storeStartX - 16 < this._x && this._x < this.storeEndX + 16 && this.storeStartY - 16 < this._y && this._y < this.storeEndY + 16)
            {
               _loc8_ = Math.floor((this._x - this.storeStartX) / 33);
               _loc9_ = Math.floor((this._y - this.storeStartY + 17) / 35);
               _loc8_ = _loc8_ >= 0 ? _loc8_ : 0;
               _loc9_ = _loc9_ >= 0 ? _loc9_ : 0;
               _loc7_ = _loc8_ + _loc9_ * 5;
               this.px = this.storeStartX + _loc8_ * 33;
               this.py = this.storeStartY + _loc9_ * 35;
               this._x = this.px;
               this._y = this.py;
               _loc5_ = true;
               this.store = true;
               if(_root.game.map.player.inventoryList1[_loc7_] != undefined)
               {
                  _loc12_ = _root.ui["itemS" + _loc7_];
                  _loc12_._name = "itemS" + (- random(100) - 100);
                  _loc12_.pickUp();
               }
               this.id = _loc7_;
               this._name = "itemS" + _loc7_;
               _root.game.map.player.inventoryList1[_loc7_] = this.attrib;
            }
         }
         else if(_root.ui.dlgCompose._x)
         {
            _loc4_ = _root.ui.dlgCompose.composePos;
            _loc10_ = 0;
            while(_loc10_ < 4)
            {
               if(!(_loc10_ != 3 && this.attrib.Type != "Crystal" && this.attrib.Type != "Potion"))
               {
                  if(!(_root.game.map.player.chapter == 0 && _root.game.map.player.phase == 13 && _loc10_ == 3 && this.attrib.Type != "Weapon"))
                  {
                     if(_loc4_[_loc10_][0] - 15 < this._x && this._x < _loc4_[_loc10_][0] + 15)
                     {
                        if(_loc4_[_loc10_][1] - 15 < this._y && this._y < _loc4_[_loc10_][1] + 15)
                        {
                           this._x = _loc4_[_loc10_][0];
                           this._y = _loc4_[_loc10_][1];
                           if(_root.ui["composeItem" + _loc10_]._x != undefined && _root.ui["composeItem" + _loc10_] != this)
                           {
                              _root.ui["composeItem" + _loc10_].pickUp();
                              _root.ui["composeItem" + _loc10_]._name = _root.ui["comItem" + random(1000)];
                           }
                           this._name = "composeItem" + _loc10_;
                           _loc5_ = true;
                           break;
                        }
                     }
                  }
               }
               _loc10_ = _loc10_ + 1;
            }
         }
         else if(50 < this._x && this._x < 250 && 0 < this._y && this._y < 275)
         {
            if(!this.questItem)
            {
               this.attrib.abandoned = true;
               _loc11_ = _root.ui.attachMovie("discardConfirm","discardConfirm",_root.ui.getNextHighestDepth());
               _loc11_.item = this;
               _loc11_.btnYes.onRelease = function()
               {
                  if(this._parent.item.id >= 10 && this._parent.item.id < 20)
                  {
                     this._parent.item.attrib.remove();
                  }
                  if(this._parent.item._x != undefined)
                  {
                     this._parent.item.destory();
                  }
                  else
                  {
                     for(var _loc3_ in _root.game.map.player.inventoryList)
                     {
                        if(_root.game.map.player.inventoryList[_loc3_].abandoned == true)
                        {
                           _root.game.map.player.inventoryList[_loc3_] = undefined;
                           break;
                        }
                     }
                  }
                  _root.game.map.player.calcWeight();
                  this._parent.removeMovieClip();
               };
               _loc11_.btnNo.onRelease = function()
               {
                  for(var _loc3_ in _root.game.map.player.inventoryList)
                  {
                     if(_root.game.map.player.inventoryList[_loc3_].abandoned == true)
                     {
                        _root.game.map.player.inventoryList[_loc3_].abandoned = undefined;
                        break;
                     }
                  }
                  this._parent.removeMovieClip();
               };
               _loc6_ = true;
            }
         }
      }
      _root.game.map.player.calcWeight();
      if(!_loc5_)
      {
         if(this.getEmptyNum() != "full")
         {
            this.findAPlace();
         }
      }
      return _loc6_;
   }
   function doubleClickAction()
   {
      var _loc4_;
      var _loc3_;
      if(_root.game.map.player.hp > 0)
      {
         if(this.storeItem)
         {
            if(_root.game.map.player.money < this.attrib.price)
            {
               _root.newMessage(_root.textSys[20][_root.lang]);
               return undefined;
            }
            this.buyItem();
            this.drag = false;
            this.stopDrag();
         }
         else
         {
            this.itemInfo.loader.removeMovieClip();
            if(this.attrib.Type == "Teleporter")
            {
               if(_root.game.map.areaName != "01" && _root.areaMode == 0)
               {
                  this.attrib.work();
                  this.destory();
               }
            }
            else if(this.attrib.Type == "Potion")
            {
               if(_root.areaMode == 0)
               {
                  if(this.attrib.work())
                  {
                     this.highlightOff();
                     this.destory();
                  }
               }
            }
            else if(this.attrib.Type == "Book")
            {
               if(_root.areaMode == 0)
               {
                  this.attrib.work();
                  this.destory();
               }
            }
            else if(this.attrib.Type != "Crystal")
            {
               if(this.id >= 10 && this.id < 20 && !this.store)
               {
                  if(this.getEmptyNum() != "full")
                  {
                     _root.game.map.player.inventoryList[this.id] = undefined;
                     this.attrib.remove();
                     this.findAPlace();
                  }
               }
               else
               {
                  this.drag = false;
                  this.stopDrag();
                  this.highlightOff();
                  if(_root.game.map.player.level < this.attrib.levelRequire)
                  {
                     _root.newMessage("Higher level is required!");
                     this._x = this.px;
                     this._y = this.py;
                     if(this.store)
                     {
                        _root.game.map.player.inventoryList1[this.id] = this.attrib;
                     }
                     else
                     {
                        _root.game.map.player.inventoryList[this.id] = this.attrib;
                     }
                     return undefined;
                  }
                  _loc4_ = false;
                  if(this._parent["item" + this.attrib.setPosNum] && this._parent["item" + this.attrib.setPosNum] != this)
                  {
                     _loc3_ = this._parent["item" + this.attrib.setPosNum];
                     _loc3_.attrib.remove();
                     _loc3_.id = this.id;
                     _loc3_._name = "item" + this.id;
                     _loc3_._x = _loc3_.px = this.px;
                     _loc3_._y = _loc3_.py = this.py;
                     _root.game.map.player.inventoryList[_loc3_.id] = _loc3_.attrib;
                     _loc4_ = true;
                  }
                  this.px = this.attrib.setPosX;
                  this.py = this.attrib.setPosY;
                  this._x = this.px;
                  this._y = this.py;
                  if(this._parent["item" + this.attrib.setPosNum] != this)
                  {
                     if(this.store)
                     {
                        this.store = false;
                        if(!_loc4_)
                        {
                           _root.game.map.player.inventoryList1[this.id] = undefined;
                        }
                     }
                     else if(!_loc4_)
                     {
                        _root.game.map.player.inventoryList[this.id] = undefined;
                     }
                     _root.game.map.player.inventoryList[this.attrib.setPosNum] = this.attrib;
                     this._name = "item" + this.attrib.setPosNum;
                     this.id = this.attrib.setPosNum;
                     this.attrib.setup();
                  }
               }
            }
         }
      }
      _root.game.map.player.calcWeight();
   }
}
