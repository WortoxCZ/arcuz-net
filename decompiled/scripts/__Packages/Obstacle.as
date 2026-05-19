class Obstacle extends MovieClip
{
   var bond;
   var frame;
   var h;
   var hitMc;
   var hp;
   var inStage;
   var onEnterFrame;
   var rUnit;
   var resist;
   function Obstacle()
   {
      super();
   }
   function init(f)
   {
      var _loc8_;
      var _loc6_;
      var _loc4_;
      var _loc5_;
      var _loc7_;
      if(this._name.slice(0,8) != "instance")
      {
         this.frame = f;
         §§push(this.gotoAndStop(f));
         this.inStage = false;
         _loc8_ = this.getBounds();
         this.bond = [_loc8_.xMin,_loc8_.xMax,_loc8_.yMin,_loc8_.yMax];
         trace(this.bond);
         _loc6_ = ["房子1","房子2","房子3","房子4","铁匠铺","流浪商铺","栅栏","储物箱","木堆","a","b","c","d","d2","e","f","f2","g","h","i","i2","j","k","l","m","m2","n","n2","o","p","入口1左右正","入口2上下右","入口3上下左"];
         for(var _loc9_ in _loc6_)
         {
            if(_loc6_[_loc9_] == f)
            {
               _loc4_ = true;
               this.type2();
               break;
            }
         }
         if(this.frame == "栅栏")
         {
            if(_root.game.map.player.chapter > 2 || _root.game.map.player.chapter == 2 && _root.game.map.player.phase >= 3)
            {
               this.frame = "栅栏2";
               §§push(this.gotoAndStop(this.frame));
            }
         }
         if(!_loc4_)
         {
            _loc5_ = ["洞口向左","洞口向右","碎片1","碎片2","碎片3","草堆","袋子1","袋子2","木材1","木材2","木材3","桶1","桶2","桶3","水桶","罐子1","罐子2","罐子3","骨头1","骨头2","腐木1","腐木2","植物","小碎石"];
            for(_loc9_ in _loc5_)
            {
               if(_loc5_[_loc9_] == f)
               {
                  _loc7_ = true;
                  this.type3();
                  break;
               }
            }
         }
         if(!(_loc4_ || _loc7_))
         {
            this.rUnit = 20;
            this.h = 100;
            this.resist = 999;
            this.hp = "obstacle";
            _root.game.firstTimeInMap(this);
            switch(f)
            {
               case "树1":
               case "树2":
               case "树3":
               case "树4":
               case "松树1":
               case "松树2":
               case "松树3":
               case "树枝1":
               case "树枝2":
               case "树枝3":
               case "材堆":
               case "稻草堆":
                  this.rUnit = 30;
                  break;
               case "石头堆1":
               case "石头堆2":
               case "石头堆3":
               case "石头堆4":
               case "最后的封印":
                  this.rUnit = 20;
                  this.h = 20;
                  break;
               case "破水井":
               case "拖车":
               case "袋子堆拖车":
               case "袋子堆":
               case "桶堆":
               case "箱子堆":
               case "箱子堆2":
               case "箱子1":
               case "箱子2":
               default:
                  return;
            }
         }
      }
   }
   function checkInStage()
   {
      var _loc5_ = this._x + _root.game.map._x;
      var _loc4_ = this._y + _root.game.map._y;
      var _loc6_;
      if(_loc5_ + this.bond[1] < -50 || _loc5_ + this.bond[0] > 500 || _loc4_ + this.bond[3] < -50 || _loc4_ + this.bond[2] > 410)
      {
         _loc6_ = false;
      }
      else
      {
         _loc6_ = true;
      }
      if(this.inStage)
      {
         if(!_loc6_)
         {
            this.inStage = false;
            §§push(this.gotoAndStop("nothing"));
            for(var _loc3_ in _root.game.layerArr)
            {
               if(_root.game.layerArr[_loc3_] == this)
               {
                  _root.game.layerArr.splice(_loc3_,1);
               }
            }
         }
      }
      else if(_loc6_)
      {
         this.inStage = true;
         this.gotoAndStop(this.frame);
         _root.game.layerArr.push(this);
      }
   }
   function checkInStage2()
   {
      var _loc5_ = this._x + _root.game.map._x;
      var _loc4_ = this._y + _root.game.map._y;
      var _loc6_;
      if(_loc5_ + this.bond[1] < -50 || _loc5_ + this.bond[0] > 500 || _loc4_ + this.bond[3] < -50 || _loc4_ + this.bond[2] > 410)
      {
         _loc6_ = false;
      }
      else
      {
         _loc6_ = true;
      }
      if(this.inStage)
      {
         if(!_loc6_)
         {
            this.inStage = false;
            §§push(this.gotoAndStop("nothing"));
            for(var _loc3_ in _root.game.layerArr)
            {
               if(_root.game.layerArr[_loc3_] == this)
               {
                  _root.game.layerArr.splice(_loc3_,1);
               }
            }
            for(_loc3_ in _root.game.map.obstacleArr)
            {
               if(_root.game.map.obstacleArr[_loc3_] == this)
               {
                  _root.game.map.obstacleArr.splice(_loc3_,1);
               }
            }
         }
      }
      else if(_loc6_)
      {
         this.inStage = true;
         §§push(this.gotoAndStop(this.frame));
         this.hitMc.gotoAndStop(this._currentframe);
         _root.game.layerArr.push(this);
         _root.game.map.obstacleArr.push(this);
      }
   }
   function action()
   {
   }
   function type2()
   {
      var _loc4_ = this._x + _root.game.map._x;
      var _loc3_ = this._y + _root.game.map._y;
      if(_loc4_ + this.bond[1] < -50 || _loc4_ + this.bond[0] > 500 || _loc3_ + this.bond[3] < -50 || _loc3_ + this.bond[2] > 410)
      {
         this.inStage = false;
         §§push(this.gotoAndStop("nothing"));
      }
      else
      {
         this.inStage = true;
         §§push(this.gotoAndStop(this.frame));
         this.hitMc.gotoAndStop(this._currentframe);
         _root.game.layerArr.push(this);
         _root.game.map.obstacleArr.push(this);
      }
      this.onEnterFrame = function()
      {
         this.checkInStage2();
      };
   }
   function type3()
   {
      var _loc4_ = this._x + _root.game.map._x;
      var _loc3_ = this._y + _root.game.map._y;
      _loc4_ + this.bond[1] < -50 || _loc4_ + this.bond[0] > 500 || _loc3_ + this.bond[3] < -50 || _loc3_ + this.bond[2] > 410 ? (this.inStage = false,this.gotoAndStop("nothing")) : (this.inStage = true,this.gotoAndStop(this.frame));
      this.onEnterFrame = function()
      {
         this.checkInStage();
      };
   }
   function enterframe()
   {
   }
}
