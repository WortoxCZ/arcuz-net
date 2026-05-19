class Weapon
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
   var val;
   function Weapon(frame1, p2, p3, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14)
   {
      this.param = ["Weapon",frame1,p2,p3,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14];
      this.Type = "Weapon";
      this.attribName = [];
      this.attrib = [];
      this.attribName[0] = "frame";
      this.attrib[0] = frame1;
      this.level = p2;
      this.grade = p3;
      this.times = 4 + this.level + this.grade;
      var _loc5_ = this.getWeaponDamage(frame1,p2,p3);
      this.attrib[3] = _loc5_[0];
      this.attrib[4] = _loc5_[1];
      if(p5 != 0)
      {
         p6 = p7 = p8 = 0;
      }
      else if(p6 != 0)
      {
         p7 = p8 = 0;
      }
      else if(p7 != 0)
      {
         p8 = 0;
      }
      this.attrib[5] = p5;
      this.attrib[6] = p6;
      this.attrib[7] = p7;
      this.attrib[8] = p8;
      this.attrib[9] = p9;
      this.attrib[10] = p10;
      this.attrib[11] = p11;
      this.attrib[12] = p12;
      this.attrib[13] = p13;
      this.attrib[14] = p14;
      this.setItemName();
      this.setPosX = 291;
      this.setPosY = 22;
      this.setPosNum = 10;
      this.setPrice();
      this.setString();
   }
   function setParam()
   {
      this.param = ["Weapon",this.attrib[0],this.level,this.grade,this.attrib[5],this.attrib[6],this.attrib[7],this.attrib[8],this.attrib[9],this.attrib[10],this.attrib[11],this.attrib[12],this.attrib[13],this.attrib[14]];
      var _loc2_ = this.getWeaponDamage(this.attrib[0],this.level,this.grade);
      this.attrib[3] = _loc2_[0];
      this.attrib[4] = _loc2_[1];
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
      var _loc2_ = 5;
      while(_loc2_ <= 14)
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
      this.price += this.attrib[3] * 20 + this.attrib[4] + this.attrib[3] * this.level * 3 + this.attrib[3] * (this.grade - 1) * 10;
      this.price += int(this.price * this.levelRequire / 50);
   }
   function setItemName()
   {
      switch(this.attrib[0])
      {
         case "s1":
            this.itemName = _root.textWeapon[0][_root.lang];
            break;
         case "s2":
            this.itemName = _root.textWeapon[1][_root.lang];
            break;
         case "s3":
            this.itemName = _root.textWeapon[2][_root.lang];
            break;
         case "s4":
            this.itemName = _root.textWeapon[3][_root.lang];
            break;
         case "s5":
            this.itemName = _root.textWeapon[4][_root.lang];
            break;
         case "s6":
            this.itemName = _root.textWeapon[5][_root.lang];
            break;
         case "s7":
            this.itemName = _root.textWeapon[6][_root.lang];
            break;
         case "s8":
            this.itemName = _root.textWeapon[7][_root.lang];
            break;
         case "s9":
            this.itemName = _root.textWeapon[8][_root.lang];
            break;
         case "s10":
            this.itemName = _root.textWeapon[9][_root.lang];
            break;
         case "b1":
            this.itemName = _root.textWeapon[10][_root.lang];
            break;
         case "b2":
            this.itemName = _root.textWeapon[11][_root.lang];
            break;
         case "b3":
            this.itemName = _root.textWeapon[12][_root.lang];
            break;
         case "b4":
            this.itemName = _root.textWeapon[13][_root.lang];
            break;
         case "b5":
            this.itemName = _root.textWeapon[14][_root.lang];
            break;
         case "b6":
            this.itemName = _root.textWeapon[15][_root.lang];
            break;
         case "b7":
            this.itemName = _root.textWeapon[16][_root.lang];
            break;
         case "b8":
            this.itemName = _root.textWeapon[17][_root.lang];
            break;
         case "b9":
            this.itemName = _root.textWeapon[18][_root.lang];
            break;
         case "b10":
            this.itemName = _root.textWeapon[19][_root.lang];
            break;
         case "a1":
            this.itemName = _root.textWeapon[20][_root.lang];
            break;
         case "a2":
            this.itemName = _root.textWeapon[21][_root.lang];
            break;
         case "a3":
            this.itemName = _root.textWeapon[22][_root.lang];
            break;
         case "a4":
            this.itemName = _root.textWeapon[23][_root.lang];
            break;
         case "a5":
            this.itemName = _root.textWeapon[24][_root.lang];
            break;
         case "a6":
            this.itemName = _root.textWeapon[25][_root.lang];
            break;
         case "a7":
            this.itemName = _root.textWeapon[26][_root.lang];
            break;
         case "a8":
            this.itemName = _root.textWeapon[27][_root.lang];
            break;
         case "a9":
            this.itemName = _root.textWeapon[28][_root.lang];
            break;
         case "a10":
            this.itemName = _root.textWeapon[29][_root.lang];
            break;
         case "a11":
            this.itemName = "Tommy\'s wand";
         default:
            return;
      }
   }
   function getWeaponDamage(武器帧, 武器等级, 武器品质)
   {
      var _loc6_ = 武器帧 + "-";
      var _loc7_ = _loc6_.slice(0,1);
      var _loc3_ = Number(_loc6_.slice(1,-1)) - 1;
      this.levelRequire = _loc3_ <= 9 ? _loc3_ * 5 + 1 : 1;
      trace(this.levelRequire + "???" + _loc3_);
      var _loc2_;
      switch(_loc7_)
      {
         case "s":
            _loc2_ = [3,4,12,1,6,15];
            this.attrib[1] = "sword";
            this.attrib[2] = 10;
            break;
         case "b":
            _loc2_ = [2,2,10,1,6,15];
            this.attrib[1] = "blade";
            this.attrib[2] = 6;
            break;
         case "a":
            _loc2_ = [4,6,15,2,6,15];
            this.attrib[1] = "axe";
            this.attrib[2] = 15;
      }
      var _loc4_ = _loc2_[0] + _loc2_[2] * _loc3_;
      var _loc5_ = _loc4_ + _loc2_[1] + _loc2_[3] * _loc3_;
      _loc4_ += 武器等级 * _loc2_[4] + (武器品质 - 1) * _loc2_[5];
      _loc5_ += 武器等级 * _loc2_[4] + (武器品质 - 1) * _loc2_[5];
      if(_loc3_ > 9)
      {
         _loc4_ = _loc5_ = 0;
      }
      else
      {
         this.attrib[2] += _loc3_ * _loc2_[2];
      }
      return [_loc4_,_loc5_];
   }
   function setString()
   {
      this.attribName[1] = "Type :" + this.attrib[1];
      this.attribName[3] = "Damage : " + this.attrib[3] + " - " + this.attrib[4];
      this.attribName[4] = "";
      this.attribName[2] = "Weight : " + this.attrib[2];
      this.attribName[5] = "Lv." + this.attrib[5] + " Fire";
      this.attribName[6] = "Lv." + this.attrib[6] + " Ice";
      this.attribName[7] = "Lv." + this.attrib[7] + " Thunder";
      this.attribName[8] = "Lv." + this.attrib[8] + " Poison";
      this.attribName[9] = "+" + this.attrib[9] * 3 + "% Chance of Critical Hit" + "(lv." + this.attrib[9] + ")";
      this.attribName[10] = "+" + this.attrib[10] + " Sp Recovery" + "(lv." + this.attrib[10] + ")";
      this.attribName[11] = "+" + this.attrib[11] + " Hp Recovery" + "(lv." + this.attrib[11] + ")";
      this.attribName[12] = "+" + this.attrib[12] * 5 + " Drop Rate" + "(lv." + this.attrib[12] + ")";
      this.attribName[13] = "+" + this.attrib[13] * 5 + " Attack Bonus" + "(lv." + this.attrib[13] + ")";
      this.attribName[14] = "+" + this.attrib[14] * 10 + "% Attack Bonus" + "(lv." + this.attrib[14] + ")";
   }
   function setup()
   {
      trace("setup!!!!!" + this.itemName);
      this.val = [];
      _root.game.map.player.weaponType = this.attrib[1];
      _root.game.map.player.weaponFrame = this.attrib[0];
      if(_root.ui.skillIMc.weapon != "none")
      {
         if(_root.ui.skillIMc.weapon != this.attrib[1])
         {
            _root.ui.skillIMc.removeMovieClip();
            _root.game.map.player.skillI = undefined;
         }
      }
      if(_root.ui.skillIMc1.weapon != "none")
      {
         if(_root.ui.skillIMc1.weapon != this.attrib[1])
         {
            _root.ui.skillIMc1.removeMovieClip();
         }
      }
      if(_root.ui.skillLMc.weapon != "none")
      {
         if(_root.ui.skillLMc.weapon != this.attrib[1])
         {
            _root.ui.skillLMc.removeMovieClip();
            _root.game.map.player.skillL = undefined;
         }
      }
      if(_root.ui.skillLMc1.weapon != "none")
      {
         if(_root.ui.skillLMc1.weapon != this.attrib[1])
         {
            _root.ui.skillLMc1.removeMovieClip();
         }
      }
      _root.game.map.player.attackMin1 += this.attrib[3];
      _root.game.map.player.attackMax1 += this.attrib[4];
      if(this.attrib[5])
      {
         _root.game.map.player.addDmgType = ["fire",this.attrib[5]];
      }
      else if(this.attrib[6])
      {
         _root.game.map.player.addDmgType = ["ice",this.attrib[6]];
      }
      else if(this.attrib[7])
      {
         _root.game.map.player.addDmgType = ["thunder",this.attrib[7]];
      }
      else if(this.attrib[8])
      {
         _root.game.map.player.addDmgType = ["poison",this.attrib[8]];
      }
      else
      {
         _root.game.map.player.addDmgType = ["none"];
      }
      _root.game.map.player.criticalHit1 += this.attrib[9] * 3;
      _root.game.map.player.dropRate1 += this.attrib[12] * 5;
      _root.game.map.player.spRegain1 += this.attrib[10];
      _root.game.map.player.hpRegain1 += this.attrib[11];
      _root.game.map.player.decSp(0);
      _root.game.map.player.attackMin1 += this.attrib[13] * 5;
      _root.game.map.player.attackMax1 += this.attrib[13] * 5;
      this.val[14] = int(this.attrib[14] * 0.1 * _root.game.map.player.attackMax0);
      _root.game.map.player.attackMin1 += this.val[14];
      _root.game.map.player.attackMax1 += this.val[14];
      _root.game.map.player.setHPSPregain();
      _root.game.map.player.setLuck();
      _root.game.map.player.setupWeaponWithSkill();
      _root.game.map.player.calcWeight();
   }
   function remove()
   {
      _root.game.map.player.attackMin1 -= this.attrib[3];
      _root.game.map.player.attackMax1 -= this.attrib[4];
      _root.game.map.player.addDmgType = ["none"];
      _root.game.map.player.criticalHit1 -= this.attrib[9] * 3;
      _root.game.map.player.dropRate1 -= this.attrib[12] * 5;
      _root.game.map.player.spRegain1 -= this.attrib[10];
      _root.game.map.player.hpRegain1 -= this.attrib[11];
      _root.game.map.player.attackMin1 -= this.attrib[13] * 5;
      _root.game.map.player.attackMax1 -= this.attrib[13] * 5;
      _root.game.map.player.attackMin1 -= this.val[14];
      _root.game.map.player.attackMax1 -= this.val[14];
      _root.game.map.player.uninstWeaponWithSkill();
      _root.game.map.player.setHPSPregain();
      _root.game.map.player.setLuck();
      _root.game.map.player.weaponType = "nothing";
      _root.game.map.player.weaponFrame = "nothing";
      _root.game.map.player.calcWeight();
   }
}
