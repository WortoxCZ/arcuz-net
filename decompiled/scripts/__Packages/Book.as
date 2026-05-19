class Book
{
   var Type;
   var _x;
   var _y;
   var attrib;
   var attribName;
   var itemName;
   var link;
   var param;
   var price;
   function Book(p1)
   {
      this.param = ["",p1];
      this.Type = this.param[0] = "Book";
      this.attrib = this.attribName = [];
      this.attribName[0] = "frame";
      this.attrib[0] = "book";
      this.attrib[1] = 1;
      this.price = 200;
      switch(p1)
      {
         case 1:
            this.itemName = "Tome of Strength";
            this.attribName[1] = "Permanently increases the Strength by 1 when used.";
            this.work = this.tostr;
            break;
         case 2:
            this.itemName = "Tome of Agility";
            this.attribName[1] = "Permanently increases the Agility by 1 when used.";
            this.work = this.toa;
            break;
         case 3:
            this.itemName = "Tome of Constitution";
            this.attribName[1] = "Permanently increases the Constitution by 1 when used.";
            this.work = this.tosta;
            break;
         case 4:
            this.itemName = "Tome of Luck";
            this.attribName[1] = "Permanently increases the Luck by 1 when used.";
            this.work = this.tol;
            break;
         case 5:
            this.itemName = "Tome of Skill";
            this.attribName[1] = "Permanently increases the Ability Point by 1 when used.";
            this.work = this.tosp;
            break;
         case 6:
            this.itemName = "Tome of Experience";
            this.attribName[1] = "Gives 500 experience when used. ";
            this.work = this.toe1;
            break;
         case 7:
            this.itemName = "Tome of Experience";
            this.attribName[1] = "Gives 2500 experience when used. ";
            this.work = this.toe2;
            break;
         case 8:
            this.itemName = "Tome of Experience";
            this.attribName[1] = "Gives 6000 experience when used. ";
            this.work = this.toe3;
         default:
            return;
      }
   }
   function work()
   {
   }
   function ringFx()
   {
      var _loc3_ = _root.game.map.attachMovie("levelUpRing","levelUpRing" + _root.game.map.getNextHighestDepth(),_root.game.map.getNextHighestDepth(),{_x:_root.game.map.player._x,_y:_root.game.map.player._y + _root.game.map.player.att,link:_root.game.map.player});
      _loc3_.blendMode = 4;
      _root.playSound1("吃书.mp3");
      _loc3_.onEnterFrame = function()
      {
         this._x = this.link._x;
         this._y = this.link._y + this.link.att;
      };
   }
   function tostr()
   {
      _root.game.map.player.CP++;
      _root.game.map.player.strengthUp();
      this.ringFx();
   }
   function toa()
   {
      _root.game.map.player.CP++;
      _root.game.map.player.agilityUp();
      this.ringFx();
   }
   function tosta()
   {
      _root.game.map.player.CP++;
      _root.game.map.player.stamineUp();
      this.ringFx();
   }
   function tol()
   {
      _root.game.map.player.CP++;
      _root.game.map.player.luckUp();
      this.ringFx();
   }
   function tosp()
   {
      _root.game.map.player.AP++;
      _root.ui.dlgSkill.fresh();
      this.ringFx();
   }
   function expFx()
   {
      var _loc2_ = _root.game.map.player.mc.getNextHighestDepth();
      var _loc3_ = _root.game.map.player.mc.attachMovie("魔法使用特效","fx" + _loc2_,_loc2_);
      _loc3_.blendMode = 8;
   }
   function toe1()
   {
      this.toe(500);
   }
   function toe2()
   {
      this.toe(2500);
   }
   function toe3()
   {
      this.toe(6000);
   }
   function toe(num)
   {
      _root.playSound1("吃书.mp3");
      _root.game.map.player.getExp(num);
      this.expFx();
   }
}
