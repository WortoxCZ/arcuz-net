class MouseCursor extends MovieClip
{
   var attackMode;
   var counter;
   var dc;
   var down;
   var oldTime;
   var onEnterFrame;
   var onMouseDown;
   var onMouseUp;
   var prevX;
   var prevY;
   function MouseCursor(Void)
   {
      super();
      Mouse.hide();
      this.oldTime = 0;
      this.down = false;
      this.onEnterFrame = function()
      {
         this.moveMe();
      };
      this.onMouseDown = function()
      {
         Mouse.hide();
         this.down = true;
         this.ifDoubleClick();
      };
      this.onMouseUp = function()
      {
         this.down = false;
      };
   }
   function ifDoubleClick()
   {
      if(getTimer() - this.oldTime < 300)
      {
         this.dc = true;
      }
      this.oldTime = getTimer();
   }
   function get doubleClick()
   {
      return this.dc;
   }
   function set doubleClick(what)
   {
      this.dc = what;
   }
   function get atkMode()
   {
      return this.attackMode;
   }
   function set atkMode(mode)
   {
      this.attackMode = mode;
   }
   function moveMe()
   {
      this._x = _root._xmouse;
      this._y = _root._ymouse;
   }
   function endCheck()
   {
      this.attackMode = undefined;
      this.onEnterFrame = function()
      {
         this.moveMe();
      };
   }
   function cleanPos()
   {
      this.prevX = _root._xmouse;
      this.prevY = _root._ymouse;
   }
   function startCheck()
   {
      this.cleanPos();
      this.onEnterFrame = function()
      {
         var _loc3_ = Math.abs(this._x - this.prevX);
         var _loc2_ = Math.abs(this._y - this.prevY);
         if(_loc3_ > _loc2_)
         {
            if(_loc3_ > 50)
            {
               this.cleanPos();
               if(this._x - this.prevX > 0)
               {
                  this.attackMode = 3;
               }
               else
               {
                  this.attackMode = 1;
               }
            }
         }
         else if(_loc2_ > 50)
         {
            this.cleanPos();
            if(this._y - this.prevY > 0)
            {
               this.attackMode = 2;
            }
            else
            {
               this.attackMode = 4;
            }
         }
         if(++this.counter > 10)
         {
            this.counter = 0;
            this.cleanPos();
            this.attackMode = undefined;
         }
         this.moveMe();
      };
   }
}
