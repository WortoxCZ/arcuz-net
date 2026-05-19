class GoblinMage extends Enemy
{
   var _alpha;
   var _currentframe;
   var _name;
   var _parent;
   var _x;
   var _y;
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
   var checkHit;
   var counter;
   var curDir;
   var defLv;
   var defence;
   var desDir;
   var dir;
   var enemyName;
   var enterframe;
   var exp;
   var expl;
   var fht;
   var from;
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
   var nta;
   var rUnit;
   var removeMovieClip;
   var setPoint;
   var sightA;
   var sightD;
   var speed;
   var stayRate;
   var totalHp;
   var translateFrameToDegree;
   var xSpeed;
   var xs;
   var ySpeed;
   var ys;
   var mbht = 50;
   var nmbht = 25;
   function GoblinMage()
   {
      super();
      var _loc4_;
      var _loc5_;
      var _loc3_;
      if(this._name.slice(0,8) != "instance")
      {
         this.keepDistance = 100;
         this.attackRate = 15;
         this.stayRate = 50;
         this.chaseRate = 10;
         this.hp = 40;
         this.attack = [15,25];
         this.defence = 1;
         _loc4_ = this._x;
         _loc5_ = this._y;
         this.setPoint = [_loc4_,_loc5_];
         this.rUnit = 10;
         this.attackR = 140;
         this.fht = 10;
         this.bht = 25;
         this.hitHardTime = 15;
         this.atkLv = 5;
         this.defLv = 3;
         this.atkT = 5;
         this.sightD = 300;
         this.sightA = 180;
         this.moveDir = 45 * random(8) - 135;
         _loc3_ = random(8) + 1;
         this.gotoAndStop(_loc3_); //unpopped
         this.curDir = _loc3_;
         this.desDir = _loc3_;
         this.speed = 3;
         this.blow = true;
         this.exp = 100;
         this.mc.stop();
         this._parent._parent.firstTimeInMap(this);
      }
   }
   function setLevel(num)
   {
      this.setLevelBasicAttrib(num);
      this.enemyName = "goblinMage";
      if(_root["goblinc" + num])
      {
         _root.changeColor(this,_root["goblinc" + num]);
      }
      if(num == 13 || num == 21)
      {
         this.newMagic = this.newFireSetPostion;
      }
      else if(num == 15)
      {
         this.newMagic = this.newIceSetPostion;
      }
      else if(num == 23)
      {
         this.newMagic = this.newPoisonBall;
      }
      else if(num == 27)
      {
         this.newMagic = this.newThunderSetPostion;
      }
      else
      {
         this.newMagic = this.newFireSetPostion;
      }
      this.attack = [int(this.attack[0] * 1.2),int(this.attack[1] * 1.2)];
      this.defence = int(this.defence * 0.4);
      this.hp = this.totalHp = int(this.totalHp * 1);
      this.exp = int(this.exp * 1);
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
            _root.playSound("哥布林法师死亡.mp3");
            this.mc.gotoAndStop("die");
            delete this.enterframe;
            this._parent._parent.delUnit1(this);
            this.counter = 60;
            this.enterframe = function()
            {
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
         this.mainAction();
         if(this.counter < 0)
         {
            if(++this.counter == 0)
            {
               this.faceHero();
               this.mc.gotoAndStop("attack");
               this.mc.mc.stop();
               _root.shotShine2(this,"white",3);
               this.counter = 0;
            }
            else if(this._parent._parent.getDis(this._x,this._y,this._parent.player.x,this._parent.player.y) > this.attackR)
            {
               this.attacking = false;
               this.patrol();
            }
         }
         else if(this.mc.mc._currentframe == 1)
         {
            this.mc.mc.stop();
            if(++this.counter > this.fht)
            {
               this.mc.mc.play();
               this.counter = 0;
               if(random(100) > 50)
               {
                  this.newMagic();
                  this.bht = this.mbht;
               }
               else
               {
                  this.bht = this.nmbht;
                  this.newFireMagic();
               }
            }
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
   function newMagic()
   {
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
   function newFireMagic(patt)
   {
      if(patt == undefined)
      {
         patt = -18;
      }
      var _loc3_ = this._parent.getNextHighestDepth();
      var _loc2_ = this._parent.attachMovie("fireBall1","fb" + _loc3_,_loc3_,{_x:this._x,_y:this._y,att:patt});
      _loc2_.blendMode = 8;
      _loc2_.hitList = [];
      _loc2_.checkHit = this.checkHitMagicObjectToPlayer;
      _loc2_.mc._y += patt;
      _loc2_.dir = this.translateFrameToDegree(this._currentframe);
      _loc2_.counter = 60;
      _loc2_.mc._rotation = _loc2_.dir;
      _loc2_.speed = 2;
      _loc2_.xs = _loc2_.speed * Math.cos(_loc2_.dir * 0.0174);
      _loc2_.ys = _loc2_.speed * Math.sin(_loc2_.dir * 0.0174);
      _loc2_.count = 0;
      _loc2_.from = this;
      _loc2_.expl = function()
      {
         var _loc2_ = this._parent.getNextHighestDepth();
         var _loc3_ = this._parent.attachMovie("fireBallExpl","fb" + _loc2_,_loc2_,{_x:this._x,_y:this._y});
         _loc3_.blendMode = 4;
         this.removeMovieClip();
      };
      _loc2_.onEnterFrame = function()
      {
         if(this.checkHit(this,this.from))
         {
            this.expl();
         }
         this._x += this.xs;
         this._y += this.ys;
         this.speed += 0.5;
         this.xs = this.speed * Math.cos(this.dir * 0.0174);
         this.ys = this.speed * Math.sin(this.dir * 0.0174);
         if(--this.counter < 0)
         {
            this.expl();
         }
      };
   }
   function newPoisonBall(patt)
   {
      if(patt == undefined)
      {
         patt = -18;
      }
      var _loc4_ = this._parent.getNextHighestDepth();
      var _loc3_ = this._parent.attachMovie("poisonBall","fb" + _loc4_,_loc4_,{_x:this._x,_y:this._y,att:patt});
      _loc3_.blendMode = 8;
      _loc3_.hitList = [];
      _loc3_.checkHit = this.checkHitMagicObjectToPlayer;
      _loc3_._y += patt;
      _loc3_.dir = this.translateFrameToDegree(this._currentframe);
      _loc3_.counter = 60;
      _loc3_._rotation = _loc3_.dir;
      _loc3_.speed = 2;
      _loc3_.xs = _loc3_.speed * Math.cos(_loc3_.dir * 0.0174);
      _loc3_.ys = _loc3_.speed * Math.sin(_loc3_.dir * 0.0174);
      _loc3_.count = 0;
      _loc3_.from = this;
      _loc3_.expl = function()
      {
         var _loc3_ = this._parent.getNextHighestDepth();
         var _loc4_ = this._parent.attachMovie("fireBallExpl","fb" + _loc3_,_loc3_,{_x:this._x,_y:this._y});
         _loc4_.blendMode = 8;
         _root.sethum(_loc4_,60);
         this.removeMovieClip();
      };
      _loc3_.onEnterFrame = function()
      {
         if(this.checkHit(this,this.from,["poison",0]))
         {
            this.expl();
         }
         this._x += this.xs;
         this._y += this.ys;
         this.speed += 0.5;
         this.xs = this.speed * Math.cos(this.dir * 0.0174);
         this.ys = this.speed * Math.sin(this.dir * 0.0174);
         if(--this.counter < 0)
         {
            this.expl();
         }
      };
   }
   function newThunderSetPostion()
   {
      var _loc3_ = this._parent.getNextHighestDepth();
      var _loc2_ = this._parent.attachMovie("魔法定位","fb" + _loc3_,_loc3_,{_x:this._parent.player._x,_y:this._parent.player._y,_alpha:0});
      _loc2_.nta = this.newThunderAttack;
      _loc2_.link = this;
      _loc2_.attack = function()
      {
         this.nta(this._x,this._y,this.link);
      };
      _loc2_.blendMode = 8;
      _loc2_.onEnterFrame = function()
      {
         this._alpha += 5;
         if(this._alpha > 100)
         {
            this.attack();
            this.removeMovieClip();
         }
      };
   }
   function newIceSetPostion()
   {
      var _loc3_ = this._parent.getNextHighestDepth();
      var _loc2_ = this._parent.attachMovie("魔法定位","fb" + _loc3_,_loc3_,{_x:this._parent.player._x,_y:this._parent.player._y,_alpha:0});
      _loc2_.nta = this.newIceAttack;
      _loc2_.link = this;
      _loc2_.attack = function()
      {
         this.nta(this._x,this._y,this.link);
      };
      _loc2_.blendMode = 8;
      _loc2_.onEnterFrame = function()
      {
         this._alpha += 5;
         if(this._alpha > 100)
         {
            this.attack();
            this.removeMovieClip();
         }
      };
   }
   function newFireSetPostion()
   {
      var _loc3_ = this._parent.getNextHighestDepth();
      var _loc2_ = this._parent.attachMovie("魔法定位","fb" + _loc3_,_loc3_,{_x:this._parent.player._x,_y:this._parent.player._y,_alpha:0});
      _loc2_.nta = this.newFireAttack;
      _loc2_.link = this;
      _loc2_.attack = function()
      {
         this.nta(this._x,this._y,this.link);
      };
      _loc2_.blendMode = 8;
      _loc2_.onEnterFrame = function()
      {
         this._alpha += 5;
         if(this._alpha > 100)
         {
            this.attack();
            this.removeMovieClip();
         }
      };
   }
   function newThunderAttack(px, py, from)
   {
      var _loc5_ = this._parent.getNextHighestDepth();
      var _loc8_ = this._parent.attachMovie("thunderAddDmgFx","fb" + _loc5_,_loc5_,{_x:px,_y:py});
      _loc8_.blendMode = 4;
      var _loc3_ = _root.game.map.player;
      var _loc9_ = 50;
      var _loc7_;
      var _loc10_;
      var _loc4_;
      if(this._parent._parent.getDis(px,py,_loc3_.x,_loc3_.y) < _loc9_)
      {
         _loc7_ = from.getDamage(_loc3_,0);
         _loc10_ = "normal";
         _loc4_ = true;
         _loc3_.hitAction(_loc7_,_loc10_,this.hitHardTime,from.atkLv,["thunder",0],from.criticalHit);
      }
      if(_loc4_)
      {
         _root.playSound("剑伤" + (random(3) + 1));
         _root.shakeGame(4,1);
      }
      return _loc4_;
   }
   function newIceAttack(px, py, from)
   {
      var _loc5_ = this._parent.getNextHighestDepth();
      var _loc8_ = this._parent.attachMovie("iceAddDmgFx","fb" + _loc5_,_loc5_,{_x:px,_y:py});
      _loc8_.blendMode = 4;
      var _loc3_ = _root.game.map.player;
      var _loc9_ = 50;
      var _loc7_;
      var _loc10_;
      var _loc4_;
      if(this._parent._parent.getDis(px,py,_loc3_.x,_loc3_.y) < _loc9_)
      {
         _loc7_ = from.getDamage(_loc3_,0);
         _loc10_ = "normal";
         _loc4_ = true;
         _loc3_.hitAction(_loc7_,_loc10_,this.hitHardTime,from.atkLv,["ice",0],from.criticalHit);
      }
      if(_loc4_)
      {
         _root.playSound("剑伤" + (random(3) + 1));
         _root.shakeGame(4,1);
      }
      return _loc4_;
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
   function mainAction()
   {
   }
}
