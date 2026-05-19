class FloatingEnemy extends Enemy
{
   var _parent;
   var _x;
   var _y;
   var gotoFrame;
   function FloatingEnemy()
   {
      super();
   }
   function facePlayer()
   {
      this.gotoFrame(this.translateDegreeToFrame(this._parent._parent.getRotation(this._x,this._y,this._parent.player.x,this._parent.player.y)));
   }
   function die()
   {
      super.die();
   }
}
