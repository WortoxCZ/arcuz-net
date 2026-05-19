class Glove extends Armor
{
   var Type;
   var attrib;
   var itemName;
   var levelRequire;
   var param;
   var setPosNum;
   var setPosX;
   var setPosY;
   function Glove(frame1, l, g, p3, p4, p5, p6, p7, p8, p9, p10, p11)
   {
      super(frame1,l,g,p3,p4,p5,p6,p7,p8,p9,p10,p11);
      this.Type = this.param[0] = "Glove";
      this.setPosX = 291;
      this.setPosY = 56;
      this.setPosNum = 13;
      switch(frame1)
      {
         case "g1":
            this.itemName = _root.textGlove[0][_root.lang];
            break;
         case "g2":
            this.itemName = _root.textGlove[1][_root.lang];
            break;
         case "g3":
            this.itemName = _root.textGlove[2][_root.lang];
            break;
         case "g4":
            this.itemName = _root.textGlove[3][_root.lang];
            break;
         case "g5":
            this.itemName = _root.textGlove[4][_root.lang];
            break;
         case "g6":
            this.itemName = _root.textGlove[5][_root.lang];
            break;
         case "g7":
            this.itemName = _root.textGlove[6][_root.lang];
            break;
         case "g8":
            this.itemName = _root.textGlove[7][_root.lang];
            break;
         case "g9":
            this.itemName = _root.textGlove[8][_root.lang];
            break;
         case "g10":
            this.itemName = _root.textGlove[9][_root.lang];
      }
      this.setDefence(frame1,l,g);
   }
   function setDefence(武器帧, 武器等级, 武器品质)
   {
      var _loc4_ = 武器帧 + "-";
      var _loc3_ = _loc4_.slice(1,-1);
      this.levelRequire = (Number(_loc3_) - 1) * 5 + 1;
      var _loc2_ = 2 + (Number(_loc3_) - 1) * 3;
      _loc2_ += 武器等级 * 3;
      _loc2_ += (武器品质 - 1) * 4;
      this.attrib[1] = _loc2_;
      this.attrib[2] = Number(_loc3_) * 2;
   }
}
