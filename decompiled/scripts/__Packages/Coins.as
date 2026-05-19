class Coins extends MovieClip
{
   var amount;
   var count;
   var num;
   var onEnterFrame;
   function Coins()
   {
      super();
   }
   function init(p)
   {
      this.amount = p;
      this.amount > 100 ? this.gotoAndStop(2) : this.gotoAndStop(1); //unpopped
      _root.playSound1("卖东西得金钱.wav");
      this.action();
   }
   function init2(p)
   {
      this.amount = p;
      this.getCoins2();
   }
   function getCoins2()
   {
      _root.playSound1("卖东西得金钱.wav");
      this._parent.player.money += this.amount;
      this.gotoAndStop(3); //unpopped
      this._y -= 15;
      this.num.text = this.amount;
      this.count = 35;
      this.onEnterFrame = function()
      {
         this._y -= 0.5;
         if(--this.count < 0)
         {
            this.removeMovieClip();
         }
      };
   }
   function getCoins()
   {
      _root.playSound1("卖东西得金钱.wav");
      this._parent.player.money += this.amount;
      this.count = 7;
      _root.shotShine2(this,"white",7);
      this.onEnterFrame = function()
      {
         if(--this.count < 0)
         {
            this.gotoAndStop(3); //unpopped
            this.count = 30;
            this._y -= 15;
            this.num.text = this.amount;
            this.onEnterFrame = function()
            {
               this._y -= 0.5;
               if(--this.count < 0)
               {
                  this.removeMovieClip();
               }
            };
         }
      };
   }
   function action()
   {
      this.count = 30;
      this.onEnterFrame = function()
      {
         if(this.count > 0)
         {
            this.count = this.count - 1;
         }
         else if(this._parent._parent.getDis(this._x,this._y,this._parent.player._x,this._parent.player._y) < 50)
         {
            this.getCoins();
         }
      };
   }
}
