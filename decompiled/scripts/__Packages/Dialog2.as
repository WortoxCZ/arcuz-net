class Dialog2 extends MovieClip
{
   var currIndex;
   var onEnterFrame;
   var str;
   var strings;
   function Dialog2()
   {
      super();
   }
   function init(arr)
   {
      this._x = 60;
      this._y = 10;
      this.init2(arr);
      this.openDlg();
   }
   function init2(arr)
   {
      this.strings = arr;
      this.currIndex = 0;
      this.showString();
   }
   function openDlg()
   {
      this._y = - this._height;
      _root.playSound1("对话框");
      this.onEnterFrame = function()
      {
         this._y += Math.round((11 - this._y) / 2);
         if(this._y >= 10)
         {
            this._y = 10;
            this.onEnterFrame = undefined;
            this.startListening();
         }
      };
   }
   function startListening()
   {
      this.onEnterFrame = function()
      {
         this.enterframe();
      };
   }
   function enterframe()
   {
   }
   function closeDlg()
   {
      _root.playSound1("对话框");
      this.onEnterFrame = function()
      {
         this._y += Math.round((- this._height - 10 - this._y) / 2);
         if(this._y <= - this._height)
         {
            this.removeMovieClip();
         }
      };
   }
   function nextText()
   {
      if(++this.currIndex < this.strings.length)
      {
         this.showString();
         return undefined;
      }
      return "end";
   }
   function showString($strings)
   {
      var _loc3_;
      var _loc4_;
      var _loc2_;
      var _loc5_;
      var _loc6_;
      if($strings != undefined)
      {
         this.str.text = $strings;
      }
      else
      {
         this.str.text = this.strings[this.currIndex];
         _loc3_ = 190;
         if(this.str.text.length > _loc3_)
         {
            _loc4_ = true;
            do
            {
               _loc2_ = this.strings[this.currIndex].charAt(_loc3_ - 1);
               if(_loc2_ == " " || _loc2_ == "?" || _loc2_ == "？" || _loc2_ == "。" || _loc2_ == "、" || _loc2_ == "." || _loc2_ == "!" || _loc2_ == "！")
               {
                  _loc4_ = false;
               }
               else
               {
                  _loc3_ = _loc3_ - 1;
               }
            }
            while(_loc4_);
            _loc5_ = this.str.text.substring(0,_loc3_);
            _loc6_ = this.str.text.substring(_loc3_,this.str.text.length);
            this.str.text = _loc5_;
            this.strings[this.currIndex] = _loc5_;
            this.strings.splice(this.currIndex + 1,0,_loc6_);
         }
      }
   }
}
