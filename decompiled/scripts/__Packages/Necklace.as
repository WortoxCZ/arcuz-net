class Necklace extends Accessory
{
   var Type;
   var itemName;
   var param;
   var setPosNum;
   var setPosX;
   var setPosY;
   var times;
   function Necklace(frame1, regainSpPerSec1, regainHpPerSec1, skillPointBonus1, positiveSkillBonus1, passiveSkillBonus1, defenceBonusByPercent1, attackBonusByPercent1, extraWeight1, exLuck1)
   {
      super(frame1,regainSpPerSec1,regainHpPerSec1,skillPointBonus1,positiveSkillBonus1,passiveSkillBonus1,defenceBonusByPercent1,attackBonusByPercent1,extraWeight1,exLuck1);
      this.Type = this.param[0] = "Necklace";
      this.setPosX = 386;
      this.setPosY = 22;
      this.setPosNum = 12;
      switch(frame1)
      {
         case "nl1":
            this.times = 3;
            this.itemName = _root.textNlace[0][_root.lang];
            break;
         case "nl2":
            this.times = 3;
            this.itemName = _root.textNlace[1][_root.lang];
            break;
         case "nl3":
            this.times = 3;
            this.itemName = _root.textNlace[2][_root.lang];
            break;
         case "nl4":
            this.times = 5;
            this.itemName = _root.textNlace[3][_root.lang];
            break;
         case "nl5":
            this.times = 5;
            this.itemName = _root.textNlace[4][_root.lang];
            break;
         case "nl6":
            this.times = 5;
            this.itemName = _root.textNlace[5][_root.lang];
            break;
         case "nl7":
            this.times = 7;
            this.itemName = _root.textNlace[6][_root.lang];
            break;
         case "nl8":
            this.times = 7;
            this.itemName = _root.textNlace[7][_root.lang];
         default:
            return;
      }
   }
}
