class Belt extends Accessory
{
   var Type;
   var itemName;
   var param;
   var setPosNum;
   var setPosX;
   var setPosY;
   var times;
   function Belt(frame1, p2, p3, p4, p5, p6, p7, p8)
   {
      super(frame1,p2,p3,p4,p5,p6,p7,p8);
      this.Type = this.param[0] = "Belt";
      this.setPosX = 338;
      this.setPosY = 90;
      this.setPosNum = 17;
      switch(frame1)
      {
         case "blt1":
            this.times = 3;
            this.itemName = _root.textBelt[0][_root.lang];
            break;
         case "blt2":
            this.times = 3;
            this.itemName = _root.textBelt[1][_root.lang];
            break;
         case "blt3":
            this.times = 3;
            this.itemName = _root.textBelt[2][_root.lang];
            break;
         case "blt4":
            this.times = 5;
            this.itemName = _root.textBelt[3][_root.lang];
            break;
         case "blt5":
            this.times = 5;
            this.itemName = _root.textBelt[4][_root.lang];
            break;
         case "blt6":
            this.times = 5;
            this.itemName = _root.textBelt[5][_root.lang];
            break;
         case "blt7":
            this.times = 7;
            this.itemName = _root.textBelt[6][_root.lang];
            break;
         case "blt8":
            this.times = 7;
            this.itemName = _root.textBelt[7][_root.lang];
            break;
         case "blt9":
            this.times = 7;
            this.itemName = _root.textBelt[8][_root.lang];
            break;
         case "blt10":
            this.times = 9;
            this.itemName = _root.textBelt[9][_root.lang];
         default:
            return;
      }
   }
}
