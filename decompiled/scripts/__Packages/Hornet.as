class Hornet extends Enemy
{
   var _alpha;
   var _name;
   var _parent;
   var _x;
   var _xscale;
   var _y;
   var _yscale;
   var addDmgType;
   var atkAtt;
   var atkLv;
   var atkT;
   var att;
   var attack;
   var attackR;
   var attackRate;
   var attackSpeed;
   var attacking;
   var bht;
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
   var flyAtt;
   var fric;
   var gForce;
   var getDamage;
   var go;
   var gotoAndStop;
   var gotoFrame;
   var hit;
   var hitAction;
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
   var rUnit;
   var removeMovieClip;
   var setLevelBasicAttrib;
   var setPoint;
   var shadowScale;
   var sightA;
   var sightD;
   var speed;
   var stay;
   var stayRate;
   var totalHp;
   var trackHero;
   var translateDegreeToFrame;
   var xSpeed;
   var ySpeed;
   var zSpeed;
   function Hornet()
   {
      super();
      var _loc4_;
      var _loc5_;
      var _loc3_;
      if(this._name.slice(0,8) != "instance")
      {
         this.hp = 40;
         this.attack = [15,25];
         this.defence = 1;
         _loc4_ = this._x;
         _loc5_ = this._y;
         this.setPoint = [_loc4_,_loc5_];
         this.rUnit = 10;
         this.attackR = 100;
         this.fht = 3;
         this.bht = 30;
         this.hitHardTime = 25;
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
         this.speed = this.moveSpeed = 4;
         this.attackSpeed = 6;
         this.blow = true;
         this.exp = 8;
         this.mc.stop();
         this.flyAtt = -80 - random(30);
         this.att = this.mc._x = 0;
         this._parent._parent.firstTimeInMap(this);
         this.stayRate = 250;
         this.chaseRate = 30;
         this.attackRate = 15;
         this.keepDistance = 0;
         this.enemyName = "hornet1";
         this.fric = 1;
         this.xSpeed = this.ySpeed = 0;
      }
   }
   function setLevel(num)
   {
      this.setLevelBasicAttrib(num);
      this.enemyName = "hornet";
      if(_root["hornetc" + num])
      {
         _root.changeColor(this,_root["hornetc" + num]);
      }
      this.speed = this.moveSpeed = num >= 5 ? (num >= 10 ? (num >= false ? 7 : 6) : 5) : 4;
      this.attackSpeed = num >= 5 ? (num >= 10 ? (num >= false ? 9 : 8) : 7) : 6;
      if(num == 11)
      {
         this.addDmgType = ["fire",4];
      }
      else if(num == 17)
      {
         this.addDmgType = ["ice",4];
      }
      else if(num == 27)
      {
         this.addDmgType = ["poison",4];
      }
      else if(num == 29)
      {
         this.addDmgType = ["thunder",4];
      }
      this.attack = [int(this.attack[0] * 1),int(this.attack[1] * 1.1)];
      this.defence = int(this.defence * 0.3);
      this.hp = this.totalHp = int(this.totalHp * 1);
      this.exp = int(this.exp * 1.2);
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
      this.jump = true;
      this.jumpSpeed = 0;
      this.enterframe = function()
      {
         this.gForce();
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
               this.endAttack();
            }
         }
      };
   }
   function die()
   {
      _root.playSound("蜜蜂死亡.mp3");
      this.mc.gotoAndStop("die");
      this._parent._parent.delUnit1(this);
      this.counter = 0;
      this.jump = true;
      this.jumpSpeed = 0;
      this.enterframe = function()
      {
         this.gForce();
         if(this.att >= 0)
         {
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
      };
   }
   function setType(num)
   {
      if(num != 1)
      {
         if(num == 2)
         {
            _root.changeColor(this,_root.Dark);
            this.hp = 60;
            this.attackSpeed = 9;
            this.addDmgType = ["thunder",4];
            this.attack = [15,30];
         }
         else if(num == 3)
         {
            _root.changeColor(this,_root.Red1);
            this.attack = [20,35];
            this.attackSpeed = 9;
            this.addDmgType = ["fire",4];
            this.hp = 70;
         }
         else if(num == 4)
         {
            _root.changeColor(this,_root.Gold);
            this.hp = 100;
            this.atkLv = 5;
            this.defLv = 5;
            this.blow = false;
            this.moveSpeed = 6;
            this.attackSpeed = 10;
            this.attack = [20,45];
            this.addDmgType = ["poison",4];
            this._xscale = this._yscale = 120;
         }
      }
      this.enemyName = "hornet" + num;
   }
   function attack1()
   {
      this.attacking = true;
      this.counter = - random(this.atkT);
      this.mc.gotoAndStop("stand");
      this.go = false;
      var _loc3_ = this._parent._parent.getDis(this._x,this._y,this._parent.player.x,this._parent.player.y);
      this.atkAtt = this._parent.player.att;
      this.atkAtt = this.atkAtt <= this.att - 10 ? this.att - 10 : this.atkAtt;
      this.atkAtt = this.atkAtt >= 0 ? 5 : this.atkAtt;
      var _loc4_ = this.atkAtt - this.att;
      var _loc5_ = Math.sqrt(_loc4_ * _loc4_ + _loc3_ * _loc3_);
      this.zSpeed = this.attackSpeed * _loc4_ / _loc5_;
      this.speed = this.attackSpeed * _loc3_ / _loc5_;
      this.zSpeed = this.zSpeed <= 0 ? 0.5 : this.zSpeed;
      this.enterframe = function()
      {
         this.gForce();
         this.moveAction();
         if(this.counter < 0)
         {
            if(++this.counter == 0)
            {
               this.trackHero();
               this.mc.gotoAndStop("attack");
               this.mc.mc.play();
               _root.shotShine2(this,"white",this.fht);
               this.counter = 0;
            }
         }
         else if(this.mc.mc._currentframe == this.mc.mc._totalframes)
         {
            this.mc.mc.stop();
            this.go = true;
            this.moveFunc();
            this.mc._y += this.zSpeed;
            this.att = this.mc._y;
            if(this.att > this.atkAtt)
            {
               this.endAttack();
            }
            if(++this.counter % 8 == 0)
            {
               if(this.checkHit1(this._parent.player,50,180))
               {
                  this._parent.player.hitAction(this.getDamage(this._parent.player,0),"normal",0,this.atkLv,this.addDmgType,this.criticalHit);
               }
            }
         }
      };
   }
   function endAttack(riseSpeed)
   {
      this.mc.gotoAndStop("stand");
      this.speed = this.moveSpeed;
      if(riseSpeed == undefined)
      {
         this.zSpeed = -0.2 * this.attackSpeed;
      }
      else
      {
         this.zSpeed = - riseSpeed;
      }
      this.flyAtt = -80 - random(30);
      this.enterframe = function()
      {
         this.moveAction();
         this.mc._y += this.zSpeed;
         this.att = this.mc._y;
         if(this.att < this.flyAtt && this.att < 0)
         {
            this.stay();
         }
         this.shadowScale();
      };
   }
   function moveAction()
   {
      this.gotoFrame(this.translateDegreeToFrame(this.moveDir));
      this.xSpeed += (this.speed * Math.cos(this.moveDir * 0.0174) - this.xSpeed) / 20;
      this.ySpeed += (this.speed * Math.sin(this.moveDir * 0.0174) - this.ySpeed) / 20;
      this.moveFunc();
   }
   function action()
   {
      this.attacking = false;
      this.mc.gotoAndStop("stand");
      this.att = this.mc._x = 0;
      this.endAttack(this.attackSpeed);
   }
}
