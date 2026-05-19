class Boots extends Armor
{
   var Type;
   var attrib;
   var itemName;
   var levelRequire;
   var param;
   var setPosNum;
   var setPosX;
   var setPosY;
   function Boots(frame1, l, g, p3, p4, p5, p6, p7, p8, p9, p10, p11)
   {
      super(frame1,l,g,p3,p4,p5,p6,p7,p8,p9,p10,p11);
      this.Type = this.param[0] = "Boots";
      this.setPosX = 338;
      this.setPosY = 124;
      this.setPosNum = 19;
      switch(frame1)
      {
         case "bt1":
            this.itemName = _root.textBoots[0][_root.lang];
            break;
         case "bt2":
            this.itemName = _root.textBoots[1][_root.lang];
            break;
         case "bt3":
            this.itemName = _root.textBoots[2][_root.lang];
            break;
         case "bt4":
            this.itemName = _root.textBoots[3][_root.lang];
            break;
         case "bt5":
            this.itemName = _root.textBoots[4][_root.lang];
            break;
         case "bt6":
            this.itemName = _root.textBoots[5][_root.lang];
            break;
         case "bt7":
            this.itemName = _root.textBoots[6][_root.lang];
            break;
         case "bt8":
            this.itemName = _root.textBoots[7][_root.lang];
            break;
         case "bt9":
            this.itemName = _root.textBoots[8][_root.lang];
            break;
         case "bt10":
            this.itemName = _root.textBoots[9][_root.lang];
         default:
            return;
      }
   }
   function setDefence(武器帧, 武器等级, 武器品质)
   {
      var _loc4_ = 武器帧 + "-";
      var _loc3_ = _loc4_.slice(2,-1);
      this.levelRequire = (Number(_loc3_) - 1) * 5 + 1;
      var _loc2_ = 2 + (Number(_loc3_) - 1) * 5;
      _loc2_ += 武器等级 * 3;
      _loc2_ += 武器品质 * 5;
      this.attrib[1] = _loc2_;
      this.attrib[2] = Number(_loc3_) * 3 + 2;
   }
}
