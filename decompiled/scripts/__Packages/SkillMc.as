class SkillMc extends MovieClip
{
   var counter;
   var drag;
   var dura;
   var duraMc;
   var funcId;
   var id;
   var ix;
   var iy;
   var link;
   var lx;
   var ly;
   var onPress;
   var spCost;
   var weapon;
   function SkillMc()
   {
      super();
      this.ix = 361;
      this.iy = 371;
      this.lx = 390;
      this.ly = 371;
   }
   function init(num, functionId)
   {
      this.id = num;
      §§push(this.gotoAndStop(this.id - 10));
      switch(this.id - 10)
      {
         case 1:
            this.weapon = "blade";
            break;
         case 2:
            this.weapon = "axe";
            break;
         case 3:
            this.weapon = "sword";
            break;
         default:
            this.weapon = "none";
      }
      this.funcId = functionId;
      this.dura = _root.skill[this.id - 1].dura[_root.game.map.player.skillList[this.id - 1]];
      if(this.funcId == "fullMagicRelease" || this.funcId == "specialAttack3")
      {
         this.spCost = _root.game.map.player.totalSp0 * _root.skill[this.id - 1].spCost[_root.game.map.player.skillList[this.id - 1]] / 100;
      }
      else
      {
         this.spCost = _root.skill[this.id - 1].spCost[_root.game.map.player.skillList[this.id - 1]];
      }
      this.duraMc.gotoAndStop(33);
      this.startDrag();
      this.drag = true;
      _root.ui.skillHighlight.gotoAndPlay(1);
      this.onPress = function()
      {
         this._name = "skillMcHold";
         if(this.drag)
         {
            _root.ui.skillHighlight.gotoAndStop(_root.ui.skillHighlight._totalframes);
            this.drag = false;
            this.checkPos();
            this.stopDrag();
         }
         else
         {
            this.drag = true;
            this.startDrag();
            _root.ui.skillHighlight.gotoAndPlay(1);
         }
      };
   }
   function func()
   {
      var _loc3_;
      if(_root.ui["tmpSkill" + this.id]._x == undefined)
      {
         if(_root.game.map.player.decSp(this.spCost) == false)
         {
            _root.newMessage(_root.textSys[9][_root.lang]);
            return false;
         }
         _loc3_ = _root.ui.createEmptyMovieClip("tmpSkill" + this.id,_root.ui.getNextHighestDepth());
         _loc3_.counter = _loc3_.dura = this.dura;
         _loc3_.link = this;
         _loc3_.onEnterFrame = function()
         {
            if(!_root.game.pauseAllCharacters)
            {
               this.link.duraMc.gotoAndStop(33 - int(33 * (this.counter / this.dura)));
               if(--this.counter < 0)
               {
                  this.link.duraMc.gotoAndStop(33);
                  this.removeMovieClip();
               }
            }
         };
         return true;
      }
      return false;
   }
   function checkPos()
   {
      var _loc3_;
      if(this.ix - 28 < this._x && this._x < this.ix + 20)
      {
         if(this.iy - 25 < this._y && this._y < this.iy + 25)
         {
            this._x = this.ix;
            this._y = this.iy;
            _root.game.map.player.skillI = _root.game.map.player[this.funcId];
            if(_root.ui.skillIMc != this)
            {
               _root.ui.skillIMc.removeMovieClip();
            }
            this._name = "skillIMc";
            _loc3_ = true;
         }
      }
      else if(this.lx - 8 < this._x && this._x < this.lx + 29)
      {
         if(this.ly - 25 < this._y && this._y < this.ly + 25)
         {
            this._x = this.lx;
            this._y = this.ly;
            if(_root.ui.skillLMc != this)
            {
               _root.ui.skillLMc.removeMovieClip();
            }
            this._name = "skillLMc";
            _root.game.map.player.skillL = _root.game.map.player[this.funcId];
            _loc3_ = true;
         }
      }
      if(this.weapon != "none")
      {
         if(this.weapon != _root.game.map.player.weaponType)
         {
            this.removeMovieClip();
         }
      }
      if(!_loc3_)
      {
         this.removeMovieClip();
      }
      else
      {
         this.stopDrag();
      }
   }
}
