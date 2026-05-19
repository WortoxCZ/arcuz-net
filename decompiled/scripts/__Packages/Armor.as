class Armor
{
   var attrib;
   var attribName;
   var grade;
   var level;
   var levelRequire;
   var param;
   var price;
   var times;
   var val;
   function Armor(frame1, l, g, p3, p4, p5, p6, p7, p8, p9, p10, p11)
   {
      this.param = ["Armor",frame1,l,g,p3,p4,p5,p6,p7,p8,p9,p10,p11];
      this.attribName = [];
      this.attrib = [];
      this.attribName[0] = "frame";
      this.attrib[0] = frame1;
      this.level = l;
      this.grade = g;
      this.times = 4 + this.level + this.grade;
      this.setDefence(frame1,this.level,this.grade);
      this.attrib[3] = p3;
      this.attrib[4] = p4;
      this.attrib[5] = p5;
      this.attrib[6] = p6;
      this.attrib[7] = p7;
      this.attrib[8] = p8;
      this.attrib[9] = p9;
      this.attrib[10] = p10;
      this.attrib[11] = p11;
      this.setPrice();
      this.setString();
   }
   function setParam()
   {
      this.param = [this.param[0]].concat([this.attrib[0],this.level,this.grade,this.attrib[3],this.attrib[4],this.attrib[5],this.attrib[6],this.attrib[7],this.attrib[8],this.attrib[9],this.attrib[10],this.attrib[11]]);
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
      while(_loc2_ <= 11)
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
   }
   function setString()
   {
      this.attribName[1] = "Defense : " + this.attrib[1];
      this.attribName[2] = "Weight : " + this.attrib[2];
      this.attribName[3] = "+" + this.attrib[3] * 10 + "% Sp Bonus" + "(lv." + this.attrib[3] + ")";
      this.attribName[4] = "+" + this.attrib[4] * 10 + "% Hp Bonus" + "(lv." + this.attrib[4] + ")";
      this.attribName[5] = "Get" + this.attrib[5] * 5 + " Hp after kill an enemy" + "(lv." + this.attrib[5] + ")";
      this.attribName[6] = "Get" + this.attrib[6] * 4 + " Sp after kill an enemy" + "(lv." + this.attrib[6] + ")";
      this.attribName[7] = "+" + this.attrib[7] * 10 + " Defense Bonus" + "(lv." + this.attrib[7] + ")";
      this.attribName[8] = "+" + this.attrib[8] * 10 + "% Denfese Bonus" + "(lv." + this.attrib[8] + ")";
      this.attribName[9] = "+" + this.attrib[9] * 3 + "% Chance of Critical Hit" + "(lv." + this.attrib[9] + ")";
      this.attribName[10] = "+" + this.attrib[10] * 3 + "% Magic Resistance" + "(lv." + this.attrib[10] + ")";
      this.attribName[11] = "+" + this.attrib[11] * 5 + " Drop Rate" + "(lv." + this.attrib[11] + ")";
   }
   function setup()
   {
      this.val = [];
      _root.game.map.player.defence1 += this.attrib[1];
      this.val[3] = int(this.attrib[3] * 10 * _root.game.map.player.totalSp0 / 100);
      this.val[4] = int(this.attrib[4] * 10 * _root.game.map.player.totalHp0 / 100);
      _root.game.map.player.totalSp1 += this.val[3];
      _root.game.map.player.totalHp1 += this.val[4];
      _root.game.map.player.setHPSP();
      _root.game.map.player.hpFromEmy += this.attrib[5] * 5;
      _root.game.map.player.spFromEmy += this.attrib[6] * 4;
      _root.game.map.player.defence1 += this.attrib[7] * 10;
      this.val[8] = int(this.attrib[8] * 0.1 * _root.game.map.player.defence0);
      _root.game.map.player.defence1 += this.val[8];
      _root.game.map.player.criticalHit1 += this.attrib[9] * 3;
      _root.game.map.player.magicResist += this.attrib[10] * 3;
      _root.game.map.player.dropRate1 += this.attrib[11] * 5;
      _root.game.map.player.setDefence();
      _root.game.map.player.setLuck();
      _root.game.map.player.addHp(0);
      _root.game.map.player.addSp(0);
      _root.game.map.player.decSp(0);
      _root.game.map.player.calcWeight();
   }
   function remove()
   {
      _root.game.map.player.defence1 -= this.attrib[1];
      _root.game.map.player.totalSp1 -= this.val[3];
      _root.game.map.player.totalHp1 -= this.val[4];
      _root.game.map.player.setHPSP();
      if(_root.game.map.player.hp > _root.game.map.player.totalHp)
      {
         _root.game.map.player.hp = _root.game.map.player.recoverHp = _root.game.map.player.totalHp;
      }
      if(_root.game.map.player.recoverHp > _root.game.map.player.totalHp)
      {
         _root.game.map.player.recoverHp = _root.game.map.player.totalHp;
      }
      if(_root.game.map.player.recoverHp > _root.game.map.player.totalHp)
      {
         _root.game.map.player.recoverHp = _root.game.map.player.totalHp;
      }
      if(_root.game.map.player.sp > _root.game.map.player.totalSp)
      {
         _root.game.map.player.sp = _root.game.map.player.totalSp;
      }
      _root.game.map.player.addHp(0);
      _root.game.map.player.addSp(0);
      _root.game.map.player.hpFromEmy -= this.attrib[5] * 5;
      _root.game.map.player.spFromEmy -= this.attrib[6] * 4;
      _root.game.map.player.defence1 -= this.attrib[7] * 10;
      _root.game.map.player.defence1 -= this.val[8];
      _root.game.map.player.criticalHit1 -= this.attrib[9] * 3;
      _root.game.map.player.magicResist -= this.attrib[10] * 3;
      _root.game.map.player.dropRate1 -= this.attrib[11] * 5;
      _root.game.map.player.setDefence();
      _root.game.map.player.setLuck();
      _root.game.map.player.calcWeight();
   }
}
