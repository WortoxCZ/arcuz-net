class HitCombo extends MovieClip
{
   var count;
   var hit;
   var onEnterFrame;
   var scl;
   var txt;
   function HitCombo()
   {
      super();
      this.scl = 100;
      this._x = 0;
      this._y = 10;
      this.hit = 0;
   }
   function showHits()
   {
      this.hit = this.hit + 1;
      this.txt.text = this.hit + " hit";
      this.count = 0;
      this._alpha = 100;
      this.txt.textColor = 16777215;
      if(_root.areaMode == 0)
      {
         if(_root.game.map.player.ach[0][0] == 0)
         {
            if(this.hit >= 50)
            {
               _root.game.map.player.ach[0][0] = 1;
               _root.newMessage("New Archievement Unlocked!");
            }
         }
         else if(_root.game.map.player.ach[1][0] == 0)
         {
            if(this.hit >= 100)
            {
               _root.game.map.player.ach[1][0] = 1;
               _root.newMessage("New Archievement Unlocked!");
            }
         }
         else if(_root.game.map.player.ach[2][0] == 0)
         {
            if(this.hit >= 999)
            {
               _root.game.map.player.ach[2][0] = 1;
               _root.newMessage("New Archievement Unlocked!");
            }
         }
      }
      this.onEnterFrame = function()
      {
         if(++this.count < 2)
         {
            this.scl = 110;
         }
         else if(this.count < 5)
         {
            this.scl = 150;
         }
         else if(this.count < 7)
         {
            this.scl = 140;
         }
         else if(this.count < 45)
         {
            this.scl = 100;
         }
         else if(this.count > 100)
         {
            this._alpha -= 2;
            if(this._alpha <= 0)
            {
               this.comboScore();
               this.removeMovieClip();
            }
         }
         this._xscale = this._yscale = this.scl;
      };
   }
   function comboScore()
   {
      var _loc3_;
      if(_root.areaMode != 0)
      {
         _loc3_ = this.hit * this.hit * 10;
         _root.game.map.controller.score += _loc3_;
         _root.game.map.controller.cbs += _loc3_;
         _root.ui.areaScore.text = "Score : " + _root.game.map.controller.score;
         _root.newMessage("Combo Score +" + _loc3_,35);
      }
   }
   function endCombo()
   {
      this.comboScore();
      this.hit = 0;
      this.count = 0;
      this._alpha = 100;
      this.txt.textColor = 16711680;
      this.onEnterFrame = function()
      {
         if(++this.count < 2)
         {
            this.scl = 110;
         }
         else if(this.count < 5)
         {
            this.scl = 150;
         }
         else if(this.count < 7)
         {
            this.scl = 140;
         }
         else if(this.count < 45)
         {
            this.scl = 100;
         }
         else if(this.count > 50)
         {
            this._alpha -= 2;
            if(this._alpha <= 0)
            {
               this.removeMovieClip();
            }
         }
      };
   }
}
