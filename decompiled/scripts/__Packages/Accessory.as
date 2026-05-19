class Accessory
{
   var attrib;
   var attribName;
   var param;
   var price;
   var val;
   function Accessory(frame1, p2, p3, p4, p5, p6, p7, p8)
   {
      this.param = ["Accessory",frame1,p2,p3,p4,p5,p6,p7,p8];
      this.attribName = [];
      this.attrib = [];
      this.attribName[0] = "frame";
      this.attrib[0] = frame1;
      this.attrib[2] = 1;
      this.attrib[3] = p2;
      this.attrib[4] = p3;
      this.attrib[5] = p4;
      this.attrib[6] = p5;
      this.attrib[7] = p6;
      this.attrib[8] = p7;
      this.attrib[9] = p8;
      this.setPirce();
      this.setString();
   }
   function setParam()
   {
      this.param = [this.param[0]].concat([this.attrib[0],this.attrib[3],this.attrib[4],this.attrib[5],this.attrib[6],this.attrib[7],this.attrib[8],this.attrib[9]]);
      this.setPirce();
   }
   function setPirce()
   {
      this.price = 50;
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
         this.price += Math.pow(2,_loc6_ - 1) * 1000;
      }
      if(_loc5_)
      {
         this.price += Math.pow(2,_loc5_) * 1050;
      }
      if(_loc4_)
      {
         this.price += Math.pow(2,_loc4_ + 1) * 1100;
      }
      if(_loc3_)
      {
         this.price += Math.pow(2,_loc3_ + 2) * 1150;
      }
   }
   function setString()
   {
      this.attribName[1] = "";
      this.attribName[2] = "Weight:" + this.attrib[2];
      this.attribName[3] = "+" + this.attrib[3] + " Hp Recovery" + "(lv." + this.attrib[3] + ")";
      this.attribName[4] = "+" + this.attrib[4] + " Sp Recovery" + "(lv." + this.attrib[4] + ")";
      this.attribName[5] = "+" + this.attrib[5] * 10 + "% Defense Bonus" + "(lv." + this.attrib[5] + ")";
      this.attribName[6] = "+" + this.attrib[6] * 10 + "% Attack Bonus" + "(lv." + this.attrib[6] + ")";
      this.attribName[7] = "+" + this.attrib[7] * 3 + "% Chance of Critical Hit" + "(lv." + this.attrib[7] + ")";
      this.attribName[8] = "+" + this.attrib[8] * 5 + " Drop Rate" + "(lv." + this.attrib[8] + ")";
      this.attribName[9] = "+" + this.attrib[9] * 50 + " Extra Weight" + "(lv." + this.attrib[9] + ")";
   }
   function setup()
   {
      this.val = [];
      _root.game.map.player.hpRegain1 += this.attrib[3];
      _root.game.map.player.spRegain1 += this.attrib[4];
      _root.game.map.player.decSp(0);
      this.val[5] = int(this.attrib[5] * 0.1 * _root.game.map.player.defence0);
      _root.game.map.player.defence1 += this.val[5];
      this.val[6] = int(this.attrib[6] * 0.1 * _root.game.map.player.attackMax0);
      _root.game.map.player.attackMin1 += this.val[6];
      _root.game.map.player.attackMax1 += this.val[6];
      _root.game.map.player.criticalHit1 += this.attrib[7] * 3;
      _root.game.map.player.dropRate1 += this.attrib[8] * 5;
      _root.game.map.player.encumbrance1 += this.attrib[9] * 50;
      _root.game.map.player.encumbrance = _root.game.map.player.encumbrance0 + _root.game.map.player.encumbrance1;
      _root.game.map.player.setHPSPregain();
      _root.game.map.player.setDefence();
      _root.game.map.player.setLuck();
      _root.game.map.player.setAttack();
      _root.game.map.player.calcWeight();
   }
   function remove()
   {
      _root.game.map.player.hpRegain1 -= this.attrib[3];
      _root.game.map.player.spRegain1 -= this.attrib[4];
      _root.game.map.player.defence1 -= this.val[5];
      _root.game.map.player.attackMin1 -= this.val[6];
      _root.game.map.player.attackMax1 -= this.val[6];
      _root.game.map.player.criticalHit1 -= this.attrib[7] * 3;
      _root.game.map.player.dropRate1 -= this.attrib[8] * 5;
      _root.game.map.player.encumbrance1 -= this.attrib[9] * 50;
      _root.game.map.player.encumbrance = _root.game.map.player.encumbrance0 + _root.game.map.player.encumbrance1;
      _root.game.map.player.setHPSPregain();
      _root.game.map.player.setDefence();
      _root.game.map.player.setLuck();
      _root.game.map.player.setAttack();
      _root.game.map.player.calcWeight();
   }
}
