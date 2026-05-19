class ItemInfo
{
   var _height;
   var _width;
   var _x;
   var _y;
   var loader;
   function ItemInfo(item, buyOrSell)
   {
      var _loc0_;
      var _loc6_;
      var _loc3_;
      var _loc5_;
      if(_root.itemInfo._x == undefined)
      {
         item.attrib.setString();
         this.loader = _root.createEmptyMovieClip("itemInfo",_root.getNextHighestDepth());
         this.loader.createTextField("txt0",this.loader.getNextHighestDepth(),0,0,12,12);
         this.loader.txt0.autoSize = true;
         if(item.attrib.level > 0)
         {
            this.loader.txt0.text = "+" + item.attrib.level + " " + item.attrib.itemName;
         }
         else
         {
            this.loader.txt0.text = item.attrib.itemName;
         }
         switch(item.attrib.grade)
         {
            case 1:
               this.loader.txt0.sqColor = 3145728;
               break;
            case 2:
               this.loader.txt0.sqColor = 3368703;
               break;
            case 3:
               this.loader.txt0.sqColor = 16750899;
               break;
            default:
               this.loader.txt0.sqColor = 3145728;
         }
         this.loader.createTextField("txt1",this.loader.getNextHighestDepth(),0,this.loader.txt0._height,12,12);
         this.loader.txt1.autoSize = true;
         if(buyOrSell == "buy")
         {
            this.loader.txt1.text = "Price: " + item.attrib.price;
            if(item.attrib.price > _root.game.map.player.money)
            {
               this.loader.txt1.sqColor = 16711680;
            }
            else
            {
               this.loader.txt1.sqColor = 6749952;
            }
         }
         else
         {
            this.loader.txt1.text = "Sell price: " + Math.ceil(item.attrib.price / 5);
            this.loader.txt1.sqColor = 3145728;
         }
         var _temp_2 = this.loader.txt0;
         var _temp_1 = "textColor";
         this.loader.txt1.textColor = _loc0_ = 16777215;
         _temp_2[_temp_1] = _loc0_;
         var _temp_4 = this.loader.txt0;
         var _temp_3 = "selectable";
         this.loader.txt1.selectable = _loc0_ = false;
         _temp_4[_temp_3] = _loc0_;
         _loc6_ = this.loader.txt0._width;
         _loc3_ = 2;
         _loc5_ = 1;
         while(_loc5_ < item.attrib.attrib.length)
         {
            if(item.attrib.attrib[_loc5_] != 0 || item.attrib.Type == "Shield" && _loc5_ == 12)
            {
               this.loader.createTextField("txt" + _loc3_,this.loader.getNextHighestDepth(),0,0,12,12);
               this.loader["txt" + _loc3_]._y = this.loader["txt" + (_loc3_ - 1)]._y + this.loader["txt" + (_loc3_ - 1)]._height;
               this.loader["txt" + _loc3_].autoSize = true;
               this.loader["txt" + _loc3_].text = item.attrib.attribName[_loc5_];
               if(item.attrib.Type == "Book" || item.attrib.Type == "Teleporter" || item.attrib.Type == "QuestItem")
               {
                  this.loader["txt" + _loc3_].autoSize = false;
                  this.loader["txt" + _loc3_].wordWrap = true;
                  this.loader["txt" + _loc3_]._width = 200;
               }
               this.loader["txt" + _loc3_].textColor = 16777215;
               this.loader["txt" + _loc3_].sqColor = 3145728;
               this.loader["txt" + _loc3_].selectable = false;
               if(this.loader["txt" + _loc3_]._width > _loc6_)
               {
                  _loc6_ = this.loader["txt" + _loc3_]._width;
               }
               _loc3_ = _loc3_ + 1;
            }
            _loc5_ = _loc5_ + 1;
         }
         if(item.attrib.times != undefined)
         {
            this.loader.createTextField("txt" + _loc3_,this.loader.getNextHighestDepth(),0,0,12,12);
            this.loader["txt" + _loc3_]._y = this.loader["txt" + (_loc3_ - 1)]._y + this.loader["txt" + (_loc3_ - 1)]._height;
            this.loader["txt" + _loc3_].autoSize = true;
            this.loader["txt" + _loc3_].textColor = 16777215;
            this.loader["txt" + _loc3_].sqColor = 3145728;
            this.loader["txt" + _loc3_].selectable = false;
            this.loader["txt" + _loc3_].text = "Compose :" + item.attrib.times;
            if(this.loader["txt" + _loc3_]._width > _loc6_)
            {
               _loc6_ = this.loader["txt" + _loc3_]._width;
            }
            _loc3_ = _loc3_ + 1;
         }
         if(item.attrib.levelRequire != undefined)
         {
            this.loader.createTextField("txt" + _loc3_,this.loader.getNextHighestDepth(),0,0,12,12);
            this.loader["txt" + _loc3_]._y = this.loader["txt" + (_loc3_ - 1)]._y + this.loader["txt" + (_loc3_ - 1)]._height;
            this.loader["txt" + _loc3_].autoSize = true;
            this.loader["txt" + _loc3_].textColor = 16777215;
            if(item.attrib.levelRequire <= _root.game.map.player.level)
            {
               this.loader["txt" + _loc3_].sqColor = 6749952;
            }
            else
            {
               this.loader["txt" + _loc3_].sqColor = 16711680;
            }
            this.loader["txt" + _loc3_].selectable = false;
            this.loader["txt" + _loc3_].text = "Requires Level :" + item.attrib.levelRequire;
            if(this.loader["txt" + _loc3_]._width > _loc6_)
            {
               _loc6_ = this.loader["txt" + _loc3_]._width;
            }
            _loc3_ = _loc3_ + 1;
         }
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            this.loader["txt" + _loc5_]._width = _loc6_;
            this.loader["txt" + _loc5_].autoSize = "center";
            this.drawSquare(this.loader["txt" + _loc5_].sqColor,_loc6_,_loc5_);
            _loc5_ = _loc5_ + 1;
         }
         this.loader.onEnterFrame = function()
         {
            this._x = _root._xmouse;
            this._y = _root._ymouse;
            if(this._x + this._width > 500)
            {
               this._x = 500 - this._width;
            }
            if(this._y + this._height > 450)
            {
               this._y = 450 - this._height;
            }
         };
         this.loader._x = _root._xmouse;
         this.loader._y = _root._ymouse;
      }
   }
   function drawSquare(color, w, num)
   {
      var _loc2_ = this.loader.createEmptyMovieClip("square_mc" + num,this.loader.getNextHighestDepth());
      _loc2_.beginFill(color);
      _loc2_.moveTo(0,0);
      _loc2_.lineTo(w,0);
      _loc2_.lineTo(w,this.loader["txt" + num]._height);
      _loc2_.lineTo(0,this.loader["txt" + num]._height);
      _loc2_.lineTo(0,0);
      _loc2_.endFill();
      _loc2_._alpha = 60;
      _loc2_._y = this.loader["txt" + num]._y;
      _loc2_.swapDepths(this.loader["txt" + num].getDepth());
   }
}
