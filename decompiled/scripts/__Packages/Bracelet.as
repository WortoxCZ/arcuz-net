class Bracelet extends Accessory
{
   var Type;
   var itemName;
   var param;
   var setPosNum;
   var setPosX;
   var setPosY;
   var times;
   function Bracelet(frame1, p2, p3, p4, p5, p6, p7, p8)
   {
      super(frame1,p2,p3,p4,p5,p6,p7,p8);
      this.Type = this.param[0] = "Bracelet";
      this.setPosX = 386;
      this.setPosY = 90;
      this.setPosNum = 18;
      switch(frame1)
      {
         case "bl1":
            this.times = 3;
            this.itemName = _root.textBclet[0][_root.lang];
            break;
         case "bl2":
            this.times = 3;
            this.itemName = _root.textBclet[1][_root.lang];
            break;
         case "bl3":
            this.times = 3;
            this.itemName = _root.textBclet[2][_root.lang];
            break;
         case "bl4":
            this.times = 5;
            this.itemName = _root.textBclet[3][_root.lang];
            break;
         case "bl5":
            this.times = 5;
            this.itemName = _root.textBclet[4][_root.lang];
            break;
         case "bl6":
            this.times = 5;
            this.itemName = _root.textBclet[5][_root.lang];
            break;
         case "bl7":
            this.times = 7;
            this.itemName = _root.textBclet[6][_root.lang];
            break;
         case "bl8":
            this.times = 7;
            this.itemName = _root.textBclet[7][_root.lang];
         default:
            return;
      }
   }
}
