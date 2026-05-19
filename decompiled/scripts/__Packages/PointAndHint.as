class PointAndHint extends MovieClip
{
   var arrowMc;
   var hint;
   var onEnterFrame;
   var tx;
   var ty;
   function PointAndHint()
   {
      super();
   }
   function init(targetX, targetY, txt)
   {
      this.tx = targetX;
      this.ty = targetY - 100;
      this.hint.text = txt;
      var _loc3_;
      if(_root.lang == 0 || _root.lang == 1 || _root.lang == 3 || _root.lang == 4)
      {
         _loc3_ = new TextFormat();
         _loc3_.size = 12;
         this.hint.setTextFormat(_loc3_);
      }
      var _loc9_ = 5;
      var _loc5_ = 45;
      var _loc8_ = 0;
      var _loc16_ = 0.8;
      var _loc12_ = 5;
      var _loc11_ = 5;
      var _loc14_ = 1;
      var _loc6_ = 3;
      var _loc10_ = false;
      var _loc15_ = false;
      var _loc13_ = false;
      var _loc7_ = new flash.filters.DropShadowFilter(_loc9_,_loc5_,_loc8_,_loc16_,_loc12_,_loc11_,_loc14_,_loc6_,_loc10_,_loc15_,_loc13_);
      var _loc4_ = new Array();
      _loc4_.push(_loc7_);
      this.filters = _loc4_;
      this.pointTo();
      this._alpha = 75;
   }
   function pointTo()
   {
      this.onEnterFrame = function()
      {
         this.arrowMc._rotation = _root.game.getRotation(this._x - _root.game.map._x - 50,this._y - _root.game.map._y,this.tx,this.ty + 100);
         this._x += (this.tx + _root.game.map._x + 50 - this._x) / 20;
         this._y += (this.ty + _root.game.map._y - this._y) / 20;
         var _loc3_ = this.getBounds(this);
         if(this._x + _loc3_.xMin < 50)
         {
            this._x = 50 - _loc3_.xMin;
         }
         else if(this._x + _loc3_.xMax > 450)
         {
            this._x = 450 - _loc3_.xMax;
         }
         if(this._y + _loc3_.yMin < 0)
         {
            this._y = - _loc3_.yMin;
         }
         else if(this._y + _loc3_.yMax > 358)
         {
            this._y = 358 - _loc3_.yMax;
         }
         this._x = int(this._x);
         this._y = int(this._y);
      };
   }
}
