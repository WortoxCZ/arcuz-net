class Slime extends Enemy
{
   var _name;
   var _parent;
   var _x;
   var _y;
   var addDmgType;
   var atkLv;
   var atkT;
   var attack;
   var attackR;
   var attackRate;
   var attacking;
   var bht;
   var blendMode;
   var blockCount;
   var blockDir;
   var blocked;
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
   var faceHero;
   var fht;
   var gForce;
   var getDamage;
   var go;
   var gotoAndStop;
   var gotoFrame;
   var hitHardTime;
   var hp;
   var jump;
   var jumpAttack;
   var jumpSpeed;
   var keepDistance;
   var keepDistance1;
   var level;
   var mainAction;
   var mc;
   var moveCount;
   var moveDir;
   var moveFunc;
   var patrol;
   var rUnit;
   var realSpeed;
   var resist;
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
   function Slime()
   {
      super();
      var _loc4_;
      var _loc5_;
      var _loc3_;
      if(this._name.slice(0,8) != "instance")
      {
         this.keepDistance = 0;
         this.hp = 40;
         this.attack = [15,25];
         this.defence = 1;
         _loc4_ = this._x;
         _loc5_ = this._y;
         this.setPoint = [_loc4_,_loc5_];
         this.rUnit = 10;
         this.attackR = 40;
         this.fht = 3;
         this.bht = 30;
         this.hitHardTime = 15;
         this.atkLv = 5;
         this.defLv = 3;
         this.atkT = 15;
         this.sightD = 200;
         this.sightA = 180;
         this.moveDir = 45 * random(8) - 135;
         _loc3_ = random(8) + 1;
         this.gotoAndStop(_loc3_); //unpopped
         this.curDir = _loc3_;
         this.desDir = _loc3_;
         this.speed = 1;
         this.realSpeed = 0;
         this.moveCount = 0;
         this.blow = true;
         this.enemyName = "slime1";
         this.mc.stop();
         this.blendMode = 14;
         this._parent._parent.firstTimeInMap(this);
      }
   }
   function die()
   {
      _root.playSound("slime死");
      super.die();
   }
   function setLevel(num)
   {
      if(num < 5)
      {
         this.fht = 3;
         this.bht = 30;
         this.atkT = 15;
      }
      else if(num < 10)
      {
         this.fht = 2;
         this.bht = 20;
         this.atkT = 10;
      }
      else if(num < 20)
      {
         this.fht = 1;
         this.bht = 10;
         this.atkT = 5;
      }
      else
      {
         this.atkT = 15;
         this.fht = 1;
         this.bht = 5;
      }
      this.speed = int(num / 2 + 2);
      this.sightD += num * 5;
      if(this.speed > 15)
      {
         this.speed = 15;
      }
      this.stayRate = 30;
      this.chaseRate = 30 - num >= 5 ? 30 - num : 5;
      this.attackRate = 30 - num >= 3 ? 30 - num : 3;
      this.sightD = 200 + num * 4;
      this.setLevelBasicAttrib(num);
      this.enemyName = "slime";
      if(_root["slimec" + num])
      {
         _root.changeColor(this,_root["slimec" + num]);
      }
      if(num == 11)
      {
         this.addDmgType = ["fire",4];
      }
      else if(num == 19 || num == 13)
      {
         this.addDmgType = ["ice",4];
      }
      else if(num == 23)
      {
         this.addDmgType = ["poison",4];
      }
      else if(num == 25)
      {
         this.addDmgType = ["thunder",4];
      }
      this.attack = [int(this.attack[0] * 1.2),int(this.attack[1] * 1.1)];
      this.defence = int(this.defence * 0.5);
      this.hp = this.totalHp = int(this.totalHp * 1);
      this.exp = int(this.exp * 1);
   }
   function attack1()
   {
      this.attacking = true;
      this.counter = - random(this.atkT);
      this.mc.gotoAndStop("stand");
      this.go = false;
      this.enterframe = function()
      {
         this.gForce();
         this.moveAction();
         if(this.counter < 0)
         {
            if(++this.counter == 0)
            {
               this.faceHero();
               this.mc.gotoAndStop("attack");
               _root.shotShine2(this,"white",this.fht);
               this.counter = 0;
            }
            else if(this._parent._parent.getDis(this._x,this._y,this._parent.player.x,this._parent.player.y) > this.attackR)
            {
               this.attacking = false;
               this.patrol();
            }
         }
         else if(this.mc.mc._currentframe == 3)
         {
            this.mc.mc.stop();
            if(++this.counter > this.fht)
            {
               this.mc.mc.play();
            }
         }
         else if(this.mc.mc._currentframe == 10)
         {
            if(this.checkHit1(this._parent.player,60,50))
            {
               this._parent.player.hitAction(this.getDamage(this._parent.player,0),"normal",0,this.atkLv,this.addDmgType,this.criticalHit);
            }
         }
         else if(this.mc.mc._currentframe == this.mc.mc._totalframes - 1)
         {
            this.counter = 0;
         }
         else if(this.mc.mc._currentframe == this.mc.mc._totalframes)
         {
            this.mc.mc.stop();
            if(++this.counter > this.bht)
            {
               this.attacking = false;
               this.patrol();
            }
         }
      };
   }
   function attack2()
   {
      this.attacking = true;
      this.counter = (- this.fht) * 2;
      this.mc.gotoAndStop("stand");
      this.jumpAttack = false;
      _root.shotShine2(this,"white",this.fht);
      this.enterframe = function()
      {
         this.gForce();
         this.moveAction();
         var _loc3_;
         var _loc2_;
         if(++this.counter == 5)
         {
            this.startJump();
            _loc3_ = this._parent._parent.getRotation(this._x,this._y,this._parent.player._x,this._parent.player._y);
            _loc2_ = this._parent._parent.getDis(this._x,this._y,this._parent.player.x,this._parent.player.y) / 25;
            this.xSpeed = _loc2_ * Math.cos(_loc3_ * 0.0174);
            this.ySpeed = _loc2_ * Math.sin(_loc3_ * 0.0174);
         }
         else if(!this.jumpAttack && this.jumpSpeed > 10 && this.counter > 10 && this.counter < 50)
         {
            if(this.checkHit1(this._parent.player,50,360))
            {
               this.jumpAttack = true;
               this._parent.player.hitAction(this.getDamage(this._parent.player,0),"normal",0,this.atkLv,this.addDmgType,this.criticalHit);
            }
         }
         else if(this.counter > 50)
         {
            this.mc.mc.stop();
            this.attacking = false;
            this.patrol();
         }
      };
   }
   function action()
   {
      this.attacking = false;
      this.mc.gotoAndStop("stand");
      this.patrol();
   }
   function moveAction()
   {
      if(this.go)
      {
         if(this.blocked > 40)
         {
            if(++this.blockCount < 50)
            {
               if(this.blockCount == 1)
               {
                  if(random(4))
                  {
                     this.blockDir = 1;
                  }
                  else
                  {
                     this.blockDir = -1;
                  }
               }
               this.moveDir += this.blockDir * (100 - 2 * this.blockCount);
               if(this.moveDir > 180)
               {
                  this.moveDir -= 360;
               }
               else if(this.moveDir < -180)
               {
                  this.moveDir += 360;
               }
            }
            else
            {
               this.blockCount = 0;
               this.blocked = 0;
               this.blockDir = 0;
            }
         }
         this.gotoFrame(this.translateDegreeToFrame(this.moveDir));
      }
      if(!this.jump)
      {
         this.xSpeed = this.realSpeed * Math.cos(this.moveDir * 0.0174);
         this.ySpeed = this.realSpeed * Math.sin(this.moveDir * 0.0174);
         this.realSpeed *= 0.95;
      }
      if(++this.moveCount > 30)
      {
         this.moveCount = 0;
         this.realSpeed = this.speed;
      }
      this.moveFunc();
   }
   function chasingHero()
   {
      this.mc.gotoAndStop("walk");
      this.resist = 0;
      this.go = true;
      this.keepDistance1 = random(this.keepDistance) + this.keepDistance;
      this.enterframe = function()
      {
         this.gForce();
         this.moveAction();
         this.mainAction();
         var _loc3_ = this._parent._parent.getDis(this._x,this._y,this._parent.player.x,this._parent.player.y);
         if(_loc3_ < this.sightD)
         {
            super.trackHero();
            if(_loc3_ < this.keepDistance1)
            {
               if(this.go)
               {
                  this.go = false;
                  this.mc.gotoAndStop("stand");
               }
            }
            else if(!this.go)
            {
               this.go = true;
               this.mc.gotoAndStop("walk");
            }
            if(_loc3_ < this.attackR)
            {
               if(!random(this.attackRate))
               {
                  this.attack1();
               }
            }
            if(_loc3_ < this.attackR + 180 && _loc3_ > this.attackR + 50)
            {
               if(this.level > 5)
               {
                  if(!random(this.attackRate + 100 - this.level))
                  {
                     this.attack2();
                  }
               }
            }
         }
         else
         {
            this.patrol();
         }
      };
   }
}
