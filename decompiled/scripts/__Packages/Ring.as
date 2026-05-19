class Ring extends Accessory
{
   var Type;
   var itemName;
   var param;
   var setPosNum;
   var setPosX;
   var setPosY;
   var times;
   function Ring(frame1, p2, p3, p4, p5, p6, p7, p8)
   {
      super(frame1,p2,p3,p4,p5,p6,p7,p8);
      this.Type = this.param[0] = "Ring";
      this.setPosX = 291;
      this.setPosY = 90;
      this.setPosNum = 16;
      switch(frame1)
      {
         case "r1":
            this.times = 3;
            this.itemName = _root.textRing[0][_root.lang];
            break;
         case "r2":
            this.times = 3;
            this.itemName = _root.textRing[1][_root.lang];
            break;
         case "r3":
            this.times = 3;
            this.itemName = _root.textRing[2][_root.lang];
            break;
         case "r4":
            this.times = 5;
            this.itemName = _root.textRing[3][_root.lang];
            break;
         case "r5":
            this.times = 5;
            this.itemName = _root.textRing[4][_root.lang];
            break;
         case "r6":
            this.times = 5;
            this.itemName = _root.textRing[5][_root.lang];
            break;
         case "r7":
            this.times = 7;
            this.itemName = _root.textRing[6][_root.lang];
            break;
         case "r8":
            this.times = 7;
            this.itemName = _root.textRing[7][_root.lang];
         default:
            return;
      }
   }
}
