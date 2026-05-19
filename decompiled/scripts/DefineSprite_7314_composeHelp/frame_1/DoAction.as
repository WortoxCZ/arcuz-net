this.setBtn = function()
{
   this.btnClose.onRelease = function()
   {
      _root.playSound1("对话框");
      this._parent.removeMovieClip();
   };
   this.p1.onRelease = function()
   {
      _root.playSound1("对话框");
      this._parent.gotoAndStop(1);
   };
   this.p2.onRelease = function()
   {
      _root.playSound1("对话框");
      this._parent.gotoAndStop(2);
   };
   this.p3.onRelease = function()
   {
      _root.playSound1("对话框");
      this._parent.gotoAndStop(3);
   };
   this.p4.onRelease = function()
   {
      _root.playSound1("对话框");
      this._parent.gotoAndStop(4);
   };
   this.p5.onRelease = function()
   {
      _root.playSound1("对话框");
      this._parent.gotoAndStop(5);
   };
   this.p6.onRelease = function()
   {
      _root.playSound1("对话框");
      this._parent.gotoAndStop(6);
   };
};
this.setBtn();
stop();
