class Wolf extends Enemy
{
   var _alpha;
   var _name;
   var _parent;
   var _x;
   var _xscale;
   var _y;
   var _yscale;
   var addDmgType;
   var atkLv;
   var atkT;
   var att;
   var attack;
   var attackR;
   var attackRate;
   var attackSpd;
   var attacked;
   var attacking;
   var bht;
   var blendMode;
   var blow;
   var chaseRate;
   var checkHit1;
   var counter;
   var criticalHit;
   var curDir;
   var defLv;
   var defence;
   var desDir;
   var enemyName;
   var enterframe;
   var exp;
   var fht;
   var gForce;
   var getDamage;
   var go;
   var gotoAndStop;
   var hitHardTime;
   var hp;
   var jumpSpeed;
   var keepDistance;
   var mc;
   var moveAction;
   var moveDir;
   var moveFunc;
   var moveSpd;
   var patrol;
   var rUnit;
   var removeMovieClip;
   var setLevelBasicAttrib;
   var setPoint;
   var sightA;
   var sightD;
   var speed;
   var startJump;
   var stayRate;
   var totalHp;
   var translateDegreeToFrame;
   var xSpeed;
   var ySpeed;
   function Wolf()
   {
      super();
      var _loc4_;
      var _loc5_;
      var _loc3_;
      if(this._name.slice(0,8) != "instance")
      {
         this.keepDistance = 30;
         this.hp = 40;
         this.exp = 12;
         this.attack = [15,30];
         this.defence = 5;
         _loc4_ = this._x;
         _loc5_ = this._y;
         this.setPoint = [_loc4_,_loc5_];
         this.rUnit = 10;
         this.attackR = 60;
         this.fht = 8;
         this.bht = 30;
         this.hitHardTime = 10;
         this.atkLv = 5;
         this.defLv = 3;
         this.atkT = 5;
         this.sightD = 180;
         this.sightA = 180;
         this.attacked = 0;
         _loc3_ = random(8) + 1;
         this.moveDir = 45 * random(8) - 135;
         this.gotoAndStop(_loc3_); //unpopped
         this.curDir = _loc3_;
         this.desDir = _loc3_;
         this.speed = 3;
         this.attackSpd = 5;
         this.moveSpd = this.speed;
         this.mc.stop();
         this.blow = true;
         this._parent._parent.firstTimeInMap(this);
         this.stayRate = 200;
         this.chaseRate = 10;
         this.attackRate = 10;
         this.keepDistance = 30;
         this.enemyName = "wolf";
      }
   }
   function setLevel(num)
   {
      this.setLevelBasicAttrib(num);
      this.enemyName = "wolf";
      this.attackRate = 40 - num;
      if(_root["wolfc" + num])
      {
         _root.changeColor(this,_root["wolfc" + num]);
      }
      if(num == 9)
      {
         this.addDmgType = ["fire",4];
      }
      else if(num == 15)
      {
         this.addDmgType = ["ice",4];
      }
      else if(num == 17)
      {
         this.addDmgType = ["fire",4];
      }
      else if(num == 23)
      {
         this.addDmgType = ["poison",4];
      }
      else if(num == 27)
      {
         this.addDmgType = ["thunder",4];
      }
      else if(num == 29)
      {
         _root.changeColor(this,_root.Green);
         this.speed = 5;
         this.fht = 10;
         this.attackSpd = 11;
         this.sightD = 240;
         this.attackR = 120;
         this.blendMode = 4;
         this.keepDistance = 100;
         this.keepDistance = 100;
         this._xscale = this._yscale = 110;
         this.blendMode = 4;
      }
      this.attack = [int(this.attack[0] * 1.1),int(this.attack[1] * 1.1)];
      this.defence = int(this.defence * 0.8);
      this.hp = this.totalHp = int(this.totalHp * 1.2);
      this.exp = int(this.exp * 1.1);
   }
   function setType(num)
   {
      if(num != 1)
      {
         if(num == 2)
         {
            _root.changeColor(this,_root.Red1);
            this.hp += 30;
            this.attack = [20,35];
            this.defence = 4;
            this.addDmgType = ["ice",0];
         }
         else if(num == 3)
         {
            _root.changeColor(this,_root.Gold);
            this.attack = [30,40];
            this.defence = 4;
            this.hp += 50;
            this.addDmgType = ["ice",0];
         }
         else if(num == 4)
         {
            _root.changeColor(this,_root.Green);
            this.speed = 5;
            this.fht = 10;
            this.attackSpd = 11;
            this.sightD = 240;
            this.attackR = 120;
            this.blendMode = 4;
            this.keepDistance = 100;
            this._xscale = this._yscale = 110;
            this.hitHardTime = 6;
         }
      }
      this.enemyName = "wolf" + num;
   }
   function die()
   {
      this.enterframe = function()
      {
         if(this.att < 0)
         {
            this.gForce();
            this.moveAction();
         }
         else
         {
            _root.playSound("wolf死");
            this._parent._parent.delUnit1(this);
            this.startJump(10);
            this.moveDir = this._parent._parent.getRotation(this._parent.player.x,this._parent.player.y,this._x,this._y);
            this.mc.gotoAndStop("die");
            this.counter = 0;
            this.enterframe = function()
            {
               this.gForce();
               if(this.att >= 0)
               {
                  this.mc.gotoAndStop("die");
                  this.mc.mc.gotoAndStop(2);
                  if(++this.counter > 40)
                  {
                     this._alpha -= 3;
                     if(this._alpha <= 0)
                     {
                        this._parent._parent.delUnit(this);
                        this.removeMovieClip();
                     }
                  }
               }
               else
               {
                  this.xSpeed = 2 * Math.cos(this.moveDir * 0.0174);
                  this.ySpeed = 2 * Math.sin(this.moveDir * 0.0174);
                  this.moveFunc();
               }
            };
         }
      };
   }
   function attack1()
   {
      this.attacking = true;
      this.attacked = 0;
      this.counter = 0;
      this.mc.gotoAndStop("attack");
      this.enterframe = function()
      {
         if(this._x < 20)
         {
            this._x = 20;
         }
         else if(this._x > _root.mapW - 20)
         {
            this._x = _root.mapW - 20;
         }
         if(this._y < 20)
         {
            this._y = 20;
         }
         else if(this._y > _root.mapH - 20)
         {
            this._y = _root.mapH - 20;
         }
         this.gForce();
         if(this.mc.mc._currentframe == 3 && this.counter <= this.fht)
         {
            this.mc.mc.stop();
            if(++this.counter > this.fht)
            {
               this.mc.mc.play();
               this.counter = 0;
            }
         }
         else if(this.mc.mc._currentframe == this.mc.mc._totalframes && this.counter == 0)
         {
            this.startJump(10 + random(3));
            §§push(this.gotoAndStop(this.translateDegreeToFrame(this.moveDir)));
            this.counter = 1;
            this.speed = this.attackSpd + random(5);
            this.go = true;
         }
         else if(this.mc.mc._currentframe == this.mc.mc._totalframes && this.counter == 1)
         {
            if(!this.attacked)
            {
               if(this.checkHit1(this._parent.player,45,80))
               {
                  this._parent.player.hitAction(this.getDamage(this._parent.player,0),"normal",0,this.atkLv,this.addDmgType,this.criticalHit);
                  this.attacked = 1;
               }
            }
            this.xSpeed = this.speed * Math.cos(this.moveDir * 0.0174);
            this.ySpeed = this.speed * Math.sin(this.moveDir * 0.0174);
            this.moveFunc();
            if(this.jumpSpeed > 0)
            {
               this.mc.gotoAndStop("stand");
            }
            if(this.att >= 0)
            {
               this.counter = 2;
               this.speed = this.moveSpd;
               this.xSpeed = this.speed * Math.cos(this.moveDir * 0.0174);
               this.ySpeed = this.speed * Math.sin(this.moveDir * 0.0174);
            }
         }
         else if(this.mc.mc._currentframe == this.mc.mc._totalframes && this.counter >= 2)
         {
            this.attacking = false;
            this.finishAttack();
         }
      };
   }
   function finishAttack()
   {
      this.mc.gotoAndStop("walk");
      this.counter = 2;
      this.speed = this.moveSpd;
      this.xSpeed = this.speed * Math.cos(this.moveDir * 0.0174);
      this.ySpeed = this.speed * Math.sin(this.moveDir * 0.0174);
      this.enterframe = function()
      {
         this.moveFunc();
         if(++this.counter > this.bht)
         {
            this.patrol();
         }
      };
   }
   function action()
   {
      this.attacking = false;
      this.mc.gotoAndStop("stand");
      this.speed = this.moveSpd;
      this.patrol();
   }
}
