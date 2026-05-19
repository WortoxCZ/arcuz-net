class Shadows extends MovieClip
{
   var controlMc;
   var counter;
   var parent;
   var path;
   var who;
   function Shadows(mc)
   {
      var _loc4_;
      if(mc._name.slice(0,8) != "instance")
      {
         super();
         this.who = mc;
         this.path = this.who._parent;
         this.counter = 0;
         _loc4_ = _root.getNextHighestDepth();
         this.controlMc = _root.createEmptyMovieClip("shadowCtr" + _loc4_,_loc4_);
         this.controlMc.counter = this.counter;
         this.controlMc.parent = this;
         this.controlMc.onEnterFrame = function()
         {
            if(++this.counter == 3)
            {
               this.counter = 0;
               this.parent.newShadow(this.parent.who,this.parent.path);
               if(this.parent.who._x == undefined)
               {
                  this.parent.delShadow();
               }
            }
         };
      }
   }
   function newShadow(mc, path)
   {
      var _loc7_ = path.getNextHighestDepth();
      var _loc3_ = path.createEmptyMovieClip("shadows" + _loc7_,_loc7_);
      _loc3_.createEmptyMovieClip("loader",0);
      var _loc6_ = new flash.geom.Matrix();
      var _loc5_ = mc.getBounds(mc);
      _loc6_.translate(- _loc5_.xMin,- _loc5_.yMin);
      var _loc8_ = new flash.display.BitmapData(mc._width,mc._height,true,0);
      _loc8_.draw(mc,_loc6_);
      _loc3_.loader.attachBitmap(_loc8_,0);
      _loc3_.loader._x = _loc5_.xMin;
      _loc3_.loader._y = _loc5_.yMin;
      _loc3_.transform.matrix = mc.transform.matrix;
      _loc3_.counter = 0;
      _loc3_._alpha = 60;
      _loc3_.blendMode = mc.blendMode;
      _root.game.layerArr.push(_loc3_);
      _loc3_.onEnterFrame = function()
      {
         this.counter = this.counter + 1;
         this._alpha = 100 - this.counter * 20;
         if(this._alpha <= 0)
         {
            this.removeMovieClip();
         }
      };
   }
   function delShadow()
   {
      this.controlMc.removeMovieClip();
      this.removeMovieClip();
   }
}
