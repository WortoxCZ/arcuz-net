dx = 0;
dy = 256;
trace(1111);
var j = 41;
while(j < 100)
{
   if(_parent.getInstanceAtDepth(j) == undefined)
   {
      var tmp = _parent.attachMovie("tileWall","extraTile" + j,j,{_x:this._x,_y:this._y});
      tmp.gotoAndStop(60);
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
   j++;
}
