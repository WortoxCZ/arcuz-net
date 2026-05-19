class GoblinArcher extends Enemy
{
   var _alpha;
   var _currentframe;
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
   var attacking;
   var bht;
   var blow;
   var counter;
   var curDir;
   var defLv;
   var defence;
   var desDir;
   var enemyName;
   var enterframe;
   var exp;
   var fht;
   var gForce;
   var go;
   var gotoAndStop;
   var hit;
   var hitHardTime;
   var hp;
   var jump;
   var keepDistance;
   var level;
   var link;
   var mc;
   var moveDir;
   var moveFunc;
   var rUnit;
   var removeMovieClip;
   var setPoint;
   var sightA;
   var sightD;
   var speed;
   var totalHp;
   var translateFrameToDegree;
   var xSpeed;
   var xs;
   var ySpeed;
   var ys;
   function GoblinArcher()
   {
      super();
      var _loc4_;
      var _loc5_;
      var _loc3_;
      if(this._name.slice(0,8) != "instance")
      {
         this.keepDistance = 100;
         this.hp = 40;
         this.attack = [15,25];
         this.defence = 1;
         _loc4_ = this._x;
         _loc5_ = this._y;
         this.setPoint = [_loc4_,_loc5_];
         this.rUnit = 10;
         this.attackR = 200;
         this.fht = 5;
         this.bht = 5;
         this.hitHardTime = 15;
         this.atkLv = 10;
         this.defLv = 3;
         this.atkT = 5;
         this.sightD = 300;
         this.sightA = 180;
         this.moveDir = 45 * random(8) - 135;
         _loc3_ = random(8) + 1;
         this.gotoAndStop(_loc3_); //unpopped
         this.curDir = _loc3_;
         this.desDir = _loc3_;
         this.speed = 5;
         this.blow = true;
         this.exp = 100;
         this.mc.stop();
         this._parent._parent.firstTimeInMap(this);
      }
   }
   function setLevel(num)
   {
      this.setLevelBasicAttrib(num);
      this.enemyName = "goblinArcher";
      if(_root["goblinc" + num])
      {
         _root.changeColor(this,_root["goblinc" + num]);
      }
      this.attack = [int(this.attack[0] * 1.2),int(this.attack[1] * 1.1)];
      this.defence = int(this.defence * 0.6);
      this.hp = this.totalHp = int(this.totalHp * 1);
      this.exp = int(this.exp * 1.1);
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
            _root.playSound("哥布林弓箭手死亡.mp3");
            delete this.enterframe;
            this._parent._parent.delUnit1(this);
            this.counter = 60;
            this.enterframe = function()
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
      this.attacking = true;
      this.counter = - random(this.atkT);
      this.mc.gotoAndStop("stand");
      this.go = false;
      this.enterframe = function()
      {
         this.gForce();
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
         else if(this.mc.mc._currentframe == 13)
         {
            this.mc.mc.stop();
            if(++this.counter > this.fht)
            {
               this.mc.mc.play();
            }
         }
         else if(this.mc.mc._currentframe == this.mc.mc._totalframes - 1)
         {
            this.counter = 0;
            _root.playSound("哥布林弓箭手射箭.mp3");
            this.newArrow();
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
   function action()
   {
      this.attacking = false;
      this.mc.gotoAndStop("stand");
      this.patrol();
   }
   function newArrow()
   {
      var _loc4_ = this._parent.getNextHighestDepth();
      var _loc2_ = this._parent.attachMovie("goblinArcherArrow","arw" + _loc4_,_loc4_,{_x:this._x,_y:this._y - this.att - 12});
      _loc2_.att = -12;
      _loc2_.dir = this.translateFrameToDegree(this._currentframe);
      _loc2_.counter = 10;
      _loc2_._rotation = _loc2_.dir;
      _loc2_.speed = 50;
      _loc2_.xs = _loc2_.speed * Math.cos(_loc2_.dir * 0.0174);
      _loc2_.ys = _loc2_.speed * Math.sin(_loc2_.dir * 0.0174);
      _loc2_.blendMode = 4;
      _loc2_.link = this;
      _loc2_.onEnterFrame = function()
      {
         this._x += this.xs;
         this._y += this.ys;
         if(--this.counter < 0)
         {
            this.removeMovieClip();
         }
         var _loc3_;
         if(!this.hit)
         {
            _loc3_ = this.att > - this._parent.player.h + this._parent.player.att && this.att < this._parent.player.att;
            if(_loc3_)
            {
               for(var _loc2_ in this)
               {
                  if(this[_loc2_].hitTest(this._parent.player.hitMc))
                  {
                     this.hit = true;
                  }
               }
            }
            if(this.hit)
            {
               this._parent.player.hitAction(this.link.getDamage(this._parent.player,0),"normal",0,this.link.atkLv,"none",this.link.criticalHit);
            }
         }
      };
   }
   function mainAction()
   {
   }
}
