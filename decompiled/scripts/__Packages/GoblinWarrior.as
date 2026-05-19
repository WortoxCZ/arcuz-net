class GoblinWarrior extends Enemy
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
   var attacking;
   var bht;
   var blow;
   var chaseRate;
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
   var getDamage;
   var go;
   var gotoAndStop;
   var hit;
   var hitHardTime;
   var hp;
   var jump;
   var jumpSpeed;
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
   var shadowScale;
   var shadw;
   var sightA;
   var sightD;
   var speed;
   var stayRate;
   var totalHp;
   var weaponFrame;
   var xSpeed;
   var ySpeed;
   function GoblinWarrior()
   {
      super();
      var _loc4_;
      var _loc5_;
      var _loc3_;
      if(this._name.slice(0,8) != "instance")
      {
         this.keepDistance = 20;
         this.chaseRate = 20;
         this.attackRate = 20;
         this.hp = 40;
         this.attack = [15,25];
         this.defence = 1;
         _loc4_ = this._x;
         _loc5_ = this._y;
         this.setPoint = [_loc4_,_loc5_];
         this.rUnit = 10;
         this.attackR = 42;
         this.fht = 5;
         this.bht = 5;
         this.hitHardTime = 15;
         this.atkLv = 5;
         this.defLv = 3;
         this.atkT = 5;
         this.sightD = 150;
         this.sightA = 180;
         this.moveDir = 45 * random(8) - 135;
         _loc3_ = random(8) + 1;
         this.gotoAndStop(_loc3_); //unpopped
         this.curDir = _loc3_;
         this.desDir = _loc3_;
         this.speed = this.moveSpeed = 5;
         this.blow = true;
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
            _root.playSound("哥布林战士死亡.mp3");
            this.mc.gotoAndStop("die");
            delete this.enterframe;
            this._parent._parent.delUnit1(this);
            this.counter = 60;
            this.onEnterFrame = function()
            {
               this.mainAction();
               if(--this.counter < 0)
               {
                  this.mc.mc.stop();
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
      this.enemyName = "goblinWarrior";
      var _loc4_ = !random(2) ? (!random(2) ? "s" : "b") : "a";
      this.weaponFrame = _loc4_ + (random(Math.round(num / 5)) + 1);
      if(_root["goblinc" + num])
      {
         _root.changeColor(this,_root["goblinc" + num]);
      }
      this.speed = this.moveSpeed = num >= 5 ? (num >= 10 ? (num >= 15 ? 6 : 5) : 4) : 3;
      this.stayRate = 30;
      this.chaseRate = 30 - num >= 5 ? 30 - num : 5;
      this.attackRate = 30 - num >= 3 ? 30 - num : 3;
      if(num == 13)
      {
         this.addDmgType = ["fire",4];
      }
      else if(num == 15)
      {
         this.addDmgType = ["ice",4];
      }
      else if(num == 23)
      {
         this.addDmgType = ["poison",4];
      }
      else if(num == 27)
      {
         this.addDmgType = ["thunder",4];
      }
      this.attack = [int(this.attack[0] * 1),int(this.attack[1] * 1)];
      this.defence = int(this.defence * 1.2);
      this.hp = this.totalHp = int(this.totalHp * 1.5);
      this.exp = int(this.exp * 1.2);
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
      if(!this.jump)
      {
         if(!random(4))
         {
            this.attack2();
            return undefined;
         }
      }
      this.attacking = true;
      this.counter = - random(this.atkT);
      this.mc.gotoAndStop("stand");
      this.go = false;
      this.enterframe = function()
      {
         this.gForce();
         this.moveAction();
         this.mainAction();
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
         else if(this.mc.mc._currentframe == 3)
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
               this.action();
            }
         }
      };
   }
   function attack2()
   {
      this.attacking = true;
      this.counter = 0;
      this.mc.gotoAndStop("attack");
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
         if(this.mc.mc._currentframe == 3)
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
      this.mc.mc.sword.gotoAndStop(this.weaponFrame);
      this.patrol();
   }
   function mainAction()
   {
      this.mc.mc.sword.gotoAndStop(this.weaponFrame);
      if(_root.game.map.player.mc._y < -5)
      {
         if(!random(60))
         {
            if(!this.jump && !this.hit)
            {
               this.jump = true;
               this.jumpSpeed = -40;
            }
         }
      }
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
