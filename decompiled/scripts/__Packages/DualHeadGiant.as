class DualHeadGiant extends Enemy
{
   var _alpha;
   var _currentframe;
   var _height;
   var _name;
   var _parent;
   var _x;
   var _y;
   var addDmgType;
   var atkLv;
   var atkT;
   var att;
   var attack;
   var attack1end;
   var attack1start;
   var attack2end;
   var attack2start;
   var attack3end;
   var attack3start;
   var attackCounter;
   var attackCounter1;
   var attackCounter2;
   var attackR;
   var attackRate;
   var attacking;
   var bht;
   var blocked;
   var blow;
   var chaseRate;
   var checkHit;
   var counter;
   var criticalHit;
   var curDir;
   var defLv;
   var defence;
   var desDir;
   var enemyName;
   var exp;
   var fht;
   var from;
   var getDamage;
   var go;
   var gotoAndStop;
   var gotoFrame;
   var h;
   var highDefence;
   var hit;
   var hitHardTime;
   var hp;
   var iceAttack;
   var jump;
   var keepDistance;
   var keepDistance1;
   var link;
   var lowDefence;
   var mc;
   var moveAction;
   var moveDir;
   var moveFunc;
   var nta;
   var onEnterFrame;
   var parent;
   var rUnit;
   var removeMovieClip;
   var resist;
   var setLevelBasicAttrib;
   var setPoint;
   var sightA;
   var sightD;
   var speed;
   var stayRate;
   var step;
   var totalHp;
   var translateDegreeToFrame;
   var translateFrameToDegree;
   var tx;
   var ty;
   var weakCounter;
   var xSpeed;
   var xs;
   var ySpeed;
   var ys;
   function DualHeadGiant()
   {
      super();
      var _loc4_;
      var _loc5_;
      var _loc3_;
      if(this._name.slice(0,8) != "instance")
      {
         this.resist = 99;
         this.keepDistance = 0;
         this.hp = this.totalHp = 1000;
         this.attack = [15,50];
         this.defence = 1000;
         _loc4_ = this._x;
         _loc5_ = this._y;
         this.setPoint = [_loc4_,_loc5_];
         this.rUnit = 50;
         this.attackR = 180;
         this.fht = 10;
         this.bht = 10;
         this.hitHardTime = 15;
         this.atkLv = 8;
         this.defLv = 5;
         this.atkT = 5;
         this.sightD = 700;
         this.sightA = 180;
         this.moveDir = 90;
         _loc3_ = 3;
         this.gotoAndStop(_loc3_); //unpopped
         this.curDir = _loc3_;
         this.desDir = _loc3_;
         this.speed = 2;
         this.blow = false;
         this.exp = 100;
         this.mc.stop();
         this.attack1start = 10;
         this.attack1end = 14;
         this.attack2start = 26;
         this.attack2end = 30;
         this.attack3start = 48;
         this.attack3end = 52;
         this.stayRate = 200;
         this.chaseRate = 2;
         this.attackRate = 5;
         this.keepDistance = 0;
         this.attackCounter = 0;
         this.attackCounter1 = 0;
         this.attackCounter2 = 0;
         this.iceAttack = false;
         this.addDmgType = ["fire",4];
         this.enemyName = "dualHeadGiant";
         this._parent._parent.unitManager.unitArray.push(this);
         this._parent._parent.layerArr.push(this);
         this._parent._parent.bossArr.push(this);
         this.action();
      }
   }
   function enterframe()
   {
   }
   function startJump(speed)
   {
   }
   function gForce()
   {
   }
   function setLevel(num)
   {
      this.setLevelBasicAttrib(num);
      this.highDefence = int(this.defence * 40);
      this.lowDefence = this.defence;
      this.defence = this.highDefence;
   }
   function die()
   {
      this.mainAction();
      this.mc.gotoAndStop("die");
      this.mc.mc.gotoAndPlay(1);
      delete this.enterframe;
      this._parent._parent.delUnit1(this);
      this.counter = 0;
      _root.playSound("双头巨人死亡.mp3");
      if(_root.areaMode == 0)
      {
         _root.game.map.player.unbreakable = true;
      }
      this.enterframe = function()
      {
         this.mainAction();
         var _loc4_;
         var _loc5_;
         if(this.mc.mc._currentframe == this.mc.mc._totalframes - 3)
         {
            _root.shakeGame(35,10);
         }
         else if(this.mc.mc._currentframe == this.mc.mc._totalframes - 1)
         {
            if(_root.areaMode == 0)
            {
               if(++this.counter == 70)
               {
                  _root.game.pauseCharacters();
                  _root.game.map.player.mc.mc.stop();
                  _loc4_ = _root.ui.attachMovie("dialog","dialog",_root.ui.getNextHighestDepth());
                  _loc5_ = [_root.textEx[8][_root.lang],_root.textEx[9][_root.lang],_root.textEx[10][_root.lang]];
                  _loc4_.init("Dual-Head Giant",_loc5_);
                  _loc4_.link = this;
                  _loc4_.closeDlg = function()
                  {
                     _root.playSound("对话框");
                     _root.game.continueCharacters();
                     for(var _loc3_ in _root.game.map)
                     {
                        if(_root.game.map[_loc3_].enemyName != undefined)
                        {
                           if(_root.game.map[_loc3_].enemyName != "dualHeadGiant")
                           {
                              _root.game.map[_loc3_].die();
                           }
                        }
                     }
                     this.onEnterFrame = function()
                     {
                        this._y += Math.round((- this._height - 10 - this._y) / 2);
                        if(this._y <= - this._height)
                        {
                           this.removeMovieClip();
                        }
                     };
                  };
               }
               else if(this.counter > 130)
               {
                  this._alpha = this._alpha - 1;
                  if(this._alpha <= 0)
                  {
                     this._parent._parent.delUnit(this);
                     this.removeMovieClip();
                  }
               }
            }
            else if(++this.counter > 100)
            {
               this._alpha = this._alpha - 1;
               if(this._alpha <= 0)
               {
                  this._parent._parent.delUnit(this);
                  this.removeMovieClip();
               }
            }
         }
         else if(this.mc.mc._currentframe == this.mc.mc._totalframes)
         {
            this.mc.mc.stop();
            if(++this.counter > 100)
            {
               this._alpha = this._alpha - 1;
               if(this._alpha <= 0)
               {
                  this._parent._parent.delUnit(this);
                  this.removeMovieClip();
               }
            }
         }
      };
   }
   function hitAction(dmg, type, hitHT, attckLv, addDmg, criticalRate)
   {
      var _loc4_;
      if(this.mc.mc._currentframe == this.attack3end)
      {
         if(this.weakCounter._x == undefined)
         {
            this.defLv = 0;
            _loc4_ = this._parent.getNextHighestDepth();
            this.weakCounter = this._parent.attachMovie("thunderDmgFx","fx" + _loc4_,_loc4_,{_x:this._x,_y:this._y + this.att - this.h});
            this.weakCounter.parent = this;
            if(this.fht <= 0)
            {
               this.weakCounter.counter = 70;
            }
            else
            {
               this.weakCounter.counter = 175;
            }
            this.defence = this.lowDefence;
            this.weakCounter.onEnterFrame = function()
            {
               if(!_root.game.pauseAllCharacters)
               {
                  this._x = this.parent._x;
                  this._y = this.parent._y + this.parent.att - this.parent.h;
                  if(--this.counter < 0)
                  {
                     this._parent.defLv = 5;
                     this._parent.defence = this._parent.highDefence;
                     this.removeMovieClip();
                  }
                  else if(this.counter < 20)
                  {
                     this._alpha -= 5;
                  }
               }
            };
         }
      }
      super.hitAction(dmg,type,hitHT,attckLv,addDmg,criticalRate);
      if(this.hp > 0 && this.hp / this.totalHp < 0.3 && this.fht > 0)
      {
         this.goingMad();
      }
   }
   function hitAction2(dmg, type, hitHT)
   {
      this.hp -= dmg;
      if(this.hp <= 0)
      {
         this.hp = 0;
         this.counter = this.hitHardTime;
         delete this.action;
      }
      else
      {
         if(this.weakCounter.counter == undefined)
         {
            return undefined;
         }
         this.counter = this.weakCounter.counter;
      }
      this.mc.gotoAndStop("die");
      this.mc.mc.gotoAndPlay(1);
      this.hit = true;
      if(hitHT != undefined)
      {
         this.counter += hitHT;
      }
      this.enterframe = function()
      {
         if(this.mc.mc._currentframe >= 4)
         {
            this.mc.mc.gotoAndStop(1);
         }
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
               this._parent.player.getExp(this.exp);
               this.die();
            }
            else
            {
               this.iceAttack = true;
               this.hit = false;
               this.defLv = 5;
               this.defence = this._parent.highDefence;
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
            _root.changeColor(this,_root.Red1);
         }
      }
      this.enemyName = "dualHeadGiant" + num;
   }
   function goingMad()
   {
      this.mc.gotoAndStop("mad");
      this.counter = 30;
      this.defLv = 10;
      this.defence = this.highDefence;
      this.enterframe = function()
      {
         var _loc3_;
         var _loc4_;
         if(this.mc.mc._currentframe == this.mc.mc._totalframes)
         {
            this.mc.mc.stop();
            if(--this.counter < 0)
            {
               this.fht = 0;
               this.bht = 3;
               this.speed = 6;
               this.defLv = 5;
               this.highDefence = this.lowDefence * 70;
               this.action();
            }
         }
         else if(this.mc.mc._currentframe == 25)
         {
            this.mc.mc.stop();
            if(--this.counter < 0)
            {
               this.counter = 60;
               this.mc.mc.play();
            }
         }
         else if(this.mc.mc._currentframe == 22)
         {
            _root.shakeGame(40,6);
            if(_root.areaMode == 0)
            {
               _loc3_ = this._parent.getNextHighestDepth();
               _loc4_ = this._parent.attachMovie("ghost","enemy" + _loc3_,_loc3_);
               _loc4_.setLevel(29);
               _loc4_.hp = _loc4_.totalHp *= 5;
               _loc4_._xscale = _loc4_._yscale = 110;
               _loc4_.defLv = 5;
               _loc4_.atkT = 0;
               _loc4_.addDmgType = ["fire",4];
               _loc4_.initAreaMode();
               _loc3_ = this._parent.getNextHighestDepth();
               _loc4_ = this._parent.attachMovie("ghost","enemy" + _loc3_,_loc3_);
               _loc4_.setLevel(29);
               _loc4_.hp = _loc4_.totalHp *= 5;
               _loc4_._xscale = _loc4_._yscale = 110;
               _loc4_.defLv = 5;
               _loc4_.atkT = 0;
               _loc4_.addDmgType = ["ice",4];
               _loc4_.initAreaMode();
               _loc3_ = this._parent.getNextHighestDepth();
               _loc4_ = this._parent.attachMovie("ghost","enemy" + _loc3_,_loc3_);
               _loc4_.setLevel(29);
               _loc4_.hp = _loc4_.totalHp *= 5;
               _loc4_._xscale = _loc4_._yscale = 110;
               _loc4_.defLv = 5;
               _loc4_.atkT = 0;
               _loc4_.addDmgType = ["thunder",4];
               _loc4_.initAreaMode();
               _loc3_ = this._parent.getNextHighestDepth();
               _loc4_ = this._parent.attachMovie("ghost","enemy" + _loc3_,_loc3_);
               _loc4_.setLevel(29);
               _loc4_.hp = _loc4_.totalHp *= 5;
               _loc4_._xscale = _loc4_._yscale = 110;
               _loc4_.defLv = 5;
               _loc4_.atkT = 0;
               _loc4_.addDmgType = ["poison",4];
               _loc4_.initAreaMode();
            }
         }
      };
   }
   function attack1()
   {
      this.defence = this.highDefence;
      if(++this.attackCounter > 5)
      {
         this.attack3();
         this.attackCounter = 0;
         return undefined;
      }
      if(this.attackCounter1 == 2)
      {
         this.attackCounter1 = 0;
         this.callingFireRain();
         return undefined;
      }
      this.attacking = true;
      this.mc.gotoAndStop("attack");
      this.counter = 0;
      this.go = false;
      if(++this.attackCounter > 4)
      {
         this.attack3();
      }
      this.enterframe = function()
      {
         this.gForce();
         this.moveAction();
         this.mainAction();
         var _loc6_;
         var _loc5_;
         var _loc4_;
         var _loc3_;
         if(this.mc.mc._currentframe == this.attack1start)
         {
            this.mc.mc.stop();
            if(++this.counter > this.fht)
            {
               this.counter = 0;
               this.mc.mc.play();
            }
         }
         else if(this.mc.mc._currentframe == this.attack1end - 1)
         {
            _loc6_ = 100 * Math.cos(this.translateFrameToDegree(this._currentframe) * 0.0174);
            _loc5_ = 100 * Math.sin(this.translateFrameToDegree(this._currentframe) * 0.0174);
            if(this._parent._parent.getDis(this._x + _loc6_,this._y + _loc5_,this._parent.player._x,this._parent.player._y) < 100)
            {
               this._parent.player.hitAction(this.getDamage(this._parent.player,0),"normal",0,this.atkLv,this.addDmgType,this.criticalHit);
            }
            _loc4_ = this._parent.getNextHighestDepth();
            _loc3_ = this._parent.attachMovie("ea3d1","ef" + _loc4_,_loc4_);
            _loc3_._x = this._x + _loc6_;
            _loc3_._y = this._y + _loc5_;
            _loc3_.blendMode = "add";
            if(this.iceAttack)
            {
               this.newiceMagic1(0);
               this.iceAttack = false;
               if(this.fht == 0)
               {
                  this.newiceMagic1(-30);
                  this.newiceMagic1(30);
               }
            }
         }
         else if(this.mc.mc._currentframe == this.attack1end)
         {
            this.mc.mc.stop();
            _root.playSound("双头巨人捶地.mp3");
            _root.shakeGame(8,6);
            if(++this.counter > this.bht)
            {
               this.counter = 0;
               this.mc.mc.play();
            }
         }
         else if(this.mc.mc._currentframe == this.attack1end + 5)
         {
            this.counter = 0;
         }
         else if(this.mc.mc._currentframe == this.attack1end + 6)
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
   function attack3()
   {
      this.attacking = true;
      this.mc.gotoAndStop("attack");
      this.counter = 0;
      this.go = false;
      this.enterframe = function()
      {
         this.gForce();
         this.moveAction();
         this.mainAction();
         var _loc6_;
         var _loc5_;
         var _loc4_;
         var _loc3_;
         if(this.mc.mc._currentframe == this.attack1start || this.mc.mc._currentframe == this.attack2start || this.mc.mc._currentframe == this.attack3start)
         {
            this.mc.mc.stop();
            if(++this.counter > this.fht)
            {
               if(this.mc.mc._currentframe == this.attack3start)
               {
                  if(this.fht > 0)
                  {
                     this.counter = -60;
                  }
                  else
                  {
                     this.counter = -20;
                  }
               }
               else
               {
                  this.counter = 0;
               }
               this.mc.mc.play();
            }
         }
         else if(this.mc.mc._currentframe == this.attack1end - 1 || this.mc.mc._currentframe == this.attack2end - 1)
         {
            _loc6_ = 100 * Math.cos(this.translateFrameToDegree(this._currentframe) * 0.0174);
            _loc5_ = 100 * Math.sin(this.translateFrameToDegree(this._currentframe) * 0.0174);
            if(this._parent._parent.getDis(this._x + _loc6_,this._y + _loc5_,this._parent.player._x,this._parent.player._y) < 100)
            {
               this._parent.player.hitAction(this.getDamage(this._parent.player,0),"normal",0,this.atkLv,this.addDmgType,this.criticalHit);
            }
            _loc4_ = this._parent.getNextHighestDepth();
            _loc3_ = this._parent.attachMovie("ea3d1","ef" + _loc4_,_loc4_);
            _loc3_._x = this._x + _loc6_;
            _loc3_._y = this._y + _loc5_;
            _loc3_.blendMode = "add";
            _root.playSound("双头巨人捶地.mp3");
            _root.shakeGame(8,6);
         }
         else if(this.mc.mc._currentframe == this.attack3end - 1)
         {
            _loc6_ = 100 * Math.cos(this.translateFrameToDegree(this._currentframe) * 0.0174);
            _loc5_ = 100 * Math.sin(this.translateFrameToDegree(this._currentframe) * 0.0174);
            if(this._parent._parent.getDis(this._x + _loc6_,this._y + _loc5_,this._parent.player._x,this._parent.player._y) < 130)
            {
               this._parent.player.hitAction(this.getDamage(this._parent.player,0),"normal",0,this.atkLv,this.addDmgType,this.criticalHit);
            }
            _loc4_ = this._parent.getNextHighestDepth();
            _loc3_ = this._parent.attachMovie("ea3d2","ef" + _loc4_,_loc4_);
            _loc3_._x = this._x + _loc6_;
            _loc3_._y = this._y + _loc5_;
            _loc3_.blendMode = "add";
            this.attackCounter1 = this.attackCounter1 + 1;
            if(this.attackCounter2 == 0)
            {
               this.attackCounter2 = 1;
               this.iceTripAttack();
            }
            else
            {
               this.attackCounter2 = 0;
               this.iceRingAttack();
            }
            _root.playSound("双头巨人捶地.mp3");
            _root.shakeGame(30,6);
         }
         else if(this.mc.mc._currentframe == this.attack1end || this.mc.mc._currentframe == this.attack2end || this.mc.mc._currentframe == this.attack3end)
         {
            this.mc.mc.stop();
            if(++this.counter > this.bht)
            {
               this.counter = 0;
               this.mc.mc.play();
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
   function callingFireRain()
   {
      this.mc.gotoAndStop("mad");
      this.defence = this.highDefence;
      this.counter = 150;
      this.enterframe = function()
      {
         if(this.mc.mc._currentframe == this.mc.mc._totalframes)
         {
            this.mc.mc.stop();
            if(--this.counter < 0)
            {
               this.action();
            }
         }
         else if(this.mc.mc._currentframe == 25)
         {
            this.mc.mc.stop();
            if(--this.counter < 0)
            {
               this.counter = 60;
               this.mc.mc.play();
            }
            else if(this.counter % (9 + this.fht) == 1)
            {
               this.newFireSetPostion(50);
            }
         }
         else if(this.mc.mc._currentframe == 22)
         {
            _root.shakeGame(40,5);
         }
      };
   }
   function action()
   {
      this.attacking = false;
      this.mc.gotoAndStop("walk");
      this.resist = 99;
      this.defence = this.highDefence;
      this.patrol();
   }
   function iceRingAttack()
   {
      var _loc5_ = this._parent.getNextHighestDepth();
      var _loc6_ = this._parent.createEmptyMovieClip("iceMagic" + _loc5_,_loc5_);
      _loc6_.att = -10;
      _loc6_.checkHit = this.checkHitMagicObjectToPlayer;
      _loc6_._x = this._x;
      _loc6_._y = this._y;
      _loc6_.from = this;
      if(this.fht != 0)
      {
         _loc6_.counter = 5;
      }
      else
      {
         _loc6_.counter = 10;
      }
      _loc6_.step = 0;
      _loc6_.onEnterFrame = function()
      {
         this._x += this.xs;
         this._y += this.ys;
         var _loc3_;
         var _loc4_;
         var _loc5_;
         var _loc2_;
         if(this.counter % 5 == 0)
         {
            _loc3_ = 0;
            while(_loc3_ < 18)
            {
               _loc4_ = _loc3_ * 20;
               _loc5_ = this._parent.getNextHighestDepth();
               _loc2_ = this._parent.attachMovie("iceMagic","iceMagic" + _loc5_,_loc5_,{_x:this._x,_y:this._y});
               _loc2_._x += (100 + 50 * this.step) * Math.cos(_loc4_ * 0.0174);
               _loc2_._y += (100 + 50 * this.step) * Math.sin(_loc4_ * 0.0174);
               _loc2_.blendMode = 4;
               _loc2_.att = -10;
               _loc2_.dir = _loc4_;
               this.checkHit(_loc2_,this.from,["ice",0]);
               _loc3_ = _loc3_ + 1;
            }
            this.step = this.step + 1;
         }
         if(--this.counter < 0)
         {
            this.removeMovieClip();
         }
      };
   }
   function iceTripAttack()
   {
      this.newiceMagic1(0);
      this.newiceMagic1(-30);
      this.newiceMagic1(30);
      if(this.fht == 0)
      {
         this.newiceMagic1(-60);
         this.newiceMagic1(60);
         this.newiceMagic1(-90);
         this.newiceMagic1(90);
      }
   }
   function patrol()
   {
      this.mc.gotoAndStop("walk");
      this.blocked = false;
      this.go = true;
      this.enterframe = function()
      {
         if(this.mc.mc._currentframe == this.mc.mc._totalframes)
         {
            this.mc.mc.gotoAndPlay(10);
         }
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
   function checkAttack()
   {
      if(this._parent._parent.getDis(this._x,this._y,this._parent.player.x,this._parent.player.y) < this.sightD)
      {
         if(!random(this.chaseRate))
         {
            this.chasingHero();
         }
      }
   }
   function stay()
   {
      this.mc.gotoAndStop("walk");
      this.mc.mc.stop();
      this.go = false;
      this.enterframe = function()
      {
         this.gForce();
         this.moveAction();
         this.tx = 0;
         this.ty = 0;
         var _loc2_ = random(300);
         if(_loc2_ < 1)
         {
            this.moveDir = 45 * random(8) - 135;
            this.patrol();
         }
         else if(_loc2_ < 4)
         {
            this.moveDir = 45 * random(8) - 135;
         }
         this.mainAction();
         this.gotoFrame(this.translateDegreeToFrame(this.moveDir));
         this.checkAttack();
      };
   }
   function chasingHero()
   {
      this.mc.gotoAndStop("walk");
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
      };
   }
   function mainAction()
   {
   }
   function newFireSetPostion(offset)
   {
      var _loc3_ = this._parent.getNextHighestDepth();
      var _loc2_ = this._parent.attachMovie("魔法定位","fb" + _loc3_,_loc3_,{_x:this._parent.player._x + random(offset) - offset / 2,_y:this._parent.player._y + random(offset) - offset / 2,_alpha:0});
      _loc2_.nta = this.newFireAttack;
      _loc2_.link = this;
      _loc2_.attack = function()
      {
         this.nta(this._x,this._y,this.link);
      };
      _loc2_.blendMode = 8;
      _loc2_.step = 5;
      if(this.fht == 0)
      {
         _loc2_.step = 8;
      }
      _loc2_.onEnterFrame = function()
      {
         this._alpha += this.step;
         if(this._alpha > 100)
         {
            this.attack();
            this.removeMovieClip();
         }
      };
   }
   function newFireAttack(px, py, from)
   {
      var _loc6_ = this._parent.getNextHighestDepth();
      var _loc8_ = this._parent.attachMovie("流星火雨","fb" + _loc6_,_loc6_,{_x:px,_y:py});
      _loc8_.blendMode = 4;
      var _loc3_ = _root.game.map.player;
      var _loc9_ = 50;
      var _loc4_;
      var _loc10_;
      var _loc5_;
      if(this._parent._parent.getDis(px,py,_loc3_.x,_loc3_.y) < _loc9_)
      {
         _loc4_ = from.getDamage(_loc3_,0);
         _loc4_ = int(_loc4_ * 2);
         _loc10_ = "normal";
         _loc5_ = true;
         _loc3_.hitAction(_loc4_,_loc10_,this.hitHardTime,from.atkLv,["fire",0],from.criticalHit);
      }
      if(_loc5_)
      {
         _root.playSound("剑伤" + (random(3) + 1));
         _root.shakeGame(4,1);
      }
      return _loc5_;
   }
   function newiceMagic1(aOffset)
   {
      var _loc4_ = this._parent.getNextHighestDepth();
      var _loc2_ = this._parent.createEmptyMovieClip("iceMagic" + _loc4_,_loc4_);
      _loc2_.att = -10;
      _loc2_.checkHit = this.checkHitMagicObjectToPlayer;
      _loc2_.counter = 10;
      _loc2_.speed = 30;
      var _loc3_ = this.translateFrameToDegree(this._currentframe);
      _loc3_ += aOffset;
      _loc2_._x = this._x + 110 * Math.cos(_loc3_ * 0.0174);
      _loc2_._y = this._y + 110 * Math.sin(_loc3_ * 0.0174);
      _loc2_.xs = _loc2_.speed * Math.cos(_loc3_ * 0.0174);
      _loc2_.ys = _loc2_.speed * Math.sin(_loc3_ * 0.0174);
      _loc2_.from = this;
      _loc2_.onEnterFrame = function()
      {
         this._x += this.xs;
         this._y += this.ys;
         if(--this.counter < 0)
         {
            this.removeMovieClip();
         }
         this.checkHit(this,this.from,["ice",0]);
         var _loc2_ = this._parent.getNextHighestDepth();
         var _loc3_ = this._parent.attachMovie("iceMagic","iceMagic" + _loc2_,_loc2_,{_x:this._x,_y:this._y});
         _loc3_.blendMode = 4;
      };
   }
   function checkHitMagicObjectToPlayer(obj, from, addDmgT)
   {
      var _loc3_ = _root.game.map.player;
      if(addDmgT == undefined)
      {
         addDmgT = [from.addDmgType[0],0];
      }
      var _loc11_ = obj.att > - _loc3_.h + _loc3_.att && obj.att < _loc3_.att;
      var _loc5_;
      var _loc10_;
      var _loc12_;
      var _loc7_;
      if(_loc11_)
      {
         if(this._parent._parent.getDis(obj._x,obj._y,_loc3_.x,_loc3_.y) < 30 + _loc3_.hitMc._width * 0.5)
         {
            for(var _loc6_ in obj.hitList)
            {
               if(_loc3_ == obj.hitList[_loc6_])
               {
                  _loc5_ = true;
               }
            }
            if(!_loc5_)
            {
            }
            obj.hitList.push(_loc3_);
            _loc10_ = from.getDamage(_loc3_,0);
            _loc12_ = "normal";
            _loc7_ = true;
            _loc3_.hitAction(_loc10_,_loc12_,this.hitHardTime,from.atkLv,addDmgT,from.criticalHit);
            _loc3_.xSpeed = 10 * Math.cos(obj.dir * 0.0174);
            _loc3_.ySpeed = 10 * Math.sin(obj.dir * 0.0174);
         }
      }
      if(_loc7_)
      {
         _root.playSound("剑伤" + (random(3) + 1));
         _root.shakeGame(4,2);
      }
      return _loc7_;
   }
}
