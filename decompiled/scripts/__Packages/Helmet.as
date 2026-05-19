class Helmet extends Armor
{
   var Type;
   var attrib;
   var itemName;
   var levelRequire;
   var param;
   var setPosNum;
   var setPosX;
   var setPosY;
   function Helmet(frame1, l, g, p3, p4, p5, p6, p7, p8, p9, p10, p11)
   {
      super(frame1,l,g,p3,p4,p5,p6,p7,p8,p9,p10,p11);
      this.Type = this.param[0] = "Helmet";
      this.setPosX = 338;
      this.setPosY = 22;
      this.setPosNum = 11;
      this.itemName = frame1;
      switch(frame1)
      {
         case "hel1":
            this.itemName = _root.textHelmet[0][_root.lang];
            break;
         case "hel2":
            this.itemName = _root.textHelmet[1][_root.lang];
            break;
         case "hel3":
            this.itemName = _root.textHelmet[2][_root.lang];
            break;
         case "hel4":
            this.itemName = _root.textHelmet[3][_root.lang];
            break;
         case "hel5":
            this.itemName = _root.textHelmet[4][_root.lang];
            break;
         case "hel6":
            this.itemName = _root.textHelmet[5][_root.lang];
            break;
         case "hel7":
            this.itemName = _root.textHelmet[6][_root.lang];
            break;
         case "hel8":
            this.itemName = _root.textHelmet[7][_root.lang];
            break;
         case "hel9":
            this.itemName = _root.textHelmet[8][_root.lang];
            break;
         case "hel10":
            this.itemName = _root.textHelmet[9][_root.lang];
            break;
         case "hel11":
            this.itemName = _root.textHelmet[10][_root.lang];
            break;
         case "hel12":
            this.itemName = _root.textHelmet[11][_root.lang];
            break;
         case "hel13":
            this.itemName = _root.textHelmet[12][_root.lang];
            break;
         case "hel14":
            this.itemName = _root.textHelmet[13][_root.lang];
            break;
         case "hel15":
            this.itemName = "Pumpkin Helmet";
            break;
         case "hel16":
            this.itemName = "Santa Hat";
         default:
            return;
      }
   }
   function setDefence(武器帧, 武器等级, 武器品质)
   {
      var _loc4_ = 武器帧 + "-";
      var _loc2_ = _loc4_.slice(3,-1);
      this.levelRequire = Number(_loc2_) <= 10 ? (Number(_loc2_) - 1) * 5 + 1 : 1;
      var _loc3_ = 3 + (Number(_loc2_) - 1) * 5;
      _loc3_ += 武器等级 * 3;
      _loc3_ += 武器品质 * 5;
      this.attrib[1] = _loc3_;
      this.attrib[2] = Number(_loc2_) + 2;
      if(Number(_loc2_) > 10)
      {
         this.attrib[1] = this.attrib[2] = 0;
      }
   }
   function setup()
   {
      super.setup();
      _root.game.map.player.helmetFrame = this.attrib[0];
   }
   function remove()
   {
      super.remove();
      _root.game.map.player.helmetFrame = "nothing";
   }
}
