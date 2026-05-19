class BtnInfo
{
   var _height;
   var _width;
   var _x;
   var _y;
   var loader;
   function BtnInfo(txt)
   {
      if(_root.btnInfo._x == undefined)
      {
         this.loader = _root.createEmptyMovieClip("btnInfo",_root.getNextHighestDepth());
         this.loader.createTextField("txt0",this.loader.getNextHighestDepth(),0,0,12,12);
         this.loader.txt0.autoSize = true;
         this.loader.txt0.text = txt;
         this.loader.txt0.sqColor = 3145728;
         this.loader.txt0.textColor = 16777215;
         this.loader.txt0.selectable = false;
         this.drawSquare(this.loader.txt0.sqColor,this.loader.txt0._width,0);
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
