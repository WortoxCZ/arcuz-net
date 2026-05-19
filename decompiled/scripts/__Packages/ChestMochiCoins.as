class ChestMochiCoins extends MovieClip
{
   var att;
   var attrib;
   var count;
   var frame;
   var item;
   var keyD;
   var onEnterFrame;
   var oy;
   var phase;
   var ys;
   var rUnit = 10;
   var h = 25;
   var resist = 998;
   var hp = "obstacle";
   function ChestMochiCoins()
   {
      super();
      _root.game.firstTimeInMap(this);
      this.frame = "极品箱子";
      this.phase = 0;
      this.oy = this._y;
      this.att = 0;
      this.ys = 0;
      this.gotoAndStop(this.frame);
   }
   function init()
   {
      this.gotoAndStop(this.frame); //unpopped
      this.phase = 0;
      this.oy = this._y;
      this.att = -40;
      this._y += this.att;
      this.ys = -3;
   }
   function enterframe()
   {
   }
   function openMe()
   {
      _root.playSound("开箱子.mp3");
      this.gotoAndStop(this.frame + "开");
      this.getItemFromMochiCoinsSlot0();
      this.phase = 1;
   }
   function getItemFromMochiCoinsSlot0()
   {
      var _loc5_ = _root.mochiCoinsSaveData.newItems[0].split("-");
      trace("getItemFromMochiCoinsSlot0:前 " + _root.mochiCoinsSaveData.newItems[0] + " -- " + _root.mochiCoinsSaveData.newItems + "---" + _loc5_);
      var _loc4_ = 1;
      while(_loc4_ <= 13)
      {
         _loc5_[_loc4_] = !isNaN(_loc5_[_loc4_]) ? int(_loc5_[_loc4_]) : _loc5_[_loc4_];
         _loc4_ = _loc4_ + 1;
      }
      var _loc7_;
      var _loc11_;
      var _loc9_;
      var _loc12_;
      var _loc8_;
      var _loc6_;
      var _loc10_;
      var _loc3_;
      var _loc13_;
      if(_loc5_[0] == "Gold")
      {
         this.attrib = _loc5_[1];
         if(this.attrib > 20000)
         {
            this.item.gotoAndStop("gold2");
         }
         else
         {
            this.item.gotoAndStop("gold1");
         }
      }
      else if(_loc5_[0] == "Gamble")
      {
         _loc7_ = Math.ceil(_root.mochiCoinsSaveData.level / 5);
         _loc7_ = _loc7_ <= 10 ? _loc7_ : 10;
         _loc11_ = random(100);
         if(_loc11_ < 20)
         {
            _loc9_ = 5;
         }
         else if(_loc11_ < 40)
         {
            _loc9_ = 4;
         }
         else if(_loc11_ < 60)
         {
            _loc9_ = 3;
         }
         else if(_loc11_ < 80)
         {
            _loc9_ = 2;
         }
         else
         {
            _loc9_ = 1;
         }
         _loc12_ = random(100);
         if(_loc12_ < 40)
         {
            _loc8_ = 3;
         }
         else if(_loc12_ < 40)
         {
            _loc8_ = 2;
         }
         else
         {
            _loc8_ = 1;
         }
         _loc6_ = random(12);
         if(_loc6_ == 1 || _loc6_ == 2 || _loc6_ == 3 || _loc6_ == 0)
         {
            _loc10_ = 10;
         }
         else if(_loc6_ == 5 || _loc6_ == 6 || _loc6_ == 7 || _loc6_ == 4)
         {
            _loc10_ = 9;
         }
         else if(_loc6_ == 9 || _loc6_ == 10 || _loc6_ == 11 || _loc6_ == 8)
         {
            _loc10_ = 7;
         }
         _loc3_ = [0,0,0,0,0,0,0,0,0,0];
         _loc3_[random(_loc10_)] = random(3) + 1;
         _loc3_[random(_loc10_)] = random(3) + 1;
         _loc3_[random(_loc10_)] = random(3) + 1;
         if(random(100) < 50)
         {
            _loc3_[random(_loc10_)] = random(3) + 1;
         }
         if(random(100) < 50)
         {
            _loc3_[random(_loc10_)] = random(3) + 1;
         }
         if(random(100) < 50)
         {
            _loc3_[random(_loc10_)] = random(3) + 1;
         }
         if(random(100) < 50)
         {
            _loc3_[random(_loc10_)] = random(3) + 1;
         }
         if(_loc6_ == 0)
         {
            _loc13_ = new Weapon("b" + _loc7_,_loc9_,_loc8_,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9]);
         }
         else if(_loc6_ == 1)
         {
            _loc13_ = new Weapon("s" + _loc7_,_loc9_,_loc8_,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9]);
         }
         else if(_loc6_ == 2)
         {
            _loc13_ = new Weapon("a" + _loc7_,_loc9_,_loc8_,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9]);
         }
         else if(_loc6_ == 3)
         {
            _loc13_ = new Shield("shield" + _loc7_,_loc9_,_loc8_,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9]);
         }
         else if(_loc6_ == 4)
         {
            _loc13_ = new Wear("w" + _loc7_,_loc9_,_loc8_,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8]);
         }
         else if(_loc6_ == 5)
         {
            _loc13_ = new Helmet("hel" + _loc7_,_loc9_,_loc8_,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8]);
         }
         else if(_loc6_ == 6)
         {
            _loc13_ = new Glove("g" + _loc7_,_loc9_,_loc8_,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8]);
         }
         else if(_loc6_ == 7)
         {
            _loc13_ = new Boots("bt" + _loc7_,_loc9_,_loc8_,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8]);
         }
         else if(_loc6_ == 8)
         {
            _loc13_ = new Belt("blt" + _loc7_,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6]);
         }
         else if(_loc6_ == 9)
         {
            _loc7_ = _loc7_ <= 8 ? _loc7_ : 8;
            _loc13_ = new Bracelet("bl" + _loc7_,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6]);
         }
         else if(_loc6_ == 10)
         {
            _loc7_ = _loc7_ <= 8 ? _loc7_ : 8;
            _loc13_ = new Necklace("nl" + _loc7_,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6]);
         }
         else if(_loc6_ == 11)
         {
            _loc7_ = _loc7_ <= 8 ? _loc7_ : 8;
            _loc13_ = new Ring("r" + _loc7_,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6]);
         }
         this.attrib = _loc13_;
         this.item.gotoAndStop(this.attrib.attrib[0]);
      }
      else
      {
         this.attrib = new §[_loc5_[0]]§(_loc5_[1],_loc5_[2],_loc5_[3],_loc5_[4],_loc5_[5],_loc5_[6],_loc5_[7],_loc5_[8],_loc5_[9],_loc5_[10],_loc5_[11],_loc5_[12],_loc5_[13]);
         this.item.gotoAndStop(this.attrib.attrib[0]);
      }
      trace("getItemFromMochiCoinsSlot0:后 " + _root.mochiCoinsSaveData.newItems[0] + "---" + this.attrib + "---" + this.attrib.attrib[0]);
   }
   function getItem()
   {
      var _loc5_;
      var _loc6_;
      var _loc7_;
      var _loc3_;
      var _loc8_;
      var _loc9_;
      if(typeof this.attrib == "number")
      {
         _loc5_ = _root.game.map.getNextHighestDepth();
         _loc6_ = _root.game.map.attachMovie("coins","coins" + _loc5_,_loc5_,{_x:this._x,_y:this._y - 3});
         _loc6_.init2(this.attrib);
      }
      else
      {
         _loc7_ = _root.game.map.mapName + "_" + this._x + "_" + this._y;
         _root.game.deadList[Number(_root.game.map.areaName)].push(_loc7_);
         _loc3_ = 20;
         while(_loc3_ <= _root.game.map.player.inventoryList.length)
         {
            if(_root.game.map.player.inventoryList[_loc3_] == undefined)
            {
               break;
            }
            _loc3_ = _loc3_ + 1;
         }
         if(_root.usingMochiCoins)
         {
            _loc8_ = _root.mochiCoinsSaveData.totalPage * 20;
         }
         else
         {
            _loc9_ = SharedObject.getLocal("Arcuz");
            _loc8_ = _loc9_.data.totalPage * 20;
         }
         if(_loc3_ >= _loc8_ + 20)
         {
            _root.newMessage(_root.textSys[19][_root.lang]);
            return undefined;
         }
         _root.game.map.player.inventoryList[_loc3_] = this.attrib;
         _root.newMessage(_root.textSys[5][_root.lang] + this.attrib.itemName);
         for(var _loc4_ in _root.game.map.player.questList)
         {
            _root.game.map.player.questList[_loc4_].update(this.attrib.attrib[0]);
         }
      }
      _root.mochiCoinsSaveData.newItems.shift();
      if(_root.mochiCoinsSaveData.newItems.length > 0)
      {
         this.getItemFromMochiCoinsSlot0();
         _root.shotShine2(this.item,"white",6);
      }
      else
      {
         this.item.swapDepths(this.getNextHighestDepth());
         this.item.count = 16;
         _root.shotShine2(this.item,"white",15);
         this.item.onEnterFrame = function()
         {
            if(--this.count < 0)
            {
               this._y -= 0.5;
               this._alpha -= 5;
               this._yscale += 5;
               if(this._alpha < 0)
               {
                  this.removeMovieClip();
               }
            }
         };
         this._parent._parent.delUnit(this);
         this.enterframe = undefined;
         this.count = 40;
         this.onEnterFrame = function()
         {
            if(--this.count < 0)
            {
               this._alpha -= 5;
               if(this._alpha < 0)
               {
                  this.removeMovieClip();
               }
            }
         };
         _root.ui.pointAndHintCoins.removeMovieClip();
         this.phase = 2;
      }
      _root.game.map.player.calcWeight();
      _root.ui.dlgInv.fresh();
   }
   function action()
   {
      this.keyD = false;
      this.count = 30;
      this.enterframe = function()
      {
         if(this.att < 0)
         {
            this._y += this.ys;
            this.att += this.ys;
            this.ys += 0.5;
         }
         else
         {
            this.att = 0;
            this._y = this.oy;
         }
         if(this.count > 0)
         {
            this.count = this.count - 1;
         }
         else if(this._parent._parent.getDis(this._x,this._y,this._parent.player._x,this._parent.player._y) < 50)
         {
            if(Key.isDown(74))
            {
               if(!this.keyD)
               {
                  this.keyD = true;
                  if(this._parent.player.mc._y > -5)
                  {
                     if(this.phase == 0)
                     {
                        this.openMe();
                     }
                     else if(this.phase == 1)
                     {
                        this.getItem();
                     }
                  }
               }
            }
            else
            {
               this.keyD = false;
            }
         }
      };
   }
}
