class Orge extends Enemy
{
   var _alpha;
   var _name;
   var _parent;
   var _x;
   var _y;
   var addDmgType;
   var atkLv;
   var atkT;
   var att;
   var attack;
   var attackR;
   var attackRate;
   var attacking;
   var bht;
   var blow;
   var chaseRate;
   var checkHit1;
   var counter;
   var criticalHit;
   var curDir;
   var dashSpeed;
   var defLv;
   var defence;
   var desDir;
   var enemyName;
   var enterframe;
   var exp;
   var faceHero;
   var fht;
   var getDamage;
   var go;
   var gotoAndStop;
   var hit;
   var hitAction;
   var hitHardTime;
   var hp;
   var jump;
   var jumpSpeed;
   var keepDistance;
   var level;
   var mc;
   var moveAction;
   var moveDir;
   var moveFunc;
   var moveSpeed;
   var patrol;
   var rUnit;
   var removeMovieClip;
   var setLevelBasicAttrib;
   var setPoint;
   var shadowScale;
   var shadw;
   var sightA;
   var sightD;
   var speed;
   var stayRate;
   var swapDepths;
   var totalHp;
   var xSpeed;
   var ySpeed;
   function Orge()
   {
      super();
      var _loc4_;
      var _loc5_;
      var _loc3_;
      if(this._name.slice(0,8) != "instance")
      {
         this.keepDistance = 30;
         this.stayRate = 30;
         this.chaseRate = 10;
         this.attackRate = 8;
         _loc4_ = this._x;
         _loc5_ = this._y;
         this.setPoint = [_loc4_,_loc5_];
         this.rUnit = 15;
         this.attackR = 60;
         this.fht = 5;
         this.bht = 10;
         this.hitHardTime = 10;
         this.atkLv = 5;
         this.defLv = 5;
         this.atkT = 0;
         this.sightD = 400;
         this.sightA = 180;
         this.moveDir = 45 * random(8) - 135;
         _loc3_ = random(8) + 1;
         this.gotoAndStop(_loc3_); //unpopped
         this.curDir = _loc3_;
         this.desDir = _loc3_;
         this.speed = this.moveSpeed = 5;
         this.dashSpeed = 20;
         this.blow = false;
         this.exp = 100;
         this.mc.stop();
         this._parent._parent.firstTimeInMap(this);
      }
   }
   function die()
   {
      this.enterframe = function()
      {
         if(this.att < 0)
         {
            this.gForce();
         }
         else
         {
            this.mainAction();
            this.mc.gotoAndStop("die");
            delete this.enterframe;
            this._parent._parent.delUnit1(this);
            this.counter = 60;
            this.enterframe = function()
            {
               this.mainAction();
               var _loc2_ = this._parent._x + this._x + (this._parent._y + this._y) * 450;
               if(_loc2_ > 100)
               {
                  this.swapDepths(_loc2_);
               }
               if(--this.counter < 0)
               {
                  this._alpha -= 5;
                  if(this._alpha <= 0)
                  {
                     this._parent._parent.delUnit(this);
                     this.removeMovieClip();
                  }
               }
            };
         }
      };
   }
   function hitAction2(dmg, type, hitHT)
   {
      this.speed = this.moveSpeed;
      this.mc.gotoAndStop("hit");
      this.mc.mc.gotoAndPlay(1);
      this.hp -= dmg;
      if(this.hp <= 0)
      {
         this.hp = 0;
         delete this.action;
      }
      if(!this.hit)
      {
         this.hit = true;
         if(type == "critical")
         {
            this.counter = this.hitHardTime + 10;
         }
         else
         {
            this.counter = this.hitHardTime;
         }
      }
      if(hitHT != undefined)
      {
         this.counter += hitHT;
      }
      this.enterframe = function()
      {
         this.gForce();
         this.go = true;
         this.moveFunc();
         this.mainAction();
         if(!this.jump)
         {
            this.xSpeed *= 0.7;
            this.ySpeed *= 0.7;
         }
         if(--this.counter < 0 && !this.jump)
         {
            if(this.hp <= 0)
            {
               delete this.hitAction;
               delete this.action;
               if(this.level < this._parent.player.level)
               {
                  this.exp = int(this.exp / (this._parent.player.level - this.level + 0.5));
               }
               this._parent.player.getExp(this.exp);
               this.die();
            }
            else
            {
               this.hit = false;
               this.action();
            }
         }
      };
   }
   function setLevel(num)
   {
      this.setLevelBasicAttrib(num);
      this.enemyName = "orge";
      var _loc2_ = !random(2) ? (!random(2) ? "s" : "b") : "a";
      this.attack = [int(this.attack[0] * 1.5),int(this.attack[1] * 1.5)];
      this.defence = int(this.defence * 2);
      this.hp = this.totalHp = int(this.totalHp * 5);
      this.exp = int(this.exp * 3);
   }
   function attack1()
   {
      if(!this.jump)
      {
         if(this.level > 26 && !random(3))
         {
            this.attack2();
            return undefined;
         }
         if(this.level > 28 && !random(3))
         {
            this.attack3();
            return undefined;
         }
      }
      this.attacking = true;
      this.counter = 0;
      this.mc.gotoAndStop("attack");
      this.go = false;
      _root.shotShine2(this,"white",3);
      this.enterframe = function()
      {
         this.gForce();
         this.moveAction();
         this.mainAction();
         if(this.mc.mc._currentframe == 8)
         {
            this.mc.mc.stop();
            if(++this.counter > this.fht)
            {
               this.mc.mc.play();
            }
         }
         else if(this.mc.mc._currentframe == 10)
         {
            if(this.checkHit1(this._parent.player,60,60))
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
               this.speed = this.moveSpeed;
               this.patrol();
            }
         }
      };
   }
   function attack2()
   {
      this.attacking = true;
      this.counter = - random(this.atkT);
      this.go = true;
      this.faceHero();
      this.moveDir += 180;
      this.xSpeed = this.speed * Math.cos(this.moveDir * 0.0174);
      this.ySpeed = this.speed * Math.sin(this.moveDir * 0.0174);
      this.speed = this.dashSpeed;
      this.mc.gotoAndStop("attack");
      this.mc.mc.gotoAndStop(9);
      this.mainAction();
      this.enterframe = function()
      {
         if(this.mc.mc._currentframe == 9)
         {
            if(this.counter <= 15)
            {
               this.counter = this.counter + 1;
               if(this.counter == 1)
               {
                  _root.shotShine2(this,"white",3);
               }
               else if(this.counter > 15)
               {
                  this.mc.mc.gotoAndStop(10);
                  this.speed = this.dashSpeed;
                  this.moveDir -= 180;
                  this.xSpeed = this.speed * Math.cos(this.moveDir * 0.0174);
                  this.ySpeed = this.speed * Math.sin(this.moveDir * 0.0174);
               }
               this.speed *= 0.6;
               this.xSpeed = this.speed * Math.cos(this.moveDir * 0.0174);
               this.ySpeed = this.speed * Math.sin(this.moveDir * 0.0174);
            }
         }
         else if(this.mc.mc._currentframe == 10)
         {
            if(this.speed < 2)
            {
               if(++this.counter > this.bht)
               {
                  this.attacking = false;
                  this.counter = 0;
                  this.speed = this.moveSpeed;
                  this.action();
                  return undefined;
               }
            }
            else if(++this.counter > 5)
            {
               if(this.checkHit1(this._parent.player,760,45))
               {
                  this._parent.player.hitAction(this.getDamage(this._parent.player,0),"normal",0,this.atkLv,this.addDmgType,this.criticalHit);
               }
               this.counter = 0;
            }
            this.speed *= 0.9;
            this.xSpeed = this.speed * Math.cos(this.moveDir * 0.0174);
            this.ySpeed = this.speed * Math.sin(this.moveDir * 0.0174);
         }
         this.moveFunc();
         this.mainAction();
      };
   }
   function attack3()
   {
      this.attacking = true;
      this.counter = 0;
      this.mc.gotoAndStop("attack");
      this.mc.mc.gotoAndStop(3);
      this.go = true;
      this.jump = true;
      this.jumpSpeed = -8;
      this.speed = -6;
      this.faceHero();
      this.enterframe = function()
      {
         this.gForce();
         this.xSpeed = this.speed * Math.cos(this.moveDir * 0.0174);
         this.ySpeed = this.speed * Math.sin(this.moveDir * 0.0174);
         this.moveFunc();
         this.mainAction();
         if(this.mc.mc._currentframe == 9)
         {
            this.mc.mc.stop();
            if(++this.counter > this.fht + 20)
            {
               this.mc.mc.play();
            }
            else if(this.counter == this.fht + 10)
            {
               this.jump = true;
               this.jumpSpeed = -8;
               this.speed = 10;
            }
         }
         else if(this.mc.mc._currentframe == 10)
         {
            if(this.checkHit1(this._parent.player,60,90))
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
               this.speed = this.moveSpeed;
               this.action();
            }
         }
      };
   }
   function action()
   {
      this.attacking = false;
      this.mc.gotoAndStop("stand");
      this.speed = this.moveSpeed;
      this.patrol();
   }
   function mainAction()
   {
   }
   function gForce()
   {
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
            this.jumpSpeed = 0;
            if(this.attacking)
            {
               this.speed = 0;
            }
         }
      }
      this.shadowScale();
   }
}
