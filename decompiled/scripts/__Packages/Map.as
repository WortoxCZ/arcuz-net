class Map extends MovieClip
{
   var Exit;
   var areaName;
   var checkLock;
   var count;
   var createEnemy;
   var currentSpot;
   var delay;
   var dir;
   var endX;
   var endY;
   var exitList;
   var gArr;
   var gAttach;
   var lock;
   var lockController;
   var lockList;
   var lockMapAction;
   var mapH;
   var mapMusic;
   var mapName;
   var mapW;
   var nextSpot;
   var obstacleArr;
   var ok;
   var onEnterFrame;
   var player;
   var special;
   var specialCamera;
   var stageH;
   var stageW;
   var startX;
   var startY;
   var tileH;
   var tileW;
   var tileWallArr;
   var unlockMap;
   var wArr;
   var wAttach;
   var xNum;
   var yNum;
   function Map()
   {
      super();
      var _loc4_;
      if(this._name.slice(0,8) != "instance")
      {
         this.stageW = 400;
         this.stageH = 360;
         this.tileW = 128;
         this.tileH = 128;
         this.mapMusic = [];
         this.mapMusic[1] = "01村庄.mp3";
         this.mapMusic[2] = "02奥库兹平原.mp3";
         this.mapMusic[3] = "03歌德草原&11魔力洞穴.mp3";
         this.mapMusic[4] = "04寂静山岭&05南方山脉.mp3";
         this.mapMusic[5] = "04寂静山岭&05南方山脉.mp3";
         this.mapMusic[6] = "06基诺山脉&09神秘山洞&游戏开始菜单.mp3";
         this.mapMusic[7] = "07玫瑰森林&08北方森林.mp3";
         this.mapMusic[8] = "07玫瑰森林&08北方森林.mp3";
         this.mapMusic[9] = "06基诺山脉&09神秘山洞&游戏开始菜单.mp3";
         this.mapMusic[10] = "10半人马森林&14罪恶森林&intro.mp3";
         this.mapMusic[11] = "03歌德草原&11魔力洞穴.mp3";
         this.mapMusic[12] = "12悲伤森林&13废弃矿坑.mp3";
         this.mapMusic[13] = "12悲伤森林&13废弃矿坑.mp3";
         this.mapMusic[14] = "10半人马森林&14罪恶森林&intro.mp3";
         this.mapMusic[15] = "15安息之谷.mp3";
         this.mapMusic[16] = "16安息之谷final&竞技场.mp3";
         if(!_root.areaMode)
         {
            this.changeMap(_root.map_01_0101);
         }
         else
         {
            this.changeMap(_root["map_area_" + _root.areaMode]);
            this.moveScreen();
            this.createEnemy = _root["map_area_" + _root.areaMode].createEnemy1;
         }
         this.checkMap1();
         this.player = this.attachMovie("player","player",this.getNextHighestDepth());
         if(_root.areaMode != 0)
         {
            this.player._x = int(this.mapW / 2);
            this.player._y = int(this.mapH / 2);
         }
         else
         {
            this.player._x = 1017;
            this.player._y = 372;
            if(this.player.chapter == 0 && this.player.phase == 0)
            {
               _root.newMessage(_root.textNpc1[24][_root.lang],350);
               _root.newMessage(_root.textNpc1[25][_root.lang],360);
               _root.newMessage(_root.textNpc1[26][_root.lang],370);
            }
            _loc4_ = 1;
            while(_loc4_ <= 7)
            {
               _root.game.map["npc" + _loc4_].showQuestStatus();
               _root.game.map["npc" + _loc4_].updateStore();
               _root.game.map["npc" + _loc4_].talking = false;
               _root.game.map["npc" + _loc4_].setDlg();
               _loc4_ = _loc4_ + 1;
            }
         }
         this.onEnterFrame = function()
         {
            this.moveScreen();
            this.checkMap();
         };
      }
   }
   function setScreen()
   {
      this._x = int(200 - this.player._x);
      this._y = int(200 - this.player._y - int(this.player.att / 3));
      this.screenRage();
   }
   function screenRage()
   {
      if(this._x > 0)
      {
         this._x = 0;
      }
      else if(this._x - 400 < - this.mapW)
      {
         this._x = - this.mapW + 400;
      }
      if(this._y > 0)
      {
         this._y = 0;
      }
      else if(this._y - 360 < - this.mapH)
      {
         this._y = - this.mapH + 360;
      }
   }
   function moveScreen()
   {
      if(!this.specialCamera)
      {
         this._x += int((200 - this.player._x - this._x) / 5);
         this._y += int((200 - this.player._y - int(this.player.att / 3) - this._y) / 5);
      }
      else
      {
         this._x += int((200 - this.specialCamera[0] - this._x) / 5);
         this._y += int((200 - this.specialCamera[1] - this._y) / 5);
      }
      this.screenRage();
   }
   function checkMap1()
   {
      var _loc5_ = this.startX;
      var _loc4_;
      var _loc3_;
      var _loc7_;
      var _loc6_;
      var _loc2_;
      while(_loc5_ <= this.endX)
      {
         _loc4_ = this.startY;
         while(_loc4_ <= this.endY)
         {
            if(this["tileG" + _loc5_ + "-" + _loc4_] == undefined)
            {
               for(var _loc8_ in this)
               {
                  if(this[_loc8_].mcType == "tileG")
                  {
                     _loc3_ = this[_loc8_];
                     if(_loc3_.xNum < this.startX || _loc3_.xNum > this.endX || _loc3_.yNum < this.startY || _loc3_.yNum > this.endY)
                     {
                        _loc7_ = _loc3_.xNum;
                        _loc6_ = _loc3_.yNum;
                        _loc3_._name = "tileG" + _loc5_ + "-" + _loc4_;
                        _loc3_._x = _loc5_ * this.tileW;
                        _loc3_._y = _loc4_ * this.tileH;
                        _loc3_.xNum = _loc5_;
                        _loc3_.yNum = _loc4_;
                        if(_loc5_ < 0 || _loc4_ < 0 || _loc5_ >= this.xNum || _loc4_ >= this.yNum)
                        {
                           _loc3_.gotoAndStop(_loc3_._totalframes);
                        }
                        else
                        {
                           _loc3_.gotoAndStop(_loc3_._totalframes);
                           _loc3_.gotoAndStop(this.gArr[_loc3_.xNum][_loc3_.yNum]);
                        }
                        _loc2_ = this["tileW" + _loc7_ + "-" + _loc6_];
                        _loc2_._name = "tileW" + _loc5_ + "-" + _loc4_;
                        _loc2_._x = _loc3_._x;
                        _loc2_._y = _loc3_._y;
                        _loc2_.xNum = _loc5_;
                        _loc2_.yNum = _loc4_;
                        if(_loc5_ < 0 || _loc4_ < 0 || _loc5_ >= this.xNum || _loc4_ >= this.yNum)
                        {
                           _loc2_.gotoAndStop(_loc2_._totalframes);
                           _loc2_.hit.gotoAndStop(_loc2_._totalframes);
                        }
                        else
                        {
                           _loc2_.gotoAndStop(_loc2_._totalframes);
                           _loc2_.gotoAndStop(this.wArr[_loc2_.xNum][_loc2_.yNum]);
                           _loc2_.hit.gotoAndStop(this.wArr[_loc2_.xNum][_loc2_.yNum]);
                           _loc2_.hit.x.text = _loc2_.xNum;
                           _loc2_.hit.y.text = _loc2_.yNum;
                        }
                        break;
                     }
                  }
               }
            }
            _loc4_ = _loc4_ + 1;
         }
         _loc5_ = _loc5_ + 1;
      }
   }
   function checkMap()
   {
      var _loc3_ = - Math.floor(this._x / this.tileW) - 1;
      var _loc2_ = - Math.floor(this._y / this.tileH) - 1;
      if(_loc3_ != this.startX || _loc2_ != this.startY)
      {
         this.startX = _loc3_;
         this.startY = _loc2_;
         this.endX = this.startX + 4;
         this.endY = this.startY + 3;
         this.checkMap1();
      }
   }
   function setTileDepth()
   {
      var _loc2_;
      var _loc3_;
      for(var _loc4_ in this.tileWallArr)
      {
         _loc2_ = this.tileWallArr[_loc4_];
         _loc3_ = _loc2_._x + this._x + _loc2_.dx + (_loc2_._y + this._y + _loc2_.dy) * 450;
         if(_loc3_ > 100)
         {
            _loc2_.swapDepths(_loc3_);
         }
      }
   }
   function changeMap(mapObj, dir)
   {
      this._parent.changeMapMc.play();
      for(var _loc16_ in this)
      {
         if(this[_loc16_] != this.player && this[_loc16_] != this.player.iceDmg && this[_loc16_] != this.player.thunderDmg && this[_loc16_] != this.player.poisonDmg)
         {
            this[_loc16_].removeMovieClip();
         }
      }
      this._parent.delUnitButPlayer();
      this.player.swapDepths(-1);
      this.special = mapObj.special;
      var _loc22_;
      var _loc12_;
      var _loc17_;
      var _loc7_;
      var _loc16_;
      var _loc8_;
      var _loc6_;
      var _loc9_;
      var _loc5_;
      if(this.areaName != mapObj.areaName)
      {
         _loc22_ = Number(_root.game.map.areaName);
         _root.game.deadList[_loc22_] = [];
         _loc12_ = Number(mapObj.areaName);
         if(_root.areaName[_loc12_] != undefined)
         {
            _root.newMessage(_root.textSys[7][_root.lang] + _root.areaName[_loc12_]);
         }
         _loc17_ = _root.attachMovie("mapNameShowMc","mapNameShowMc" + _root.getNextHighestDepth(),_root.getNextHighestDepth());
         if(_root.areaMode == 0)
         {
            _loc17_.mc.txt.text = _root.areaName[_loc12_];
            _root.playMusic(this.mapMusic[_loc12_],true);
         }
         else
         {
            _loc17_.mc.txt.text = _root.textMap[16][_root.lang];
            _root.playMusic("16安息之谷final&竞技场.mp3",true);
         }
         if(_root.game.map.player.ach[16][0] == 0)
         {
            _loc7_ = [];
            _loc16_ = 1;
            while(_loc16_ < 17)
            {
               if(typeof _root.game.map.player.mapVisit[_loc16_] != "string")
               {
                  _loc7_[_loc16_] = _root.mapVisitArrayToString(_root.game.map.player.mapVisit[_loc16_]);
               }
               else
               {
                  _loc7_[_loc16_] = _root.game.map.player.mapVisit[_loc16_];
               }
               _loc16_ = _loc16_ + 1;
            }
            _loc16_ = 1;
            while(_loc16_ < 17)
            {
               _loc7_[_loc16_] = _root.mapVisitStringToArray(_loc7_[_loc16_]);
               _loc16_ = _loc16_ + 1;
            }
            _loc8_ = false;
            _loc6_ = 1;
            while(_loc6_ < 17)
            {
               _loc9_ = _loc6_ < 10 ? "0" + _loc6_ : _loc6_;
               _loc16_ = 0;
               while(_loc16_ < 8)
               {
                  if(_loc8_)
                  {
                     break;
                  }
                  _loc5_ = 0;
                  while(_loc5_ < 8)
                  {
                     if(_root["map_" + _loc9_][_loc16_][_loc5_] != 0)
                     {
                        if(_loc7_[_loc6_][_loc5_][_loc16_] != 1)
                        {
                           _loc8_ = true;
                           break;
                        }
                     }
                     _loc5_ = _loc5_ + 1;
                  }
                  _loc16_ = _loc16_ + 1;
               }
               _loc6_ = _loc6_ + 1;
            }
            trace("notAchieve " + _loc8_);
            if(_loc8_ == false)
            {
               _root.game.map.player.ach[16][0] = 1;
               _root.newMessage(_root.textSys[23][_root.lang]);
            }
         }
      }
      this.areaName = mapObj.areaName;
      this.mapName = mapObj.mapName;
      this.xNum = mapObj.Info.xNum;
      this.yNum = mapObj.Info.yNum;
      this.mapW = mapObj.Info.mapW;
      this.mapH = mapObj.Info.mapH;
      this.gAttach = mapObj.Info.gAttach;
      this.wAttach = mapObj.Info.wAttach;
      this.Exit = mapObj.Exit;
      this.createEnemy = mapObj.createEnemy;
      this.gArr = mapObj.g.slice();
      this.wArr = mapObj.w.slice();
      mapObj.playSound();
      this.tileWallArr = [];
      this.obstacleArr = [];
      this.startX = this.startY = this.endX = this.endY = 0;
      _root.ui.pointAndHint.removeMovieClip();
      _root.ui.pointAndHintCoins.removeMovieClip();
      _loc16_ = 0;
      var _loc4_;
      while(_loc16_ < 5)
      {
         _loc5_ = 0;
         while(_loc5_ < 4)
         {
            _loc4_ = this.attachMovie(this.gAttach,"tileG" + _loc16_ + "-" + _loc5_,_loc16_ * 4 + _loc5_ + 1);
            _loc4_.mcType = "tileG";
            _loc4_._x = _loc16_ * this.tileW;
            _loc4_._y = _loc5_ * this.tileH;
            _loc4_.xNum = _loc16_;
            _loc4_.yNum = _loc5_;
            _loc4_.gotoAndStop(this.gArr[_loc4_.xNum][_loc4_.yNum]);
            _loc5_ = _loc5_ + 1;
         }
         _loc16_ = _loc16_ + 1;
      }
      _loc16_ = 0;
      var _loc3_;
      while(_loc16_ < 5)
      {
         _loc5_ = 0;
         while(_loc5_ < 4)
         {
            _loc3_ = this.attachMovie(this.wAttach,"tileW" + _loc16_ + "-" + _loc5_,_loc16_ * 4 + _loc5_ + 21);
            _loc3_.mcType = "tileW";
            _loc3_._x = _loc16_ * this.tileW;
            _loc3_._y = _loc5_ * this.tileH;
            _loc3_.xNum = _loc16_;
            _loc3_.yNum = _loc5_;
            _loc3_.gotoAndStop(this.wArr[_loc3_.xNum][_loc3_.yNum]);
            _loc3_.hit.gotoAndStop(this.wArr[_loc3_.xNum][_loc3_.yNum]);
            this.tileWallArr.push(_loc3_);
            _loc5_ = _loc5_ + 1;
         }
         _loc16_ = _loc16_ + 1;
      }
      if(dir != undefined)
      {
         if(dir == "left")
         {
            dir = "right";
         }
         else if(dir == "right")
         {
            dir = "left";
         }
         else if(dir == "top")
         {
            dir = "bottom";
         }
         else if(dir == "bottom")
         {
            dir = "top";
         }
         this.player._x = this.Exit[dir + "In"][0];
         this.player._y = this.Exit[dir + "In"][1];
         _loc17_ = _root.createEmptyMovieClip("tmpCtrl",_root.getNextHighestDepth());
         _loc17_.dir = dir;
         _root.game.map.player.enterframe = undefined;
         _loc17_.onEnterFrame = function()
         {
            if(!this.ok)
            {
               this.ok = true;
            }
            else
            {
               _root.game.map.player.mapIn(this.dir);
               this.removeMovieClip();
            }
         };
      }
      else
      {
         _root.game.map.player.action();
      }
      this.player.swapDepths(this.getNextHighestDepth());
      this.lockList = undefined;
      this.lock = false;
      this.setScreen();
      this.createEnemy();
      var _loc19_;
      var _loc20_;
      if(this.areaName == "01")
      {
         _loc19_ = _root.game.map.player.chapter;
         _loc20_ = _root.game.map.player.phase;
         if(_loc19_ == 0 && _loc20_ == 5 || _loc19_ == 0 && _loc20_ == 8)
         {
            _root.ui.attachMovie("pointAndHint","pointAndHint",_root.ui.getNextHighestDepth());
            _root.ui.pointAndHint.init(1067,300,_root.textTutorial[20][_root.lang]);
         }
         if(_root.usingMochiCoins)
         {
            if(_root.mochiCoinsSaveData.newItems.length > 0)
            {
               _root.ui.attachMovie("pointAndHint","pointAndHintCoins",_root.ui.getNextHighestDepth());
               _root.ui.pointAndHintCoins.init(619,1301,"You\'ve bought some good stuff,check it out now!");
               this.attachMovie("chestMochiCoins","chestMochiCoins",this.getNextHighestDepth(),{_x:619,_y:1341});
            }
         }
      }
      else if(this.areaName == "02")
      {
         _loc19_ = _root.game.map.player.chapter;
         _loc20_ = _root.game.map.player.phase;
         if(_loc19_ == 0 && _loc20_ == 4)
         {
            if(_root.hintOfDlg._x == undefined)
            {
               _root.attachMovie("hintOfDlg","hintOfDlg",_root.getNextHighestDepth());
            }
            _root.hintOfDlg.gotoAndStop(7);
         }
      }
      var _loc11_;
      for(_loc16_ in this)
      {
         if(this[_loc16_].level != undefined)
         {
            if(this[_loc16_].level > _root.game.map.player.level + 2)
            {
               _loc11_ = true;
               break;
            }
         }
      }
      var _loc14_;
      if(_loc11_)
      {
         _root.ui.createEmptyMovieClip("caution",_root.ui.getNextHighestDepth());
         _loc17_ = _root.attachMovie("mapNameShowMc","mapNameShowMc" + _root.getNextHighestDepth(),_root.getNextHighestDepth());
         _loc17_._y -= 18;
         _loc17_.mc.txt.text = "! CAUTION !";
         _loc14_ = new TextFormat();
         _loc14_.align = "center";
         _loc14_.color = 16711680;
         _loc14_.size = 20;
         _loc17_.mc.txt.setTextFormat(_loc14_);
      }
      if(this.lockList != undefined)
      {
         this.lock = true;
         this.lockController = this.createEmptyMovieClip("lockController",this.getNextHighestDepth());
         this.lockController.count = 60;
         this.lockController.exitList = [];
         if(_root.game.map.specialCamera != undefined)
         {
            this.lockController.delay = true;
         }
         this.lockController.currentSpot = 0;
         if(this.Exit.topIn != undefined)
         {
            this.lockController.exitList.push(this.Exit.topIn);
         }
         if(this.Exit.bottomIn != undefined)
         {
            this.lockController.exitList.push(this.Exit.bottomIn);
         }
         if(this.Exit.leftIn != undefined)
         {
            this.lockController.exitList.push(this.Exit.leftIn);
         }
         if(this.Exit.rightIn != undefined)
         {
            this.lockController.exitList.push(this.Exit.rightIn);
         }
         this.lockController.nextSpot = function()
         {
            _root.game.map.specialCamera = [];
            _root.game.map.specialCamera[0] = this.exitList[this.currentSpot][0];
            _root.game.map.specialCamera[1] = this.exitList[this.currentSpot][1];
            this.currentSpot = this.currentSpot + 1;
         };
         this.lockController.unlockMap = function()
         {
            this.currentSpot = 0;
            this.onEnterFrame = function()
            {
               if(!_root.game.pauseAllCharacters)
               {
                  if(this.count > 2)
                  {
                     _root.game.pauseCharacters();
                  }
               }
               if(++this.count > 60)
               {
                  if(this.currentSpot < this.exitList.length)
                  {
                     this.nextSpot();
                     this.count = 0;
                  }
                  else
                  {
                     _root.game.map.specialCamera = undefined;
                     _root.game.map.lockList = undefined;
                     _root.game.map.lock = false;
                     _root.game.continueCharacters();
                     this.removeMovieClip();
                  }
               }
               if(this.count == 20)
               {
                  _root.game.map["魔法阵" + this.currentSpot].removeMovieClip();
               }
            };
         };
         this.lockController.checkLock = function()
         {
            this.onEnterFrame = function()
            {
               if(++this.count > 60)
               {
                  this.count = 0;
                  if(_root.game.map.ifUnlock())
                  {
                     this.unlockMap();
                  }
               }
            };
         };
         this.lockController.lockMapAction = function()
         {
            this.onEnterFrame = function()
            {
               var _loc3_;
               if(_root.ui.dialog._x == undefined)
               {
                  if(++this.count > 60)
                  {
                     if(this.currentSpot < this.exitList.length)
                     {
                        this.nextSpot();
                        this.count = 0;
                     }
                     else
                     {
                        _root.game.continueCharacters();
                        _root.game.map.specialCamera = undefined;
                        this.checkLock();
                     }
                  }
                  if(this.count == 20)
                  {
                     _loc3_ = _root.game.map.attachMovie("魔法阵","魔法阵" + this.currentSpot,_root.game.map.getNextHighestDepth());
                     _loc3_._x = _root.game.map.specialCamera[0];
                     _loc3_._y = _root.game.map.specialCamera[1];
                     _loc3_.blendMode = 8;
                     _root.sethum(_loc3_,140);
                  }
               }
            };
         };
         this.lockController.lockMap = function()
         {
            if(this.delay)
            {
               this.count = 0;
               this.onEnterFrame = function()
               {
                  if(!_root.game.pauseAllCharacters)
                  {
                     if(this.count > 1)
                     {
                        _root.game.pauseCharacters();
                     }
                  }
                  if(++this.count == 60)
                  {
                     this.count = 60;
                     this.lockMapAction();
                  }
               };
            }
            else
            {
               this.count = 0;
               this.onEnterFrame = function()
               {
                  if(!_root.game.pauseAllCharacters)
                  {
                     if(this.count > 1)
                     {
                        _root.game.pauseCharacters();
                     }
                  }
                  if(++this.count == 3)
                  {
                     this.count = 60;
                     this.lockMapAction();
                  }
               };
            }
         };
         this.lockController.lockMap();
      }
      if(typeof _root["map_" + this.areaName + "_visit"] == "string")
      {
         _root["map_" + this.areaName + "_visit"] = _root.mapVisitStringToArray(_root["map_" + this.areaName + "_visit"]);
      }
      var _loc15_ = Number(this.mapName.slice(0,2));
      var _loc13_ = Number(this.mapName.slice(2,4));
      if(_root["map_" + this.areaName + "_visit"][_loc13_][_loc15_] == 0)
      {
         _root["map_" + this.areaName + "_visit"][_loc13_][_loc15_] = 1;
      }
      if(typeof _root.game.map.player.mapVisit[int(this.areaName)] == "string")
      {
         _root.game.map.player.mapVisit[int(this.areaName)] = _root.mapVisitStringToArray(_root.game.map.player.mapVisit[int(this.areaName)]);
      }
      if(_root.game.map.player.mapVisit[int(this.areaName)][_loc13_][_loc15_] == 0)
      {
         _root.game.map.player.mapVisit[int(this.areaName)][_loc13_][_loc15_] = 1;
      }
      _root.ui.dlgMap.fresh();
      if(_root.areaMode == 0)
      {
         _root.ui.miniMap.gotoAndStop("t" + _root["map_" + _root.game.map.areaName][Number(_root.game.map.mapName.slice(1,2))][Number(_root.game.map.mapName.slice(3,4))]);
      }
      else
      {
         _root.ui.miniMap.gotoAndStop("t0");
      }
      var _loc21_;
      var _loc23_;
      if(_root.game.map.player._name == undefined)
      {
         if(_root.usingMochiCoins)
         {
            if(_root.mochiCoinsSaveData.tele[0] != undefined)
            {
               _loc21_ = true;
            }
         }
         else
         {
            _loc23_ = SharedObject.getLocal("Arcuz");
            if(_loc23_.data.tele[0] != undefined)
            {
               _loc21_ = true;
            }
         }
      }
      else if(_root.game.map.player.tele[0] != undefined && this.areaName == "01")
      {
         _loc21_ = true;
      }
      if(_loc21_)
      {
         if(dir == undefined)
         {
            _root.game.map.player._x = 984;
            _root.game.map.player._y = 829;
         }
         _loc17_ = _root.game.map.attachMovie("传输坐标","传输坐标",98);
         _loc17_._x = 984;
         _loc17_._y = 831;
         _loc17_.ok = false;
         _loc17_.blendMode = 8;
         _loc17_.onEnterFrame = function()
         {
            var _loc4_ = this._parent._parent.getDis(this._x,this._y,this._parent.player._x,this._parent.player._y);
            var _loc3_;
            if(_loc4_ < 20)
            {
               if(this.ok)
               {
                  _root.playSound("开传送门.mp3");
                  _root.game.map.changeMap(_root[_root.game.map.player.tele[0]]);
                  if(_root.game.map.player.tele[1] != undefined)
                  {
                     _root.game.map.player._x = _root.game.map.player.tele[1];
                     _root.game.map.player._y = _root.game.map.player.tele[2];
                  }
                  _root.game.map.player.tele[0] = undefined;
                  _root.game.map.player.tele[1] = undefined;
                  _root.game.map.player.tele[2] = undefined;
                  _root.game.map.player.tele = undefined;
                  _loc3_ = _root.game.map.attachMovie("传输坐标","传输坐标",98);
                  _loc3_._x = _root.game.map.player._x;
                  _loc3_._y = _root.game.map.player._y + 2;
                  _loc3_.blendMode = 8;
                  _loc3_.onEnterFrame = function()
                  {
                     this._alpha -= 5;
                     if(this._alpha < 0)
                     {
                        this.removeMovieClip();
                     }
                  };
               }
            }
            else if(_loc4_ > 60)
            {
               this.ok = true;
            }
         };
      }
   }
}
