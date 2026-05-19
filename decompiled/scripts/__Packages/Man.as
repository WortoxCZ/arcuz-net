class Man extends MovieClip
{
   var att;
   var attack;
   var attackM;
   var attacking;
   var colorChanged;
   var counter;
   var curDir;
   var defLv;
   var defenceM;
   var dmg;
   var exp;
   var fric;
   var go;
   var h;
   var hit;
   var hp;
   var iceDmg;
   var inStage;
   var jump;
   var jumpSpeed;
   var level;
   var mc;
   var nx;
   var ny;
   var parent;
   var poisonDmg;
   var rUnit;
   var resist;
   var shadw;
   var speed;
   var thunderDmg;
   var xSpeed;
   var ySpeed;
   function Man()
   {
      super();
      this.go = true;
      this.rUnit = 10;
      this.att = 0;
      this.resist = 0;
      this.inStage = true;
      this.fric = 1;
      this.attackM = 1;
      this.defenceM = 1;
   }
   function get x()
   {
      return this._x;
   }
   function get y()
   {
      return this._y;
   }
   function set x(num)
   {
      this._x = num;
   }
   function set y(num)
   {
      this._y = num;
   }
   function get depth()
   {
      return this.getDepth();
   }
   function set depth(where)
   {
      this.swapDepths(where);
   }
   function enterframe()
   {
   }
   function showHitHp(num, type, sp)
   {
      var _loc4_ = this._parent.getNextHighestDepth();
      var _loc2_ = this._parent.attachMovie("hitHp","hitHp" + _loc4_,_loc4_,{_x:this._x + this.xSpeed + random(30) - 15,_y:this._y + this.ySpeed - this.h + this.att - random(10) - 10});
      if(sp != undefined && sp != "magic")
      {
         _loc2_.mc.txt.text = sp;
      }
      else
      {
         _loc2_.mc.txt.text = num;
      }
      var _loc3_;
      if(type == "critical")
      {
         _loc3_ = new TextFormat();
         _loc3_.align = "center";
         _loc3_.size = 24;
         _loc3_.color = 16711680;
         _loc2_.mc.txt.setTextFormat(_loc3_);
      }
      else if(type == "finalHit")
      {
         _loc3_ = new TextFormat();
         _loc3_.align = "center";
         _loc3_.color = 16776960;
         _loc3_.size = 22;
         _loc2_.mc.txt.setTextFormat(_loc3_);
      }
      else if(type == "poison")
      {
         _loc3_ = new TextFormat();
         _loc3_.align = "center";
         _loc3_.color = 65280;
         _loc3_.size = 20;
         _loc2_.mc.txt.setTextFormat(_loc3_);
      }
      if(sp == "magic")
      {
         trace("魔法攻击！");
         _loc3_ = new TextFormat();
         _loc3_.align = "center";
         _loc3_.color = 6737151;
         _loc3_.size = 22;
         _loc2_.mc.txt.setTextFormat(_loc3_);
      }
   }
   function hitEffect(type)
   {
      var _loc5_;
      var _loc6_;
      if(type == "critical")
      {
         _root.playSound("爆击");
         _loc5_ = this._parent.attachMovie("hitEffect1","ef" + this._parent.getNextHighestDepth(),this._parent.getNextHighestDepth(),{_x:this._x + random(10) - 5,_y:this.att + this._y - random(this.h)});
         _loc5_._xscale = _loc5_._yscale = 100 + random(10);
         _loc6_ = 4 + random(5);
      }
      else if(type == "finalHit")
      {
         _root.playSound("终结攻击");
         _loc5_ = this._parent.attachMovie("hitEffect2","ef" + this._parent.getNextHighestDepth(),this._parent.getNextHighestDepth(),{_x:this._x + random(10) - 5,_y:this.att + this._y - random(this.h)});
         _loc5_._rotation = 180 - random(360);
         _loc5_._xscale = _loc5_._yscale = 100 + random(10);
         _loc6_ = 4 + random(5);
      }
      else
      {
         _loc5_ = this._parent.attachMovie("hitEffect","ef" + this._parent.getNextHighestDepth(),this._parent.getNextHighestDepth(),{_x:this._x + random(10) - 5,_y:this.att + this._y - random(this.h)});
         _loc5_._rotation = random(180);
         _loc6_ = 3 + random(3);
      }
      _loc5_.blendMode = "add";
      var _loc4_ = 0;
      var _loc3_;
      while(_loc4_ < _loc6_)
      {
         _loc3_ = this._parent.attachMovie("particle","ef" + this._parent.getNextHighestDepth(),this._parent.getNextHighestDepth(),{_x:_loc5_._x,_y:_loc5_._y});
         _loc3_._rotation = 180 - random(360);
         _loc3_._yscale = 30 + random(50);
         _loc3_.blendMode = "add";
         _loc3_.speed = 10 + random(20);
         _loc3_.xSpeed = _loc3_.speed * Math.cos(_loc3_._rotation * 0.0174);
         _loc3_.ySpeed = _loc3_.speed * Math.sin(_loc3_._rotation * 0.0174);
         _loc3_.onEnterFrame = function()
         {
            this._xscale = (this.speed + 8) * 10;
            this._x += this.xSpeed;
            this._y += this.ySpeed;
            this._alpha = this._xscale - 50;
            this.xSpeed *= 0.6;
            this.ySpeed *= 0.6;
            this.speed *= 0.6;
            if(this.speed < 0.05)
            {
               this.removeMovieClip();
            }
         };
         _loc4_ = _loc4_ + 1;
      }
   }
   function hitAction(dmg, type, hitHT, attckLv, addDmg, criticalRate)
   {
      var _loc6_ = attckLv - this.defLv;
      var _loc9_;
      var _loc8_;
      if(addDmg != undefined)
      {
         if(addDmg != "none")
         {
            if(this == _root.game.map.player && random(100) < _root.game.map.player.magicResist)
            {
               _root.newMessage(_root.textSys[18][_root.lang]);
               this.showHitHp(dmg,type,"Magic Resist!");
               _root.playSound1("魔防.mp3");
               return undefined;
            }
            if(addDmg[0] == "fire")
            {
               if(addDmg[1] == 1)
               {
                  if(random(100) < 10)
                  {
                     dmg = this.fireAddDmg(dmg,1.5);
                     _loc9_ = "magic";
                  }
               }
               else if(addDmg[1] == 2)
               {
                  if(random(100) < 20)
                  {
                     dmg = this.fireAddDmg(dmg,2);
                     _loc9_ = "magic";
                  }
               }
               else if(addDmg[1] == 3)
               {
                  if(random(100) < 30)
                  {
                     dmg = this.fireAddDmg(dmg,2.5);
                     _loc9_ = "magic";
                  }
               }
               else if(addDmg[1] == 4)
               {
                  if(random(100) < 50)
                  {
                     dmg = this.fireAddDmg(dmg,3);
                     _loc9_ = "magic";
                  }
               }
               else
               {
                  dmg = this.fireAddDmg(dmg,2);
                  _loc9_ = "magic";
               }
            }
            else if(addDmg[0] == "ice")
            {
               if(addDmg[1] == 1)
               {
                  if(random(100) < 10)
                  {
                     dmg = this.iceAddDmg(dmg,1.2);
                     _loc9_ = "magic";
                  }
               }
               else if(addDmg[1] == 2)
               {
                  if(random(100) < 20)
                  {
                     dmg = this.iceAddDmg(dmg,1.3);
                     _loc9_ = "magic";
                  }
               }
               else if(addDmg[1] == 3)
               {
                  if(random(100) < 30)
                  {
                     dmg = this.iceAddDmg(dmg,1.5);
                     _loc9_ = "magic";
                  }
               }
               else if(addDmg[1] == 4)
               {
                  if(random(100) < 50)
                  {
                     dmg = this.iceAddDmg(dmg,2);
                     _loc9_ = "magic";
                  }
               }
               else
               {
                  dmg = this.iceAddDmg(dmg,1.5);
                  _loc9_ = "magic";
               }
            }
            else if(addDmg[0] == "thunder")
            {
               if(addDmg[1] == 1)
               {
                  if(random(100) < 10)
                  {
                     _loc8_ = this.thunderAddDmg(dmg,1.1);
                     _loc9_ = "magic";
                     dmg = _loc8_[0];
                     hitHT = _loc8_[1];
                     _loc6_ = 100;
                  }
               }
               else if(addDmg[1] == 2)
               {
                  if(random(100) < 20)
                  {
                     _loc8_ = this.thunderAddDmg(dmg,1.3);
                     _loc9_ = "magic";
                     dmg = _loc8_[0];
                     hitHT = _loc8_[1];
                     _loc6_ = 100;
                  }
               }
               else if(addDmg[1] == 3)
               {
                  if(random(100) < 30)
                  {
                     _loc8_ = this.thunderAddDmg(dmg,1.5);
                     _loc9_ = "magic";
                     dmg = _loc8_[0];
                     hitHT = _loc8_[1];
                     _loc6_ = 100;
                  }
               }
               else if(addDmg[1] == 4)
               {
                  if(random(100) < 50)
                  {
                     _loc8_ = this.thunderAddDmg(dmg,1.8);
                     _loc9_ = "magic";
                     dmg = _loc8_[0];
                     hitHT = _loc8_[1];
                     _loc6_ = 100;
                  }
               }
               else
               {
                  _loc8_ = this.thunderAddDmg(dmg,1.5);
                  _loc9_ = "magic";
                  dmg = _loc8_[0];
                  hitHT = _loc8_[1];
                  _loc6_ = 100;
               }
            }
            else if(addDmg[0] == "poison")
            {
               if(addDmg[1] == 1)
               {
                  if(random(100) < 10)
                  {
                     this.poisonAddDmg(dmg,1);
                     _loc9_ = "magic";
                  }
               }
               else if(addDmg[1] == 2)
               {
                  if(random(100) < 20)
                  {
                     this.poisonAddDmg(dmg,1.2);
                     _loc9_ = "magic";
                  }
               }
               else if(addDmg[1] == 3)
               {
                  if(random(100) < 30)
                  {
                     this.poisonAddDmg(dmg,1.3);
                     _loc9_ = "magic";
                  }
               }
               else if(addDmg[1] == 4)
               {
                  if(random(100) < 50)
                  {
                     this.poisonAddDmg(dmg,1.5);
                     _loc9_ = "magic";
                  }
               }
               else
               {
                  this.poisonAddDmg(dmg,1);
                  _loc9_ = "magic";
               }
            }
         }
      }
      else if(this._name == "player")
      {
         if(random(100) < _root.game.map.player.blockRate)
         {
            _root.playSound("装备武器.wav");
            _root.newMessage(_root.textSys[3][_root.lang]);
            this.showHitHp(dmg,type,"Block!");
            return undefined;
         }
         if(random(100) < _root.game.map.player.skillList[5] * 8)
         {
            _root.game.map.player.angry();
            _root.newMessage(_root.textSys[4][_root.lang]);
            this.showHitHp(dmg,type,"Rage!");
            return undefined;
         }
      }
      if(random(100) < criticalRate)
      {
         type = "critical";
         dmg *= 2;
      }
      dmg = int(dmg);
      if(_loc6_ > 0)
      {
         this.attacking = false;
         this.hitEffect(type);
         if(this.hp > 0)
         {
            if(_loc9_ == undefined)
            {
               _loc9_ = this.hitAction2(dmg,type,hitHT);
            }
            else
            {
               this.hitAction2(dmg,type,hitHT);
            }
         }
      }
      else if(_loc6_ == 0)
      {
         if(this.hp > 0)
         {
            this.decHp(dmg);
            this.hitEffect(type);
            if(this.hp <= 0)
            {
               this.hp = 0;
               delete this.hitAction;
               delete this.action;
               if(this != this._parent.player)
               {
                  this._parent.player.getExp(this.exp);
               }
               this.iceDmg.removeMovieClip();
               this.thunderDmg.removeMovieClip();
               this.poisonDmg.removeMovieClip();
               this.die();
            }
         }
      }
      else
      {
         dmg = 0;
         type = "normal";
      }
      this.showHitHp(dmg,type,_loc9_);
   }
   function decHp(val)
   {
      this.hp -= val;
   }
   function fireAddDmg(dmg, ex)
   {
      dmg *= ex;
      var _loc2_ = this._parent.getNextHighestDepth();
      var _loc3_ = this._parent.attachMovie("fireAddDmgFx","fx" + _loc2_,_loc2_,{_x:this._x,_y:this._y + this.att - this.h});
      _loc3_.blendMode = 8;
      return int(dmg);
   }
   function iceAddDmg(dmg, ex)
   {
      dmg *= ex;
      var _loc3_ = this._parent.getNextHighestDepth();
      var _loc4_ = this._parent.attachMovie("iceAddDmgFx","fx" + _loc3_,_loc3_,{_x:this._x,_y:this._y + this.att});
      _loc4_.blendMode = 4;
      if(this.iceDmg._x == undefined)
      {
         _loc3_ = this._parent.getNextHighestDepth();
         this.iceDmg = this._parent.attachMovie("iceAddDmgEffectFx","fx" + _loc3_,_loc3_,{_x:this._x,_y:this._y + this.att});
         this.iceDmg.parent = this;
         this.iceDmg.counter = 300;
         this.fric *= 0.5;
         this.iceDmg.onEnterFrame = function()
         {
            if(!_root.game.pauseAllCharacters)
            {
               this._x = this.parent._x;
               this._y = this.parent._y + this.parent.att;
               if(--this.counter < 0)
               {
                  this.parent.fric *= 2;
                  this.removeMovieClip();
               }
            }
         };
      }
      return int(dmg);
   }
   function thunderAddDmg(dmg, ex)
   {
      dmg *= ex;
      var _loc3_ = this._parent.getNextHighestDepth();
      var _loc6_ = this._parent.attachMovie("thunderAddDmgFx","fx" + _loc3_,_loc3_,{_x:this._x,_y:this._y});
      _loc6_.blendMode = 4;
      if(random(100) > 50)
      {
         return [int(dmg),0];
      }
      var _loc4_;
      if(this.thunderDmg._x == undefined)
      {
         _loc3_ = this._parent.getNextHighestDepth();
         this.thunderDmg = this._parent.attachMovie("thunderDmgFx","fx" + _loc3_,_loc3_,{_x:this._x,_y:this._y + this.att - this.h,_visible:0});
         this.thunderDmg.parent = this;
         this.thunderDmg.counter = 65;
         this.thunderDmg.onEnterFrame = function()
         {
            if(!_root.game.pauseAllCharacters)
            {
               this._x = this.parent._x;
               this._y = this.parent._y + this.parent.att - this.parent.h;
               if(--this.counter < 0)
               {
                  this.removeMovieClip();
               }
               else if(this.counter == 20)
               {
                  this._parent.mc.gotoAndStop("stand");
               }
               else if(this.counter == 60)
               {
                  this._visible = 1;
               }
               else if(this.counter < 20)
               {
                  this._alpha -= 5;
               }
            }
         };
         _loc4_ = 65;
      }
      else
      {
         this.thunderDmg._alpha = 100;
         this.thunderDmg.counter = 65;
         _loc4_ = 65;
      }
      return [int(dmg),_loc4_];
   }
   function poisonAddDmg(dmg, ex)
   {
      dmg *= ex;
      var _loc3_;
      if(this.poisonDmg._x == undefined)
      {
         _loc3_ = this._parent.getNextHighestDepth();
         this.poisonDmg = this._parent.attachMovie("poisonAddDmgFx","poisonDmg" + _loc3_,_loc3_,{_x:this._x,_y:this._y + this.att});
         this.poisonDmg.parent = this;
         this.poisonDmg.dmg = Math.ceil(dmg / 7) + 1;
         this.poisonDmg.counter = 1400;
         this.poisonDmg.onEnterFrame = function()
         {
            if(!_root.game.pauseAllCharacters)
            {
               this._x = this.parent._x;
               this._y = this.parent._y + this.parent.att;
               if(--this.counter > 0)
               {
                  if(this.counter % 35 == 0)
                  {
                     this.parent.hitAction(this.dmg,"poison",0,this.parent.defLv,"none");
                  }
               }
               else
               {
                  this.removeMovieClip();
               }
            }
         };
      }
   }
   function hitAction2()
   {
   }
   function die()
   {
   }
   function action()
   {
   }
   function startJump(speed)
   {
      this.jump = true;
      if(speed == undefined)
      {
         this.jumpSpeed = -40;
      }
      else
      {
         this.jumpSpeed = - speed;
      }
      if(!this.attacking && !this.hit)
      {
         this.mc.gotoAndStop("jump");
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
            if(!this.attacking && !this.hit)
            {
               this.mc.gotoAndStop("stand");
            }
         }
      }
      this.shadowScale();
   }
   function gotoFrame(where)
   {
      var _loc3_ = this.mc._currentframe;
      var _loc4_ = this.mc.mc._currentframe;
      if(where > this.curDir)
      {
         if(where - this.curDir > 4)
         {
            this.curDir = this.curDir - 1;
         }
         else
         {
            this.curDir = this.curDir + 1;
         }
      }
      else if(where < this.curDir)
      {
         if(this.curDir - where > 4)
         {
            this.curDir = this.curDir + 1;
         }
         else
         {
            this.curDir = this.curDir - 1;
         }
      }
      this.curDir = this.checkDir(this.curDir);
      this.gotoAndStop(this.curDir); //unpopped
      this.mc.gotoAndStop(_loc3_);
      this.mc.mc.gotoAndPlay(_loc4_);
      this.mc._y = this.att;
   }
   function toFrame(where)
   {
      var _loc2_ = this.mc._currentframe;
      var _loc3_ = this.mc.mc._currentframe;
      this.gotoAndStop(where); //unpopped
      this.mc.gotoAndStop(_loc2_);
      this.mc.mc.gotoAndPlay(_loc3_);
      this.mc._y = this.att;
   }
   function checkDir(dir)
   {
      if(dir > 8)
      {
         dir = 1;
      }
      else if(dir < 1)
      {
         dir = 8;
      }
      return dir;
   }
   function translateNumToFrame(num)
   {
      if(num == -10)
      {
         return 7;
      }
      if(num == 10)
      {
         return 3;
      }
      if(num == -1)
      {
         return 5;
      }
      if(num == 1)
      {
         return 1;
      }
      if(num == -11)
      {
         return 6;
      }
      if(num == -9)
      {
         return 8;
      }
      if(num == 9)
      {
         return 4;
      }
      if(num == 11)
      {
         return 2;
      }
   }
   function translateFrameToDegree(frame)
   {
      if(frame == 7)
      {
         return -90;
      }
      if(frame == 3)
      {
         return 90;
      }
      if(frame == 5)
      {
         return 180;
      }
      if(frame == 1)
      {
         return 0;
      }
      if(frame == 6)
      {
         return -135;
      }
      if(frame == 8)
      {
         return -45;
      }
      if(frame == 4)
      {
         return 135;
      }
      if(frame == 2)
      {
         return 45;
      }
   }
   function translateDegreeToFrame(degree)
   {
      degree = int(degree / 45) * 45;
      if(degree == -90)
      {
         return 7;
      }
      if(degree == 90)
      {
         return 3;
      }
      if(degree == 180 || degree == -180)
      {
         return 5;
      }
      if(degree == 0)
      {
         return 1;
      }
      if(degree == -135)
      {
         return 6;
      }
      if(degree == -45)
      {
         return 8;
      }
      if(degree == 135)
      {
         return 4;
      }
      if(degree == 45)
      {
         return 2;
      }
   }
   function shadowScale()
   {
      var _loc2_ = 100 - (this.shadw._y - this.mc._y) / 3;
      this.shadw._xscale = _loc2_;
      this.shadw._yscale = _loc2_;
   }
   function getStairLevel()
   {
      var _loc3_;
      var _loc2_;
      for(var _loc4_ in this._parent.map)
      {
         _loc3_ = Number(this._parent.map[_loc4_].getGroundType(this._parent.player._x + this._parent._x,this._parent.player._y + this._parent._y).slice(3,6));
         _loc2_ = Number(this._parent.map[_loc4_].getGroundType(this._parent.player._x + this._parent._x + this.xSpeed,this._parent.player._y + this._parent._y + this.ySpeed).slice(3,6));
      }
      return [_loc2_ - 500,_loc3_ - 500];
   }
   function checkHitWall(px, py)
   {
      if(px == undefined)
      {
         px = this._x;
         py = this._y;
      }
      var _loc4_ = px + this._parent._x + 50;
      var _loc3_ = py + this._parent._y;
      for(var _loc5_ in _root.game.map.obstacleArr)
      {
         if(_root.game.map.obstacleArr[_loc5_].hitMc.hitTest(_loc4_,_loc3_,true))
         {
            return true;
         }
      }
      this.nx = Math.floor(px / 128);
      this.ny = Math.floor(py / 128);
      return this._parent["tileW" + this.nx + "-" + this.ny].hit.hitTest(_loc4_,_loc3_,true);
   }
   function addBlurFilter(x, y)
   {
      var _loc2_;
      if(x == undefined && y == undefined)
      {
         _loc2_ = new flash.filters.BlurFilter(Math.abs(this.xSpeed * 2),Math.abs(this.ySpeed * 2),1);
      }
      else
      {
         _loc2_ = new flash.filters.BlurFilter(x,y,1);
      }
      if(this.colorChanged)
      {
         this.filters = [this.filters[0],_loc2_];
      }
      else
      {
         this.filters = [_loc2_];
      }
   }
   function delFilter()
   {
      if(this.colorChanged)
      {
         this.filters = [this.filters[0]];
      }
      else
      {
         this.filters = null;
      }
   }
   function getDamage(who, extraDmg)
   {
      var _loc2_ = random(this.attack[1] - this.attack[0]) + this.attack[0];
      _loc2_ += extraDmg;
      _loc2_ *= this.attackM;
      var _loc5_ = who.defence * who.defenceM;
      var _loc4_ = 3 * _loc2_ * _loc2_ / (_loc2_ + _loc5_ * 3);
      if(who.level != undefined && this.level != undefined)
      {
         who.level <= this.level ? (_loc4_ *= 1 + (this.level - who.level) / 20) : (_loc4_ /= who.level - this.level);
      }
      return _loc4_ > 0 ? int(_loc4_) : 1;
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
      if(this.checkHitWall(this._x,this._y))
      {
         this._x += this._x <= this._parent.mapW / 2 ? 5 : -5;
         this._y += this._y <= this._parent.mapH / 2 ? 5 : -5;
      }
      else
      {
         while(this.checkHitWall(this._x,this._y - 20))
         {
            this._y = this._y + 1;
         }
         while(this.checkHitWall(this._x,this._y + 20))
         {
            this._y = this._y - 1;
         }
         while(this.checkHitWall(this._x - 20,this._y))
         {
            this._x = this._x + 1;
         }
         while(this.checkHitWall(this._x + 20,this._y))
         {
            this._x = this._x - 1;
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
}
