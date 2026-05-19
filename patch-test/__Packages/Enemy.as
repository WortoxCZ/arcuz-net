class Enemy extends Man
{
   var _alpha;
   var _currentframe;
   var _parent;
   var _quality;
   var _x;
   var _y;
   var addDmgType;
   var alreadyDrop;
   var att;
   var attack;
   var attackR;
   var attackRate;
   var attacking;
   var blockCount;
   var blockDir;
   var blocked;
   var chaseRate;
   var counter;
   var criticalHit;
   var defence;
   var enemyName;
   var exp;
   var go;
   var gotoAndStop;
   var h;
   var hit;
   var hitHardTime;
   var hitMc;
   var hp;
   var iceDmg;
   var jump;
   var keepDistance;
   var keepDistance1;
   var level;
   var link;
   var mc;
   var moveDir;
   var onEnterFrame;
   var poisonDmg;
   var randomPt;
   var removeMovieClip;
   var resist;
   var setPoint;
   var showHp;
   var sightD;
   var speed;
   var stayRate;
   var thunderDmg;
   var totalHp;
   var tx;
   var ty;
   var xSpeed;
   var ySpeed;
   function Enemy()
   {
      super();
      this.moveDir = 90;
      var _loc3_ = 3;
      this.gotoAndStop(_loc3_); //unpopped
      this.blockCount = 0;
      this.blocked = 0;
      this.criticalHit = 2;
      this.stayRate = 30;
      this.chaseRate = 30;
      this.attackRate = 30;
      this.keepDistance = 100;
      var _loc4_ = this._x;
      var _loc5_ = this._y;
      this.h = this.hitMc._height;
      this.setPoint = [_loc4_,_loc5_];
   }
   function initAreaMode()
   {
      this.mc.gotoAndStop("stand");
      this._alpha = 0;
      do
      {
         var tmpx = _root.game.map.player._x + random(400) - 200;
         while(tmpx > _root.game.map.mapW && tmpy < 0)
         {
            tmpx = _root.game.map.player._x + random(400) - 200;
         }
         var tmpy = _root.game.map.player._y + random(400) - 200;
         while(tmpy > _root.game.map.mapH && tmpy < 0)
         {
            tmpy = _root.game.map.player._y + random(400) - 200;
         }
      }
      while(this.checkHitWall(tmpx,tmpy));
      this._x = tmpx;
      this._y = tmpy;
      this.setPoint = [tmpx,tmpy];
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
   function setLevelBasicAttrib(num)
   {
      this.level = num;
      var _loc5_ = this.level * 8 + 8;
      this.attack = [_loc5_,_loc5_ + _loc5_ / 5];
      this.defence = this.level * 15 - 6;
      this.hp = this.totalHp = this.level * 100;
      this.exp = _root.getEnemyExp(this.level);
      var _loc3_ = Number(_root.game.map.areaName);
      for(var _loc4_ in _root.game.deadList[_loc3_])
      {
         if(_root.game.deadList[_loc3_][_loc4_] == _root.game.map.mapName + "_" + this.setPoint[0] + "_" + this.setPoint[1])
         {
            this._parent._parent.delUnit(this);
            this.removeMovieClip();
            break;
         }
      }
   }
   function setLevel(num)
   {
      this.setLevelBasicAttrib(num);
   }
   function getRotation()
   {
      var _loc2_ = this._parent.player.x - this._x;
      var _loc3_ = this._parent.player.y - this._y;
      return int(Math.atan2(_loc3_,_loc2_) * 57.4);
   }
   function dropSth()
   {
      if(this.alreadyDrop)
      {
         return undefined;
      }
      this.alreadyDrop = true;
      var _loc19_;
      var _loc18_;
      var _loc20_;
      var _loc9_;
      var _loc5_;
      var _loc11_;
      var _loc7_;
      var _loc17_;
      var _loc6_;
      var _loc4_;
      var _loc8_;
      var _loc14_;
      var _loc15_;
      var _loc3_;
      var _loc10_;
      var _loc16_;
      var _loc12_;
      var _loc13_;
      var _loc22_;
      var _loc21_;
      var _loc23_;
      var _loc0_;
      var _loc24_;
      if(!this.dropSpecialItem())
      {
         if(random(80 + _root.game.map.player.dropRate) < _root.game.map.player.dropRate + 10)
         {
            _loc19_ = true;
         }
         if(_loc19_)
         {
            if(!random(2))
            {
               _loc18_ = _root.game.map.getNextHighestDepth();
               _loc20_ = _root.game.map.attachMovie("chest","chest" + _loc18_,_loc18_,{_x:this._x,_y:this._y - 3});
               _loc9_ = random(100);
               if(_loc9_ < 25)
               {
                  _loc5_ = Math.ceil(this.level / 5);
                  _loc5_ = _loc5_ <= 10 ? _loc5_ : 10;
                  _loc11_ = random(100);
                  if(_loc11_ < 3)
                  {
                     _loc7_ = 4;
                  }
                  else if(_loc11_ < 8)
                  {
                     _loc7_ = 3;
                  }
                  else if(_loc11_ < 16)
                  {
                     _loc7_ = 2;
                  }
                  else if(_loc11_ < 28)
                  {
                     _loc7_ = 1;
                  }
                  else
                  {
                     _loc7_ = 0;
                  }
                  _loc17_ = random(100);
                  if(_loc17_ < 3)
                  {
                     _loc6_ = 3;
                  }
                  else if(_loc17_ < 12)
                  {
                     _loc6_ = 2;
                  }
                  else
                  {
                     _loc6_ = 1;
                  }
                  _loc4_ = random(12);
                  if(_loc4_ == 1 || _loc4_ == 2 || _loc4_ == 3 || _loc4_ == 0)
                  {
                     _loc8_ = 10;
                     if(_loc6_ == 3)
                     {
                        _loc14_ = true;
                     }
                     else if(_loc6_ == 2)
                     {
                        _loc15_ = true;
                     }
                  }
                  else if(_loc4_ == 5 || _loc4_ == 6 || _loc4_ == 7 || _loc4_ == 4)
                  {
                     _loc8_ = 9;
                     if(_loc6_ == 3)
                     {
                        _loc14_ = true;
                     }
                     else if(_loc6_ == 2)
                     {
                        _loc15_ = true;
                     }
                  }
                  else if(_loc4_ == 9 || _loc4_ == 10 || _loc4_ == 11 || _loc4_ == 8)
                  {
                     _loc8_ = 7;
                  }
                  _loc3_ = [0,0,0,0,0,0,0,0,0,0];
                  if(random(100) < 3)
                  {
                     _loc3_[random(_loc8_)] = random(3) + 1;
                     _loc3_[random(_loc8_)] = 1;
                     _loc3_[random(_loc8_)] = 1;
                     _loc15_ = true;
                  }
                  else if(random(100) < 9)
                  {
                     _loc3_[random(_loc8_)] = 1;
                     _loc3_[random(_loc8_)] = random(2) + 1;
                     _loc15_ = true;
                  }
                  else if(random(100) < 20)
                  {
                     _loc3_[random(_loc8_)] = 1;
                     _loc15_ = true;
                  }
                  trace("掉落种类：" + _loc4_ + ":" + _loc5_ + ":" + _loc7_ + ":" + _loc6_ + ":" + _loc3_);
                  if(_loc4_ == 0)
                  {
                     _loc10_ = new Weapon("b" + _loc5_,_loc7_,_loc6_,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9]);
                  }
                  else if(_loc4_ == 1)
                  {
                     _loc10_ = new Weapon("s" + _loc5_,_loc7_,_loc6_,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9]);
                  }
                  else if(_loc4_ == 2)
                  {
                     _loc10_ = new Weapon("a" + _loc5_,_loc7_,_loc6_,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9]);
                  }
                  else if(_loc4_ == 3)
                  {
                     _loc10_ = new Shield("shield" + _loc5_,_loc7_,_loc6_,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9]);
                  }
                  else if(_loc4_ == 4)
                  {
                     _loc10_ = new Wear("w" + _loc5_,_loc7_,_loc6_,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8]);
                  }
                  else if(_loc4_ == 5)
                  {
                     _loc10_ = new Helmet("hel" + _loc5_,_loc7_,_loc6_,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8]);
                  }
                  else if(_loc4_ == 6)
                  {
                     _loc10_ = new Glove("g" + _loc5_,_loc7_,_loc6_,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8]);
                  }
                  else if(_loc4_ == 7)
                  {
                     _loc10_ = new Boots("bt" + _loc5_,_loc7_,_loc6_,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8]);
                  }
                  else if(_loc4_ == 8)
                  {
                     _loc10_ = new Belt("blt" + _loc5_,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6]);
                  }
                  else if(_loc4_ == 9)
                  {
                     _loc5_ = _loc5_ <= 8 ? _loc5_ : 8;
                     _loc10_ = new Bracelet("bl" + _loc5_,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6]);
                  }
                  else if(_loc4_ == 10)
                  {
                     _loc5_ = _loc5_ <= 8 ? _loc5_ : 8;
                     _loc10_ = new Necklace("nl" + _loc5_,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6]);
                  }
                  else if(_loc4_ == 11)
                  {
                     _loc5_ = _loc5_ <= 8 ? _loc5_ : 8;
                     _loc10_ = new Ring("r" + _loc5_,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6]);
                  }
               }
               else if(_loc9_ < 50)
               {
                  _loc16_ = random(100);
                  if(_loc16_ < 2)
                  {
                     _loc12_ = 2;
                  }
                  else if(_loc16_ < 10)
                  {
                     _loc12_ = 1;
                  }
                  else
                  {
                     _loc12_ = 0;
                  }
                  _loc13_ = random(100);
                  if(_loc13_ < 45)
                  {
                     _loc22_ = 1 + _loc12_;
                  }
                  else if(_loc13_ < 70)
                  {
                     _loc22_ = 4 + _loc12_;
                  }
                  else if(_loc13_ < 80)
                  {
                     _loc22_ = 7 + _loc12_;
                  }
                  else if(_loc13_ < 98)
                  {
                     _loc22_ = 13 + random(6);
                  }
                  else
                  {
                     _loc22_ = 10 + _loc12_;
                  }
                  _loc10_ = new Potion("potion" + _loc22_);
               }
               else if(_loc9_ < 60)
               {
                  _loc16_ = random(100);
                  if(_loc16_ < 2)
                  {
                     _loc21_ = 3;
                  }
                  else if(_loc16_ < 10)
                  {
                     _loc21_ = 2;
                  }
                  else
                  {
                     _loc21_ = 1;
                  }
                  switch(random(4))
                  {
                     case 0:
                        _loc23_ = "fc";
                        break;
                     case 1:
                        _loc23_ = "wdc";
                        break;
                     case 2:
                        _loc23_ = "ec";
                        break;
                     case 3:
                        _loc23_ = "wc";
                  }
                  _loc10_ = new Crystal(_loc23_ + _loc21_);
               }
               else if(_loc9_ < 68)
               {
                  _loc10_ = new Teleporter();
               }
               else if(_loc9_ < 70)
               {
                  if(!random(30))
                  {
                     if(random(2))
                     {
                        _loc10_ = new Book(5);
                     }
                     else
                     {
                        _loc10_ = new Book(6);
                     }
                  }
                  else
                  {
                     _loc10_ = new Book(random(4) + 1);
                  }
               }
               else if(_loc9_ < 73)
               {
                  _loc16_ = random(100);
                  if(_loc16_ < 2)
                  {
                     _loc21_ = 3;
                  }
                  else if(_loc16_ < 10)
                  {
                     _loc21_ = 2;
                  }
                  else
                  {
                     _loc21_ = 1;
                  }
                  _loc23_ = "stone";
                  _loc10_ = new Crystal(_loc23_ + _loc21_);
               }
               else
               {
                  _loc10_;
               }
               if(_loc14_ && !_loc15_)
               {
                  _loc20_.init("神圣箱子",_loc10_);
                  if(_root.game.map.player.ach[21][0] == 0)
                  {
                     _root.game.map.player.ach[21][1] = _loc0_ = _root.game.map.player.ach[21][1] + 1;
                     if(_loc0_ >= 50)
                     {
                        _root.game.map.player.ach[21][0] = 1;
                        _root.newMessage(_root.textSys[23][_root.lang]);
                     }
                  }
               }
               else if(_loc15_ && !_loc14_)
               {
                  _loc20_.init("魔法箱子",_loc10_);
                  if(_root.game.map.player.ach[20][0] == 0)
                  {
                     _root.game.map.player.ach[20][1] = _loc0_ = _root.game.map.player.ach[20][1] + 1;
                     if(_loc0_ >= 50)
                     {
                        _root.game.map.player.ach[20][0] = 1;
                        _root.newMessage(_root.textSys[23][_root.lang]);
                     }
                  }
               }
               else if(_loc14_ && _loc15_)
               {
                  _loc20_.init("极品箱子",_loc10_);
                  if(_root.game.map.player.ach[21][0] == 0)
                  {
                     _root.game.map.player.ach[21][1] = _loc0_ = _root.game.map.player.ach[21][1] + 1;
                     if(_loc0_ >= 50)
                     {
                        _root.game.map.player.ach[21][0] = 1;
                        _root.newMessage(_root.textSys[23][_root.lang]);
                     }
                  }
               }
               else
               {
                  _loc20_.init("普通箱子",_loc10_);
               }
               if(_loc10_ == undefined)
               {
                  _loc20_.attrib = undefined;
               }
            }
            else
            {
               _loc18_ = _root.game.map.getNextHighestDepth();
               _loc20_ = _root.game.map.attachMovie("coins","coins" + _loc18_,_loc18_,{_x:this._x,_y:this._y - 3});
               _loc24_ = 10 + random(this.level) + this.level * (random(3) + 1);
               _loc20_.init(_loc24_);
            }
         }
      }
   }
   function dropSpecialItem()
   {
      return false;
   }
   function hitAction(dmg, type, hitHT, attckLv, addDmg, criticalRate)
   {
      if(!_root.game.hitCombo)
      {
         _root.game.attachMovie("hitCombo","hitCombo",_root.game.getNextHighestDepth());
      }
      _root.game.hitCombo.showHits();
      super.hitAction(dmg,type,hitHT,attckLv,addDmg,criticalRate);
      var _loc0_;
      var _loc4_;
      if(this._quality != "LOW")
      {
         if(!this.showHp._x)
         {
            _loc4_ = this.showHp = _root.game.map.attachMovie("enemyHpShow","showHp" + _root.game.map.getNextHighestDepth(),_root.game.map.getNextHighestDepth());
            if(_root.game.map.player.level < this.level - 3)
            {
               _loc4_.name.text = "???";
               _loc4_.bar._xscale = 0;
            }
            else
            {
               _loc4_.bar._xscale = this.hp / this.totalHp * 100;
               if(this.addDmgType[0] != undefined)
               {
                  _loc4_.name.text = "Lv." + this.level + " " + this.enemyName + "(" + this.addDmgType[0] + ")";
               }
               else
               {
                  _loc4_.name.text = "Lv." + this.level + " " + this.enemyName;
               }
            }
            _loc4_.counter = 70;
            _loc4_._x = this._x;
            _loc4_._y = this._y + this.mc._y - this.hitMc._height;
            _loc4_.link = this;
            _loc4_.onEnterFrame = function()
            {
               this._x = this.link._x;
               this._y = this.link._y + this.link.mc._y - this.link.hitMc._height;
               if(--this.counter < 0)
               {
                  this.removeMovieClip();
               }
            };
         }
         else
         {
            if(_root.game.map.player.level < this.level - 3)
            {
               this.showHp.bar._xscale = 0;
            }
            else
            {
               this.showHp.bar._xscale = this.hp / this.totalHp * 100;
            }
            this.showHp.counter = 70;
         }
      }
      var _loc6_;
      var _loc7_;
      var _loc8_;
      if(this.hp <= 0)
      {
         this.showHp.bar._xscale = 0;
         if(_root.areaMode != 0)
         {
            if(!random(5))
            {
               _loc6_ = _root.game.map.getNextHighestDepth();
               _loc7_ = _root.game.map.attachMovie("dropPotion","dropPotion" + _loc6_,_loc6_,{_x:this._x,_y:this._y - 3});
               _loc7_.init("potion" + (random(18) + 1));
            }
            _root.game.map.controller.timer += 100;
            _root.game.map.controller.score += 10 * this.level;
            _root.ui.areaScore.text = "Score : " + _root.game.map.controller.score;
            _root.newMessage("Time +100  Score +" + 10 * this.level,35);
         }
         else
         {
            if(this.enemyName == "slime")
            {
               if(_root.game.map.player.ach[3][0] == 0)
               {
                  if(++_root.game.map.player.ach[3][1] >= 500)
                  {
                     _root.game.map.player.ach[3][0] = 1;
                     _root.newMessage(_root.textSys[23][_root.lang]);
                  }
               }
            }
            else if(this.enemyName == "wolf")
            {
               if(_root.game.map.player.ach[4][0] == 0)
               {
                  if(++_root.game.map.player.ach[4][1] >= 500)
                  {
                     _root.game.map.player.ach[4][0] = 1;
                     _root.newMessage(_root.textSys[23][_root.lang]);
                  }
               }
            }
            else if(this.enemyName == "hornet")
            {
               if(_root.game.map.player.ach[5][0] == 0)
               {
                  if(++_root.game.map.player.ach[5][1] >= 500)
                  {
                     _root.game.map.player.ach[5][0] = 1;
                     _root.newMessage(_root.textSys[23][_root.lang]);
                  }
               }
            }
            else if(this.enemyName == "goblinWarrior")
            {
               if(_root.game.map.player.ach[6][0] == 0)
               {
                  if(++_root.game.map.player.ach[6][1] >= 500)
                  {
                     _root.game.map.player.ach[6][0] = 1;
                     _root.newMessage(_root.textSys[23][_root.lang]);
                  }
               }
            }
            else if(this.enemyName == "goblinArcher")
            {
               if(_root.game.map.player.ach[7][0] == 0)
               {
                  if(++_root.game.map.player.ach[7][1] >= 500)
                  {
                     _root.game.map.player.ach[7][0] = 1;
                     _root.newMessage(_root.textSys[23][_root.lang]);
                  }
               }
            }
            else if(this.enemyName == "goblinMage")
            {
               if(_root.game.map.player.ach[8][0] == 0)
               {
                  if(++_root.game.map.player.ach[8][1] >= 500)
                  {
                     _root.game.map.player.ach[8][0] = 1;
                     _root.newMessage(_root.textSys[23][_root.lang]);
                  }
               }
            }
            else if(this.enemyName == "skeletonWarrior")
            {
               if(_root.game.map.player.ach[9][0] == 0)
               {
                  if(++_root.game.map.player.ach[9][1] >= 500)
                  {
                     _root.game.map.player.ach[9][0] = 1;
                     _root.newMessage(_root.textSys[23][_root.lang]);
                  }
               }
            }
            else if(this.enemyName == "centaur")
            {
               if(_root.game.map.player.ach[10][0] == 0)
               {
                  if(++_root.game.map.player.ach[10][1] >= 500)
                  {
                     _root.game.map.player.ach[10][0] = 1;
                     _root.newMessage(_root.textSys[23][_root.lang]);
                  }
               }
            }
            if(this.enemyName != undefined)
            {
               _root.newMessage(_root.textSys[2][_root.lang] + " lv." + this.level + " " + this.enemyName);
               for(var _loc5_ in _root.game.map.player.questList)
               {
                  if(_root.game.map.player.questList[_loc5_].statu != "Completed!")
                  {
                     _root.game.map.player.questList[_loc5_].update(this.enemyName + this.level);
                  }
               }
               this.enemyName = undefined;
            }
            this.dropSth();
            _loc8_ = _root.game.map.mapName + "_" + this.setPoint[0] + "_" + this.setPoint[1];
            _root.game.deadList[Number(_root.game.map.areaName)].push(_loc8_);
         }
         _root.game.map.player.addHp(_root.game.map.player.hpFromEmy);
         _root.game.map.player.addSp(_root.game.map.player.spFromEmy);
      }
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
      if(hitHT != undefined && this.hp > 0)
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
   function die()
   {
      this.iceDmg.removeMovieClip();
      this.thunderDmg.removeMovieClip();
      this.poisonDmg.removeMovieClip();
      this.enterframe = function()
      {
         if(this.att < 0)
         {
            this.gForce();
         }
         else
         {
            this.mc.gotoAndStop("die");
            delete this.enterframe;
            for(var _loc2_ in this._parent._parent.unitManager.unitArray)
            {
               if(this._parent._parent.unitManager.unitArray[_loc2_] == this)
               {
                  this._parent._parent.unitManager.unitArray.splice(_loc2_,1);
               }
            }
            this.enterframe = function()
            {
               if(this.mc.mc._currentframe >= 60)
               {
                  this.mc.mc.stop();
                  this._alpha -= 5;
                  this.mc._yscale += 20;
                  this.mc._y -= 1;
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
   function move1()
   {
   }
   function move2()
   {
   }
   function moveAction()
   {
      if(this.go & !this.jump && !this.attacking)
      {
         if(this.blocked > 40)
         {
            if(++this.blockCount < 50)
            {
               if(this.blockCount == 1)
               {
                  if(random(3))
                  {
                     this.blockDir = 1;
                  }
                  else
                  {
                     this.blockDir = -1;
                  }
               }
               this.moveDir += this.blockDir * (100 - 2 * this.blockCount);
               if(this.moveDir > 180)
               {
                  this.moveDir -= 360;
               }
               else if(this.moveDir < -180)
               {
                  this.moveDir += 360;
               }
            }
            else
            {
               this.blockCount = 0;
               this.blocked = 0;
               this.blockDir = 0;
            }
         }
         this.gotoFrame(this.translateDegreeToFrame(this.moveDir));
      }
      this.xSpeed = this.speed * Math.cos(this.moveDir * 0.0174);
      this.ySpeed = this.speed * Math.sin(this.moveDir * 0.0174);
      this.moveFunc();
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
   function trackHero()
   {
      this.moveDir = this._parent._parent.getRotation(this._x,this._y,this._parent.player.x,this._parent.player.y);
   }
   function faceHero()
   {
      this.moveDir = this._parent._parent.getRotation(this._x,this._y,this._parent.player.x,this._parent.player.y);
      this.toFrame(this.translateDegreeToFrame(this.moveDir));
   }
   function checkHit1(who, dis, agl)
   {
      var _loc3_ = this.att > - who.h + who.att && - this.h + this.att < who.att;
      var _loc6_;
      var _loc5_;
      var _loc4_;
      if(_loc3_)
      {
         _loc6_ = this._parent._parent.getDis(this._x,this._y,who.x,who.y);
         if(dis > _loc6_)
         {
            _loc5_ = this._parent._parent.getRotation(this._x,this._y,who.x,who.y);
            _loc4_ = this._parent._parent.getDegree1(_loc5_,this.translateFrameToDegree(this._currentframe));
            if(_loc4_ < agl)
            {
               return true;
            }
         }
      }
      return false;
   }
   function action()
   {
   }
   function mainAction()
   {
   }
   function attack1()
   {
   }
   function patrol()
   {
      this.mc.gotoAndStop("walk");
      this.resist = 0;
      this.blocked = 0;
      this.go = true;
      this.randomPt = [this._x + random(300) - 150,this._y + random(300) - 150];
      this.enterframe = function()
      {
         var _loc2_ = this._parent._parent.getDis(this._x,this._y,this.setPoint[0],this.setPoint[1]);
         if(_loc2_ > 150)
         {
            this.randomPt[0] = this.setPoint[0];
            this.randomPt[1] = this.setPoint[1];
         }
         this.moveDir = this._parent._parent.getRotation(this._x,this._y,this.randomPt[0],this.randomPt[1]);
         if(this._parent._parent.getDis(this._x,this._y,this.randomPt[0],this.randomPt[1]) < 10)
         {
            this.stay();
         }
         if(!random(this.stayRate))
         {
            this.stay();
         }
         this.gForce();
         this.mainAction();
         this.moveAction();
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
            return "chase";
         }
         return "insight";
      }
   }
   function stay()
   {
      this.mc.gotoAndStop("stand");
      this.resist = 0;
      this.go = false;
      this.enterframe = function()
      {
         this.gForce();
         this.tx = 0;
         this.ty = 0;
         var _loc2_ = random(300);
         if(_loc2_ < 2)
         {
            this.patrol();
         }
         else if(_loc2_ < 5)
         {
            this.moveDir = 45 * random(8) - 135;
            this.gotoFrame(this.translateDegreeToFrame(this.moveDir));
         }
         this.mainAction();
         if(this.checkAttack() == "insight")
         {
            this.faceHero();
         }
      };
   }
   function chasingHero()
   {
      this.mc.gotoAndStop("walk");
      this.resist = 0;
      this.go = true;
      this.keepDistance1 = random(this.keepDistance) + this.keepDistance;
      this.enterframe = function()
      {
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
         this.gForce();
         this.moveAction();
         this.mainAction();
      };
   }
}
