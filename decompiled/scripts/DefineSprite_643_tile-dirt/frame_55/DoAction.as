dx = 0;
dy = 256;
var i = 41;
while(i < 100)
{
   if(_parent.getInstanceAtDepth(i) == undefined)
   {
      var tmp = _parent.attachMovie("tileWall","extraTile" + i,i,{_x:this._x,_y:this._y});
      tmp.gotoAndStop(50);
      tmp.hit.gotoAndStop(tmp._totalframes);
      tmp.tile = this;
      tmp.onEnterFrame = function()
      {
         if(this.tile._x != this._x || this.tile._y != this._y)
         {
            this.removeMovieClip();
         }
      };
      break;
   }
   i++;
}
