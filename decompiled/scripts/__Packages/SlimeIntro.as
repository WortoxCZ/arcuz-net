class SlimeIntro extends MovieClip
{
   var moveCount;
   var mtype;
   var onEnterFrame;
   var onPress;
   var realSpeed;
   var speed;
   function SlimeIntro()
   {
      super();
   }
   function init()
   {
      var _loc4_ = random(2) * 2 - 1;
      this._xscale = 100 * _loc4_;
      this._x = 250 - _loc4_ * 260;
      var _loc3_ = 310 + random(55);
      while(_root.getInstanceAtDepth(10100 + _loc3_) != undefined)
      {
         _loc3_ = 310 + random(55);
      }
      this._y = _loc3_;
      this.swapDepths(10100 + _loc3_);
      trace(this._y + ":" + this.getDepth());
      this.speed = this.realSpeed = _loc4_ * (random(10) + 2);
      this.moveCount = 15;
      this.mtype = "slimeintro";
      this.walk();
      this.onPress = function()
      {
         this.die();
      };
   }
   function playSound1(what)
   {
      if(_root[what] == undefined)
      {
         _root[what] = new Sound(_root);
         _root[what].attachSound(what);
      }
      _root[what].start();
   }
   function die()
   {
      this.gotoAndStop("die"); //unpopped
      this.onEnterFrame = undefined;
      _root.slimeKilled = _root.slimeKilled + 1;
      delete this.onPress;
   }
   function walk()
   {
      this.gotoAndStop("walk");
      this.onEnterFrame = function()
      {
         this.realSpeed *= 0.95;
         if(++this.moveCount > 30)
         {
            this.moveCount = 0;
            this.realSpeed = this.speed;
         }
         this._x += this.realSpeed;
         if(this._x > 550 || this._x < -50)
         {
            _root.slimeRun = _root.slimeRun + 1;
            this.removeMovieClip();
         }
      };
   }
}
