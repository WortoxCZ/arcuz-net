class Chest extends MovieClip
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
   function Chest()
   {
      super();
      _root.game.firstTimeInMap(this);
      this.frame = "普通箱子";
      this.phase = 0;
      this.oy = this._y;
      this.att = 0;
      this.ys = 0;
      this.gotoAndStop(this.frame); //unpopped
      this.attrib = this.getRandomPotion();
      var _loc4_ = Number(_root.game.map.areaName);
      for(var _loc5_ in _root.game.deadList[_loc4_])
      {
         if(_root.game.deadList[_loc4_][_loc5_] == _root.game.map.mapName + "_" + this._x + "_" + this._y)
         {
            this.attrib = undefined;
            break;
         }
      }
   }
   function getRandomPotion()
   {
      var _loc9_ = random(100);
      var _loc4_;
      var _loc6_;
      var _loc5_;
      var _loc3_;
      var _loc13_;
      var _loc2_;
      var _loc12_;
      var _loc10_;
      var _loc7_;
      var _loc8_;
      var _loc11_;
      if(_loc9_ < 9)
      {
         _loc4_ = Math.ceil(_root.game.map.player.level / 5);
         _loc4_ = _loc4_ <= 10 ? _loc4_ : 10;
         _loc6_ = 0;
         _loc5_ = 1;
         _loc3_ = random(12);
         if(_loc3_ == 1 || _loc3_ == 2 || _loc3_ == 3 || _loc3_ == 0)
         {
            _loc13_ = 10;
         }
         else if(_loc3_ == 5 || _loc3_ == 6 || _loc3_ == 7 || _loc3_ == 4)
         {
            _loc13_ = 9;
         }
         else if(_loc3_ == 9 || _loc3_ == 10 || _loc3_ == 11 || _loc3_ == 8)
         {
            _loc13_ = 7;
         }
         _loc2_ = [0,0,0,0,0,0,0,0,0,0];
         trace("掉落种类：" + _loc3_ + ":" + _loc4_ + ":" + _loc6_ + ":" + _loc5_ + ":" + _loc2_);
         if(_loc3_ == 0)
         {
            _loc12_ = new Weapon("b" + _loc4_,_loc6_,_loc5_,_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9]);
         }
         else if(_loc3_ == 1)
         {
            _loc12_ = new Weapon("s" + _loc4_,_loc6_,_loc5_,_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9]);
         }
         else if(_loc3_ == 2)
         {
            _loc12_ = new Weapon("a" + _loc4_,_loc6_,_loc5_,_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9]);
         }
         else if(_loc3_ == 3)
         {
            _loc12_ = new Shield("shield" + _loc4_,_loc6_,_loc5_,_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9]);
         }
         else if(_loc3_ == 4)
         {
            _loc12_ = new Wear("w" + _loc4_,_loc6_,_loc5_,_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8]);
         }
         else if(_loc3_ == 5)
         {
            _loc12_ = new Helmet("hel" + _loc4_,_loc6_,_loc5_,_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8]);
         }
         else if(_loc3_ == 6)
         {
            _loc12_ = new Glove("g" + _loc4_,_loc6_,_loc5_,_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8]);
         }
         else if(_loc3_ == 7)
         {
            _loc12_ = new Boots("bt" + _loc4_,_loc6_,_loc5_,_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8]);
         }
         else if(_loc3_ == 8)
         {
            _loc12_ = new Belt("blt" + _loc4_,_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6]);
         }
         else if(_loc3_ == 9)
         {
            _loc4_ = _loc4_ <= 8 ? _loc4_ : 8;
            _loc12_ = new Bracelet("bl" + _loc4_,_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6]);
         }
         else if(_loc3_ == 10)
         {
            _loc4_ = _loc4_ <= 8 ? _loc4_ : 8;
            _loc12_ = new Necklace("nl" + _loc4_,_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6]);
         }
         else if(_loc3_ == 11)
         {
            _loc4_ = _loc4_ <= 8 ? _loc4_ : 8;
            _loc12_ = new Ring("r" + _loc4_,_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6]);
         }
      }
      else if(_loc9_ < 18)
      {
         _loc10_ = random(100);
         if(_loc10_ < 2)
         {
            _loc7_ = 2;
         }
         else if(_loc10_ < 10)
         {
            _loc7_ = 1;
         }
         else
         {
            _loc7_ = 0;
         }
         _loc8_ = random(100);
         if(_loc8_ < 45)
         {
            _loc11_ = 1 + _loc7_;
         }
         else if(_loc8_ < 70)
         {
            _loc11_ = 4 + _loc7_;
         }
         else if(_loc8_ < 80)
         {
            _loc11_ = 7 + _loc7_;
         }
         else if(_loc8_ < 98)
         {
            _loc11_ = 13 + random(6);
         }
         else
         {
            _loc11_ = 10 + _loc7_;
         }
         _loc12_ = new Potion("potion" + _loc11_);
      }
      else if(_loc9_ < 20)
      {
         _loc12_ = new Teleporter();
      }
      else
      {
         _loc12_;
      }
      return _loc12_;
   }
   function init(type, stuff)
   {
      this.frame = type;
      this.gotoAndStop(this.frame); //unpopped
      var _loc3_;
      if(stuff == undefined)
      {
         this.attrib = this.getRandomPotion();
         _loc3_ = Number(_root.game.map.areaName);
         for(var _loc4_ in _root.game.deadList[_loc3_])
         {
            if(_root.game.deadList[_loc3_][_loc4_] == _root.game.map.mapName + "_" + this._x + "_" + this._y)
            {
               this.attrib = undefined;
               break;
            }
         }
      }
      else
      {
         this.attrib = stuff;
      }
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
      if(this.attrib == undefined)
      {
         this.item.gotoAndStop("nothing");
      }
      else
      {
         this.item.gotoAndStop(this.attrib.attrib[0]);
      }
      this.phase = 1;
   }
   function getItem()
   {
      var _loc5_;
      var _loc3_;
      var _loc6_;
      var _loc7_;
      if(this.attrib != undefined)
      {
         _loc5_ = _root.game.map.mapName + "_" + this._x + "_" + this._y;
         _root.game.deadList[Number(_root.game.map.areaName)].push(_loc5_);
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
            _loc6_ = _root.mochiCoinsSaveData.totalPage * 20;
         }
         else
         {
            _loc7_ = SharedObject.getLocal("Arcuz");
            _loc6_ = _loc7_.data.totalPage * 20;
         }
         if(_loc3_ >= _loc6_ + 20)
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
      }
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
      _root.game.map.player.calcWeight();
      this.phase = 2;
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
