class Shield extends Armor
{
   var Type;
   var attrib;
   var attribName;
   var grade;
   var itemName;
   var level;
   var levelRequire;
   var param;
   var price;
   var setPosNum;
   var setPosX;
   var setPosY;
   var times;
   function Shield(frame1, l, g, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12)
   {
      super(frame1,l,g,p3,p4,p5,p6,p7,p8,p9,p10,p11);
      this.param = ["Shield",frame1,l,g,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12];
      this.Type = "Shield";
      this.setPosX = 386;
      this.setPosY = 56;
      this.setPosNum = 15;
      this.attrib[12] = p12 <= 4 ? p12 : 4;
      switch(frame1)
      {
         case "shield1":
            this.itemName = _root.textShield[0][_root.lang];
            break;
         case "shield2":
            this.itemName = _root.textShield[1][_root.lang];
            break;
         case "shield3":
            this.itemName = _root.textShield[2][_root.lang];
            break;
         case "shield4":
            this.itemName = _root.textShield[3][_root.lang];
            break;
         case "shield5":
            this.itemName = _root.textShield[4][_root.lang];
            break;
         case "shield6":
            this.itemName = _root.textShield[5][_root.lang];
            break;
         case "shield7":
            this.itemName = _root.textShield[6][_root.lang];
            break;
         case "shield8":
            this.itemName = _root.textShield[7][_root.lang];
            break;
         case "shield9":
            this.itemName = _root.textShield[8][_root.lang];
            break;
         case "shield10":
            this.itemName = _root.textShield[9][_root.lang];
      }
      this.setPrice();
      this.setString();
   }
   function setParam()
   {
      this.param = ["Shield",this.attrib[0],this.level,this.grade,this.attrib[3],this.attrib[4],this.attrib[5],this.attrib[6],this.attrib[7],this.attrib[8],this.attrib[9],this.attrib[10],this.attrib[11],this.attrib[12]];
      this.setDefence(this.attrib[0],this.level,this.grade);
      this.setPrice();
   }
   function setPrice()
   {
      this.price = 0;
      var _loc6_;
      var _loc5_;
      var _loc4_;
      var _loc3_;
      _loc6_ = _loc5_ = _loc4_ = _loc3_ = 0;
      var _loc2_ = 3;
      while(_loc2_ <= 12)
      {
         if(this.attrib[_loc2_] == 1)
         {
            _loc6_ = _loc6_ + 1;
         }
         else if(this.attrib[_loc2_] == 2)
         {
            _loc5_ = _loc5_ + 1;
         }
         else if(this.attrib[_loc2_] == 3)
         {
            _loc4_ = _loc4_ + 1;
         }
         else if(this.attrib[_loc2_] == 4)
         {
            _loc3_ = _loc3_ + 1;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(_loc6_)
      {
         this.price += Math.pow(2,_loc6_ - 1) * 600;
      }
      if(_loc5_)
      {
         this.price += Math.pow(2,_loc5_) * 650;
      }
      if(_loc4_)
      {
         this.price += Math.pow(2,_loc4_ + 1) * 700;
      }
      if(_loc3_)
      {
         this.price += Math.pow(2,_loc3_ + 2) * 750;
      }
      this.price += this.attrib[1] * 30 + this.attrib[1] * this.level * 6 + this.attrib[1] * (this.grade - 1) * 20;
      this.price += int(this.price * this.levelRequire / 50);
   }
   function setDefence(武器帧, 武器等级, 武器品质)
   {
      var _loc4_ = 武器帧 + "-";
      var _loc3_ = _loc4_.slice(6,-1);
      this.levelRequire = (Number(_loc3_) - 1) * 5 + 1;
      var _loc2_ = 3 + (Number(_loc3_) - 1) * 10;
      _loc2_ += 武器等级 * 4;
      _loc2_ += 武器品质 * 6;
      this.attrib[1] = _loc2_;
      this.attrib[2] = Number(_loc3_) * 8 + 8;
   }
   function setString()
   {
      super.setString();
      this.attribName[12] = "+" + (this.attrib[12] * 3 + 5 + this.level * 2 + (this.grade - 1) * 10) + "% Chance of Block" + "(lv." + this.attrib[12] + ")";
      this.attribName[13] = "times:" + this.times;
   }
   function setup()
   {
      _root.game.map.player.shieldFrame = this.attrib[0];
      _root.game.map.player.blockRate1 = this.attrib[12] * 3 + 5 + this.level * 2 + (this.grade - 1) * 10;
      _root.game.map.player.blockRate = _root.game.map.player.blockRate0 + _root.game.map.player.blockRate1;
      super.setup();
   }
   function remove()
   {
      _root.game.map.player.shieldFrame = "nothing";
      _root.game.map.player.blockRate = 0;
      _root.game.map.player.blockRate1 = 0;
      super.remove();
   }
}
