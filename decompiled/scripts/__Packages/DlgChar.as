class DlgChar extends MovieClip
{
   var agility;
   var armor;
   var blockRate;
   var btnAccept;
   var btnAgility;
   var btnConstitution;
   var btnLuck;
   var btnStrength;
   var cp;
   var criticalHit;
   var damage;
   var defence;
   var dummy;
   var exp;
   var hp;
   var hpNow;
   var level;
   var luck;
   var magicResist;
   var playerName;
   var spNow;
   var stamine;
   var strength;
   function DlgChar()
   {
      super();
      this.dummy = new Object();
      this.clone();
      this.cout();
   }
   function clone()
   {
      this.dummy.hp = _root.game.map.player.hp;
      this.dummy.totalHp = _root.game.map.player.totalHp;
      this.dummy.totalHp0 = _root.game.map.player.totalHp0;
      this.dummy.totalHp1 = _root.game.map.player.totalHp1;
      this.dummy.sp = _root.game.map.player.sp;
      this.dummy.totalSp = _root.game.map.player.totalSp;
      this.dummy.totalSp0 = _root.game.map.player.totalSp0;
      this.dummy.totalSp1 = _root.game.map.player.totalSp1;
      this.dummy.hpRegain = _root.game.map.player.hpRegain;
      this.dummy.hpRegain0 = _root.game.map.player.hpRegain0;
      this.dummy.hpRegain1 = _root.game.map.player.hpRegain1;
      this.dummy.spRegain = _root.game.map.player.spRegain;
      this.dummy.spRegain0 = _root.game.map.player.spRegain0;
      this.dummy.spRegain1 = _root.game.map.player.spRegain1;
      this.dummy.skillList = [];
      this.dummy.skillList[4] = _root.game.map.player.skillList[4];
      this.dummy.level = _root.game.map.player.level;
      this.dummy.defence = _root.game.map.player.defence;
      this.dummy.defence0 = _root.game.map.player.defence0;
      this.dummy.defence1 = _root.game.map.player.defence1;
      this.dummy.exp = _root.game.map.player.exp;
      this.dummy.magicResist = _root.game.map.player.magicResist;
      this.dummy.CP = _root.game.map.player.CP;
      this.dummy.strength = _root.game.map.player.strength;
      this.dummy.attackMin0 = _root.game.map.player.attackMin0;
      this.dummy.attackMax0 = _root.game.map.player.attackMax0;
      this.dummy.attackMin1 = _root.game.map.player.attackMin1;
      this.dummy.attackMax1 = _root.game.map.player.attackMax1;
      this.dummy.attack = [this.dummy.attackMin0 + _root.game.map.player.attackMin1,this.dummy.attackMax0 + _root.game.map.player.attackMax1];
      this.dummy.encumbrance0 = _root.game.map.player.encumbrance0;
      this.dummy.encumbrance1 = _root.game.map.player.encumbrance1;
      this.dummy.encumbrance = _root.game.map.player.encumbrance;
      this.dummy.skillList[3] = _root.game.map.player.skillList[3];
      this.dummy.agility = _root.game.map.player.agility;
      this.dummy.blockRate0 = _root.game.map.player.blockRate0;
      this.dummy.stamine = _root.game.map.player.stamine;
      this.dummy.luck = _root.game.map.player.luck;
      this.dummy.criticalHit = _root.game.map.player.criticalHit;
      this.dummy.criticalHit0 = _root.game.map.player.criticalHit0;
      this.dummy.criticalHit1 = _root.game.map.player.criticalHit1;
      this.dummy.dropRate = _root.game.map.player.dropRate;
      this.dummy.dropRate0 = _root.game.map.player.dropRate0;
      this.dummy.dropRate1 = _root.game.map.player.dropRate1;
      this.dummy.strengthUp = _root.game.map.player.strengthUp;
      this.dummy.agilityUp = _root.game.map.player.agilityUp;
      this.dummy.stamineUp = _root.game.map.player.stamineUp;
      this.dummy.setHPSP = _root.game.map.player.setHPSP;
      this.dummy.setHPSPregain = _root.game.map.player.setHPSPregain;
      this.dummy.luckUp = _root.game.map.player.luckUp;
      this.dummy.setAttack = _root.game.map.player.setAttack;
      this.dummy.setLuck = _root.game.map.player.setLuck;
      this.dummy.setDefence = _root.game.map.player.setDefence;
   }
   function setCP()
   {
      _root.game.map.player.hp = this.dummy.hp;
      _root.game.map.player.totalHp = this.dummy.totalHp;
      _root.game.map.player.totalHp0 = this.dummy.totalHp0;
      _root.game.map.player.totalHp1 = this.dummy.totalHp1;
      _root.game.map.player.sp = this.dummy.sp;
      _root.game.map.player.totalSp = this.dummy.totalSp;
      _root.game.map.player.totalSp0 = this.dummy.totalSp0;
      _root.game.map.player.totalSp1 = this.dummy.totalSp1;
      _root.game.map.player.hpRegain = this.dummy.hpRegain;
      _root.game.map.player.hpRegain0 = this.dummy.hpRegain0;
      _root.game.map.player.hpRegain1 = this.dummy.hpRegain1;
      _root.game.map.player.spRegain = this.dummy.spRegain;
      _root.game.map.player.spRegain0 = this.dummy.spRegain0;
      _root.game.map.player.spRegain1 = this.dummy.spRegain1;
      _root.game.map.player.level = this.dummy.level;
      _root.game.map.player.defence = this.dummy.defence;
      _root.game.map.player.defence0 = this.dummy.defence0;
      _root.game.map.player.defence1 = this.dummy.defence1;
      _root.game.map.player.magicResist = this.dummy.magicResist;
      _root.game.map.player.CP = this.dummy.CP;
      _root.game.map.player.strength = this.dummy.strength;
      _root.game.map.player.attackMin0 = this.dummy.attackMin0;
      _root.game.map.player.attackMax0 = this.dummy.attackMax0;
      _root.game.map.player.attackMin1 = this.dummy.attackMin1;
      _root.game.map.player.attackMax1 = this.dummy.attackMax1;
      _root.game.map.player.attack = [this.dummy.attackMin0 + this.dummy.attackMin1,this.dummy.attackMax0 + this.dummy.attackMax1];
      _root.game.map.player.encumbrance0 = this.dummy.encumbrance0;
      _root.game.map.player.encumbrance1 = this.dummy.encumbrance1;
      _root.game.map.player.encumbrance = this.dummy.encumbrance;
      _root.game.map.player.agility = this.dummy.agility;
      _root.game.map.player.blockRate0 = this.dummy.blockRate0;
      _root.game.map.player.stamine = this.dummy.stamine;
      _root.game.map.player.luck = this.dummy.luck;
      _root.game.map.player.criticalHit = this.dummy.criticalHit;
      _root.game.map.player.criticalHit0 = this.dummy.criticalHit0;
      _root.game.map.player.criticalHit1 = this.dummy.criticalHit1;
      _root.game.map.player.dropRate = this.dummy.dropRate;
      _root.game.map.player.dropRate0 = this.dummy.dropRate0;
      _root.game.map.player.dropRate1 = this.dummy.dropRate1;
      _root.game.map.player.calcWeight();
      _root.game.map.player.addHp(0);
      _root.game.map.player.addSp(0);
      _root.game.map.player.decSp(0);
   }
   function cout()
   {
      var _loc3_;
      if(_root.usingMochiCoins)
      {
         if(_root.mochiCoinsSaveData.playerName == undefined)
         {
            _root.mochiCoinsSaveData.playerName = "Funnaut";
         }
         this.playerName.text = _root.mochiCoinsSaveData.playerName;
      }
      else
      {
         _loc3_ = SharedObject.getLocal("Arcuz");
         this.playerName.text = _loc3_.data.playerName;
      }
      this.hpNow.text = _root.game.map.player.hp + "/" + this.dummy.totalHp;
      this.spNow.text = _root.game.map.player.sp + "/" + this.dummy.totalSp;
      if(this.dummy.level >= 35)
      {
         this.level.textColor = 16684583;
      }
      this.level.text = this.dummy.level;
      this.hp.text = this.dummy.totalHp + "/" + this.dummy.totalSp;
      this.armor.text = this.dummy.defence0;
      this.exp.text = this.dummy.exp + "/" + _root.expArr[_root.game.map.player.level];
      this.magicResist.text = this.dummy.magicResist + "%";
      this.cp.text = this.dummy.CP;
      this.strength.text = this.dummy.strength;
      this.dummy.attack = [this.dummy.attackMin0 + this.dummy.attackMin1,this.dummy.attackMax0 + this.dummy.attackMax1];
      this.damage.text = this.dummy.attack[0] + " - " + this.dummy.attack[1];
      this.agility.text = this.dummy.agility;
      this.defence.text = this.dummy.defence0 + "+" + _root.game.map.player.defence1;
      this.blockRate.text = _root.game.map.player.blockRate1 + "%" + "(+" + this.dummy.blockRate0 + "%)";
      this.stamine.text = this.dummy.stamine;
      this.luck.text = this.dummy.luck;
      this.criticalHit.text = this.dummy.criticalHit + "%";
      this.setUpBtn();
   }
   function btnStrengthfunc()
   {
      _root.playSound1("对话框");
      this._parent.dummy.strengthUp();
      this._parent.cout();
   }
   function btnAgilityfunc()
   {
      _root.playSound1("对话框");
      this._parent.dummy.agilityUp();
      this._parent.cout();
   }
   function btnConstitutionfunc()
   {
      _root.playSound1("对话框");
      this._parent.dummy.stamineUp();
      this._parent.cout();
   }
   function btnLuckfunc()
   {
      _root.playSound1("对话框");
      this._parent.dummy.luckUp();
      this._parent.cout();
   }
   function setUpBtn()
   {
      if(this.dummy.CP > 0)
      {
         this.btnStrength._visible = true;
         this.btnAgility._visible = true;
         this.btnConstitution._visible = true;
         this.btnLuck._visible = true;
         _root.setBtnInfo(this.btnStrength,"add point");
         this.btnStrength.onRelease = this.btnStrengthfunc;
         _root.setBtnInfo(this.btnAgility,"add point");
         this.btnAgility.onRelease = this.btnAgilityfunc;
         _root.setBtnInfo(this.btnConstitution,"add point");
         this.btnConstitution.onRelease = this.btnConstitutionfunc;
         _root.setBtnInfo(this.btnLuck,"add point");
         this.btnLuck.onRelease = this.btnLuckfunc;
      }
      else
      {
         this.btnStrength.onRelease = undefined;
         this.btnAgility.onRelease = undefined;
         this.btnConstitution.onRelease = undefined;
         this.btnLuck.onRelease = undefined;
         this.btnStrength._visible = false;
         this.btnAgility._visible = false;
         this.btnConstitution._visible = false;
         this.btnLuck._visible = false;
      }
      if(_root.game.map.player.CP > 0)
      {
         this.btnAccept._visible = true;
         this.btnAccept.onRelease = function()
         {
            _root.playSound1("对话框");
            this._parent.setCP();
            this._visible = false;
         };
      }
      else
      {
         this.btnAccept._visible = false;
      }
   }
}
