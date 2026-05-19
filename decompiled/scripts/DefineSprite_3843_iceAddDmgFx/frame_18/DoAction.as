this.onEnterFrame = function()
{
   this._alpha -= 5;
   if(this._alpha < 0)
   {
      this.removeMovieClip();
   }
};
stop();
