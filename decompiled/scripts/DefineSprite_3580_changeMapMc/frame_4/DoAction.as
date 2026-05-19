stop();
count = 0;
onEnterFrame = function()
{
   if(++this.count > 50)
   {
      this.removeMovieClip();
   }
};
