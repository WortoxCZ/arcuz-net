class Centaur extends Enemy
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
   var blocked;
   var blow;
   var checkAttack;
   var checkHit1;
   var counter;
   var criticalHit;
   var curDir;
   var dashSpeed;
   var defLv;
   var defence;
   var delFilter;
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
   var hitHardTime;
   var hp;
   var keepDistance;
   var mainAction;
   var mc;
   var moveAction;
   var moveDir;
   var moveFunc;
   var moveSpeed;
   var rUnit;
   var removeMovieClip;
   var setLevelBasicAttrib;
   var setPoint;
   var sightA;
   var sightD;
   var speed;
   var startJump;
   var stay;
   var stayRate;
   var totalHp;
   var xSpeed;
   var ySpeed;
   function Centaur()
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
         this.rUnit = 20;
         this.attackR = 50;
         this.fht = 3;
         this.bht = 5;
         this.hitHardTime = 15;
         this.atkLv = 5;
         this.defLv = 3;
         this.atkT = 15;
         this.sightD = 400;
         this.sightA = 270;
         this.moveDir = 45 * random(8) - 135;
         _loc3_ = random(8) + 1;
         this.gotoAndStop(_loc3_); //unpopped
         this.curDir = _loc3_;
         this.desDir = _loc3_;
         this.speed = this.moveSpeed = 6;
         this.dashSpeed = 35;
         this.blow = true;
         this.enemyName = "centaur1";
         this.mc.stop();
         this._parent._parent.firstTimeInMap(this);
         this.attackRate = 3;
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
            _root.playSound("半人马死亡.mp3");
            this.mc.gotoAndStop("die");
            delete this.enterframe;
            this._parent._parent.delUnit1(this);
            this.counter = 0;
            this.enterframe = function()
            {
               if(++this.counter >= 60)
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
   function dropSpecialItem()
   {
      var _loc3_;
      var _loc4_;
      if(_root.game.map.player.chapter == 2 && _root.game.map.player.phase == 1)
      {
         if(random(100) < 20)
         {
            _loc3_ = _root.game.map.getNextHighestDepth();
            _loc4_ = _root.game.map.attachMovie("chest","chest" + _loc3_,_loc3_,{_x:this._x,_y:this._y - 3});
            _loc4_.init("任务箱子",new QuestItem("brmzj"));
            return true;
         }
      }
      return false;
   }
   function setLevel(num)
   {
      this.setLevelBasicAttrib(num);
      this.enemyName = "centaur";
      if(_root["centaurc" + num])
      {
         _root.changeColor(this,_root["centaurc" + num]);
      }
      if(num == 17 || num == 25)
      {
         this.addDmgType = ["fire",4];
      }
      else if(num == 23)
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
      this.attack = [int(this.attack[0] * 1.3),int(this.attack[1] * 1.3)];
      this.defence = int(this.defence * 1.2);
      this.hp = this.totalHp = int(this.totalHp * 2);
      this.exp = int(this.exp * 1.6);
   }
   function attack1()
   {
      if(this.keepDistance != 0)
      {
         this.attack2();
         return undefined;
      }
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
         else if(this.mc.mc._currentframe == 7)
         {
            if(this.checkHit1(this._parent.player,70,45))
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
      this.counter = - random(this.atkT);
      this.faceHero();
      this.mc.gotoAndStop("attack");
      this.mc.mc.stop();
      this.go = true;
      this.xSpeed = this.ySpeed = this.speed = 0;
      this.enterframe = function()
      {
         if(this.mc.mc._currentframe == 1)
         {
            this.speed = 0;
            if(this.counter <= this.fht + 10)
            {
               this.counter = this.counter + 1;
               if(this.counter == 1)
               {
                  _root.shotShine2(this,"white",3);
               }
               else if(this.counter > this.fht + 10)
               {
                  this.mc.mc.play();
               }
            }
         }
         else if(this.mc.mc._currentframe == 7)
         {
            this.speed = this.dashSpeed;
            this.xSpeed = this.speed * Math.cos(this.moveDir * 0.0174);
            this.ySpeed = this.speed * Math.sin(this.moveDir * 0.0174);
            super.addBlurFilter(Math.abs(this.xSpeed / 5),Math.abs(this.ySpeed / 5));
         }
         else if(this.mc.mc._currentframe == 8)
         {
            this.mc.mc.stop();
            if(this.speed < 1)
            {
               if(++this.counter > this.bht)
               {
                  this.attacking = false;
                  this.counter = 0;
                  this.delFilter();
                  this.speed = this.moveSpeed;
                  this.action();
                  return undefined;
               }
            }
            else if(++this.counter > 3)
            {
               if(this.checkHit1(this._parent.player,80,90))
               {
                  this._parent.player.hitAction(this.getDamage(this._parent.player,0),"normal",0,this.atkLv,this.addDmgType,this.criticalHit);
                  this._parent.player.xSpeed = 5;
                  this._parent.player.ySpeed = 5;
                  this._parent.player.startJump(8);
                  this._parent.player.go = true;
                  this.startJump(8);
                  this.speed *= -0.3;
               }
               super.addBlurFilter(Math.abs(this.xSpeed / 5),Math.abs(this.ySpeed / 5));
               this.counter = 0;
            }
            this.speed *= 0.85;
            this.xSpeed = this.speed * Math.cos(this.moveDir * 0.0174);
            this.ySpeed = this.speed * Math.sin(this.moveDir * 0.0174);
         }
         this.gForce();
         this.moveFunc();
         this.mainAction();
      };
   }
   function action()
   {
      this.attacking = false;
      this.mc.gotoAndStop("stand");
      this.delFilter();
      this.patrol();
   }
   function patrol()
   {
      this.mc.gotoAndStop("walk");
      this.blocked = false;
      this.go = true;
      if(!random(2))
      {
         this.keepDistance = 0;
         this.attackR = 50;
      }
      else
      {
         this.keepDistance = 200;
         this.attackR = 250;
      }
      this.speed = this.moveSpeed;
      this.enterframe = function()
      {
         this.gForce();
         this.mainAction();
         if(this._parent._parent.getDis(this._x,this._y,this.setPoint[0],this.setPoint[1]) > 150)
         {
            this.moveDir = this._parent._parent.getRotation(this._x,this._y,this.setPoint[0],this.setPoint[1]);
         }
         this.moveAction();
         if(!random(this.stayRate))
         {
            this.stay();
         }
         this.checkAttack();
      };
   }
}
