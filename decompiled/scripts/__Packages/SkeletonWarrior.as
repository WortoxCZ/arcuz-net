class SkeletonWarrior extends Enemy
{
   var _alpha;
   var _name;
   var _parent;
   var _rotation;
   var _x;
   var _xscale;
   var _y;
   var _yscale;
   var addDmgType;
   var atkLv;
   var atkT;
   var att;
   var attachMovie;
   var attack;
   var attackR;
   var attackRate;
   var attacking;
   var bht;
   var blow;
   var counter;
   var criticalHit;
   var curDir;
   var dashSpeed;
   var defLv;
   var defence;
   var desDir;
   var dx;
   var dy;
   var enemyName;
   var enterframe;
   var exp;
   var fht;
   var gForce;
   var getDamage;
   var getDepth;
   var getNextHighestDepth;
   var go;
   var gotoAndStop;
   var h;
   var hit;
   var hitHardTime;
   var hp;
   var jump;
   var keepDistance;
   var level;
   var mc;
   var moveDir;
   var moveFunc;
   var moveSpeed;
   var onEnterFrame;
   var rUnit;
   var removeMovieClip;
   var setPoint;
   var sightA;
   var sightD;
   var speed;
   var totalHp;
   var weaponFrame;
   var xSpeed;
   var ySpeed;
   var ys;
   function SkeletonWarrior()
   {
      super();
      var _loc4_;
      var _loc5_;
      var _loc3_;
      if(this._name.slice(0,8) != "instance")
      {
         this.keepDistance = 20;
         this.attackRate = 3;
         this.hp = 40;
         this.attack = [15,25];
         this.defence = 1;
         _loc4_ = this._x;
         _loc5_ = this._y;
         this.setPoint = [_loc4_,_loc5_];
         this.rUnit = 10;
         this.attackR = 45;
         this.fht = 10;
         this.bht = 25;
         this.hitHardTime = 15;
         this.atkLv = 5;
         this.defLv = 3;
         this.atkT = 5;
         this.sightD = 250;
         this.sightA = 180;
         this.moveDir = 45 * random(8) - 135;
         _loc3_ = random(8) + 1;
         this.gotoAndStop(_loc3_); //unpopped
         this.curDir = _loc3_;
         this.desDir = _loc3_;
         this.speed = this.moveSpeed = 5;
         this.dashSpeed = 20;
         this.blow = true;
         this.exp = 100;
         this.mc.stop();
         this._parent._parent.firstTimeInMap(this);
      }
   }
   function setLevel(num)
   {
      this.setLevelBasicAttrib(num);
      this.enemyName = "skeletonWarrior";
      var _loc4_ = !random(2) ? (!random(2) ? "s" : "b") : "a";
      this.weaponFrame = _loc4_ + (random(Math.round(num / 5)) + 2);
      if(_root["skeletonc" + num])
      {
         _root.changeColor(this,_root["skeletonc" + num]);
      }
      if(num == 15 || num == 23 || num == 25)
      {
         this.addDmgType = ["fire",4];
      }
      else if(num == 21)
      {
         this.addDmgType = ["ice",4];
      }
      else if(num == 29)
      {
         this.addDmgType = ["poison",4];
      }
      else if(num == 31 || num == 33)
      {
         this.addDmgType = ["thunder",4];
      }
      this.attack = [int(this.attack[0] * 1.2),int(this.attack[1] * 1.2)];
      this.defence = int(this.defence * 1);
      this.hp = this.totalHp = int(this.totalHp * 2);
      this.exp = int(this.exp * 1.5);
   }
   function die()
   {
      this.enterframe = function()
      {
         var _loc5_;
         var _loc4_;
         var _loc3_;
         if(this.att < 0)
         {
            this.gForce();
         }
         else
         {
            this.mainAction();
            _root.playSound("骷髅死亡.mp3");
            this.mc.gotoAndStop("die");
            delete this.enterframe;
            this._parent._parent.delUnit1(this);
            _loc5_ = random(5) + 5;
            _loc4_ = 0;
            while(_loc4_ < _loc5_)
            {
               if(_loc4_ == 0)
               {
                  _loc3_ = this.attachMovie("skeletonDieParts2","skeletonDieParts" + this.getNextHighestDepth(),this.getNextHighestDepth());
               }
               else if(_loc4_ < 4)
               {
                  _loc3_ = this.attachMovie("skeletonDieParts1","skeletonDieParts" + this.getNextHighestDepth(),this.getNextHighestDepth());
               }
               else
               {
                  _loc3_ = this.attachMovie("skeletonDieParts3","skeletonDieParts" + this.getNextHighestDepth(),this.getNextHighestDepth());
               }
               _loc3_.swapDepths(this.getDepth() + random(100));
               _loc3_.gotoAndStop(random(_loc3_._totalframes) + 1);
               _loc3_.h = - (20 + random(20));
               _loc3_._y = _loc3_.h;
               _loc3_.dir = random(360);
               _loc3_.speed = Math.random() * 2;
               _loc3_.dx = _loc3_.speed * Math.cos(_loc3_.dir * 0.0174);
               _loc3_.dy = _loc3_.speed * Math.sin(_loc3_.dir * 0.0174);
               _loc3_.ys = -4 - random(4);
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
               _loc4_ = _loc4_ + 1;
            }
            this.gotoAndStop(9); //unpopped
            this.counter = 60;
            this.enterframe = function()
            {
               if(--this.counter < 0)
               {
                  this._alpha -= 5;
                  if(this._alpha < 0)
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
   function setType(num)
   {
      if(num != 1)
      {
         if(num == 2)
         {
            _root.changeColor(this,_root.Dark);
            this.hp = 50;
            this.addDmgType = ["thunder",4];
            this.attack = [15,30];
         }
         else if(num == 3)
         {
            _root.changeColor(this,_root.Red1);
            this.attack = [20,35];
            this.addDmgType = ["fire",4];
            this.hp = 60;
         }
         else if(num == 4)
         {
            _root.changeColor(this,_root.Gold);
            this.hp = 80;
            this.atkLv = 5;
            this.defLv = 5;
            this.blow = false;
            this.attack = [20,45];
            this.addDmgType = ["poison",4];
            this._xscale = this._yscale = 120;
         }
      }
   }
   function attack1()
   {
      if(!random(2))
      {
         this.attack2();
      }
      else
      {
         this.attack3();
      }
      this.mainAction();
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
      this.mc.gotoAndStop("attack1");
      this.mc.mc.stop();
      this.mainAction();
      this.enterframe = function()
      {
         if(this.mc.mc._currentframe == 1)
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
                  this.mc.mc.gotoAndStop(2);
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
         else if(this.mc.mc._currentframe == 2)
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
      this.counter = - random(this.atkT);
      this.mc.gotoAndStop("stand");
      this.mainAction();
      this.go = false;
      this.enterframe = function()
      {
         if(this.counter < 0)
         {
            if(++this.counter == 0)
            {
               this.faceHero();
               this.mc.gotoAndStop("attack");
               _root.shotShine2(this,"white",3);
               this.counter = 0;
            }
            else if(this._parent._parent.getDis(this._x,this._y,this._parent.player.x,this._parent.player.y) > this.attackR)
            {
               this.attacking = false;
               this.patrol();
            }
         }
         else if(this.mc.mc._currentframe == 2)
         {
            this.mc.mc.stop();
            if(++this.counter > this.fht)
            {
               this.mc.mc.play();
            }
         }
         else if(this.mc.mc._currentframe == 4)
         {
            if(this.checkHit1(this._parent.player,60,30))
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
               this.gotoAndStop(this.translateDegreeToFrame(this.moveDir)); //unpopped
               this.patrol();
            }
         }
         this.gForce();
         this.moveAction();
         this.mainAction();
      };
   }
   function action()
   {
      this.attacking = false;
      this.mc.gotoAndStop("stand");
      this.mainAction();
      this.patrol();
   }
   function mainAction()
   {
      this.mc.mc.sword.gotoAndStop(this.weaponFrame);
   }
}
