class Player extends Man
{
   var AP;
   var CP;
   var _alpha;
   var _currentframe;
   var _name;
   var _parent;
   var _rotation;
   var _x;
   var _xscale;
   var _y;
   var _yscale;
   var ach;
   var addDmgType;
   var agility;
   var angryCounter;
   var atkLimit;
   var atkLv;
   var att;
   var attachMovie;
   var attack;
   var attackM;
   var attackMax0;
   var attackMax1;
   var attackMin0;
   var attackMin1;
   var attackMode;
   var attacking;
   var bHardTime;
   var beginTime;
   var bhtCount;
   var bhtaxe;
   var bhtblade;
   var bhtnothing;
   var bhtsword;
   var blockRate;
   var blockRate0;
   var blockRate1;
   var canJump;
   var chapter;
   var comboCount;
   var count;
   var counter;
   var createEmptyMovieClip;
   var criticalHit;
   var criticalHit0;
   var criticalHit1;
   var curDir;
   var defLv;
   var defence;
   var defence0;
   var defence1;
   var defenceM;
   var desDir;
   var dropRate;
   var dropRate0;
   var dropRate1;
   var dx;
   var dy;
   var encumbrance;
   var encumbrance0;
   var encumbrance1;
   var exDmg;
   var exp;
   var expl;
   var fHardTime;
   var fhtCount;
   var fhtaxe;
   var fhtblade;
   var fhtnothing;
   var fhtsword;
   var finalHit;
   var fric;
   var getNextHighestDepth;
   var gotoAndStop;
   var h;
   var helmetFrame;
   var hit;
   var hitHardTime;
   var hollyLightCounter;
   var hp;
   var hpCounter;
   var hpFromEmy;
   var hpRegain;
   var hpRegain0;
   var hpRegain1;
   var iceDmg;
   var inStage;
   var inventoryList;
   var inventoryList1;
   var jump;
   var jumpSpeed;
   var keyJumpDown;
   var level;
   var levelUpExp;
   var link;
   var luck;
   var magicResist;
   var map16finish;
   var mapVisit;
   var mc;
   var money;
   var num;
   var nx;
   var ny;
   var oldX;
   var oldY;
   var onEnterFrame;
   var overWeight;
   var parent;
   var phase;
   var poisonDmg;
   var questList;
   var questListInfo;
   var rUnit;
   var recoverHp;
   var removeMovieClip;
   var resist;
   var revive;
   var reviveController;
   var saveData;
   var secondaryQuest;
   var selectEnemyList;
   var shadowController;
   var shadw;
   var shieldFrame;
   var skillI;
   var skillL;
   var skillList;
   var sp;
   var spCounter;
   var spFromEmy;
   var spRegain;
   var spRegain0;
   var spRegain1;
   var speed;
   var speedUpCounter;
   var stamine;
   var step;
   var strength;
   var tele;
   var thunderDmg;
   var tmpBht;
   var tmpFht;
   var tmpRcvhp;
   var totalHp;
   var totalHp0;
   var totalHp1;
   var totalSp;
   var totalSp0;
   var totalSp1;
   var uiMc;
   var unbreakable;
   var weaponFrame;
   var weaponType;
   var wearColor;
   var wearFrame;
   var weight;
   var xPos;
   var xSpeed;
   var xs;
   var yPos;
   var ySpeed;
   var ys;
   var nextAttackMode = 0;
   var KeyUp = 87;
   var KeyDown = 83;
   var KeyLeft = 65;
   var KeyRight = 68;
   var KeyUp1 = 38;
   var KeyDown1 = 40;
   var KeyLeft1 = 37;
   var KeyRight1 = 39;
   var KeyWalk = 16;
   var KeySwitchSpell = 81;
   var KeySSPressed = false;
   var KeyJ = 74;
   var KeyK = 75;
   var KeyL = 76;
   var KeyI = 73;
   var KeyKPressed = 0;
   var KeyLPressed = 0;
   var KeyJPressed = 0;
   var KeyIPressed = 0;
   var Key1 = 49;
   var Key1Pressed = 0;
   var Key2 = 50;
   var Key2Pressed = 0;
   var Key3 = 51;
   var Key3Pressed = 0;
   function Player()
   {
      super();
      if(this._name.slice(0,8) != "instance")
      {
         this._x = this.xPos = this.oldX = 200;
         this._y = this.yPos = this.oldY = 200;
         this.canJump = false;
         this.att = 0;
         this.h = 50;
         this.fHardTime = ["",0,1,3,3];
         this.bHardTime = ["",1,3,4,8];
         this.fhtnothing = ["",5,5,5,5];
         this.bhtnothing = ["",5,5,5,5];
         this.fHardTime = this.fhtnothing;
         this.bHardTime = this.bhtnothing;
         this.fhtCount = -1;
         this.bhtCount = -1;
         this.hitHardTime = 12;
         this.counter = 0;
         this.comboCount = 0;
         this.hit = false;
         this.unbreakable = false;
         this.finalHit = false;
         this.jump = false;
         this.attacking = false;
         this.atkLv = 5;
         this.defLv = 3;
         this.speed = 6;
         this.xSpeed = 0;
         this.ySpeed = 0;
         this.rUnit = 10;
         this.gotoAndStop(3); //unpopped
         this.curDir = 3;
         this.desDir = 3;
         this._parent._parent.pushUnit(this);
         this.inStage = true;
         this.encumbrance1 = 0;
         this.readData();
         this.addHp(0);
         this.addSp(0);
         this.decHp(0);
         this.decSp(0);
         this.encumbrance0 = this.strength * 5 + 50 + this.skillList[3] * 100;
         this.encumbrance = this.encumbrance0 + this.encumbrance1;
         this.overWeight = false;
         this.calcWeight();
         this.revive = false;
         this.levelUpExp = _root.expArr[this.level];
         _root.ui.exp.mask._xscale = 100 * this.exp / this.levelUpExp;
         this.beginTime = getTimer();
         this.action();
      }
   }
   function getExp(exp1)
   {
      if(_root.areaMode != 0)
      {
         return undefined;
      }
      if(this.level == 35)
      {
         return undefined;
      }
      if(exp1 != undefined)
      {
         if(exp1 != 0)
         {
            _root.newMessage(_root.textSys[1][_root.lang] + exp1);
         }
         this.exp += exp1;
         if(this.exp >= this.levelUpExp)
         {
            this.exp -= this.levelUpExp;
            this.levelUp();
         }
         _root.ui.exp.mask._xscale = 100 * this.exp / this.levelUpExp;
      }
   }
   function levelUp()
   {
      this.level = this.level + 1;
      this.CP += 5;
      this.AP += 1;
      this.levelUpExp = _root.expArr[this.level];
      _root.playSound1("升级.mp3");
      var _loc3_ = _root.attachMovie("levelUpMc","levelUpMc" + _root.getNextHighestDepth(),_root.getNextHighestDepth(),{_x:250,_y:225});
      _loc3_ = this._parent.attachMovie("levelUpRing","levelUpRing" + this._parent.getNextHighestDepth(),this._parent.getNextHighestDepth(),{_x:this._x,_y:this._y + this.att,link:this});
      _loc3_.blendMode = 4;
      _loc3_.onEnterFrame = function()
      {
         this._x = this.link._x;
         this._y = this.link._y + this.link.att;
      };
      this.setHPSP();
      this.setHPSPregain();
      this.recoverHp = this.hp = this.totalHp;
      this.sp = this.totalSp;
      _root.ui.hp.mask._x = 142;
      _root.ui.recoverHp.mask._x = 142;
      _root.ui.sp.mask._x = 142;
      _root.ui.btnChar.play();
      _root.ui.btnSkill.play();
      this.setAttack();
      this.setDefence();
      this.setLuck();
      _root.newMessage(_root.textSys[0][_root.lang] + this.level);
      if(this.level == 35)
      {
         if(_root.game.map.player.ach[12][0] == 0)
         {
            _root.game.map.player.ach[12][0] = 1;
            _root.newMessage("New Archievement Unlocked!");
         }
         this.levelUpExp = 0;
         this.exp = 0;
      }
      this.getExp(0);
   }
   function strengthUp()
   {
      this.CP = this.CP - 1;
      this.strength = this.strength + 1;
      this.encumbrance0 = this.strength * 5 + 50 + this.skillList[3] * 100;
      this.encumbrance = this.encumbrance0 + this.encumbrance1;
      this.setAttack();
   }
   function agilityUp()
   {
      this.CP = this.CP - 1;
      this.agility = this.agility + 1;
      this.setDefence();
   }
   function stamineUp()
   {
      this.CP = this.CP - 1;
      this.stamine = this.stamine + 1;
      this.setHPSP();
      this.setHPSPregain();
   }
   function setHPSP()
   {
      this.totalHp0 = this.level * 30 + 30;
      this.totalHp0 += int(this.stamine * 10);
      this.totalHp = this.totalHp0 + this.totalHp1;
      this.totalSp0 = this.level * 5 + this.stamine * 3;
      this.totalSp = this.totalSp0 + this.totalSp1;
   }
   function setHPSPregain()
   {
      this.hpRegain0 = this.skillList[4] * 2;
      this.spRegain0 = this.skillList[4] * 2;
      this.hpRegain = this.hpRegain0 + this.hpRegain1;
      this.spRegain = this.spRegain0 + this.spRegain1;
      this.decSp(0);
   }
   function luckUp()
   {
      this.CP = this.CP - 1;
      this.luck = this.luck + 1;
      this.setLuck();
   }
   function setupWeaponWithSkill()
   {
      var _loc2_;
      if(this.weaponType == "blade")
      {
         _loc2_ = this.skillList[0];
         if(_loc2_ < 4)
         {
            this.fhtblade = [6,5,4,4,3];
            this.bhtblade = ["",7,8,8,8];
         }
         else if(_loc2_ < 8)
         {
            this.fhtblade = [6,4,4,4,3];
            this.bhtblade = ["",6,7,8,8];
         }
         else if(_loc2_ < 12)
         {
            this.fhtblade = [6,3,3,3,3];
            this.bhtblade = ["",5,6,7,8];
         }
         else if(_loc2_ < 16)
         {
            this.fhtblade = [6,2,2,2,3];
            this.bhtblade = ["",3,4,5,8];
         }
         else if(_loc2_ < 20)
         {
            this.fhtblade = [6,1,1,1,3];
            this.bhtblade = ["",1,2,3,8];
         }
         else
         {
            this.fhtblade = [6,0,0,0,3];
            this.bhtblade = ["",0,0,1,8];
         }
      }
      else if(this.weaponType == "sword")
      {
         _loc2_ = this.skillList[2];
         if(_loc2_ < 4)
         {
            this.fhtsword = [9,5,6,7,3];
            this.bhtsword = ["",10,10,11,8];
         }
         else if(_loc2_ < 8)
         {
            this.fhtsword = [9,4,5,7,3];
            this.bhtsword = ["",8,9,10,8];
         }
         else if(_loc2_ < 12)
         {
            this.fhtsword = [9,3,4,6,3];
            this.bhtsword = ["",6,7,8,8];
         }
         else if(_loc2_ < 16)
         {
            this.fhtsword = [9,2,3,5,3];
            this.bhtsword = ["",4,5,6,8];
         }
         else if(_loc2_ < 20)
         {
            this.fhtsword = [9,1,2,4,3];
            this.bhtsword = ["",2,3,5,8];
         }
         else
         {
            this.fhtsword = [9,0,1,3,3];
            this.bhtsword = ["",1,3,4,8];
         }
      }
      else if(this.weaponType == "axe")
      {
         _loc2_ = this.skillList[1];
         if(_loc2_ < 4)
         {
            this.fhtaxe = [12,5,7,10,3];
            this.bhtaxe = ["",11,12,15,8];
         }
         else if(_loc2_ < 8)
         {
            this.fhtaxe = [12,4,6,9,3];
            this.bhtaxe = ["",9,11,14,8];
         }
         else if(_loc2_ < 12)
         {
            this.fhtaxe = [12,3,5,8,3];
            this.bhtaxe = ["",7,11,13,8];
         }
         else if(_loc2_ < 16)
         {
            this.fhtaxe = [12,2,4,7,3];
            this.bhtaxe = ["",4,10,12,8];
         }
         else if(_loc2_ < 20)
         {
            this.fhtaxe = [12,1,3,6,3];
            this.bhtaxe = ["",3,8,10,8];
         }
         else
         {
            this.fhtaxe = [12,0,2,5,3];
            this.bhtaxe = ["",1,6,8,8];
         }
      }
      else
      {
         _loc2_ = 0;
      }
      this.fHardTime = this["fht" + this.weaponType];
      this.bHardTime = this["bht" + this.weaponType];
      this.attackMin1 += _loc2_ * 10;
      this.attackMax1 += _loc2_ * 10;
      this.setAttack();
   }
   function uninstWeaponWithSkill()
   {
      var _loc2_;
      if(this.weaponType == "blade")
      {
         _loc2_ = this.skillList[0];
      }
      else if(this.weaponType == "sword")
      {
         _loc2_ = this.skillList[2];
      }
      else if(this.weaponType == "axe")
      {
         _loc2_ = this.skillList[1];
      }
      else
      {
         _loc2_ = 0;
      }
      this.fHardTime = this.fhtnothing;
      this.bHardTime = this.bhtnothing;
      this.attackMin1 -= _loc2_ * 10;
      this.attackMax1 -= _loc2_ * 10;
      this.setAttack();
   }
   function calcWeight()
   {
      this.weight = 0;
      for(var _loc3_ in this.inventoryList)
      {
         if(this.inventoryList[_loc3_].attrib[2] != undefined)
         {
            this.weight += this.inventoryList[_loc3_].attrib[2];
         }
      }
      this.encumbrance0 = this.strength * 5 + 50 + this.skillList[3] * 100;
      this.encumbrance = this.encumbrance0 + this.encumbrance1;
      if(this.weight > this.encumbrance)
      {
         if(!this.overWeight)
         {
            this.overWeight = true;
            this.fric *= 0.25;
         }
      }
      else if(this.overWeight)
      {
         this.overWeight = false;
         this.fric *= 4;
      }
      _root.ui.dlgInv.money.text = this.money;
      _root.ui.dlgInv.weight.text = this.weight + "/" + this.encumbrance;
      if(this.weight > this.encumbrance)
      {
         _root.ui.dlgInv.weight.textColor = 16711680;
      }
      else
      {
         _root.ui.dlgInv.weight.textColor = 16777215;
      }
   }
   function setAttack()
   {
      this.attackMin0 = this.level * 4 + int(this.strength / 2);
      this.attackMax0 = this.level * 4 + int(this.strength / 1);
      this.attack = [this.attackMin0 + this.attackMin1,this.attackMax0 + this.attackMax1];
   }
   function setDefence()
   {
      this.defence0 = this.level * 5 + this.agility * 2;
      this.defence = this.defence0 + this.defence1;
      this.blockRate0 = Math.floor(this.agility / 10);
   }
   function setLuck()
   {
      this.criticalHit0 = int(this.luck / 4);
      this.criticalHit = this.criticalHit0 + this.criticalHit1;
      this.dropRate0 = this.luck;
      this.dropRate = this.dropRate0 + this.dropRate1;
   }
   function saveStatus()
   {
      if(_root.usingMochiCoins)
      {
         this.saveStatusToMC();
      }
      else
      {
         this.saveStatusToSO();
      }
   }
   function saveStatusToMC()
   {
      this.saveData = _root.mochiCoinsSaveData;
      if(_root.areaMode == 0)
      {
         this.saveData.hp = this.hp;
         this.saveData.recoverHp = this.recoverHp;
         this.saveData.sp = this.sp;
      }
      this.saveData.level = this.level;
      this.saveData.exp = this.exp;
      this.saveData.CP = this.CP;
      this.saveData.AP = this.AP;
      this.saveData.strength = this.strength;
      this.saveData.agility = this.agility;
      this.saveData.stamine = this.stamine;
      this.saveData.luck = this.luck;
      this.saveData.questList = [];
      for(var _loc3_ in this.questList)
      {
         this.saveData.questList[_loc3_] = [this.questListInfo[_loc3_][0],this.questListInfo[_loc3_][1],this.questListInfo[_loc3_][2],this.questList[_loc3_].statu,this.questList[_loc3_].currentNumber];
      }
      this.saveData.skillList = [];
      var _loc3_ = 0;
      while(_loc3_ < 22)
      {
         this.saveData.skillList[_loc3_] = 0;
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      while(_loc3_ < 22)
      {
         this.saveData.skillList[_loc3_] = this.skillList[_loc3_];
         _loc3_ = _loc3_ + 1;
      }
      this.saveData.money = this.money;
      this.saveData.inventoryList = [];
      for(_loc3_ in this.inventoryList)
      {
         this.inventoryList[_loc3_].setParam();
         if(this.inventoryList[_loc3_].times != undefined)
         {
            this.saveData.inventoryList[_loc3_] = this.inventoryList[_loc3_].param.concat([this.inventoryList[_loc3_].times]);
         }
         else
         {
            this.saveData.inventoryList[_loc3_] = this.inventoryList[_loc3_].param.concat(["c"]);
         }
      }
      this.saveData.inventoryList1 = [];
      for(_loc3_ in this.inventoryList1)
      {
         this.inventoryList1[_loc3_].setParam();
         if(this.inventoryList[_loc3_].times != undefined)
         {
            this.saveData.inventoryList1[_loc3_] = this.inventoryList1[_loc3_].param.concat([this.inventoryList1[_loc3_].times]);
         }
         else
         {
            this.saveData.inventoryList1[_loc3_] = this.inventoryList1[_loc3_].param.concat(["c"]);
         }
      }
      this.saveData.map16finish = this.map16finish;
      this.saveData.hpFromEmy = this.hpFromEmy;
      this.saveData.spFromEmy = this.spFromEmy;
      this.saveData.chapter = this.chapter;
      this.saveData.phase = this.phase;
      this.saveData.secondaryQuest = [[],[],[],[]];
      this.saveData.secondaryQuest[1][0] = this.secondaryQuest[1][0];
      this.saveData.secondaryQuest[1][1] = this.secondaryQuest[1][1];
      this.saveData.secondaryQuest[1][2] = this.secondaryQuest[1][2];
      this.saveData.secondaryQuest[2][0] = this.secondaryQuest[2][0];
      this.saveData.secondaryQuest[2][1] = this.secondaryQuest[2][1];
      this.saveData.secondaryQuest[2][2] = this.secondaryQuest[2][2];
      this.saveData.secondaryQuest[3][0] = this.secondaryQuest[3][0];
      if(this.tele[0] != undefined)
      {
         this.saveData.tele = [this.tele[0],this.tele[1],this.tele[2]];
      }
      else
      {
         this.saveData.tele = undefined;
      }
      this.saveData.mapVisit = [];
      _loc3_ = 1;
      while(_loc3_ < 17)
      {
         if(typeof this.mapVisit[_loc3_] != "string")
         {
            this.saveData.mapVisit[_loc3_] = _root.mapVisitArrayToString(this.mapVisit[_loc3_]);
         }
         else
         {
            this.saveData.mapVisit[_loc3_] = this.mapVisit[_loc3_];
         }
         _loc3_ = _loc3_ + 1;
      }
      this.saveData.ach = [];
      _loc3_ = 0;
      while(_loc3_ < 24)
      {
         this.saveData.ach[_loc3_] = [this.ach[_loc3_][0],this.ach[_loc3_][1]];
         _loc3_ = _loc3_ + 1;
      }
      this.savePlayTime();
      _root.saveTmpSaveDataToMochiCoinsData();
   }
   function saveStatusToSO()
   {
      this.saveData = SharedObject.getLocal("Arcuz");
      if(this.saveData.flush(1000) != true)
      {
         this.initDataSO();
      }
      if(_root.areaMode == 0)
      {
         this.saveData.data.hp = this.hp;
         this.saveData.data.recoverHp = this.recoverHp;
         this.saveData.data.sp = this.sp;
      }
      this.saveData.data.level = this.level;
      this.saveData.data.exp = this.exp;
      this.saveData.data.CP = this.CP;
      this.saveData.data.AP = this.AP;
      this.saveData.data.strength = this.strength;
      this.saveData.data.agility = this.agility;
      this.saveData.data.stamine = this.stamine;
      this.saveData.data.luck = this.luck;
      this.saveData.data.questList = [];
      for(var _loc3_ in this.questList)
      {
         this.saveData.data.questList[_loc3_] = [this.questListInfo[_loc3_][0],this.questListInfo[_loc3_][1],this.questListInfo[_loc3_][2],this.questList[_loc3_].statu,this.questList[_loc3_].currentNumber];
      }
      this.saveData.data.skillList = [];
      var _loc3_ = 0;
      while(_loc3_ < 22)
      {
         this.saveData.data.skillList[_loc3_] = 0;
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      while(_loc3_ < 22)
      {
         this.saveData.data.skillList[_loc3_] = this.skillList[_loc3_];
         _loc3_ = _loc3_ + 1;
      }
      this.saveData.data.money = this.money;
      this.saveData.data.inventoryList = [];
      for(_loc3_ in this.inventoryList)
      {
         this.inventoryList[_loc3_].setParam();
         if(this.inventoryList[_loc3_].times != undefined)
         {
            this.saveData.data.inventoryList[_loc3_] = this.inventoryList[_loc3_].param.concat([this.inventoryList[_loc3_].times]);
         }
         else
         {
            this.saveData.data.inventoryList[_loc3_] = this.inventoryList[_loc3_].param.concat(["c"]);
         }
      }
      this.saveData.data.inventoryList1 = [];
      for(_loc3_ in this.inventoryList1)
      {
         this.inventoryList1[_loc3_].setParam();
         if(this.inventoryList[_loc3_].times != undefined)
         {
            this.saveData.data.inventoryList1[_loc3_] = this.inventoryList1[_loc3_].param.concat([this.inventoryList1[_loc3_].times]);
         }
         else
         {
            this.saveData.data.inventoryList1[_loc3_] = this.inventoryList1[_loc3_].param.concat(["c"]);
         }
      }
      this.saveData.data.map16finish = this.map16finish;
      this.saveData.data.hpFromEmy = this.hpFromEmy;
      this.saveData.data.spFromEmy = this.spFromEmy;
      this.saveData.data.chapter = this.chapter;
      this.saveData.data.phase = this.phase;
      this.saveData.data.secondaryQuest = [[],[],[],[]];
      this.saveData.data.secondaryQuest[1][0] = this.secondaryQuest[1][0];
      this.saveData.data.secondaryQuest[1][1] = this.secondaryQuest[1][1];
      this.saveData.data.secondaryQuest[1][2] = this.secondaryQuest[1][2];
      this.saveData.data.secondaryQuest[2][0] = this.secondaryQuest[2][0];
      this.saveData.data.secondaryQuest[2][1] = this.secondaryQuest[2][1];
      this.saveData.data.secondaryQuest[2][2] = this.secondaryQuest[2][2];
      this.saveData.data.secondaryQuest[3][0] = this.secondaryQuest[3][0];
      if(this.tele[0] != undefined)
      {
         this.saveData.data.tele = [this.tele[0],this.tele[1],this.tele[2]];
      }
      else
      {
         this.saveData.data.tele = undefined;
      }
      this.saveData.data.mapVisit = [];
      _loc3_ = 1;
      while(_loc3_ < 17)
      {
         if(typeof this.mapVisit[_loc3_] != "string")
         {
            this.saveData.data.mapVisit[_loc3_] = _root.mapVisitArrayToString(this.mapVisit[_loc3_]);
         }
         else
         {
            this.saveData.data.mapVisit[_loc3_] = this.mapVisit[_loc3_];
         }
         _loc3_ = _loc3_ + 1;
      }
      this.saveData.data.ach = [];
      _loc3_ = 0;
      while(_loc3_ < 24)
      {
         this.saveData.data.ach[_loc3_] = [this.ach[_loc3_][0],this.ach[_loc3_][1]];
         _loc3_ = _loc3_ + 1;
      }
      this.savePlayTime();
      this.saveData.flush();
   }
   function savePlayTime()
   {
      if(_root.usingMochiCoins)
      {
         this.saveData = _root.mochiCoinsSaveData;
         this.saveData.totalPlayTime += int((getTimer() - this.beginTime) / 1000);
      }
      else
      {
         this.saveData = SharedObject.getLocal("Arcuz");
         this.saveData.data.totalPlayTime += int((getTimer() - this.beginTime) / 1000);
      }
      this.beginTime = getTimer();
   }
   function readData()
   {
      if(_root.usingMochiCoins)
      {
         this.readDataFromMC();
      }
      else
      {
         this.readDataFromSO();
      }
   }
   function initDataMC()
   {
      this.saveData = _root.mochiCoinsSaveData;
      this.saveData.totalPage = 3 + int(this.saveData.extraPage);
      _root.mochiCoinsSaveData.totalPage = _root.mochiCoinsSaveData.totalPage <= 9 ? _root.mochiCoinsSaveData.totalPage : 9;
      this.saveData.totalPlayTime = 0;
      this.saveData.level = 1;
      this.saveData.exp = 0;
      this.saveData.CP = 0;
      this.saveData.AP = 0;
      this.saveData.strength = 3;
      this.saveData.agility = 3;
      this.saveData.stamine = 3;
      this.saveData.luck = 3;
      this.saveData.questList = [];
      this.saveData.skillList = [];
      var _loc4_ = 0;
      while(_loc4_ < 22)
      {
         this.saveData.skillList[_loc4_] = 0;
         _loc4_ = _loc4_ + 1;
      }
      this.saveData.money = 0;
      this.saveData.inventoryList = [];
      this.saveData.inventoryList1 = [];
      this.saveData.map16finish = 0;
      this.saveData.hpFromEmy = 0;
      this.saveData.spFromEmy = 0;
      this.saveData.chapter = 0;
      this.saveData.phase = 0;
      this.saveData.secondaryQuest = [];
      this.saveData.secondaryQuest[1] = [0,0,0];
      this.saveData.secondaryQuest[2] = [0,0,0];
      this.saveData.secondaryQuest[3] = [0];
      this.saveData.mapVisit = [];
      this.saveData.tele = [];
      this.saveData.ach = [];
      _loc4_ = 0;
      while(_loc4_ < 24)
      {
         this.saveData.ach[_loc4_] = [0,0];
         _loc4_ = _loc4_ + 1;
      }
      _loc4_ = 1;
      while(_loc4_ < 17)
      {
         this.saveData.mapVisit[_loc4_] = "0000000000000000000000000000000000000000000000000000000000000000";
         _loc4_ = _loc4_ + 1;
      }
      for(_loc4_ in _root.quest)
      {
         for(var _loc3_ in _root.quest[_loc4_])
         {
            _root.quest[_loc4_][_loc3_].reset();
         }
      }
      for(_loc4_ in _root.sQuest)
      {
         for(_loc3_ in _root.sQuest[_loc4_])
         {
            _root.sQuest[_loc4_][_loc3_].reset();
         }
      }
      this.level = this.saveData.level;
      this.stamine = this.saveData.stamine;
      this.totalHp1 = 0;
      this.totalSp1 = 0;
      this.setHPSP();
      this.saveData.hp = this.totalHp;
      this.saveData.recoverHp = this.totalHp;
      this.saveData.sp = this.totalSp;
   }
   function readDataFromMC()
   {
      this.saveData = _root.mochiCoinsSaveData;
      this.saveData.totalPage = 3 + int(this.saveData.extraPage);
      _root.mochiCoinsSaveData.totalPage = _root.mochiCoinsSaveData.totalPage <= 9 ? _root.mochiCoinsSaveData.totalPage : 9;
      if(_root.mochiCoinsLoggedIn)
      {
         if(this.saveData.level == undefined)
         {
            this.initDataMC();
         }
      }
      else
      {
         this.initDataMC();
      }
      for(var _loc6_ in this.saveData)
      {
         trace(_loc6_ + " -mochi coins-- " + this.saveData[_loc6_]);
      }
      if(_root.areaMode == 0)
      {
         this.hp = this.saveData.hp != undefined ? this.saveData.hp : 1;
         this.recoverHp = this.saveData.recoverHp != undefined ? this.saveData.recoverHp : 1;
         this.sp = this.saveData.sp != undefined ? this.saveData.sp : 1;
      }
      this.ach = [];
      var _loc5_ = 0;
      while(_loc5_ < 24)
      {
         if(this.saveData.ach[_loc5_][0] != undefined)
         {
            this.ach[_loc5_] = [this.saveData.ach[_loc5_][0],this.saveData.ach[_loc5_][1]];
         }
         else
         {
            this.ach[_loc5_] = [0,0];
         }
         _loc5_ = _loc5_ + 1;
      }
      this.chapter = this.saveData.chapter;
      this.phase = this.saveData.phase;
      this.saveData.totalPlayTime = this.saveData.totalPlayTime != undefined ? this.saveData.totalPlayTime : 0;
      this.level = this.saveData.level;
      this.exp = this.saveData.exp;
      this.CP = this.saveData.CP;
      this.AP = this.saveData.AP;
      this.strength = this.saveData.strength;
      this.agility = this.saveData.agility;
      this.stamine = this.saveData.stamine;
      this.luck = this.saveData.luck;
      this.questList = [];
      this.questListInfo = [];
      var _loc4_;
      for(_loc5_ in this.saveData.questList)
      {
         _loc4_ = this.saveData.questList[_loc5_];
         if(_loc4_[0] == 1)
         {
            this.questList[_loc5_] = _root.quest[_loc4_[1]][_loc4_[2]];
            this.questList[_loc5_].statu = _loc4_[3];
            this.questList[_loc5_].currentNumber = _loc4_[4];
         }
         else
         {
            this.questList[_loc5_] = _root.sQuest[_loc4_[1]][_loc4_[2]];
            this.questList[_loc5_].statu = _loc4_[3];
            this.questList[_loc5_].currentNumber = _loc4_[4];
         }
         this.questListInfo[_loc5_] = [_loc4_[0],_loc4_[1],_loc4_[2]];
      }
      this.skillList = [];
      _loc5_ = 0;
      while(_loc5_ < 22)
      {
         this.skillList[_loc5_] = 0;
         _loc5_ = _loc5_ + 1;
      }
      _loc5_ = 0;
      while(_loc5_ < 22)
      {
         this.skillList[_loc5_] = this.saveData.skillList[_loc5_];
         _loc5_ = _loc5_ + 1;
      }
      this.money = this.saveData.money;
      this.inventoryList = [];
      var _loc3_;
      for(_loc5_ in this.saveData.inventoryList)
      {
         _loc3_ = this.saveData.inventoryList[_loc5_];
         this.inventoryList[_loc5_] = new §[_loc3_[0]]§(_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9],_loc3_[10],_loc3_[11],_loc3_[12],_loc3_[13]);
         if(_loc3_[_loc3_.length - 1] != "c")
         {
            this.inventoryList[_loc5_].times = _loc3_[_loc3_.length - 1];
         }
      }
      this.inventoryList1 = [];
      for(_loc5_ in this.saveData.inventoryList1)
      {
         _loc3_ = this.saveData.inventoryList1[_loc5_];
         this.inventoryList1[_loc5_] = new §[_loc3_[0]]§(_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9],_loc3_[10],_loc3_[11],_loc3_[12],_loc3_[13]);
         if(_loc3_[_loc3_.length - 1] != "c")
         {
            this.inventoryList1[_loc5_].times = _loc3_[_loc3_.length - 1];
         }
      }
      this.map16finish = this.saveData.map16finish;
      this.magicResist = 0;
      this.hpFromEmy = 0;
      this.spFromEmy = 0;
      this.secondaryQuest = [[],[],[],[]];
      this.secondaryQuest[1][0] = this.saveData.secondaryQuest[1][0];
      this.secondaryQuest[1][1] = this.saveData.secondaryQuest[1][1];
      this.secondaryQuest[1][2] = this.saveData.secondaryQuest[1][2];
      this.secondaryQuest[2][0] = this.saveData.secondaryQuest[2][0];
      this.secondaryQuest[2][1] = this.saveData.secondaryQuest[2][1];
      this.secondaryQuest[2][2] = this.saveData.secondaryQuest[2][2];
      this.secondaryQuest[3][0] = this.saveData.secondaryQuest[3][0];
      this.mapVisit = [];
      _loc5_ = 1;
      while(_loc5_ < 17)
      {
         this.mapVisit[_loc5_] = this.saveData.mapVisit[_loc5_];
         _loc5_ = _loc5_ + 1;
      }
      if(this.saveData.tele[0] != undefined)
      {
         this.tele = [this.saveData.tele[0],this.saveData.tele[1],this.saveData.tele[2]];
      }
      this.attackMax1 = this.attackMin1 = 0;
      this.defence1 = 0;
      this.blockRate0 = this.blockRate = this.blockRate1 = 0;
      this.criticalHit1 = 0;
      this.dropRate1 = 0;
      this.totalHp1 = this.totalSp1 = 0;
      this.hpRegain1 = this.spRegain1 = 0;
      this.weaponType = "nothing";
      this.weaponFrame = "nothing";
      this.shieldFrame = "nothing";
      this.wearFrame = "nothing";
      this.helmetFrame = "nothing";
      this.addDmgType = ["none",0];
      this.setAttack();
      this.setDefence();
      this.setLuck();
      this.setHPSP();
      if(_root.areaMode != 0)
      {
         this.hp = this.recoverHp = this.totalHp;
         this.sp = this.totalSp;
      }
      this.setHPSPregain();
      _loc5_ = 10;
      while(_loc5_ < 20)
      {
         this.inventoryList[_loc5_].setup();
         _loc5_ = _loc5_ + 1;
      }
      _loc5_ = 10;
      while(_loc5_ < 20)
      {
         this.inventoryList[_loc5_].remove();
         this.inventoryList[_loc5_].setup();
         _loc5_ = _loc5_ + 1;
      }
   }
   function readDataFromSO()
   {
      this.saveData = SharedObject.getLocal("Arcuz");
      for(var _loc6_ in this.saveData.data)
      {
         trace(_loc6_ + " --SharedObject-- " + this.saveData.data[_loc6_]);
      }
      if(this.saveData.data.level == undefined)
      {
         this.initDataSO();
      }
      if(_root.areaMode == 0)
      {
         this.hp = this.saveData.data.hp != undefined ? this.saveData.data.hp : 1;
         this.recoverHp = this.saveData.data.recoverHp != undefined ? this.saveData.data.recoverHp : 1;
         this.sp = this.saveData.data.sp != undefined ? this.saveData.data.sp : 1;
      }
      this.ach = [];
      var _loc5_ = 0;
      while(_loc5_ < 24)
      {
         if(this.saveData.data.ach[_loc5_][0] != undefined)
         {
            this.ach[_loc5_] = [this.saveData.data.ach[_loc5_][0],this.saveData.data.ach[_loc5_][1]];
         }
         else
         {
            this.ach[_loc5_] = [0,0];
         }
         _loc5_ = _loc5_ + 1;
      }
      this.chapter = this.saveData.data.chapter;
      this.phase = this.saveData.data.phase;
      this.saveData.data.totalPlayTime = this.saveData.data.totalPlayTime != undefined ? this.saveData.data.totalPlayTime : 0;
      this.level = this.saveData.data.level;
      this.exp = this.saveData.data.exp;
      this.CP = this.saveData.data.CP;
      this.AP = this.saveData.data.AP;
      this.strength = this.saveData.data.strength;
      this.agility = this.saveData.data.agility;
      this.stamine = this.saveData.data.stamine;
      this.luck = this.saveData.data.luck;
      this.questList = [];
      this.questListInfo = [];
      var _loc4_;
      for(_loc5_ in this.saveData.data.questList)
      {
         _loc4_ = this.saveData.data.questList[_loc5_];
         if(_loc4_[0] == 1)
         {
            this.questList[_loc5_] = _root.quest[_loc4_[1]][_loc4_[2]];
            this.questList[_loc5_].statu = _loc4_[3];
            this.questList[_loc5_].currentNumber = _loc4_[4];
         }
         else
         {
            this.questList[_loc5_] = _root.sQuest[_loc4_[1]][_loc4_[2]];
            this.questList[_loc5_].statu = _loc4_[3];
            this.questList[_loc5_].currentNumber = _loc4_[4];
         }
         this.questListInfo[_loc5_] = [_loc4_[0],_loc4_[1],_loc4_[2]];
      }
      this.skillList = [];
      _loc5_ = 0;
      while(_loc5_ < 22)
      {
         this.skillList[_loc5_] = 0;
         _loc5_ = _loc5_ + 1;
      }
      _loc5_ = 0;
      while(_loc5_ < 22)
      {
         this.skillList[_loc5_] = this.saveData.data.skillList[_loc5_];
         _loc5_ = _loc5_ + 1;
      }
      this.money = this.saveData.data.money;
      this.inventoryList = [];
      var _loc3_;
      for(_loc5_ in this.saveData.data.inventoryList)
      {
         _loc3_ = this.saveData.data.inventoryList[_loc5_];
         this.inventoryList[_loc5_] = new §[_loc3_[0]]§(_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9],_loc3_[10],_loc3_[11],_loc3_[12],_loc3_[13]);
         if(_loc3_[_loc3_.length - 1] != "c")
         {
            this.inventoryList[_loc5_].times = _loc3_[_loc3_.length - 1];
         }
      }
      this.inventoryList1 = [];
      for(_loc5_ in this.saveData.data.inventoryList1)
      {
         _loc3_ = this.saveData.data.inventoryList1[_loc5_];
         this.inventoryList1[_loc5_] = new §[_loc3_[0]]§(_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9],_loc3_[10],_loc3_[11],_loc3_[12],_loc3_[13]);
         if(_loc3_[_loc3_.length - 1] != "c")
         {
            this.inventoryList1[_loc5_].times = _loc3_[_loc3_.length - 1];
         }
      }
      this.map16finish = this.saveData.data.map16finish;
      this.magicResist = 0;
      this.hpFromEmy = 0;
      this.spFromEmy = 0;
      this.secondaryQuest = [[],[],[],[]];
      this.secondaryQuest[1][0] = this.saveData.data.secondaryQuest[1][0];
      this.secondaryQuest[1][1] = this.saveData.data.secondaryQuest[1][1];
      this.secondaryQuest[1][2] = this.saveData.data.secondaryQuest[1][2];
      this.secondaryQuest[2][0] = this.saveData.data.secondaryQuest[2][0];
      this.secondaryQuest[2][1] = this.saveData.data.secondaryQuest[2][1];
      this.secondaryQuest[2][2] = this.saveData.data.secondaryQuest[2][2];
      this.secondaryQuest[3][0] = this.saveData.data.secondaryQuest[3][0];
      this.mapVisit = [];
      _loc5_ = 1;
      while(_loc5_ < 17)
      {
         this.mapVisit[_loc5_] = this.saveData.data.mapVisit[_loc5_];
         _loc5_ = _loc5_ + 1;
      }
      if(this.saveData.data.tele[0] != undefined)
      {
         this.tele = [this.saveData.data.tele[0],this.saveData.data.tele[1],this.saveData.data.tele[2]];
      }
      this.attackMax1 = this.attackMin1 = 0;
      this.defence1 = 0;
      this.blockRate0 = this.blockRate = this.blockRate1 = 0;
      this.criticalHit1 = 0;
      this.dropRate1 = 0;
      this.totalHp1 = this.totalSp1 = 0;
      this.hpRegain1 = this.spRegain1 = 0;
      this.weaponType = "nothing";
      this.weaponFrame = "nothing";
      this.shieldFrame = "nothing";
      this.wearFrame = "nothing";
      this.helmetFrame = "nothing";
      this.addDmgType = ["none",0];
      this.setAttack();
      this.setDefence();
      this.setLuck();
      this.setHPSP();
      if(_root.areaMode != 0)
      {
         this.hp = this.recoverHp = this.totalHp;
         this.sp = this.totalSp;
      }
      this.setHPSPregain();
      _loc5_ = 10;
      while(_loc5_ < 20)
      {
         this.inventoryList[_loc5_].setup();
         _loc5_ = _loc5_ + 1;
      }
      _loc5_ = 10;
      while(_loc5_ < 20)
      {
         this.inventoryList[_loc5_].remove();
         this.inventoryList[_loc5_].setup();
         _loc5_ = _loc5_ + 1;
      }
   }
   function initDataSO()
   {
      this.saveData = SharedObject.getLocal("Arcuz");
      this.saveData.data.totalPage = 3;
      this.saveData.data.totalPlayTime = 0;
      this.saveData.data.level = 1;
      this.saveData.data.exp = 0;
      this.saveData.data.CP = 0;
      this.saveData.data.AP = 0;
      this.saveData.data.strength = 3;
      this.saveData.data.agility = 3;
      this.saveData.data.stamine = 3;
      this.saveData.data.luck = 3;
      this.saveData.data.questList = [];
      this.saveData.data.skillList = [];
      var _loc4_ = 0;
      while(_loc4_ < 22)
      {
         this.saveData.data.skillList[_loc4_] = 0;
         _loc4_ = _loc4_ + 1;
      }
      this.saveData.data.money = 0;
      this.saveData.data.inventoryList = [];
      this.saveData.data.inventoryList1 = [];
      this.saveData.data.map16finish = 0;
      this.saveData.data.hpFromEmy = 0;
      this.saveData.data.spFromEmy = 0;
      this.saveData.data.chapter = 0;
      this.saveData.data.phase = 0;
      this.saveData.data.secondaryQuest = [];
      this.saveData.data.secondaryQuest[1] = [0,0,0];
      this.saveData.data.secondaryQuest[2] = [0,0,0];
      this.saveData.data.secondaryQuest[3] = [0];
      this.saveData.data.mapVisit = [];
      this.saveData.data.tele = [];
      this.saveData.data.ach = [];
      _loc4_ = 0;
      while(_loc4_ < 24)
      {
         this.saveData.data.ach[_loc4_] = [0,0];
         _loc4_ = _loc4_ + 1;
      }
      _loc4_ = 1;
      while(_loc4_ < 17)
      {
         this.saveData.data.mapVisit[_loc4_] = "0000000000000000000000000000000000000000000000000000000000000000";
         _loc4_ = _loc4_ + 1;
      }
      for(_loc4_ in _root.quest)
      {
         for(var _loc3_ in _root.quest[_loc4_])
         {
            _root.quest[_loc4_][_loc3_].reset();
         }
      }
      for(_loc4_ in _root.sQuest)
      {
         for(_loc3_ in _root.sQuest[_loc4_])
         {
            _root.sQuest[_loc4_][_loc3_].reset();
         }
      }
      this.level = this.saveData.data.level;
      this.stamine = this.saveData.data.stamine;
      this.totalHp1 = 0;
      this.totalSp1 = 0;
      this.setHPSP();
      this.saveData.data.hp = this.totalHp;
      this.saveData.data.recoverHp = this.totalHp;
      this.saveData.data.sp = this.totalSp;
   }
   function die()
   {
      if(this.iceDmg._x != undefined)
      {
         this.fric *= 2;
         this.iceDmg.removeMovieClip();
      }
      this.thunderDmg.removeMovieClip();
      this.poisonDmg.removeMovieClip();
      var _loc3_;
      if(this.revive)
      {
         this.mc.gotoAndStop("die");
         this.defLv = 1000;
         this.enterframe = function()
         {
         };
         this.reviveController = this.createEmptyMovieClip("reviveController",this.getNextHighestDepth());
         this.reviveController.counter = 70;
         this.reviveController.onEnterFrame = function()
         {
            if(--this.counter == 10)
            {
               this._parent.mc.gotoAndStop("hit");
               this._parent.attachMovie("神圣之光","hlylit",this._parent.getNextHighestDepth());
               _root.playSound1("复活.mp3");
               this._parent.hlylit.blendMode = 8;
            }
            else if(this.counter < -30)
            {
               this._parent.revive = false;
               this._parent.defLv = 3;
               this._parent.hit = false;
               this._parent.action();
               this._parent.hlylit.removeMovieClip();
               if(this._parent.hollyLightCounter.onEnterFrame)
               {
                  this._parent.hollyLightCounter.uiMc.remove();
                  this._parent.totalHp1 -= this._parent.hollyLightCounter.hp;
                  this._parent.totalSp1 -= this._parent.hollyLightCounter.sp;
                  this._parent.setHPSP();
                  this._parent.revive = false;
                  this._parent.hollyLightCounter.removeMovieClip();
               }
               if(_root.archangle._x != undefined)
               {
                  this._parent.totalHp1 -= _root.archangle.hp;
                  this._parent.totalSp1 -= _root.archangle.sp;
                  this._parent.setHPSP();
                  this._parent.revive = false;
                  _root.archangle.removeMovieClip();
               }
               for(var _loc3_ in _root.ui.uiPlayerState)
               {
                  _root.ui.uiPlayerState[_loc3_].removeMovieClip();
               }
               _root.ui.uiPlayerState.mcNum = 0;
               this._parent.hp = this._parent.recoverHp = this._parent.totalHp;
               this._parent.sp = this._parent.totalSp;
               _root.ui.hp.mask._x = 142;
               _root.ui.recoverHp.mask._x = 142;
               _root.ui.sp.mask._x = 142;
               this.removeMovieClip();
            }
         };
      }
      else
      {
         this.resist = 10;
         this.hpCounter.onEnterFrame = function()
         {
            if(--this._parent.recoverHp < 0)
            {
               _root.ui.recoverHp.mask._x = 0;
               this.removeMovieClip();
            }
            else
            {
               _root.ui.recoverHp.mask._x = this._parent.recoverHp * 142 / this._parent.totalHp;
            }
         };
         if(this.weaponFrame != "nothing")
         {
            _loc3_ = this._parent.attachMovie("dropWeapon","dropWeapon",this._parent.getNextHighestDepth());
            _loc3_.gotoAndStop(this.weaponFrame);
            _loc3_._x = this._x;
            _loc3_.h = - (20 + random(20));
            _loc3_._y = this._y + _loc3_.h;
            _loc3_.xs = (2 * random(2) - 1) * (Math.random() * 2 + 0.2);
            _loc3_.ys = -4 - random(4);
            _loc3_.dir = random(360);
            _loc3_.speed = Math.random() * 2;
            _loc3_.dx = _loc3_.speed * Math.cos(_loc3_.dir * 0.0174);
            _loc3_.dy = _loc3_.speed * Math.sin(_loc3_.dir * 0.0174);
            _loc3_.onEnterFrame = function()
            {
               this.ys += 0.5;
               this._rotation += 30;
               this._x += this.dx;
               this._y += this.dy;
               this._y += this.ys;
               this.h += this.ys;
               if(this.h >= 0)
               {
                  this.ys *= -0.5;
                  if(Math.abs(this.ys) < 0.1)
                  {
                     delete this.onEnterFrame;
                  }
               }
            };
         }
         if(this.shieldFrame != "nothing")
         {
            _loc3_ = this._parent.attachMovie("dropWeapon","dropShield",this._parent.getNextHighestDepth());
            _loc3_.gotoAndStop(this.shieldFrame);
            _loc3_._x = this._x;
            _loc3_.h = - (20 + random(20));
            _loc3_._y = this._y + _loc3_.h;
            _loc3_.xs = (2 * random(2) - 1) * (Math.random() * 2 + 0.2);
            _loc3_.ys = -4 - random(4);
            _loc3_.dir = random(360);
            _loc3_.speed = Math.random() * 2;
            _loc3_.dx = _loc3_.speed * Math.cos(_loc3_.dir * 0.0174);
            _loc3_.dy = _loc3_.speed * Math.sin(_loc3_.dir * 0.0174);
            _loc3_.onEnterFrame = function()
            {
               this.ys += 0.5;
               this._rotation += 30;
               this._x += this.dx;
               this._y += this.dy;
               this._y += this.ys;
               this.h += this.ys;
               if(this.h >= 0)
               {
                  this.ys *= -0.5;
                  if(Math.abs(this.ys) < 0.1)
                  {
                     delete this.onEnterFrame;
                  }
               }
            };
         }
         if(this.helmetFrame != "nothing")
         {
            _loc3_ = this._parent.attachMovie("dropWeapon","dropHelmet",this._parent.getNextHighestDepth());
            _loc3_.gotoAndStop(this.helmetFrame);
            _loc3_.checkHitWall = this.checkHitWall;
            _loc3_._x = this._x;
            _loc3_.h = - (20 + random(20));
            _loc3_._y = this._y + _loc3_.h;
            _loc3_.xs = (2 * random(2) - 1) * (Math.random() * 2 + 0.2);
            _loc3_.ys = -4 - random(4);
            _loc3_.dir = random(360);
            _loc3_.speed = Math.random() * 2;
            _loc3_.dx = _loc3_.speed * Math.cos(_loc3_.dir * 0.0174);
            _loc3_.dy = _loc3_.speed * Math.sin(_loc3_.dir * 0.0174);
            _loc3_.onEnterFrame = function()
            {
               this.ys += 0.5;
               this._rotation += 30;
               this._x += this.dx;
               this._y += this.dy;
               this._y += this.ys;
               this.h += this.ys;
               if(this.h >= 0)
               {
                  this.ys *= -0.5;
                  if(Math.abs(this.ys) < 0.1)
                  {
                     delete this.onEnterFrame;
                  }
               }
            };
         }
         this.mc.gotoAndStop("die");
         this.enterframe = function()
         {
         };
         _root.playMusic("死亡.mp3",false);
         if(_root.areaMode != 0)
         {
            if(_root.gameOverMc._x == undefined)
            {
               _root.attachMovie("gameOverMc2","gameOverMc",_root.getNextHighestDepth());
            }
         }
         else
         {
            _root.attachMovie("gameOverMc","gameOverMc",_root.getNextHighestDepth());
         }
      }
   }
   function hitEffect(type)
   {
      var _loc2_ = this._parent.attachMovie("hitEffectHero","ef" + this._parent.getNextHighestDepth(),this._parent.getNextHighestDepth(),{_x:this._x + random(10) - 5,_y:this.att + this._y - random(this.h)});
      _loc2_._rotation = random(180);
      _loc2_.blendMode = 3;
   }
   function decHp(val)
   {
      if(this.unbreakable)
      {
         return undefined;
      }
      this.hp -= val;
      this.recoverHp -= int(val / 2);
      _root.ui.hp.mask._x = this.hp * 142 / this.totalHp;
      _root.ui.recoverHp.mask._x = this.recoverHp * 142 / this.totalHp;
      if(this.hpCounter._x == undefined)
      {
         this.createEmptyMovieClip("hpCounter",this.getNextHighestDepth());
         this.hpCounter.counter = 0;
         this.hpCounter.onEnterFrame = function()
         {
            if(!_root.game.pauseAllCharacters)
            {
               if(++this.counter > 200)
               {
                  this.counter = 0;
                  if(this._parent.hp < this._parent.recoverHp)
                  {
                     this._parent.hp += int(this._parent.hpRegain * this._parent.totalHp / 100) + 1;
                     this._parent.hp = this._parent.hp <= this._parent.recoverHp ? this._parent.hp : this._parent.recoverHp;
                     _root.ui.hp.mask._x = this._parent.hp * 142 / this._parent.totalHp;
                     _root.ui.recoverHp.mask._x = this._parent.recoverHp * 142 / this._parent.totalHp;
                     _root.ui.dlgChar.hpNow.text = this._parent.hp + "/" + this._parent.totalHp;
                  }
                  else
                  {
                     _root.ui.hp.mask._x = this._parent.hp * 142 / this._parent.totalHp;
                     _root.ui.recoverHp.mask._x = this._parent.recoverHp * 142 / this._parent.totalHp;
                     _root.ui.dlgChar.hpNow.text = this._parent.hp + "/" + this._parent.totalHp;
                     this._parent.hp = this._parent.recoverHp;
                     this.removeMovieClip();
                  }
               }
            }
         };
      }
   }
   function addHp(val)
   {
      if(this.hp > 0)
      {
         this.hp += val;
         if(this.hp > this.totalHp)
         {
            this.hp = this.recoverHp = this.totalHp;
         }
         if(this.recoverHp > this.totalHp)
         {
            this.recoverHp = this.totalHp;
         }
         if(this.hp > this.recoverHp)
         {
            this.recoverHp = this.hp;
         }
         _root.ui.hp.mask._x = this.hp * 142 / this.totalHp;
         _root.ui.recoverHp.mask._x = this.recoverHp * 142 / this.totalHp;
      }
   }
   function addSp(val)
   {
      if(this.hp > 0)
      {
         this.sp += val;
         if(this.sp > this.totalSp)
         {
            this.sp = this.totalSp;
         }
         _root.ui.sp.mask._x = this.sp * 142 / this.totalSp;
      }
   }
   function decSp(val)
   {
      if(this.sp > val)
      {
         this.sp -= val;
         _root.ui.sp.mask._x = this.sp * 142 / this.totalSp;
         if(this.spCounter._x == undefined)
         {
            this.spCounter = this.createEmptyMovieClip("spCounter",this.getNextHighestDepth());
            this.spCounter.counter = 0;
            this.spCounter.onEnterFrame = function()
            {
               if(!_root.game.pauseAllCharacters)
               {
                  if(++this.counter > 200)
                  {
                     this.counter = 0;
                     if(this._parent.spRegain == 0)
                     {
                        this.removeMovieClip();
                     }
                     else if(this._parent.sp < this._parent.totalSp)
                     {
                        this._parent.sp += Math.ceil(this._parent.spRegain * this._parent.totalSp / 100);
                        this._parent.sp = this._parent.sp <= this._parent.totalSp ? this._parent.sp : this._parent.totalSp;
                        _root.ui.sp.mask._x = this._parent.sp * 142 / this._parent.totalSp;
                        _root.ui.dlgChar.spNow.text = this._parent.sp + "/" + this._parent.totalSp;
                     }
                     else
                     {
                        _root.ui.dlgChar.spNow.text = this._parent.sp + "/" + this._parent.totalSp;
                        _root.ui.sp.mask._x = this._parent.sp * 142 / this._parent.totalSp;
                        _root.ui.dlgChar.spNow.text = this._parent.sp + "/" + this._parent.totalSp;
                        this.removeMovieClip();
                     }
                  }
               }
            };
         }
         return true;
      }
      return false;
   }
   function hitAction2(dmg, type, hitHT)
   {
      _root.game.hitCombo.endCombo();
      this.mc.gotoAndStop("hit");
      this.mc.mc.gotoAndPlay(1);
      _root.playSound1("击中" + (random(2) + 1));
      this.decHp(dmg);
      if(this.hp <= 0)
      {
         this.hp = 0;
         _root.ui.hp.mask._x = 0;
      }
      var _loc4_;
      if(!this.hit)
      {
         this.hit = true;
         this.attacking = false;
         this.attackMode = 0;
         this.nextAttackMode = 0;
         this.atkLv = 5;
         this.defLv = 3;
         this.fhtCount = this.bhtCount = -1;
         this.comboCount = 0;
         this.delFilter();
         this.shadowController.delShadow();
         if(!this.tmpRcvhp)
         {
            _loc4_ = this.createEmptyMovieClip("tmpRcvhp",this.getNextHighestDepth());
            _loc4_.onEnterFrame = function()
            {
               _root.ui.recoverHp.mask._x += (this._parent.recoverHp * 142 / this._parent.totalHp - _root.ui.recoverHp.mask._x) / 10;
               if(Math.abs(_root.ui.recoverHp.mask._x - this._parent.recoverHp * 142 / this._parent.totalHp) < 0.5)
               {
                  _root.ui.recoverHp.mask._x = this._parent.recoverHp * 142 / this._parent.totalHp;
                  this.removeMovieClip();
               }
            };
         }
         if(type == "critical")
         {
            this.counter = this.hitHardTime + 10;
         }
         else
         {
            this.counter = this.hitHardTime;
         }
         if(hitHT != undefined)
         {
            this.counter += hitHT;
         }
         this.enterframe = function()
         {
            this.mainAction();
            if(!this.jump)
            {
               this.xSpeed *= 0.7;
               this.ySpeed *= 0.7;
            }
            this.counter = this.counter - 1;
            if(!this.jump)
            {
               if(this.hp <= 0)
               {
                  this.die();
               }
               else if(this.counter < 0)
               {
                  this.hit = false;
                  this.action();
               }
            }
         };
      }
      else if(hitHT == 65 && this.thunderDmg._x != undefined)
      {
         this.counter += 10;
      }
   }
   function checkAttack()
   {
      var _loc3_ = Key.isDown;
      var _loc4_;
      if(_loc3_(this.KeyJ))
      {
         if(!this.KeyJPressed)
         {
            this.KeyJPressed = true;
            if(this.weaponType == "blade")
            {
               _loc4_ = [1,3,2,3,1];
            }
            else if(this.weaponType == "sword")
            {
               _loc4_ = [1,3,2,3,2];
            }
            else if(this.weaponType == "axe")
            {
               _loc4_ = [1,3,2,1,3];
            }
            else
            {
               _loc4_ = [2,1,3,1];
            }
            if(this.attacking)
            {
               if(this.nextAttackMode == 0)
               {
                  this.nextAttackMode = _loc4_[this.comboCount];
               }
            }
            else if(this.jump && this.jumpSpeed >= 0)
            {
               this.startAttack(3);
            }
            else
            {
               this.startAttack(1);
            }
         }
      }
      else
      {
         this.KeyJPressed = false;
      }
      if(_loc3_(this.KeyI))
      {
         if(!this.KeyIPressed)
         {
            this.KeyIPressed = true;
            if(_root.ui.skillIMc.weapon == "none" || _root.ui.skillIMc.weapon == this.weaponType)
            {
               if(this.skillI == this.bladeFinalAttack)
               {
                  if(this.finalHit == 4)
                  {
                     this.skillI();
                  }
               }
               if(_root.ui.skillIMc.func())
               {
                  this.skillI();
               }
            }
         }
      }
      else
      {
         this.KeyIPressed = false;
      }
      if(_loc3_(this.KeyL))
      {
         if(!this.KeyLPressed)
         {
            this.KeyLPressed = true;
            if(_root.ui.skillLMc.weapon == "none" || _root.ui.skillLMc.weapon == this.weaponType)
            {
               if(this.skillL == this.bladeFinalAttack)
               {
                  if(this.finalHit == 4)
                  {
                     this.skillL();
                  }
               }
               if(_root.ui.skillLMc.func())
               {
                  this.skillL();
               }
            }
         }
      }
      else
      {
         this.KeyLPressed = false;
      }
      if(_root.mouseCursor.doubleClick)
      {
         _root.mouseCursor.doubleClick = false;
      }
   }
   function checkTurn()
   {
      var _loc4_ = 0;
      var _loc3_ = 0;
      var _loc2_ = Key.isDown;
      if(_loc2_(this.KeyUp) || _loc2_(this.KeyUp1))
      {
         _loc3_ = -10;
      }
      else if(_loc2_(this.KeyDown) || _loc2_(this.KeyDown1))
      {
         _loc3_ = 10;
      }
      if(_loc2_(this.KeyLeft) || _loc2_(this.KeyLeft1))
      {
         _loc4_ = -1;
      }
      else if(_loc2_(this.KeyRight) || _loc2_(this.KeyRight1))
      {
         _loc4_ = 1;
      }
      return _loc4_ + _loc3_;
   }
   function talkTo(npc)
   {
      var _loc3_ = this._parent._parent.getRotation(this._x,this._y,npc._x,npc._y);
      var _loc4_ = this.translateDegreeToFrame(_loc3_);
      var _loc6_ = this._parent._parent.getRotation(npc._x,npc._y,this._x,this._y);
      var _loc5_ = this.translateDegreeToFrame(_loc6_);
      npc.gotoAndStop(_loc5_);
      if(this._parent.special != "town")
      {
         return undefined;
      }
      this.gotoAndStop(_loc4_); //unpopped
      this.mc.gotoAndStop("stand");
      this.ySpeed = 0;
      this.xSpeed = 0;
      this.mainAction();
      this.enterframe = function()
      {
         this.mainAction();
      };
   }
   function inTown()
   {
      this.resist = 0;
      this.mc.gotoAndStop("stand");
      this.enterframe = function()
      {
         var _loc6_ = Key.isDown;
         var _loc5_ = this.checkTurn();
         var _loc4_;
         var _loc3_;
         if(_loc5_ == 0)
         {
            if(!this.jump)
            {
               if(this.xSpeed != 0 || this.ySpeed != 0)
               {
                  this.ySpeed = Math.abs(this.ySpeed) >= 0.1 ? this.ySpeed * 0.7 : 0;
                  this.xSpeed = Math.abs(this.xSpeed) >= 0.1 ? this.xSpeed * 0.7 : 0;
               }
               if(this.mc._currentframe == 11)
               {
                  if(this.mc.mc._currentframe == 6 || this.mc.mc._currentframe == 16)
                  {
                     this.mc.gotoAndStop("stand");
                     this.ySpeed = 0;
                     this.xSpeed = 0;
                  }
               }
               else if(this.mc._currentframe == 20)
               {
                  if(this.mc.mc._currentframe == 1 || this.mc.mc._currentframe == 10)
                  {
                     this.mc.gotoAndStop("stand");
                     this.ySpeed = 0;
                     this.xSpeed = 0;
                  }
               }
            }
            else
            {
               this.ySpeed *= 0.7;
               this.xSpeed *= 0.7;
            }
         }
         else
         {
            _loc4_ = super.translateNumToFrame(_loc5_);
            super.gotoFrame(_loc4_);
            _loc3_ = this.translateFrameToDegree(_loc4_);
            this.xSpeed = this.speed * Math.cos(_loc3_ * 0.0174);
            this.ySpeed = this.speed * Math.sin(_loc3_ * 0.0174);
            this.mc._y = this.att;
            if(this.jump)
            {
               this.mc.gotoAndStop("jump");
            }
            else
            {
               this.mc.gotoAndStop("run");
            }
         }
         this.mainAction();
      };
   }
   function action()
   {
      this.attacking = false;
      if(this._parent.special == "town")
      {
         this.inTown();
         return undefined;
      }
      this.resist = 0;
      this.mc.gotoAndStop("stand");
      this.enterframe = function()
      {
         var _loc9_ = Key.isDown;
         var _loc8_ = this.checkTurn();
         var _loc7_;
         var _loc5_;
         if(_loc8_ == 0)
         {
            if(!this.jump)
            {
               if(this.xSpeed != 0 || this.ySpeed != 0)
               {
                  this.ySpeed = Math.abs(this.ySpeed) >= 0.1 ? this.ySpeed * 0.7 : 0;
                  this.xSpeed = Math.abs(this.xSpeed) >= 0.1 ? this.xSpeed * 0.7 : 0;
               }
               if(this.mc._currentframe == 11)
               {
                  if(this.mc.mc._currentframe == 6 || this.mc.mc._currentframe == 16)
                  {
                     this.mc.gotoAndStop("stand");
                     this.ySpeed = 0;
                     this.xSpeed = 0;
                  }
               }
               else if(this.mc._currentframe == 20)
               {
                  if(this.mc.mc._currentframe == 1 || this.mc.mc._currentframe == 10)
                  {
                     this.mc.gotoAndStop("stand");
                     this.ySpeed = 0;
                     this.xSpeed = 0;
                  }
               }
            }
            else
            {
               this.ySpeed *= 0.7;
               this.xSpeed *= 0.7;
            }
         }
         else
         {
            _loc7_ = super.translateNumToFrame(_loc8_);
            super.gotoFrame(_loc7_);
            _loc5_ = this.translateFrameToDegree(_loc7_);
            this.xSpeed = this.speed * Math.cos(_loc5_ * 0.0174);
            this.ySpeed = this.speed * Math.sin(_loc5_ * 0.0174);
            this.mc._y = this.att;
            if(!this.attacking)
            {
               if(this.jump)
               {
                  this.mc.gotoAndStop("jump");
               }
               else
               {
                  this.mc.gotoAndStop("run");
               }
            }
         }
         var _loc6_;
         var _loc4_;
         if(!this.jump || this.canJump)
         {
            if(_loc9_(this.KeyK))
            {
               if(!this.keyJumpDown)
               {
                  _root.playSound1("跳");
                  if(this.jump && this.canJump)
                  {
                     _loc6_ = _root.game.map.getNextHighestDepth();
                     _loc4_ = _root.game.map.attachMovie("踩踏","fx" + _loc6_,_loc6_);
                     _loc4_._x = this._x;
                     _loc4_._y = this._y + this.mc._y;
                     _loc4_.blendMode = "add";
                  }
                  super.startJump();
                  this.canJump = false;
                  this.keyJumpDown = true;
               }
            }
            else
            {
               this.keyJumpDown = false;
            }
         }
         this.checkAttack();
         this.mainAction();
      };
   }
   function checkHit(exDmg)
   {
      if(exDmg == undefined)
      {
         exDmg = 1;
      }
      var _loc10_ = this._parent._parent.unitManager.unitArray;
      var _loc16_ = 0;
      if(this.finalHit)
      {
         _loc16_ = 10;
         if(this.attackMode == 2)
         {
            _loc16_ += 200;
         }
      }
      var _loc4_;
      var _loc11_;
      var _loc13_;
      var _loc12_;
      var _loc7_;
      var _loc5_;
      var _loc6_;
      var _loc8_;
      var _loc14_;
      var _loc15_;
      for(var _loc17_ in _loc10_)
      {
         if(_loc10_[_loc17_] != this)
         {
            _loc4_ = _loc10_[_loc17_];
            _loc11_ = this._parent._parent.getRotation(this._x,this._y,_loc4_._x,_loc4_._y);
            if(this.jump)
            {
               if(this.attackMode == 3 && this.comboCount == 1)
               {
                  _loc13_ = - this.att + this.h > - _loc4_.att;
                  _loc12_ = true;
                  if(this.shadowController.controlMc._x == undefined)
                  {
                     this.shadowController = new Shadows(this);
                  }
               }
               else if(this.attackMode == 4)
               {
                  _loc12_ = true;
                  _loc13_ = this.att < _loc4_.h + _loc4_.att && this.h + this.att > _loc4_.att;
               }
               else
               {
                  _loc13_ = this.att < _loc4_.h + _loc4_.att && this.h + this.att > _loc4_.att;
               }
            }
            else
            {
               _loc13_ = this.att > - _loc4_.h + _loc4_.att && - this.h + this.att < _loc4_.att;
            }
            if(_loc13_)
            {
               if(this._parent._parent.getDis(this._x,this._y,_loc4_._x,_loc4_._y) < 45 + _loc16_ + _loc4_.hitMc._width / 2)
               {
                  _loc7_ = this._parent._parent.getDegree1(_loc11_,super.translateFrameToDegree(this._currentframe));
                  this.getMinDir(_loc4_,_loc7_);
                  if(this.attackMode == 2)
                  {
                     if(_loc7_ < 50)
                     {
                        _loc5_ = this._parent._parent.getRotation(this._x,this._y,_loc4_._x,_loc4_._y);
                        _loc6_ = this.getDamage(_loc4_,0);
                        _loc8_ = "normal";
                        if(this.finalHit)
                        {
                           _loc8_ = "finalHit";
                           _loc4_.startJump(3);
                           _loc14_ = 8;
                           _loc6_ += _loc6_ * this.skillList[9] / 5;
                        }
                        _loc15_ = true;
                        _loc6_ *= exDmg;
                        _loc4_.hitAction(int(_loc6_),_loc8_,_loc14_,this.atkLv,this.addDmgType,this.criticalHit);
                     }
                  }
                  else if(this.attackMode == 1)
                  {
                     if(_loc7_ < 80)
                     {
                        _loc5_ = this._parent._parent.getRotation(this._x,this._y,_loc4_._x,_loc4_._y);
                        _loc6_ = this.getDamage(_loc4_,0);
                        _loc8_ = "normal";
                        if(this.finalHit)
                        {
                           _loc8_ = "finalHit";
                           _loc4_.startJump(30 + random(8));
                           if(_loc4_.blow)
                           {
                              _loc4_.xSpeed = Math.cos(_loc5_ * 0.0174);
                              _loc4_.ySpeed = Math.sin(_loc5_ * 0.0174);
                           }
                           _loc6_ += _loc6_ * this.skillList[7] / 5;
                           _loc14_ = 8;
                        }
                        else if(_loc4_.blow)
                        {
                           _loc4_.xSpeed = 2 * Math.cos(_loc5_ * 0.0174);
                           _loc4_.ySpeed = 2 * Math.sin(_loc5_ * 0.0174);
                        }
                        _loc15_ = true;
                        _loc6_ *= exDmg;
                        _loc4_.hitAction(int(_loc6_),_loc8_,_loc14_,this.atkLv,this.addDmgType,this.criticalHit);
                     }
                  }
                  else
                  {
                     _loc5_ = this._parent._parent.getRotation(this._x,this._y,_loc4_._x,_loc4_._y);
                     _loc6_ = this.getDamage(_loc4_,0);
                     _loc8_ = "normal";
                     if(this.finalHit)
                     {
                        _loc8_ = "finalHit";
                        _loc4_.startJump(5);
                        if(_loc4_.blow)
                        {
                           _loc4_.xSpeed = 4 * Math.cos(_loc5_ * 0.0174);
                           _loc4_.ySpeed = 4 * Math.sin(_loc5_ * 0.0174);
                        }
                        _loc6_ += _loc6_ * this.skillList[8] / 5;
                        _loc14_ = 15;
                     }
                     else if(_loc12_)
                     {
                        _loc4_.xSpeed = 15 * Math.cos(_loc5_ * 0.0174);
                        _loc4_.ySpeed = 15 * Math.sin(_loc5_ * 0.0174);
                        _loc4_.jumpSpeed += 4;
                     }
                     else if(_loc4_.blow)
                     {
                        _loc4_.xSpeed = 4 * Math.cos(_loc5_ * 0.0174);
                        _loc4_.ySpeed = 4 * Math.sin(_loc5_ * 0.0174);
                     }
                     _loc15_ = true;
                     _loc6_ *= exDmg;
                     _loc4_.hitAction(int(_loc6_),_loc8_,_loc14_,this.atkLv,this.addDmgType,this.criticalHit);
                  }
               }
            }
         }
      }
      if(this.finalHit)
      {
         if(_loc15_)
         {
            _root.playSound1("剑伤" + (random(3) + 1));
            if(this.attackMode == 2)
            {
               _root.shakeGame(12,6);
            }
            else if(this.attackMode == 3)
            {
               _root.shakeGame(16,6);
            }
            else
            {
               _root.shakeGame(12,4);
            }
         }
         else
         {
            this.selectEnemyList = [];
            if(this.attackMode == 2)
            {
               _root.shakeGame(12,5);
            }
            else
            {
               _root.shakeGame(8,4);
            }
         }
      }
      else if(_loc15_)
      {
         _root.playSound1("剑伤" + (random(3) + 1));
         if(this.attackMode == 1)
         {
            _root.shakeGame(6,3);
         }
         else if(this.attackMode == 3)
         {
            _root.shakeGame(6,3);
         }
         else
         {
            _root.shakeGame(6,3);
         }
      }
      else
      {
         this.selectEnemyList = [];
      }
      return _loc15_;
   }
   function checkHit2()
   {
      var _loc6_ = this._parent._parent.unitManager.unitArray;
      var _loc3_;
      var _loc8_;
      var _loc4_;
      var _loc5_;
      var _loc7_;
      for(var _loc9_ in _loc6_)
      {
         if(_loc6_[_loc9_] != this)
         {
            _loc3_ = _loc6_[_loc9_];
            _loc8_ = this._parent._parent.getRotation(this._x,this._y,_loc3_._x,_loc3_._y);
            _loc4_ = this._parent._parent.getDis(this._x,this._y,_loc3_._x,_loc3_._y);
            if(_loc4_ < 100 + _loc3_.hitMc._width / 2)
            {
               _loc3_.hitAction(this.getDamage(_loc3_,0),"normal",undefined,this.atkLv,this.addDmgType,this.criticalHit);
               _loc5_ = this._parent._parent.getRotation(this._x,this._y,_loc3_._x,_loc3_._y);
               _loc3_.xSpeed = -0.0005 * _loc4_ * _loc4_ * Math.cos(_loc5_ * 0.0174);
               _loc3_.ySpeed = -0.0005 * _loc4_ * _loc4_ * Math.sin(_loc5_ * 0.0174);
               _loc3_.startJump(30 + random(8));
               _loc7_ = true;
            }
         }
      }
      if(_loc7_)
      {
         _root.playSound1("剑伤" + (random(3) + 1));
         _root.shakeGame(12,5);
      }
      else
      {
         _root.shakeGame(8,3);
      }
   }
   function checkHit3(r, exDmg, type, shake, jumpSpeed, moveSpeed)
   {
      var _loc6_ = this._parent._parent.unitManager.unitArray;
      if(!jumpSpeed)
      {
         jumpSpeed = 1;
      }
      if(!moveSpeed)
      {
         moveSpeed = 8;
      }
      if(r == undefined)
      {
         r = 45;
      }
      if(type == undefined)
      {
         type = "normal";
      }
      if(shake == undefined)
      {
         shake = 4;
      }
      var _loc3_;
      var _loc10_;
      var _loc7_;
      var _loc4_;
      var _loc5_;
      var _loc9_;
      for(var _loc16_ in _loc6_)
      {
         if(_loc6_[_loc16_] != this)
         {
            _loc3_ = _loc6_[_loc16_];
            _loc10_ = this._parent._parent.getRotation(this._x,this._y,_loc3_._x,_loc3_._y);
            _loc7_ = this._parent._parent.getDis(this._x,this._y,_loc3_._x,_loc3_._y);
            if(_loc7_ < r + _loc3_.hitMc._width / 2)
            {
               _loc4_ = this.getDamage(_loc3_,0);
               _loc4_ *= exDmg;
               _loc3_.hitAction(_loc4_,type,shake * 2,this.atkLv,this.addDmgType,this.criticalHit);
               _loc5_ = this._parent._parent.getRotation(this._x,this._y,_loc3_._x,_loc3_._y);
               _loc3_.xSpeed = moveSpeed * Math.cos(_loc5_ * 0.0174);
               _loc3_.ySpeed = moveSpeed * Math.sin(_loc5_ * 0.0174);
               _loc3_.startJump(jumpSpeed + random(4));
               _loc9_ = true;
            }
         }
      }
      if(_loc9_)
      {
         _root.playSound1("剑伤" + (random(3) + 1));
         _root.shakeGame(8,shake);
      }
      else
      {
         _root.shakeGame(8,5);
      }
   }
   function checkHit4()
   {
      var _loc6_ = this._parent._parent.unitManager.unitArray;
      var _loc4_;
      var _loc8_;
      var _loc7_;
      var _loc9_;
      var _loc5_;
      var _loc10_;
      for(var _loc11_ in _loc6_)
      {
         if(_loc6_[_loc11_] != this)
         {
            _loc4_ = _loc6_[_loc11_];
            _loc8_ = this.att > - _loc4_.h + _loc4_.att && - this.h + this.att < _loc4_.att;
            if(_loc8_)
            {
               _loc7_ = this._parent._parent.getRotation(this._x,this._y,_loc4_._x,_loc4_._y);
               _loc9_ = this._parent._parent.getDis(this._x,this._y,_loc4_._x,_loc4_._y);
               if(_loc9_ < 50 + _loc4_.hitMc._width / 2)
               {
                  _loc5_ = this._parent._parent.getDegree1(_loc7_,super.translateFrameToDegree(this._currentframe));
                  if(_loc5_ < 90)
                  {
                     this.getMinDir(_loc4_,_loc5_);
                     _loc4_.hitAction(this.getDamage(_loc4_,0),"normal",undefined,this.atkLv,this.addDmgType,this.criticalHit);
                     if(_loc4_.blow)
                     {
                        _loc4_.jumpSpeed = -7 - _loc4_.att / 20;
                        _loc4_.jump = true;
                     }
                     _loc10_ = true;
                  }
               }
            }
         }
      }
      if(_loc10_)
      {
         _root.playSound1("剑伤" + (random(3) + 1));
         _root.shakeGame(12,5);
      }
      else
      {
         _root.shakeGame(6,3);
      }
      return _loc10_;
   }
   function checkHit5(exDmg, range, wid)
   {
      var _loc8_ = this._parent._parent.unitManager.unitArray;
      var _loc4_;
      var _loc10_;
      var _loc9_;
      var _loc6_;
      var _loc5_;
      var _loc11_;
      var _loc7_;
      var _loc12_;
      for(var _loc14_ in _loc8_)
      {
         if(_loc8_[_loc14_] != this)
         {
            _loc4_ = _loc8_[_loc14_];
            _loc10_ = this.h - this.att > - _loc4_.att && - this.att < _loc4_.h - _loc4_.att;
            if(_loc10_)
            {
               _loc9_ = this._parent._parent.getRotation(this._x,this._y,_loc4_._x,_loc4_._y);
               _loc6_ = this._parent._parent.getDis(this._x,this._y,_loc4_._x,_loc4_._y);
               if(_loc6_ < range)
               {
                  _loc5_ = this._parent._parent.getDegree1(_loc9_,super.translateFrameToDegree(this._currentframe));
                  if(_loc5_ < 90)
                  {
                     _loc11_ = Math.sin(_loc5_ * 0.0174) * _loc6_;
                     if(_loc11_ < wid)
                     {
                        this.getMinDir(_loc4_,_loc5_);
                        _loc7_ = "normal";
                        if(this.finalHit)
                        {
                           _loc7_ = "finalHit";
                        }
                        _loc4_.hitAction(int(this.getDamage(_loc4_,0) * exDmg),_loc7_,undefined,this.atkLv,this.addDmgType,this.criticalHit);
                        if(_loc4_.blow)
                        {
                           _loc4_.jumpSpeed = -7 - _loc4_.att / 20;
                           _loc4_.jump = true;
                        }
                        _loc12_ = true;
                     }
                  }
               }
            }
         }
      }
      if(_loc12_)
      {
         _root.playSound1("剑伤" + (random(3) + 1));
         _root.shakeGame(12,5);
      }
      else
      {
         _root.shakeGame(6,3);
      }
      return _loc12_;
   }
   function startAttack($mode)
   {
      if(this.attackMode == $mode)
      {
         return undefined;
      }
      this.attacking = true;
      this.attackMode = $mode;
      this.fhtCount = -1;
      this.bhtCount = -1;
      var _loc10_;
      if(this.mc.mc != undefined)
      {
         if(this.mc.mc._currentframe != 1 && this.mc._currentframe != 20)
         {
            _loc10_ = true;
         }
      }
      var _loc7_ = this.checkTurn();
      var _loc6_;
      var _loc4_;
      var _loc5_;
      if(_loc7_ != 0)
      {
         _loc6_ = super.translateNumToFrame(_loc7_);
         _loc4_ = super.translateFrameToDegree(_loc6_);
         §§push(this.gotoAndStop(_loc6_));
         this.mc._y = this.att;
         this.curDir = this.desDir = _loc6_;
      }
      else
      {
         _loc5_ = this.selectEnemyList[0];
         if(_loc5_._x != undefined)
         {
            super.gotoFrame(this.translateDegreeToFrame(this._parent._parent.getRotation(this._x,this._y,_loc5_._x,_loc5_._y)));
            this.selectEnemyList = [];
         }
      }
      if(!this.jump)
      {
         _loc4_ = super.translateFrameToDegree(this._currentframe);
         this.xSpeed = 10 * Math.cos(_loc4_ * 0.0174);
         this.ySpeed = 10 * Math.sin(_loc4_ * 0.0174);
      }
      this.finalHit = false;
      this.mc.gotoAndStop("attack" + $mode);
      var _loc9_;
      if(_loc10_)
      {
         if(this.comboCount > 3)
         {
            if(this.weaponType == "sword")
            {
               if(this.skillList[9] == 0)
               {
                  _loc9_ = true;
                  this.attackMode = 1;
               }
            }
            else if(this.weaponType == "axe")
            {
               if(this.skillList[8] == 0)
               {
                  _loc9_ = true;
                  this.attackMode = 1;
               }
            }
            else if(this.weaponType == "blade")
            {
               if(this.skillList[7] == 0)
               {
                  _loc9_ = true;
                  this.attackMode = 1;
               }
            }
            else
            {
               _loc9_ = true;
            }
            if(_loc9_)
            {
               this.comboCount = 0;
               this.mc.gotoAndStop("attack" + this.attackMode);
            }
            else
            {
               this.comboCount = 0;
               this.finalHit = true;
               this.atkLv = 8;
               this.defLv = 8;
               this.mc.gotoAndStop("attack" + this.attackMode);
            }
         }
         else
         {
            this.mc.mc.gotoAndPlay(6);
            _root.playSound1(this.weaponType + this.attackMode);
         }
      }
      this.comboCount = this.comboCount + 1;
      this.enterframe = function()
      {
         var _loc5_;
         var _loc4_;
         if(this.mc.mc._currentframe != 6)
         {
            if(this.mc.mc._currentframe == 8)
            {
               if(this.attackMode == 2 && this.finalHit)
               {
                  _loc5_ = this.checkHit5(1 + this.skillList[9] / 5,200,50);
               }
               else
               {
                  _loc5_ = this.checkHit();
               }
               if(_loc5_ && this.finalHit)
               {
                  this.finalHit = 4;
               }
               if(this.finalHit && this.attackMode == 3)
               {
                  _root.playSound1("axeFinal");
               }
               if(this.jump)
               {
                  if(this.comboCount == 1 && this.attackMode == 3)
                  {
                     this.jumpSpeed += 20;
                     this.atkLimit = true;
                     this.comboCount = 0;
                     _root.playSound1("下劈过程");
                  }
                  else if(this.jumpSpeed > 0)
                  {
                     this.jumpSpeed -= 1.2 * this.jumpSpeed;
                  }
               }
            }
            else if(this.mc.mc._currentframe == 5)
            {
               if(this.fhtCount == -1)
               {
                  this.mc.mc.stop();
                  this.fhtCount = this.fHardTime[this.attackMode];
                  if(this.finalHit)
                  {
                     this.fhtCount -= 0;
                     if(this.shadowController.controlMc._x == undefined)
                     {
                        this.shadowController = new Shadows(this);
                     }
                     if(this.attackMode == 3)
                     {
                        this.startJump(8);
                        this.xSpeed *= 2;
                        this.ySpeed *= 2;
                     }
                     else if(this.attackMode == 2)
                     {
                        this.startJump(2);
                        _loc4_ = super.translateFrameToDegree(this._currentframe);
                        this.xSpeed = -3 * Math.cos(_loc4_ * 0.0174);
                        this.ySpeed = -3 * Math.sin(_loc4_ * 0.0174);
                        _root.playSound1("swordFinal");
                     }
                  }
               }
               else if(--this.fhtCount < 0)
               {
                  this.fhtCount = -1;
                  this.mc.mc.play();
                  _root.playSound1(this.weaponType + this.attackMode);
                  if(!rush && !this.finalHit)
                  {
                     super.addBlurFilter(4,1);
                  }
               }
            }
            else if(this.mc.mc._currentframe == 13)
            {
               if(this.bhtCount == -1)
               {
                  this.mc.mc.stop();
                  this.bhtCount = this.bHardTime[this.attackMode];
                  if(this.comboCount == 4)
                  {
                     this.bhtCount += 4;
                  }
                  else if(this.finalHit)
                  {
                     this.bhtCount += 12;
                  }
                  else if(!rush)
                  {
                     this.delFilter();
                     this.shadowController.delShadow();
                  }
                  if(this.comboCount == 0 && this.attackMode == 3)
                  {
                     if(this.weaponType == "blade")
                     {
                        this.bhtCount += 5;
                     }
                     this.bhtCount += 5;
                  }
               }
               else if(--this.bhtCount < 0)
               {
                  this.bhtCount = -1;
                  this.mc.mc.play();
               }
               if(this.finalHit == 4)
               {
                  this.checkAttack2();
               }
            }
         }
         if(this.mc.mc._currentframe > 8 && this.mc.mc._currentframe != this.mc.mc._totalframes)
         {
            if(this.comboCount == 3)
            {
               this.checkAttack();
               if(this.mc.mc._currentframe > 13)
               {
                  if(this.nextAttackMode)
                  {
                     this.mainAction();
                     this.startAttack(this.nextAttackMode);
                     this.nextAttackMode = 0;
                     return undefined;
                  }
                  this.selectEnemyList = [];
               }
            }
            else if(!this.finalHit && !this.atkLimit)
            {
               this.checkAttack();
               if(this.mc.mc._currentframe > 13)
               {
                  if(this.nextAttackMode)
                  {
                     this.mainAction();
                     this.startAttack(this.nextAttackMode);
                     this.nextAttackMode = 0;
                     return undefined;
                  }
                  this.selectEnemyList = [];
               }
            }
         }
         if(this.attackMode == 2)
         {
            if(this.mc.mc._currentframe == 9)
            {
               var rush = true;
               _loc4_ = super.translateFrameToDegree(this._currentframe);
               if(!this.finalHit)
               {
                  this.xSpeed = 5 * Math.cos(_loc4_ * 0.0174);
                  this.ySpeed = 5 * Math.sin(_loc4_ * 0.0174);
               }
               else
               {
                  this.xSpeed = 35 * Math.cos(_loc4_ * 0.0174);
                  this.ySpeed = 35 * Math.sin(_loc4_ * 0.0174);
               }
            }
            else if(this.mc.mc._currentframe > 9)
            {
               var rush = true;
               if(!this.jump)
               {
                  this.xSpeed *= 0.8;
                  this.ySpeed *= 0.8;
               }
            }
         }
         if(this.mc.mc._currentframe == this.mc.mc._totalframes)
         {
            this.attacking = false;
            this.atkLimit = false;
            this.attackMode = 0;
            this.nextAttackMode = 0;
            this.atkLv = 5;
            this.defLv = 3;
            this.comboCount = 0;
            this.delFilter();
            this.shadowController.delShadow();
            this.action();
            this.mainAction();
            return undefined;
         }
         if(!this.jump)
         {
            if(this.finalHit && rush)
            {
               this.xSpeed *= 0.9;
               this.ySpeed *= 0.9;
            }
            else
            {
               this.xSpeed *= 0.5;
               this.ySpeed *= 0.5;
            }
         }
         if(this.finalHit && rush)
         {
            super.addBlurFilter();
         }
         this.mainAction();
      };
   }
   function bladeFinalAttack()
   {
      if(this.weaponType == "nothing")
      {
         return undefined;
      }
      if(this.finalHit == 4)
      {
         this.startJump();
      }
      else
      {
         this.startJump(2);
      }
      this.attackMode = 1;
      this.fhtCount = -1;
      this.bhtCount = -1;
      this.finalHit = 2;
      this.delFilter();
      this.mc.gotoAndStop("attack1");
      this.mc.mc.gotoAndPlay(4);
      var _loc3_ = super.translateFrameToDegree(this._currentframe);
      this.xSpeed = Math.cos(_loc3_ * 0.0174);
      this.ySpeed = Math.sin(_loc3_ * 0.0174);
      if(this.shadowController.controlMc._x == undefined)
      {
         this.shadowController = new Shadows(this);
      }
      this.enterframe = function()
      {
         if(this.mc.mc._currentframe == 8)
         {
            this.checkHit4();
            this.jumpSpeed = -6 - this.att / 20;
         }
         else if(this.mc.mc._currentframe == 13)
         {
            if(this.bhtCount == -1)
            {
               this.mc.mc.stop();
               this.bhtCount = 6;
            }
            else if(--this.bhtCount < 0)
            {
               this.bhtCount = -1;
               this.mc.mc.play();
            }
         }
         if(this.mc.mc._currentframe > 12)
         {
            this.comboCount = 0;
            this.extraAttack();
         }
         if(!this.jump)
         {
            this.xSpeed /= 2;
            this.ySpeed /= 2;
         }
         if(this.mc.mc._currentframe == this.mc.mc._totalframes)
         {
            this.attacking = false;
            this.attackMode = 0;
            this.nextAttackMode = 0;
            this.atkLv = 5;
            this.defLv = 3;
            this.comboCount = 0;
            this.delFilter();
            this.shadowController.delShadow();
            this.action();
            return undefined;
         }
         this.mainAction();
      };
   }
   function swordFinalAttack()
   {
      if(this.weaponType == "nothing")
      {
         return undefined;
      }
      this.attacking = true;
      this.fhtCount = -1;
      this.bhtCount = -1;
      this.finalHit = 2;
      this.delFilter();
      this.attackMode = 2;
      var degree = super.translateFrameToDegree(this._currentframe);
      this.mc.gotoAndStop("attack2");
      this.mc.mc.gotoAndPlay(1);
      this.xSpeed = -6 * Math.cos(degree * 0.0174);
      this.ySpeed = -6 * Math.sin(degree * 0.0174);
      this.enterframe = function()
      {
         var _loc4_;
         if(this.mc.mc._currentframe == 8)
         {
            _loc4_ = this.skillList[12] / 5 + 1;
            this.checkHit5(_loc4_,270,65);
            super.addBlurFilter();
            this.shadowController.delShadow();
            this.finalAttack2Effect();
            this.xSpeed = 35 * Math.cos(degree * 0.0174);
            this.ySpeed = 35 * Math.sin(degree * 0.0174);
            _root.playSound1("剑特殊技2");
         }
         else if(this.mc.mc._currentframe == 13)
         {
            if(this.bhtCount == -1)
            {
               this.mc.mc.stop();
               this.bhtCount = this.bHardTime[this.attackMode];
               this.bhtCount += 12;
            }
            else if(--this.bhtCount < 0)
            {
               this.bhtCount = -1;
               this.mc.mc.play();
            }
         }
         this.xSpeed *= 0.85;
         this.ySpeed *= 0.85;
         if(this.mc.mc._currentframe == this.mc.mc._totalframes)
         {
            this.attacking = false;
            this.attackMode = 0;
            this.nextAttackMode = 0;
            this.atkLv = 5;
            this.defLv = 3;
            this.comboCount = 0;
            this.delFilter();
            this.shadowController.delShadow();
            this.action();
            return undefined;
         }
         this.mainAction();
      };
   }
   function axeFinalAttack()
   {
      if(this.weaponType == "nothing")
      {
         return undefined;
      }
      this.attacking = true;
      this.attackMode = 3;
      this.fhtCount = -1;
      this.bhtCount = -1;
      this.finalHit = 2;
      this.delFilter();
      this.startJump(30);
      this.mc.gotoAndStop("attack3");
      this.mc.mc.gotoAndPlay(1);
      var _loc4_ = super.translateFrameToDegree(this._currentframe);
      this.xSpeed = Math.cos(_loc4_ * 0.0174);
      this.ySpeed = Math.sin(_loc4_ * 0.0174);
      if(this.shadowController.controlMc._x == undefined)
      {
         this.shadowController = new Shadows(this);
      }
      this.enterframe = function()
      {
         var _loc3_;
         if(this.mc.mc._currentframe == 5)
         {
            if(this.jumpSpeed > 7)
            {
               this.mc.mc.play();
            }
            else
            {
               this.mc.mc.stop();
            }
         }
         else if(this.mc.mc._currentframe == 8)
         {
            _loc3_ = this.skillList[11] / 5 + 1;
            this.checkHit3(80,_loc3_,"finalHit",10,2);
            _root.playSound1("斧特殊技2");
         }
         else if(this.mc.mc._currentframe == 13)
         {
            if(this.bhtCount == -1)
            {
               this.mc.mc.stop();
               this.bhtCount = this.bHardTime[this.attackMode];
               this.bhtCount += 15;
            }
            else if(--this.bhtCount < 0)
            {
               this.bhtCount = -1;
               this.mc.mc.play();
            }
         }
         if(!this.jump)
         {
            this.xSpeed *= 0.5;
            this.ySpeed *= 0.5;
         }
         if(this.mc.mc._currentframe == this.mc.mc._totalframes)
         {
            this.attacking = false;
            this.attackMode = 0;
            this.nextAttackMode = 0;
            this.atkLv = 5;
            this.defLv = 3;
            this.comboCount = 0;
            this.delFilter();
            this.shadowController.delShadow();
            this.action();
            return undefined;
         }
         this.mainAction();
      };
   }
   function extraAttack()
   {
      if(this.comboCount++ >= this.skillList[10] * 3 + 1)
      {
         this.comboCount = 0;
         this.attackMode = 0;
         this.bhtCount = -1;
         this.mc.gotoAndStop("attack3");
         this.mc.mc.gotoAndPlay(1);
         this.delFilter();
         this.shadowController.delShadow();
         this.enterframe = function()
         {
            if(this.mc.mc._currentframe == 8)
            {
               this.attackMode = 4;
               this.finalHit = 0;
               if(this.checkHit())
               {
                  this.xSpeed *= -4;
                  this.ySpeed *= -4;
               }
               this.startJump(20);
            }
            else if(this.mc.mc._currentframe == 13)
            {
               if(this.bhtCount == -1)
               {
                  this.mc.mc.stop();
                  this.bhtCount += 15;
               }
               else if(--this.bhtCount < 0)
               {
                  this.bhtCount = -1;
                  this.mc.mc.play();
               }
            }
            if(this.mc.mc._currentframe == this.mc.mc._totalframes)
            {
               this.attacking = false;
               this.atkLimit = false;
               this.attackMode = 0;
               this.nextAttackMode = 0;
               this.atkLv = 5;
               this.defLv = 3;
               this.comboCount = 0;
               this.delFilter();
               this.finalHit = false;
               this.shadowController.delShadow();
               this.action();
               return undefined;
            }
            this.mainAction();
         };
         return undefined;
      }
      if(this.comboCount % 2 == 1)
      {
         this.attackMode = 3;
      }
      else
      {
         this.attackMode = 1;
      }
      this.attacking = true;
      this.fhtCount = -1;
      this.bhtCount = -1;
      var _loc6_ = this.checkTurn();
      var _loc7_;
      var _loc4_;
      if(_loc6_ != 0)
      {
         _loc7_ = super.translateNumToFrame(_loc6_);
         super.gotoFrame(_loc7_);
      }
      else
      {
         _loc4_ = this.selectEnemyList[0];
         if(_loc4_._x != undefined)
         {
            super.gotoFrame(this.translateDegreeToFrame(this._parent._parent.getRotation(this._x,this._y,_loc4_._x,_loc4_._y)));
            this.selectEnemyList = [];
         }
      }
      var _loc5_ = super.translateFrameToDegree(this._currentframe);
      this.xSpeed = 1 * Math.cos(_loc5_ * 0.0174);
      this.ySpeed = 1 * Math.sin(_loc5_ * 0.0174);
      this.mc.gotoAndStop("attack" + this.attackMode);
      this.mc.mc.gotoAndPlay(5);
      _root.playSound1("blade" + this.attackMode);
      if(this.shadowController.controlMc._x == undefined)
      {
         this.shadowController = new Shadows(this);
      }
      this.enterframe = function()
      {
         if(!this.jump)
         {
            this.attacking = false;
            this.attackMode = 0;
            this.nextAttackMode = 0;
            this.atkLv = 5;
            this.defLv = 3;
            this.comboCount = 0;
            this.delFilter();
            this.shadowController.delShadow();
            this.action();
         }
         else
         {
            if(this.mc.mc._currentframe == 8)
            {
               this.checkHit4();
               this.jumpSpeed = -6 - this.att / 20;
               this.finalHit = 4;
            }
            if(this.attackMode == 1)
            {
               if(this.mc.mc._currentframe == 15)
               {
                  this.extraAttack();
                  return undefined;
               }
            }
            else if(this.mc.mc._currentframe > 12)
            {
               if(this.finalHit == 4)
               {
                  this.extraAttack();
               }
            }
            if(this.mc.mc._currentframe == this.mc.mc._totalframes)
            {
               this.attacking = false;
               this.attackMode = 0;
               this.finalHit = false;
               this.nextAttackMode = 0;
               this.atkLv = 5;
               this.defLv = 3;
               this.comboCount = 0;
               this.delFilter();
               this.shadowController.delShadow();
               this.action();
               return undefined;
            }
            this.mainAction();
         }
      };
   }
   function checkHitMagicObjectToEnemy(obj, fromWho, exDmg, addDmgT)
   {
      if(exDmg == undefined)
      {
         exDmg = 1;
      }
      var _loc7_ = _root.game.map.player;
      if(addDmgT == undefined)
      {
         addDmgT = [_loc7_.addDmgType[0],0];
      }
      var _loc8_ = this._parent._parent.unitManager.unitArray;
      var _loc3_;
      var _loc9_;
      var _loc5_;
      var _loc6_;
      var _loc10_;
      var _loc11_;
      for(var _loc14_ in _loc8_)
      {
         if(_loc8_[_loc14_] != _root.game.map.player)
         {
            _loc3_ = _loc8_[_loc14_];
            _loc9_ = obj.att > - _loc3_.h + _loc3_.att && obj.att < _loc3_.att;
            if(_loc9_)
            {
               if(this._parent._parent.getDis(obj._x,obj._y,_loc3_._x,_loc3_._y) < 30 + _loc3_.hitMc._width / 2)
               {
                  for(_loc14_ in obj.hitList)
                  {
                     if(_loc3_ == obj.hitList[_loc14_])
                     {
                        _loc5_ = true;
                     }
                  }
                  if(_loc5_)
                  {
                     continue;
                  }
                  obj.hitList.push(_loc3_);
                  _loc6_ = _loc7_.getDamage(_loc3_,0);
                  _loc6_ *= exDmg;
                  _loc10_ = "normal";
                  _loc11_ = true;
                  _loc3_.hitAction(int(_loc6_),_loc10_,this.hitHardTime,_loc7_.atkLv,addDmgT,_loc7_.criticalHit);
                  _loc3_.xSpeed = 10 * Math.cos(obj.dir * 0.0174);
                  _loc3_.ySpeed = 10 * Math.sin(obj.dir * 0.0174);
               }
            }
         }
      }
      if(_loc11_)
      {
         _root.playSound1("剑伤" + (random(3) + 1));
         _root.shakeGame(6,3);
      }
      return _loc11_;
   }
   function checkHitMagicObjectToEnemy2(obj, fromWho, range, exDmg, addDmgT)
   {
      if(exDmg == undefined)
      {
         exDmg = 1;
      }
      var _loc7_ = this._parent._parent.unitManager.unitArray;
      var _loc6_ = _root.game.map.player;
      if(addDmgT == undefined)
      {
         addDmgT = [_loc6_.addDmgType[0],0];
      }
      var _loc3_;
      var _loc5_;
      var _loc8_;
      var _loc9_;
      for(var _loc12_ in _loc7_)
      {
         if(_loc7_[_loc12_] != _root.game.map.player)
         {
            _loc3_ = _loc7_[_loc12_];
            if(this._parent._parent.getDis(obj._x,obj._y,_loc3_._x,_loc3_._y) < range + _loc3_.hitMc._width / 2)
            {
               _loc5_ = _loc6_.getDamage(_loc3_,0);
               _loc5_ *= exDmg;
               _loc8_ = "normal";
               _loc9_ = true;
               _loc3_.hitAction(int(_loc5_),_loc8_,this.hitHardTime,_loc6_.atkLv,addDmgT,_loc6_.criticalHit);
               _loc3_.xSpeed = 10 * Math.cos(obj.dir * 0.0174);
               _loc3_.ySpeed = 10 * Math.sin(obj.dir * 0.0174);
            }
         }
      }
      if(_loc9_)
      {
         _root.playSound1("剑伤" + (random(3) + 1));
         _root.shakeGame(6,3);
      }
      return _loc9_;
   }
   function checkHitMeToEnemy(range, dmg)
   {
      var _loc9_;
      if(dmg)
      {
         _loc9_ = dmg;
      }
      else
      {
         _loc9_ = 0;
      }
      var _loc11_ = this._parent._parent.unitManager.unitArray;
      var _loc5_ = _root.game.map.player;
      var _loc4_ = 0;
      var _loc3_;
      var _loc7_;
      var _loc8_;
      while(_loc4_ < this._parent._parent.unitManager.unitArray.length)
      {
         if(this._parent._parent.unitManager.unitArray[_loc4_].enemyName != undefined)
         {
            _loc3_ = this._parent._parent.unitManager.unitArray[_loc4_];
            if(this._parent._parent.getDis(this._x,this._y,_loc3_._x,_loc3_._y) < range)
            {
               dmg = _loc5_.getDamage(_loc3_,_loc9_);
               _loc7_ = "normal";
               _loc8_ = true;
               _loc3_.hitAction(dmg,_loc7_,this.hitHardTime,_loc5_.atkLv,[_loc5_.addDmgType[0],0],_loc5_.criticalHit);
            }
         }
         _loc4_ = _loc4_ + 1;
      }
      if(_loc8_)
      {
         _root.playSound1("剑伤" + (random(3) + 1));
         _root.shakeGame(8,3);
      }
      return _loc8_;
   }
   function checkHitPulseObjectToEnemy(obj, fromWho)
   {
      var _loc6_ = this._parent._parent.unitManager.unitArray;
      var _loc7_ = _root.game.map.player;
      var _loc3_;
      var _loc9_;
      var _loc5_;
      var _loc8_;
      var _loc10_;
      var _loc11_;
      for(var _loc12_ in _loc6_)
      {
         if(_loc6_[_loc12_] != _root.game.map.player)
         {
            _loc3_ = _loc6_[_loc12_];
            _loc9_ = obj.att >= - _loc3_.h + _loc3_.att && obj.att <= _loc3_.att;
            if(_loc9_)
            {
               if(this._parent._parent.getDis(obj._x,obj._y,_loc3_._x,_loc3_._y) < 30 + _loc3_.hitMc._width / 2)
               {
                  for(_loc12_ in obj.hitList)
                  {
                     if(_loc3_ == obj.hitList[_loc12_])
                     {
                        _loc5_ = true;
                     }
                  }
                  if(_loc5_)
                  {
                     continue;
                  }
                  obj.hitList.push(_loc3_);
                  _loc8_ = _loc7_.getDamage(_loc3_,0);
                  _loc10_ = "normal";
                  _loc11_ = true;
                  _loc3_.hitAction(_loc8_,_loc10_,this.hitHardTime,_loc7_.atkLv,["none"],_loc7_.criticalHit);
                  _loc3_.xSpeed = 10 * Math.cos(obj.dir * 0.0174);
                  _loc3_.ySpeed = 10 * Math.sin(obj.dir * 0.0174);
               }
            }
         }
      }
      if(_loc11_)
      {
         _root.playSound1("剑伤" + (random(3) + 1));
         _root.shakeGame(6,3);
      }
      return _loc11_;
   }
   function newfireMagic(exDmg)
   {
      this.newfireMagic1(exDmg,0);
      this.newfireMagic1(exDmg,-35);
      this.newfireMagic1(exDmg,35);
   }
   function newfireMagic1(exDmg, angleOffset)
   {
      var _loc4_ = this._parent.getNextHighestDepth();
      var _loc3_ = this._parent.attachMovie("fireBall1","fb" + _loc4_,_loc4_,{_x:this._x,_y:this._y,att:this.att - this.h / 2});
      _loc3_.blendMode = 8;
      _loc3_.hitList = [];
      _loc3_.checkHit = this.checkHitMagicObjectToEnemy;
      _loc3_.mc._y += this.att - this.h / 2;
      _loc3_.dir = this.translateFrameToDegree(this._currentframe);
      _loc3_.dir += angleOffset;
      _loc3_.counter = 60;
      _loc3_.mc._rotation = _loc3_.dir;
      _loc3_.speed = 10;
      _loc3_.xs = _loc3_.speed * Math.cos(_loc3_.dir * 0.0174);
      _loc3_.ys = _loc3_.speed * Math.sin(_loc3_.dir * 0.0174);
      _loc3_.count = 1;
      _loc3_.exDmg = exDmg;
      _loc3_.expl = function()
      {
         var _loc2_ = this._parent.getNextHighestDepth();
         var _loc3_ = this._parent.attachMovie("fireBallExpl","fb" + _loc2_,_loc2_,{_x:this._x,_y:this._y});
         _loc3_.blendMode = 8;
         this.removeMovieClip();
      };
      _loc3_.onEnterFrame = function()
      {
         if(this.checkHit(this,_root.game.map.player,this.exDmg,["fire",0]))
         {
            if(--this.count < 0)
            {
               this.expl();
            }
         }
         this._x += this.xs;
         this._y += this.ys;
         if(--this.counter < 0)
         {
            this.expl();
         }
      };
   }
   function newpoisonMagic(exDmg)
   {
      this.newpoisonMagic1(exDmg,0);
      this.newpoisonMagic1(exDmg,35);
      this.newpoisonMagic1(exDmg,-35);
   }
   function newpoisonMagic1(exDmg, aOffset)
   {
      var _loc4_ = this._parent.getNextHighestDepth();
      var _loc3_ = this._parent.attachMovie("poisonBall","fb" + _loc4_,_loc4_,{_x:this._x,_y:this._y,att:this.att - this.h / 2});
      _loc3_.blendMode = 8;
      _loc3_.hitList = [];
      _loc3_.checkHit = this.checkHitMagicObjectToEnemy;
      _loc3_._y += this.att - this.h / 2;
      _loc3_.dir = this.translateFrameToDegree(this._currentframe);
      _loc3_.dir += aOffset;
      _loc3_.counter = 60;
      _loc3_._rotation = _loc3_.dir;
      _loc3_.speed = 10;
      _loc3_.xs = _loc3_.speed * Math.cos(_loc3_.dir * 0.0174);
      _loc3_.ys = _loc3_.speed * Math.sin(_loc3_.dir * 0.0174);
      _loc3_.count = 1;
      _loc3_.exDmg = exDmg;
      _loc3_.expl = function()
      {
         var _loc3_ = this._parent.getNextHighestDepth();
         var _loc4_ = this._parent.attachMovie("fireBallExpl","fb" + _loc3_,_loc3_,{_x:this._x,_y:this._y});
         _loc4_.blendMode = 8;
         _root.sethum(_loc4_,60);
         this.removeMovieClip();
      };
      _loc3_.onEnterFrame = function()
      {
         if(this.checkHit(this,_root.game.map.player,this.exDmg,["poison",0]))
         {
            if(--this.count < 0)
            {
               this.expl();
            }
         }
         this._x += this.xs;
         this._y += this.ys;
         if(--this.counter < 0)
         {
            this.expl();
         }
      };
   }
   function newiceMagic(exDmg)
   {
      this.newiceMagic1(exDmg,0);
      this.newiceMagic1(exDmg,35);
      this.newiceMagic1(exDmg,-35);
   }
   function newiceMagic1(exDmg, aOffset)
   {
      var _loc5_ = this._parent.getNextHighestDepth();
      var _loc3_ = this._parent.createEmptyMovieClip("iceMagic" + _loc5_,_loc5_);
      _loc3_._x = this._x;
      _loc3_._y = this._y;
      _loc3_.att = 0;
      _loc3_.checkHit = this.checkHitMagicObjectToEnemy2;
      _loc3_.counter = 60;
      _loc3_.speed = 5;
      var _loc4_ = this.translateFrameToDegree(this._currentframe);
      _loc4_ += aOffset;
      _loc3_.xs = _loc3_.speed * Math.cos(_loc4_ * 0.0174);
      _loc3_.ys = _loc3_.speed * Math.sin(_loc4_ * 0.0174);
      _loc3_.exDmg = exDmg;
      _loc3_.onEnterFrame = function()
      {
         this._x += this.xs;
         this._y += this.ys;
         var _loc3_;
         var _loc4_;
         if(--this.counter < 0)
         {
            this.removeMovieClip();
         }
         else if(this.counter % 10 == 0)
         {
            this.checkHit(this,_root.game.map.player,45,this.exDmg,["ice",0]);
            _loc3_ = this._parent.getNextHighestDepth();
            _loc4_ = this._parent.attachMovie("iceMagic","iceMagic" + _loc3_,_loc3_,{_x:this._x,_y:this._y});
            _loc4_.blendMode = 4;
         }
      };
   }
   function newthunderMagic(exDmg)
   {
      this.newthunderMagic1(exDmg,0);
      this.newthunderMagic1(exDmg,35);
      this.newthunderMagic1(exDmg,-35);
   }
   function newthunderMagic1(exDmg, aOffset)
   {
      var _loc5_ = this._parent.getNextHighestDepth();
      var _loc3_ = this._parent.createEmptyMovieClip("thunderMagic" + _loc5_,_loc5_);
      _loc3_._x = this._x;
      _loc3_._y = this._y;
      _loc3_.att = 0;
      _loc3_.checkHit = this.checkHitMagicObjectToEnemy2;
      _loc3_.counter = 90;
      _loc3_.speed = 5;
      var _loc4_ = this.translateFrameToDegree(this._currentframe);
      _loc4_ += aOffset;
      _loc3_.xs = _loc3_.speed * Math.cos(_loc4_ * 0.0174);
      _loc3_.ys = _loc3_.speed * Math.sin(_loc4_ * 0.0174);
      _loc3_.exDmg = exDmg;
      _loc3_.onEnterFrame = function()
      {
         this._x += this.xs;
         this._y += this.ys;
         var _loc3_;
         var _loc4_;
         if(--this.counter < 0)
         {
            this.removeMovieClip();
         }
         else if(this.counter % 15 == 0)
         {
            this.checkHit(this,_root.game.map.player,40,this.exDmg,["thunder",0]);
            _loc3_ = this._parent.getNextHighestDepth();
            _loc4_ = this._parent.attachMovie("thunderAddDmgFx","thdFx" + _loc3_,_loc3_,{_x:this._x,_y:this._y});
            _loc4_.blendMode = 4;
         }
      };
   }
   function magicPowerRelease()
   {
      if(this.weaponType == "nothing")
      {
         return undefined;
      }
      this.attacking = true;
      this.fhtCount = -1;
      this.bhtCount = -1;
      this.finalHit = 2;
      this.delFilter();
      this.mc.gotoAndStop("attack1");
      this.mc.mc.gotoAndPlay(1);
      this.effectAttack("ea4ef1",1,true);
      this.enterframe = function()
      {
         if(this.mc.mc._currentframe == 8)
         {
            this.checkHit();
            _root.playSound1("剑气释放.mp3");
            this["new" + this.addDmgType[0] + "Magic"](this.skillList[17] * 0.1 + 1);
         }
         else if(this.mc.mc._currentframe == 13)
         {
            if(this.bhtCount == -1)
            {
               this.mc.mc.stop();
               this.bhtCount = this.bHardTime[1];
               this.bhtCount += 6;
            }
            else if(--this.bhtCount < 0)
            {
               this.bhtCount = -1;
               this.mc.mc.play();
            }
         }
         if(!this.jump)
         {
            this.xSpeed *= 0.7;
            this.ySpeed *= 0.7;
         }
         if(this.mc.mc._currentframe == this.mc.mc._totalframes)
         {
            this.attacking = false;
            this.attackMode = 0;
            this.nextAttackMode = 0;
            this.atkLv = 5;
            this.defLv = 3;
            this.comboCount = 0;
            this.delFilter();
            this.shadowController.delShadow();
            this.action();
            return undefined;
         }
         this.mainAction();
      };
   }
   function fullMagicRelease()
   {
      if(this.weaponType == "nothing")
      {
         return undefined;
      }
      if(this.jump)
      {
         this.xSpeed = 0;
         this.ySpeed = 0;
      }
      this.attacking = true;
      this.fhtCount = -1;
      this.bhtCount = -1;
      this.finalHit = 2;
      this.atkLv = 10;
      this.defLv = 10;
      this.resist = 10;
      this.delFilter();
      this.mc.gotoAndStop("attack4");
      this.mc.mc.gotoAndPlay(1);
      this.effectAttack("ea4ef1",1,true);
      this.enterframe = function()
      {
         var _loc4_;
         var _loc3_;
         if(this.mc.mc._currentframe == 3)
         {
            if(this.jump)
            {
               this.mc.mc.stop();
            }
            else
            {
               this.mc.mc.play();
               _root.playSound1("终极魔法释放.mp3");
               _loc4_ = this._parent.getNextHighestDepth();
               _loc3_ = this._parent.attachMovie("fullMagicRelease","fmrFx" + _loc4_,_loc4_,{_x:this._x,_y:this._y,_xscale:10,_yscale:10});
               _loc3_.step = 1;
               _loc3_.counter = 15;
               _loc3_.blendMode = 8;
               _loc3_._alpha = 70;
               _loc3_.onEnterFrame = function()
               {
                  if(this.step == 1)
                  {
                     if(this._xscale < 70)
                     {
                        this._xscale *= 1.5;
                        this._yscale *= 1.5;
                     }
                     else
                     {
                        this._xscale += 0.5;
                        this._yscale += 0.5;
                        if(--this.counter < 0)
                        {
                           this.step = this.step + 1;
                        }
                     }
                  }
                  else if(this.step == 2)
                  {
                     if(this._xscale < 200)
                     {
                        this._xscale *= 1.5;
                        this._yscale *= 1.5;
                     }
                     else
                     {
                        this._xscale += 1;
                        this._yscale += 1;
                        if(++this.counter > 10)
                        {
                           this._alpha -= 5;
                           if(this._alpha < 0)
                           {
                              this.removeMovieClip();
                           }
                        }
                     }
                  }
               };
            }
         }
         else if(this.mc.mc._currentframe == 6)
         {
            if(this.fhtCount == -1)
            {
               this.mc.mc.stop();
               this.fhtCount = 15;
            }
            else if(--this.fhtCount < 0)
            {
               if(!this.jump)
               {
                  this.fhtCount = -1;
                  this.mc.mc.play();
                  _root.playSound1("特殊技旋转");
               }
            }
         }
         else if(this.mc.mc._currentframe == 8)
         {
            this.checkHitMeToEnemy(250,this.attack[1] * (this.skillList[18] * 1.5 + 0.5));
         }
         else if(this.mc.mc._currentframe == 13)
         {
            if(this.bhtCount == -1)
            {
               this.mc.mc.stop();
               this.bhtCount = this.bHardTime[1];
               this.bhtCount += 6;
            }
            else if(--this.bhtCount < 0)
            {
               this.bhtCount = -1;
               this.mc.mc.play();
            }
         }
         if(!this.jump)
         {
            this.xSpeed *= 0.7;
            this.ySpeed *= 0.7;
         }
         if(this.mc.mc._currentframe == this.mc.mc._totalframes)
         {
            this.attacking = false;
            this.attackMode = 0;
            this.nextAttackMode = 0;
            this.atkLv = 5;
            this.defLv = 3;
            this.comboCount = 0;
            this.delFilter();
            this.shadowController.delShadow();
            this.action();
            return undefined;
         }
         this.mainAction();
      };
   }
   function newbladePulse()
   {
      var _loc4_ = this._parent.getNextHighestDepth();
      var _loc3_ = this._parent.attachMovie("bladePulse","fb" + _loc4_,_loc4_,{_x:this._x,_y:this._y + this.att - this.h / 2,att:this.att - 10});
      _loc3_.dir = this.translateFrameToDegree(this._currentframe);
      _loc3_.counter = 20;
      _loc3_._rotation = _loc3_.dir;
      _loc3_.speed = 1;
      _loc3_.xs = _loc3_.speed * Math.cos(_loc3_._rotation * 0.0174);
      _loc3_.ys = _loc3_.speed * Math.sin(_loc3_._rotation * 0.0174);
      _loc3_.checkHit = this.checkHitMagicObjectToEnemy;
      _loc3_.exDmg = int(this.skillList[16] * 0.05 + 1);
      _loc3_.blendMode = 8;
      _loc3_.expl = function()
      {
         this._alpha -= 10;
         if(this._alpha < 0)
         {
            this.removeMovieClip();
         }
      };
      _loc3_.onEnterFrame = function()
      {
         if(this.counter % 5 == 0)
         {
            this.checkHit(this,_root.game.map.player,this.exDmg,"none");
         }
         this._x += this.xs;
         this._y += this.ys;
         this.xs = this.speed * Math.cos(this._rotation * 0.0174);
         this.ys = this.speed * Math.sin(this._rotation * 0.0174);
         this.speed += 1;
         if(--this.counter < 0)
         {
            this.expl();
         }
      };
   }
   function bladePulseRelease()
   {
      if(this.weaponType == "nothing")
      {
         return undefined;
      }
      this.attacking = true;
      this.fhtCount = -1;
      this.bhtCount = -1;
      this.finalHit = 2;
      this.delFilter();
      this.mc.gotoAndStop("attack1");
      this.mc.mc.gotoAndPlay(1);
      this.effectAttack("ea4ef1",1,true);
      this.enterframe = function()
      {
         if(this.mc.mc._currentframe == 8)
         {
            this.checkHit();
            this.newbladePulse();
            _root.playSound1("剑气释放.mp3");
         }
         else if(this.mc.mc._currentframe == 13)
         {
            if(this.bhtCount == -1)
            {
               this.mc.mc.stop();
               this.bhtCount = this.bHardTime[1];
               this.bhtCount += 6;
            }
            else if(--this.bhtCount < 0)
            {
               this.bhtCount = -1;
               this.mc.mc.play();
            }
         }
         if(!this.jump)
         {
            this.xSpeed *= 0.7;
            this.ySpeed *= 0.7;
         }
         if(this.mc.mc._currentframe == this.mc.mc._totalframes)
         {
            this.attacking = false;
            this.attackMode = 0;
            this.nextAttackMode = 0;
            this.atkLv = 5;
            this.defLv = 3;
            this.comboCount = 0;
            this.delFilter();
            this.shadowController.delShadow();
            this.action();
            return undefined;
         }
         this.mainAction();
      };
   }
   function checkAttack2()
   {
      if(this.skillI == this.bladeFinalAttack)
      {
         if(Key.isDown(this.KeyI))
         {
            if(!this.KeyIPressed)
            {
               this.KeyIPressed = true;
               if(_root.ui.skillIMc.func())
               {
                  this.skillI();
               }
            }
         }
         else
         {
            this.KeyIPressed = false;
         }
      }
      if(this.skillL == this.bladeFinalAttack)
      {
         if(Key.isDown(this.KeyL))
         {
            if(!this.KeyLPressed)
            {
               this.KeyLPressed = true;
               if(_root.ui.skillLMc.func())
               {
                  this.skillL();
               }
            }
         }
         else
         {
            this.KeyLPressed = false;
         }
      }
   }
   function checkAttack4()
   {
      if(Key.isDown(this.KeyJ))
      {
         if(!this.KeyJPressed)
         {
            this.KeyJPressed = true;
            this.extraAttack();
         }
      }
      else
      {
         this.KeyJPressed = false;
      }
      if(Key.isDown(this.KeyI))
      {
         if(!this.KeyIPressed)
         {
            this.KeyIPressed = true;
            this.extraAttack();
         }
      }
      else
      {
         this.KeyIPressed = false;
      }
      if(Key.isDown(this.KeyL))
      {
         if(!this.KeyLPressed)
         {
            this.KeyLPressed = true;
            this.extraAttack();
         }
      }
      else
      {
         this.KeyLPressed = false;
      }
   }
   function getMinDir(who, angle)
   {
      if(this.selectEnemyList.length == 0)
      {
         this.selectEnemyList = [who,angle];
      }
      else if(angle < this.selectEnemyList[1])
      {
         this.selectEnemyList = [];
         this.selectEnemyList = [who,angle];
      }
   }
   function specialAttack()
   {
      if(this.weaponType == "nothing")
      {
         return undefined;
      }
      this.delFilter();
      this.effectAttack("ea4ef1",1,true);
      _root.playSound1("特殊技旋转蓄力");
      this.attacking = true;
      this.attackMode = 4;
      this.atkLv = 10;
      this.defLv = 10;
      this.resist = 10;
      this.finalHit = false;
      this.comboCount = 0;
      this.xSpeed = this.ySpeed = 0;
      this.mc.gotoAndStop("attack4");
      this.mc.mc.gotoAndPlay(1);
      this.enterframe = function()
      {
         if(this.mc.mc._currentframe == 8)
         {
            if(this.fhtCount == -1)
            {
               this.mc.mc.stop();
               this.fhtCount = this.fHardTime[this.attackMode];
            }
            else if(--this.fhtCount < 0)
            {
               if(!this.jump)
               {
                  this.fhtCount = -1;
                  this.mc.mc.play();
                  _root.playSound1("特殊技旋转");
               }
            }
         }
         else if(this.mc.mc._currentframe == 25)
         {
            if(this.bhtCount == -1)
            {
               this.mc.mc.stop();
               this.bhtCount = this.bHardTime[this.attackMode];
            }
            else if(--this.bhtCount < 0)
            {
               this.bhtCount = -1;
               this.mc.mc.play();
            }
         }
         var _loc4_;
         var _loc6_;
         var _loc5_;
         if(this.mc.mc._currentframe == 10)
         {
            this.xSpeed = this.ySpeed = 0;
            super.startJump(35);
            if(this.shadowController.controlMc._x == undefined)
            {
               this.shadowController = new Shadows(this);
            }
            _loc4_ = this._parent.getNextHighestDepth();
            _loc6_ = this._parent.attachMovie("ea4ground","ef" + _loc4_,_loc4_,{_x:this._x,_y:this._y});
            _loc6_.blendMode = "add";
            _loc5_ = this.skillList[13] / 5 + 1.4;
            this.checkHit3(100,_loc5_,"normal",6,30,4);
            this.effectAttack("ea4big",1,true);
         }
         else if(this.mc.mc._currentframe == 11)
         {
            this.effectAttack("ea4small",0,true);
         }
         else if(this.mc.mc._currentframe == this.mc.mc._totalframes)
         {
            this.attacking = false;
            this.attackMode = 0;
            this.atkLv = 5;
            this.defLv = 3;
            this.delFilter();
            this.shadowController.delShadow();
            this.action();
            return undefined;
         }
         this.mainAction();
      };
   }
   function specialAttack2()
   {
      if(this.weaponType == "nothing")
      {
         return undefined;
      }
      this.delFilter();
      this.effectAttack("ea4ef1",1,true);
      _root.playSound1("特殊技旋转蓄力");
      this.attacking = true;
      this.attackMode = 4;
      this.atkLv = 10;
      this.defLv = 10;
      this.resist = 10;
      this.finalHit = false;
      this.comboCount = 0;
      this.xSpeed = this.ySpeed = 0;
      this.mc.gotoAndStop("attack4");
      this.mc.mc.gotoAndPlay(1);
      this.enterframe = function()
      {
         if(this.mc.mc._currentframe == 8)
         {
            if(this.fhtCount == -1)
            {
               this.mc.mc.stop();
               this.fhtCount = this.fHardTime[this.attackMode];
            }
            else if(--this.fhtCount < 0)
            {
               if(!this.jump)
               {
                  this.fhtCount = -1;
                  this.mc.mc.play();
                  _root.playSound1("特殊技旋转");
               }
            }
         }
         else if(this.mc.mc._currentframe == 25)
         {
            if(this.bhtCount == -1)
            {
               this.mc.mc.stop();
               this.bhtCount = this.bHardTime[this.attackMode];
            }
            else if(--this.bhtCount < 0)
            {
               this.bhtCount = -1;
               this.mc.mc.play();
            }
         }
         var _loc4_;
         var _loc6_;
         if(this.mc.mc._currentframe == 10)
         {
            this.xSpeed = this.ySpeed = 0;
            super.startJump(35);
            if(this.shadowController.controlMc._x == undefined)
            {
               this.shadowController = new Shadows(this);
            }
            _loc4_ = this._parent.getNextHighestDepth();
            _loc6_ = this._parent.attachMovie("ea4ground","ef" + _loc4_,_loc4_,{_x:this._x,_y:this._y});
            _loc6_.blendMode = "add";
            this.checkHit2();
            this.effectAttack("ea4big",1,true);
         }
         else if(this.mc.mc._currentframe == 11)
         {
            this.effectAttack("ea4small",0,true);
         }
         else if(this.mc.mc._currentframe == this.mc.mc._totalframes)
         {
            this.attacking = false;
            this.attackMode = 0;
            this.atkLv = 5;
            this.defLv = 3;
            this.delFilter();
            this.shadowController.delShadow();
            this.action();
            return undefined;
         }
         if(this.mc.mc._currentframe == 25)
         {
            this.mc.gotoAndStop("attack4");
            this.mc.mc.gotoAndPlay(8);
            _root.playSound1("特殊技旋转");
            if(this.shadowController.controlMc._x == undefined)
            {
               this.shadowController = new Shadows(this);
            }
            this.enterframe = function()
            {
               if(this.mc.mc._currentframe == 25)
               {
                  if(this.bhtCount == -1)
                  {
                     this.mc.mc.stop();
                     this.bhtCount = this.bHardTime[this.attackMode];
                  }
                  else if(--this.bhtCount < 0)
                  {
                     this.bhtCount = -1;
                     this.mc.mc.play();
                  }
               }
               var _loc4_;
               var _loc3_;
               var _loc5_;
               if(this.mc.mc._currentframe == 10)
               {
                  this.xSpeed = this.ySpeed = 0;
                  super.startJump(10);
                  _loc4_ = this.skillList[14] / 5 + 1.4;
                  this.checkHit3(100,_loc4_,"normal",6);
                  _loc3_ = this._parent.getNextHighestDepth();
                  _loc5_ = this._parent.attachMovie("ea4ground","ef" + _loc3_,_loc3_,{_x:this._x,_y:this._y});
                  _loc5_.blendMode = "add";
               }
               else if(this.mc.mc._currentframe == this.mc.mc._totalframes)
               {
                  this.attacking = false;
                  this.attackMode = 0;
                  this.atkLv = 5;
                  this.defLv = 3;
                  this.delFilter();
                  this.shadowController.delShadow();
                  this.action();
                  return undefined;
               }
               this.mainAction();
            };
         }
         this.mainAction();
      };
   }
   function specialAttack3()
   {
      if(this.weaponType == "nothing")
      {
         return undefined;
      }
      this.delFilter();
      this.effectAttack("ea4ef1",1,true);
      _root.playSound1("特殊技旋转蓄力");
      this.attacking = true;
      this.attackMode = 4;
      this.atkLv = 10;
      this.defLv = 10;
      this.finalHit = false;
      this.comboCount = 0;
      this.xSpeed = this.ySpeed = 0;
      this.mc.gotoAndStop("attack4");
      this.mc.mc.gotoAndPlay(1);
      this.counter = 100 * this.skillList[15];
      this.enterframe = function()
      {
         var _loc3_;
         if(this.mc.mc._currentframe > 8)
         {
            _loc3_ = Key.isDown;
            this.xSpeed = this.ySpeed = 0;
            if(_loc3_(this.KeyUp))
            {
               this.ySpeed = (- this.speed) / 2;
            }
            else if(_loc3_(this.KeyDown))
            {
               this.ySpeed = this.speed / 2;
            }
            if(_loc3_(this.KeyLeft))
            {
               this.xSpeed = (- this.speed) / 2;
            }
            else if(_loc3_(this.KeyRight))
            {
               this.xSpeed = this.speed / 2;
            }
            this.counter = this.counter - 1;
            if(this.counter % 10 == 0)
            {
               this.checkHitMeToEnemy(120);
               _root.playSound1("剑圣风暴-旋风.mp3");
            }
         }
         if(this.mc.mc._currentframe == 8)
         {
            if(this.fhtCount == -1)
            {
               this.mc.mc.stop();
               this.fhtCount = this.fHardTime[this.attackMode];
            }
            else if(--this.fhtCount < 0)
            {
               if(!this.jump)
               {
                  this.fhtCount = -1;
                  this.mc.mc.play();
                  _root.playSound1("特殊技旋转");
                  this.mc.mc.tmp = this.effectAttack("ea4ef2",1,true);
               }
            }
         }
         else if(this.mc.mc._currentframe == 21)
         {
            if(this.counter > 0)
            {
               this.mc.mc.gotoAndPlay(10);
            }
         }
         if(this.mc.mc._currentframe == 10)
         {
            this.xSpeed = this.ySpeed = 0;
         }
         else if(this.mc.mc._currentframe == this.mc.mc._totalframes)
         {
            this.mc.mc.tmp.removeMovieClip();
            this.counter = 0;
            this.attacking = false;
            this.attackMode = 0;
            this.atkLv = 5;
            this.defLv = 3;
            this.delFilter();
            this.shadowController.delShadow();
            this.action();
            return undefined;
         }
         this.mainAction();
      };
   }
   function angry(potionTime)
   {
      var _loc3_;
      var _loc4_;
      if(this.angryCounter._x == undefined)
      {
         _root.playSound1("狂暴.mp3");
         _loc3_ = this.mc.getNextHighestDepth();
         _loc4_ = this.mc.attachMovie("加状态","fx" + _loc3_,_loc3_);
         _loc4_.blendMode = 8;
         _loc3_ = this.mc.getNextHighestDepth();
         _loc4_ = this.mc.attachMovie("魔法使用特效","fx" + _loc3_,_loc3_);
         _loc4_.blendMode = 8;
         this.angryCounter = this.attachMovie("狂暴光环","angryCounter",this.getNextHighestDepth());
         this.angryCounter.blendMode = 8;
         this.attackM = 2;
         this.defenceM = 0.5;
         if(potionTime == undefined)
         {
            if(this.skillList[19] == 0)
            {
               this.angryCounter.counter = 350;
            }
            else
            {
               this.angryCounter.counter = this.skillList[19] * 10 * 35;
            }
         }
         else
         {
            this.angryCounter.counter = potionTime * 35;
         }
         this.angryCounter.onEnterFrame = function()
         {
            if(--this.counter < 0)
            {
               this.uiMc.remove();
               this._parent.attackM = 1;
               this._parent.defenceM = 1;
               this.removeMovieClip();
            }
         };
         this.angryCounter.uiMc = this.newStateShow(10);
      }
   }
   function speedUp()
   {
      var _loc3_;
      var _loc4_;
      if(this.speedUpCounter._x == undefined)
      {
         _root.playSound1("加速.mp3");
         _loc3_ = this.mc.getNextHighestDepth();
         _loc4_ = this.mc.attachMovie("加状态","fx" + _loc3_,_loc3_);
         _loc4_.blendMode = 8;
         _loc3_ = this.mc.getNextHighestDepth();
         _loc4_ = this.mc.attachMovie("魔法使用特效","fx" + _loc3_,_loc3_);
         _loc4_.blendMode = 8;
         this.fric *= 2;
         this.shadowController = new Shadows(this);
         this.speedUpCounter = this.createEmptyMovieClip("speedUpCounter",this.getNextHighestDepth());
         this.speedUpCounter.tmpFht = this.fHardTime;
         this.speedUpCounter.tmpBht = this.bHardTime;
         this.fHardTime = [0,0,0,0,0];
         this.bHardTime = [0,0,0,0,0];
         this.speedUpCounter.counter = this.skillList[20] * 10 * 35;
         this.speedUpCounter.uiMc = this.newStateShow(11);
         this.speedUpCounter.onEnterFrame = function()
         {
            if(this._parent.shadowController.controlMc._x == undefined)
            {
               this._parent.shadowController = new Shadows(this._parent);
            }
            if(--this.counter < 0)
            {
               this.uiMc.remove();
               this._parent.shadowController.delShadow();
               this._parent.fHardTime = this.tmpFht;
               this._parent.bHardTime = this.tmpBht;
               this._parent.fric *= 0.5;
               this.removeMovieClip();
            }
         };
      }
   }
   function hollyLight()
   {
      if(this.revive)
      {
         return undefined;
      }
      this.revive = true;
      var _loc2_;
      var _loc3_;
      if(this.hollyLightCounter._x == undefined)
      {
         _loc2_ = this.mc.getNextHighestDepth();
         _loc3_ = this.mc.attachMovie("加状态","fx" + _loc2_,_loc2_);
         _loc3_.blendMode = 8;
         _loc2_ = this.mc.getNextHighestDepth();
         _loc3_ = this.mc.attachMovie("魔法使用特效","fx" + _loc2_,_loc2_);
         _loc3_.blendMode = 8;
         this.hollyLightCounter = this.createEmptyMovieClip("hollyLightCounter",this.getNextHighestDepth());
         this.hollyLightCounter.hp = int(this.totalHp * ((this.skillList[21] - 1) * 35 + 30) / 100);
         this.hollyLightCounter.sp = int(this.totalSp * ((this.skillList[21] - 1) * 35 + 30) / 100);
         this.hollyLightCounter.counter = 10500 * this.skillList[21];
         this.totalHp1 += this.hollyLightCounter.hp;
         this.totalSp1 += this.hollyLightCounter.sp;
         this.setHPSP();
         this.hollyLightCounter.uiMc = this.newStateShow(12);
         this.hollyLightCounter.onEnterFrame = function()
         {
            if(--this.counter < 0)
            {
               this.uiMc.remove();
               this._parent.totalHp1 -= this.hp;
               this._parent.totalSp1 -= this.sp;
               this._parent.setHPSP();
               this._parent.addHp(0);
               this._parent.addSp(0);
               this._parent.decHp(0);
               this._parent.decSp(0);
               this._parent.revive = false;
               this.removeMovieClip();
            }
         };
      }
   }
   function newStateShow(type)
   {
      var num = _root.ui.uiPlayerState.getNextHighestDepth();
      var _loc4_ = _root.ui.uiPlayerState.attachMovie("skillMc","mc" + num,num);
      for(var _loc3_ in _loc4_)
      {
         delete _loc4_[_loc3_];
      }
      _loc4_.stopDrag();
      _loc4_.gotoAndStop(type);
      _loc4_.duraMc.gotoAndStop(_loc4_.duraMc._totalframes);
      _loc4_._x = 25 * num;
      _loc4_.num = num;
      _root.ui.uiPlayerState.mcNum++;
      _loc4_.remove = function()
      {
         var _loc4_ = this.num;
         var _loc3_ = _loc4_;
         while(_loc3_ <= _root.ui.uiPlayerState.mcNum)
         {
            _root.ui.uiPlayerState["mc" + _loc3_]._x -= 25;
            _root.ui.uiPlayerState["mc" + _loc3_].num--;
            _root.ui.uiPlayerState["mc" + _loc3_]._name = ["mc" + (_loc3_ - 1)];
            _loc3_ = _loc3_ + 1;
         }
         this.removeMovieClip();
      };
      return _loc4_;
   }
   function mainAction()
   {
      this.gForce();
      this.xSpeed = Math.abs(this.xSpeed) >= 0.2 ? this.xSpeed : 0;
      this.ySpeed = Math.abs(this.ySpeed) >= 0.2 ? this.ySpeed : 0;
      this.moveAction();
      if(Key.isDown(this.KeySwitchSpell))
      {
         if(!this.KeySSPressed)
         {
            this.KeySSPressed = true;
            _root.ui.skillMcHold.removeMovieClip();
            if(_root.ui.skillIMc._x)
            {
               _root.ui.skillIMc._name = "tempskillIMc";
               _root.ui.tempskillIMc._x += 200;
               _root.game.map.player.skillI = undefined;
            }
            if(_root.ui.skillIMc1._x)
            {
               _root.ui.skillIMc1._name = "skillIMc";
               _root.ui.skillIMc._x -= 200;
               _root.game.map.player.skillI = _root.game.map.player[_root.ui.skillIMc.funcId];
            }
            if(_root.ui.tempskillIMc._x)
            {
               _root.ui.tempskillIMc._name = "skillIMc1";
            }
            if(_root.ui.skillLMc._x)
            {
               _root.ui.skillLMc._name = "tempskillLMc";
               _root.ui.tempskillLMc._x += 200;
               _root.game.map.player.skillL = undefined;
            }
            if(_root.ui.skillLMc1._x)
            {
               _root.ui.skillLMc1._name = "skillLMc";
               _root.ui.skillLMc._x -= 200;
               _root.game.map.player.skillL = _root.game.map.player[_root.ui.skillLMc.funcId];
            }
            if(_root.ui.tempskillLMc._x)
            {
               _root.ui.tempskillLMc._name = "skillLMc1";
            }
         }
      }
      else
      {
         this.KeySSPressed = false;
      }
      var _loc3_;
      var _loc4_;
      if(_root.areaMode == 0)
      {
         if(Key.isDown(this.Key1))
         {
            if(!this.Key1Pressed)
            {
               this.Key1Pressed = true;
               if(_root.ui.item1Mc.attrib.work())
               {
                  _loc3_ = 20;
                  while(_loc3_ < this.inventoryList.length)
                  {
                     if(this.inventoryList[_loc3_].attrib[0] == _root.ui.item1Mc.attrib.attrib[0])
                     {
                        this.inventoryList[_loc3_] = undefined;
                        _root.ui["item" + _loc3_].removeMovieClip();
                        _loc4_ = true;
                        break;
                     }
                     _loc3_ = _loc3_ + 1;
                  }
                  if(!_loc4_)
                  {
                     _root.game.map.player.inventoryList[0] = undefined;
                     _root.itemInfo.removeMovieClip();
                     _root.ui.item1Mc.removeMovieClip();
                  }
               }
            }
         }
         else
         {
            this.Key1Pressed = false;
         }
         if(Key.isDown(this.Key2))
         {
            if(!this.Key2Pressed)
            {
               this.Key2Pressed = true;
               if(_root.ui.item2Mc.attrib.work())
               {
                  _loc3_ = 20;
                  while(_loc3_ < this.inventoryList.length)
                  {
                     if(this.inventoryList[_loc3_].attrib[0] == _root.ui.item2Mc.attrib.attrib[0])
                     {
                        this.inventoryList[_loc3_] = undefined;
                        _root.ui["item" + _loc3_].removeMovieClip();
                        _loc4_ = true;
                        break;
                     }
                     _loc3_ = _loc3_ + 1;
                  }
                  if(!_loc4_)
                  {
                     _root.game.map.player.inventoryList[1] = undefined;
                     _root.itemInfo.removeMovieClip();
                     _root.ui.item2Mc.removeMovieClip();
                  }
               }
            }
         }
         else
         {
            this.Key2Pressed = false;
         }
         if(Key.isDown(this.Key3))
         {
            if(!this.Key3Pressed)
            {
               this.Key3Pressed = true;
               if(_root.ui.item3Mc.attrib.work())
               {
                  _loc3_ = 20;
                  while(_loc3_ < this.inventoryList.length)
                  {
                     if(this.inventoryList[_loc3_].attrib[0] == _root.ui.item3Mc.attrib.attrib[0])
                     {
                        this.inventoryList[_loc3_] = undefined;
                        _root.ui["item" + _loc3_].removeMovieClip();
                        _loc4_ = true;
                        break;
                     }
                     _loc3_ = _loc3_ + 1;
                  }
                  if(!_loc4_)
                  {
                     _root.game.map.player.inventoryList[2] = undefined;
                     _root.itemInfo.removeMovieClip();
                     _root.ui.item3Mc.removeMovieClip();
                  }
               }
            }
         }
         else
         {
            this.Key3Pressed = false;
         }
      }
   }
   function gForce()
   {
      var _loc8_;
      var _loc5_;
      var _loc6_;
      var _loc7_;
      var _loc4_;
      var _loc3_;
      var _loc9_;
      if(this.jump)
      {
         this.jumpSpeed += Math.abs(this.jumpSpeed) / 4 + 0.3;
         this.mc._y += this.jumpSpeed;
         this.att = this.mc._y;
         if(this.mc._y >= this.shadw._y)
         {
            this.mc._y = this.shadw._y;
            this.att = this.mc._y;
            this.jump = false;
            if(this.jumpSpeed > 10)
            {
               _root.playSound1("落地");
            }
            this.jumpSpeed = 0;
            if(!this.attacking && !this.hit)
            {
               this.mc.gotoAndStop("stand");
            }
            else if(this.attacking)
            {
               if(this.attackMode == 3 && this.comboCount == 0)
               {
                  _root.playSound1("下劈落地");
                  _loc8_ = this._parent.getNextHighestDepth();
                  _loc5_ = this._parent.attachMovie("ea3d","ef" + _loc8_,_loc8_,{_x:this._x,_y:this._y});
                  _loc5_.blendMode = 4;
                  _loc6_ = this.translateFrameToDegree(this._currentframe);
                  _loc5_._x += 20 * Math.cos(_loc6_ * 0.0174);
                  _loc5_._y += 20 * Math.sin(_loc6_ * 0.0174);
                  _loc7_ = 3 + random(3);
                  _loc4_ = 0;
                  while(_loc4_ < _loc7_)
                  {
                     _loc3_ = this._parent.attachMovie("particle","ef" + this._parent.getNextHighestDepth(),this._parent.getNextHighestDepth(),{_x:_loc5_._x,_y:_loc5_._y});
                     _loc3_._rotation = _loc6_ + random(100) - 50;
                     _loc3_._yscale = 50 + random(50);
                     _loc3_.blendMode = "add";
                     _loc3_.speed = 10 + random(20);
                     _loc3_.xSpeed = _loc3_.speed * Math.cos(_loc3_._rotation * 0.0174);
                     _loc3_.ySpeed = _loc3_.speed * Math.sin(_loc3_._rotation * 0.0174);
                     _loc3_.onEnterFrame = function()
                     {
                        this._xscale = (this.speed + 8) * 12;
                        this._x += this.xSpeed;
                        this._y += this.ySpeed;
                        this._alpha = this._xscale - 50;
                        this.xSpeed *= 0.6;
                        this.ySpeed *= 0.6;
                        this.speed *= 0.6;
                        if(this.speed < 0.05)
                        {
                           this.removeMovieClip();
                        }
                     };
                     _loc4_ = _loc4_ + 1;
                  }
                  if(this.finalHit)
                  {
                     if(this.finalHit == 2)
                     {
                        _loc8_ = this._parent.getNextHighestDepth();
                        _loc9_ = this._parent.attachMovie("ea3d2","ef" + _loc8_,_loc8_,{_x:_loc5_._x,_y:_loc5_._y});
                        _loc9_.blendMode = "add";
                        _root.shakeGame(24,6);
                     }
                     else
                     {
                        _loc8_ = this._parent.getNextHighestDepth();
                        _loc9_ = this._parent.attachMovie("ea3d1","ef" + _loc8_,_loc8_,{_x:_loc5_._x,_y:_loc5_._y});
                        _loc9_.blendMode = "add";
                        _root.shakeGame(20,4);
                     }
                  }
               }
            }
         }
      }
      this.shadowScale();
      this._parent._parent.checkInStage(this);
   }
   function moveFunc0()
   {
      var _loc5_;
      var _loc4_;
      var _loc3_;
      var _loc2_;
      if(!this.attacking)
      {
         _loc5_ = Math.abs(this.xSpeed * this.fric);
         _loc4_ = Math.abs(this.ySpeed * this.fric);
         _loc3_ = this._x + this.xSpeed * this.fric;
         _loc2_ = this._y + this.ySpeed * this.fric;
      }
      else
      {
         _loc5_ = Math.abs(this.xSpeed);
         _loc4_ = Math.abs(this.ySpeed);
         _loc3_ = this._x + this.xSpeed;
         _loc2_ = this._y + this.ySpeed;
      }
      if(_loc5_ > 10 || _loc4_ > 10)
      {
         if(!this.checkHitWall(_loc3_,_loc2_))
         {
            if(_loc3_ > 10 && _loc3_ < this._parent.mapW - 10 && _loc2_ > 10 && _loc2_ < this._parent.mapH - 10)
            {
               this._x = _loc3_;
               this._y = _loc2_;
            }
         }
      }
      else
      {
         this._x = _loc3_;
         this._y = _loc2_;
      }
      if(this.checkHitWall(this._x,this._y))
      {
         this._x += this._x <= this._parent.mapW / 2 ? 5 : -5;
         this._y += this._y <= this._parent.mapH / 2 ? 5 : -5;
      }
      else if(_loc5_ > _loc4_)
      {
         while(this.checkHitWall(this._x - 15,this._y))
         {
            this._x = this._x + 1;
         }
         while(this.checkHitWall(this._x + 15,this._y))
         {
            this._x = this._x - 1;
         }
         while(this.checkHitWall(this._x,this._y - 18))
         {
            this._y = this._y + 1;
         }
         while(this.checkHitWall(this._x,this._y + 18))
         {
            this._y = this._y - 1;
         }
      }
      else if(_loc5_ < _loc4_)
      {
         while(this.checkHitWall(this._x - 18,this._y))
         {
            this._x = this._x + 1;
         }
         while(this.checkHitWall(this._x + 18,this._y))
         {
            this._x = this._x - 1;
         }
         while(this.checkHitWall(this._x,this._y - 15))
         {
            this._y = this._y + 1;
         }
         while(this.checkHitWall(this._x,this._y + 15))
         {
            this._y = this._y - 1;
         }
      }
      else
      {
         while(this.checkHitWall(this._x - 18,this._y))
         {
            this._x = this._x + 1;
         }
         while(this.checkHitWall(this._x + 18,this._y))
         {
            this._x = this._x - 1;
         }
         while(this.checkHitWall(this._x,this._y - 18))
         {
            this._y = this._y + 1;
         }
         while(this.checkHitWall(this._x,this._y + 18))
         {
            this._y = this._y - 1;
         }
      }
   }
   function moveAction()
   {
      this.moveFunc0();
      this.checkOut();
      if(this._x < 20)
      {
         this._x = 20;
      }
      else if(this._x > this._parent.mapW - 20)
      {
         this._x = this._parent.mapW - 20;
      }
      if(this._y < 50)
      {
         this._y = 50;
      }
      else if(this._y > this._parent.mapH - 20)
      {
         this._y = this._parent.mapH - 20;
      }
   }
   function finalAttack2Effect()
   {
      var _loc2_;
      if(this._currentframe == 1)
      {
         this.effectAttack("ea2fsr",2);
      }
      else if(this._currentframe == 2)
      {
         _loc2_ = this.effectAttack("ea2ffr",2);
      }
      else if(this._currentframe == 3)
      {
         this.effectAttack("ea2ff",2);
      }
      else if(this._currentframe == 4)
      {
         _loc2_ = this.effectAttack("ea2ffr",2);
         _loc2_._xscale = -100;
      }
      else if(this._currentframe == 5)
      {
         _loc2_ = this.effectAttack("ea2fsr",2);
         _loc2_._xscale = -100;
      }
      else if(this._currentframe == 6)
      {
         _loc2_ = this.effectAttack("ea2fbr",2);
         _loc2_._xscale = -100;
      }
      else if(this._currentframe == 7)
      {
         this.effectAttack("ea2fb",2);
      }
      else if(this._currentframe == 8)
      {
         this.effectAttack("ea2fbr",2);
      }
   }
   function effectAttack(linkName, level, orgColor)
   {
      if(this.weaponType == "nothing")
      {
         return undefined;
      }
      var _loc4_ = this._parent.getNextHighestDepth();
      var _loc3_ = this._parent.attachMovie(linkName,"ea" + _loc4_,_loc4_,{_x:this._x,_y:this._y + this.att});
      _loc3_.blendMode = "add";
      _loc3_.parent = this;
      if(level > 0)
      {
         _loc3_.level = 1 + level;
      }
      else
      {
         _loc3_.level = -1 + level;
      }
      if(!orgColor)
      {
         if(this.weaponType != "sword")
         {
            if(this.weaponType == "axe")
            {
               _loc3_._xscale = _loc3_._yscale = 110;
               _root.sethum(_loc3_,160);
            }
            else if(this.weaponType == "blade")
            {
               _root.sethum(_loc3_,-100);
               _loc3_._xscale = _loc3_._yscale = 90;
               _loc3_._alpha = 80;
            }
         }
      }
      _loc3_.onEnterFrame = function()
      {
         if(!this.parent.hit)
         {
            this._x = this.parent._x;
            this._y = this.parent._y + this.parent.att;
         }
         else
         {
            this.removeMovieClip();
         }
      };
      return _loc3_;
   }
   function setWear()
   {
      this.mc.mc.weapon.gotoAndStop(this.weaponFrame);
      this.mc.mc.shield.gotoAndStop(this.shieldFrame);
      this.mc.mc.helmet.gotoAndStop(this.helmetFrame);
      this.mc.mc.wear.gotoAndStop(this.wearFrame);
      var _loc3_ = this.mc.mc.wear._currentframe + this.mc.mc._currentframe - 1;
      this.mc.mc.wear.gotoAndStop(_loc3_);
      if(this.wearFrame != "nothing")
      {
         _root.changeColor(this.mc.mc.wear,this.wearColor);
      }
   }
   function getItem(itemObj)
   {
      var _loc3_ = 20;
      while(_loc3_ <= this.inventoryList.length)
      {
         if(this.inventoryList[_loc3_] == undefined)
         {
            break;
         }
         _loc3_ = _loc3_ + 1;
      }
      var _loc7_;
      var _loc8_;
      if(_root.usingMochiCoins)
      {
         _loc7_ = _root.mochiCoinsSaveData.totalPage * 20;
      }
      else
      {
         _loc8_ = SharedObject.getLocal("Arcuz");
         _loc7_ = _loc8_.data.totalPage * 20;
      }
      var _loc4_;
      var _loc6_;
      if(_loc3_ >= _loc7_ + 20)
      {
         _root.newMessage(_root.textSys[19][_root.lang]);
         _loc4_ = _root.game.map.getNextHighestDepth();
         _loc6_ = _root.game.map.attachMovie("chest","chest" + _loc4_,_loc4_,{_x:this._x + random(20) - 10,_y:this._y + random(10) + 5});
         _loc6_.init("普通箱子",itemObj);
         return undefined;
      }
      this.inventoryList[_loc3_] = itemObj;
      _root.newMessage(_root.textSys[5][_root.lang] + itemObj.itemName);
      _root.ui.dlgInv.fresh();
   }
   function removeItem(frame, num)
   {
      var _loc4_ = num;
      if(num == undefined)
      {
         _loc4_ = 1;
      }
      for(var _loc5_ in this.inventoryList)
      {
         if(this.inventoryList[_loc5_].attrib[0] == frame)
         {
            this.inventoryList[_loc5_] = undefined;
            if((_loc4_ = _loc4_ - 1) == 0)
            {
               break;
            }
         }
      }
      if(_loc4_ != 0)
      {
         for(_loc5_ in this.inventoryList1)
         {
            if(this.inventoryList1[_loc5_].attrib[0] == frame)
            {
               this.inventoryList1[_loc5_] = undefined;
               if((_loc4_ = _loc4_ - 1) == 0)
               {
                  break;
               }
            }
         }
      }
      for(_loc5_ in this.inventoryList)
      {
         if(this.inventoryList[_loc5_].attrib[0] == frame)
         {
            this.inventoryList[_loc5_].questItem = false;
         }
      }
      for(_loc5_ in this.inventoryList1)
      {
         if(this.inventoryList1[_loc5_].attrib[0] == frame)
         {
            this.inventoryList1[_loc5_].questItem = false;
         }
      }
      _root.ui.dlgInv.fresh();
   }
   function checkOut()
   {
      var _loc3_;
      var _loc4_;
      if(!this.attacking && !this.hit && !_root.game.map.lock)
      {
         this.nx = Math.floor(this._x / 128);
         this.ny = Math.floor(this._y / 128);
         _loc3_ = this._parent.Exit["m" + this.nx + "_" + this.ny];
         if(_loc3_ != undefined)
         {
            if(_loc3_ == "left")
            {
               if(this._x < 50)
               {
                  this.mapOut(_loc3_);
               }
            }
            else if(_loc3_ == "right")
            {
               if(this._x > this._parent.mapW - 50)
               {
                  this.mapOut(_loc3_);
               }
            }
            else if(_loc3_ == "top")
            {
               if(this._y < 50)
               {
                  this.mapOut(_loc3_);
               }
            }
            else if(_loc3_ == "bottom")
            {
               if(this._y > this._parent.mapH - 50)
               {
                  this.mapOut(_loc3_);
               }
            }
         }
         else if(_root.game.map.special._x != undefined)
         {
            if(_root.game.map.special.hitMc.hitTest(this._x + this._parent._x + 50,this._y + this._parent._y,true))
            {
               _loc4_ = _root.game.map.special.dir;
               this.mapOut(_loc4_);
            }
         }
      }
   }
   function mapIn(exit)
   {
      if(exit == "left")
      {
         this.desDir = 0;
         this.xSpeed = this.speed;
         this._x += 15;
         this.ySpeed = 0;
      }
      else if(exit == "right")
      {
         this.desDir = 180;
         this.xSpeed = - this.speed;
         this._x -= 15;
         this.ySpeed = 0;
      }
      else if(exit == "top")
      {
         this.desDir = 90;
         this.ySpeed = this.speed;
         this._y += 15;
         this.xSpeed = 0;
      }
      else if(exit == "bottom")
      {
         this.desDir = -90;
         this.ySpeed = - this.speed;
         this._y -= 15;
         this.xSpeed = 0;
      }
      this.mc.gotoAndStop("run");
      this.toFrame(this.translateDegreeToFrame(this.desDir));
      this.counter = 0;
      this.enterframe = function()
      {
         this.moveFunc0();
         this.gForce();
         this.nx = Math.floor(this._x / 128);
         this.ny = Math.floor(this._y / 128);
         this.nx = this.nx < this._parent.xNum ? this.nx : this._parent.xNum - 1;
         this.ny = this.ny < this._parent.yNum ? this.ny : this._parent.yNum - 1;
         var _loc3_ = this._parent.Exit["m" + this.nx + "_" + this.ny];
         var _loc4_;
         if(_loc3_ == "left")
         {
            if(this._x > 70)
            {
               _loc4_ = true;
            }
         }
         else if(_loc3_ == "right")
         {
            if(this._x < this._parent.mapW - 70)
            {
               _loc4_ = true;
            }
         }
         else if(_loc3_ == "top")
         {
            if(this._y > 70)
            {
               _loc4_ = true;
            }
         }
         else if(_loc3_ == "bottom")
         {
            if(this._y < this._parent.mapH - 70)
            {
               _loc4_ = true;
            }
         }
         var _loc5_;
         if(_loc3_ != undefined)
         {
            if(_loc4_)
            {
               this.counter = 0;
               this.xSpeed = this.ySpeed = 0;
               this.action();
            }
         }
         else if(_root.game.map.special._x != undefined)
         {
            if(_root.game.map.special.hitMc.hitTest(this._x + this._parent._x + 50,this._y + this._parent._y,true))
            {
               _loc5_ = true;
            }
            if(!_loc5_)
            {
               this.counter = 0;
               this.xSpeed = this.ySpeed = 0;
               this.action();
            }
         }
         else
         {
            this.counter = 0;
            this.xSpeed = this.ySpeed = 0;
            this.action();
         }
      };
   }
   function mapOut(exit)
   {
      if(exit == "left")
      {
         this.desDir = 180;
         this.xSpeed = - this.speed;
         this.ySpeed = 0;
      }
      else if(exit == "right")
      {
         this.desDir = 0;
         this.xSpeed = this.speed;
         this.ySpeed = 0;
      }
      else if(exit == "top")
      {
         this.desDir = -90;
         this.ySpeed = - this.speed;
         this.xSpeed = 0;
      }
      else if(exit == "bottom")
      {
         this.desDir = 90;
         this.ySpeed = this.speed;
         this.xSpeed = 0;
      }
      if(!this.jump)
      {
         this.mc.gotoAndStop("run");
      }
      this.counter = 0;
      this.enterframe = function()
      {
         var _loc5_;
         if(_root.game.map.special._x != undefined)
         {
            if(_root.game.map.special.hitMc.hitTest(this._x + this._parent._x + 50,this._y + this._parent._y,true))
            {
               _loc5_ = true;
            }
         }
         if(!_loc5_)
         {
            this.gotoFrame(this.translateDegreeToFrame(this.desDir));
            this.moveFunc0();
         }
         this.gForce();
         var _loc7_ = this._x + this._parent._x;
         var _loc6_ = this._y + this._parent._y;
         if(this.counter == 2)
         {
            this._parent._parent.attachMovie("changeMapMc","changeMapMc",this._parent._parent.getNextHighestDepth());
         }
         var _loc3_;
         var _loc4_;
         if(++this.counter > 10)
         {
            this.counter = 0;
            delete this.onEnterFrame;
            _loc3_ = _root[this._parent.Exit[exit + "Link"]].areaName;
            if(_root["map_" + _loc3_ + "_in"][2][0] < _root.game.map.player.chapter)
            {
               _loc4_ = true;
            }
            else if(_root["map_" + _loc3_ + "_in"][2][0] == _root.game.map.player.chapter && _root["map_" + _loc3_ + "_in"][2][1] <= _root.game.map.player.phase)
            {
               _loc4_ = true;
            }
            if(_loc4_)
            {
               this._parent.changeMap(_root[this._parent.Exit[exit + "Link"]],exit);
            }
            else
            {
               if(exit == "left")
               {
                  exit = "right";
               }
               else if(exit == "right")
               {
                  exit = "left";
               }
               else if(exit == "top")
               {
                  exit = "bottom";
               }
               else if(exit == "bottom")
               {
                  exit = "top";
               }
               this._parent.changeMap(_root["map_" + _root.game.map.areaName + "_" + _root.game.map.mapName],exit);
               _root.newMessage(_root.textSys[6][_root.lang]);
            }
         }
      };
   }
   function cleanAllstatus()
   {
      this.hpCounter.removeMovieClip();
      this.spCounter.removeMovieClip();
      this.hollyLightCounter.removeMovieClip();
      this.reviveController.removeMovieClip();
      this.angryCounter.removeMovieClip();
      if(this.speedUpCounter._x != undefined)
      {
         this.fHardTime = this.speedUpCounter.tmpFht;
         this.bHardTime = this.speedUpCounter.tmpBht;
         this.speedUpCounter.removeMovieClip();
      }
      this.poisonDmg.removeMovieClip();
      this.thunderDmg.removeMovieClip();
      this.iceDmg.removeMovieClip();
      for(var _loc3_ in _root.ui.uiPlayerState)
      {
         _root.ui.uiPlayerState[_loc3_].removeMovieClip();
      }
      _root.ui.uiPlayerState.mcNum = 0;
      this.attackM = 1;
      this.defenceM = 1;
      this.shadowController.delShadow();
      this.fric = 1;
      this.overWeight = false;
      this.calcWeight();
   }
}
