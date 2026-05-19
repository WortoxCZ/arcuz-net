class Ghost extends FloatingEnemy
{
   var _alpha;
   var _name;
   var _parent;
   var _x;
   var _y;
   var addDmgType;
   var alreadyDrop;
   var atkLv;
   var atkT;
   var attack;
   var attackR;
   var attackRate;
   var attacking;
   var bht;
   var blendMode;
   var blocked;
   var blow;
   var checkAttack;
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
   var fric;
   var getDamage;
   var ghostList;
   var go;
   var gotoAndStop;
   var hit;
   var hitAction;
   var hitHardTime;
   var hp;
   var jump;
   var keepDistance;
   var keepDistance1;
   var level;
   var mainAction;
   var mc;
   var moveDir;
   var onEnterFrame;
   var rUnit;
   var resist;
   var setLevelBasicAttrib;
   var setPoint;
   var showHp;
   var sightA;
   var sightD;
   var speed;
   var splitLife;
   var stay;
   var totalHp;
   var trackHero;
   var xSpeed;
   var ySpeed;
   function Ghost()
   {
      super();
      var _loc4_;
      var _loc5_;
      var _loc3_;
      if(this._name.slice(0,8) != "instance")
      {
         this.keepDistance = 150;
         this.attackRate = 3;
         this.hp = 40;
         this.attack = [15,25];
         this.defence = 1;
         _loc4_ = this._x;
         _loc5_ = this._y;
         this.setPoint = [_loc4_,_loc5_];
         this.rUnit = 10;
         this.attackR = 45;
         this.fht = 5;
         this.bht = 25;
         this.hitHardTime = 15;
         this.atkLv = 5;
         this.defLv = 3;
         this.atkT = 5;
         this.sightD = 400;
         this.sightA = 300;
         this.moveDir = 45 * random(8) - 135;
         _loc3_ = random(8) + 1;
         this.gotoAndStop(_loc3_); //unpopped
         this.curDir = _loc3_;
         this.desDir = _loc3_;
         this.speed = 12;
         this.xSpeed = this.ySpeed = 0;
         this.blow = true;
         this.exp = 100;
         this.splitLife = 3;
         this.ghostList = [];
         this.mc.stop();
         this.enemyName = "";
         this.blendMode = 4;
         this._parent._parent.firstTimeInMap(this);
      }
   }
   function gForce()
   {
   }
   function setLevel(num)
   {
      this.enemyName = "ghost";
      this.setLevelBasicAttrib(num);
      this.attack = [int(this.attack[0] * 1.2),int(this.attack[1] * 1.2)];
      this.defence = int(this.defence * 1.2);
      this.hp = this.totalHp = int(this.totalHp * 5);
      this.exp = int(this.exp * 4);
   }
   function initSplitMode()
   {
      this.mc.gotoAndStop("stand");
      this._alpha = 0;
      this.setPoint = [this._x,this._y];
      this.enterframe = undefined;
      this.onEnterFrame = function()
      {
         this._alpha += 10;
         if(this._alpha >= 100)
         {
            this._alpha = 100;
            this.onEnterFrame = undefined;
            this.action();
         }
      };
   }
   function setMeFake()
   {
      this.exp = 0;
      this.hp = this.totalHp = int(this.totalHp / 5);
      this.splitLife = 0;
      this.ghostList = 0;
      this.alreadyDrop = true;
   }
   function split(num)
   {
      _root.playSound1("鬼魂分身.mp3");
      this.showHp.removeMovieClip();
      this.splitLife = this.splitLife - 1;
      this.ghostList = [];
      var _loc3_ = 0;
      var _loc8_;
      var _loc7_;
      var _loc5_;
      var _loc4_;
      while(_loc3_ < num)
      {
         _loc8_ = 150 * Math.sin(_loc3_ * (360 / (num + 1)) * 0.0174);
         _loc7_ = 150 * Math.cos(_loc3_ * (360 / (num + 1)) * 0.0174);
         _loc5_ = this._parent.getNextHighestDepth();
         _loc4_ = this._parent.attachMovie("ghost","enemy" + _loc5_,_loc5_,{_x:this._x + _loc8_,_y:this._y + _loc7_});
         _loc4_.setLevel(this.level);
         _loc4_.setMeFake();
         _loc4_.initSplitMode();
         this.ghostList.push(_loc4_);
         _loc3_ = _loc3_ + 1;
      }
      _loc8_ = -87.39082619290224;
      _loc7_ = 48.60908862879402;
      this._x += _loc8_;
      this._y += _loc7_;
      var _loc11_ = random(num + 1);
      var _loc12_;
      var _loc13_;
      if(_loc11_ != num)
      {
         _loc12_ = this._x;
         _loc13_ = this._y;
         this._x = this.ghostList[_loc11_]._x;
         this._y = this.ghostList[_loc11_]._y;
         this.ghostList[_loc11_]._x = _loc12_;
         this.ghostList[_loc11_]._y = _loc13_;
      }
      this.initSplitMode();
   }
   function die()
   {
      _root.playSound("鬼魂死亡.mp3");
      super.die();
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
         if(!this.jump)
         {
            this.xSpeed *= 0.7;
            this.ySpeed *= 0.7;
         }
         if(--this.counter < 0)
         {
            if(this.hp <= 0)
            {
               delete this.hitAction;
               delete this.action;
               this._parent.player.getExp(this.exp);
               this.die();
               for(var _loc2_ in this.ghostList)
               {
                  this.ghostList[_loc2_].die();
               }
            }
            else
            {
               this.hit = false;
               if(this.splitLife == 3 && this.hp < this.totalHp * 2 / 3)
               {
                  this.split(3);
               }
               else if(this.splitLife == 2 && this.hp < this.totalHp / 3)
               {
                  this.split(5);
               }
               else if(this.splitLife == 1 && this.hp < this.totalHp / 7)
               {
                  this.split(7);
               }
               this.action();
            }
         }
      };
   }
   function attack1()
   {
      this.counter = -1;
      this.go = true;
      this.mc.gotoAndStop("attack");
      this.mc.mc.stop();
      this.mainAction();
      this.enterframe = function()
      {
         this.gForce();
         this.moveAction();
         this.trackHero();
         this.facePlayer();
         if(this.counter < 0)
         {
            if(++this.counter == 0)
            {
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
         else if(this.mc.mc._currentframe == 5)
         {
            this.mc.mc.stop();
            if(++this.counter > this.fht)
            {
               this.mc.mc.play();
            }
         }
         else if(this.mc.mc._currentframe == 9)
         {
            if(this.checkHit1(this._parent.player,50,15))
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
   function chasingHero()
   {
      this.mc.gotoAndStop("walk");
      this.go = true;
      this.keepDistance1 = random(this.keepDistance) + this.keepDistance;
      this.enterframe = function()
      {
         this.moveAction();
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
         }
         else
         {
            this.patrol();
         }
         this.facePlayer();
      };
   }
   function moveAction()
   {
      this.xSpeed += (this.speed * Math.cos(this.moveDir * 0.0174) - this.xSpeed) / 15;
      this.ySpeed += (this.speed * Math.sin(this.moveDir * 0.0174) - this.ySpeed) / 15;
      this._x += this.xSpeed;
      this._y += this.ySpeed;
      if(this._x < 20)
      {
         this._x = 20;
      }
      else if(this._x > this._parent.mapW - 20)
      {
         this._x = this._parent.mapW - 20;
      }
      if(this._y < 50)
      {
         this._y = 50;
      }
      else if(this._y > this._parent.mapH - 20)
      {
         this._y = this._parent.mapH - 20;
      }
   }
   function moveFunc()
   {
      if(this.go)
      {
         if(this.jump || this.attacking)
         {
            this._x += this.xSpeed;
            this._y += this.ySpeed;
         }
         else
         {
            this._x += this.xSpeed * this.fric;
            this._y += this.ySpeed * this.fric;
         }
      }
      if(this._x < 20)
      {
         this._x = 20;
      }
      else if(this._x > this._parent.mapW - 20)
      {
         this._x = this._parent.mapW - 20;
      }
      if(this._y < 50)
      {
         this._y = 50;
      }
      else if(this._y > this._parent.mapH - 20)
      {
         this._y = this._parent.mapH - 20;
      }
   }
   function action()
   {
      this.attacking = false;
      this.mc.gotoAndStop("stand");
      this.patrol();
   }
   function patrol()
   {
      this.mc.gotoAndStop("walk");
      this.resist = 0;
      this.blocked = false;
      this.go = true;
      this.enterframe = function()
      {
         this.mainAction();
         if(this._parent._parent.getDis(this._x,this._y,this.setPoint[0],this.setPoint[1]) > 150)
         {
            this.moveDir = this._parent._parent.getRotation(this._x,this._y,this.setPoint[0],this.setPoint[1]);
         }
         else if(!random(30))
         {
            this.stay();
         }
         this.moveAction();
         this.checkAttack();
      };
   }
}
