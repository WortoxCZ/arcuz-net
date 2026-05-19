class Npc extends Man
{
   var _name;
   var _parent;
   var _x;
   var _y;
   var chapter;
   var goods;
   var gotoAndStop;
   var h;
   var hp;
   var keyD;
   var moveDir;
   var npcName;
   var phase;
   var questId;
   var questMark;
   var rUnit;
   var resist;
   var speech;
   var str;
   var subQuestId;
   var talking = false;
   function Npc()
   {
      super();
      if(this._name.slice(0,8) != "instance")
      {
         this.gotoAndStop(random(8) + 1); //unpopped
         this.rUnit = 10;
         this.h = 26;
         this.hp = 1000000;
         this.moveDir = -90;
         this.resist = 999;
         this._parent._parent.firstTimeInMap(this);
         this.chapter = _root.game.map.player.chapter;
         this.phase = _root.game.map.player.phase;
         this.questMark.gotoAndStop(3);
         this.updateSpeech();
      }
   }
   function showQuestStatus()
   {
      var _loc3_ = _root.game.map.player.secondaryQuest[_root.game.map.player.chapter][this.subQuestId[_root.game.map.player.chapter]];
      if(this.questId[_root.game.map.player.chapter][_root.game.map.player.phase] == 1 || _loc3_ == 0)
      {
         this.questMark.gotoAndStop(1);
      }
      else if(_root.game.map[_root.quest[_root.game.map.player.chapter][_root.game.map.player.phase - 2].rewardNpc] == this || _root.game.map[_root.quest[_root.game.map.player.chapter][_root.game.map.player.phase - 1].rewardNpc] == this || _loc3_ == 1 || _loc3_ == 2)
      {
         this.questMark.gotoAndStop(2);
      }
      else
      {
         this.questMark.gotoAndStop(3);
      }
   }
   function action()
   {
      this.keyD = true;
      this.showQuestStatus();
      this.enterframe = function()
      {
         this.enterframe1();
      };
   }
   function enterframe1()
   {
      if(!this.talking)
      {
         if(!random(250))
         {
            §§push(this.gotoAndStop(random(8) + 1));
         }
      }
      var _loc5_;
      var _loc3_;
      var _loc4_;
      if(this._parent._parent.getDis(this._x,this._y,this._parent.player._x,this._parent.player._y) < 80)
      {
         if(Key.isDown(74) || _root.mouseCursor.down)
         {
            if(!this.keyD || _root.mouseCursor.down)
            {
               this.keyD = true;
               if(_root.mouseCursor.down)
               {
                  if(this._parent._parent.getDis(this._x,this._y,_root._xmouse - _root.game.map._x - 50,_root._ymouse - _root.game.map._y) > 50)
                  {
                     return undefined;
                  }
                  if(_root.ui.dlgCompose.hitTest(_root._xmouse,_root._ymouse,true))
                  {
                     return undefined;
                  }
                  if(_root.ui.dlgSellStuff.hitTest(_root._xmouse,_root._ymouse,true))
                  {
                     return undefined;
                  }
                  if(_root.ui.dlgStore.hitTest(_root._xmouse,_root._ymouse,true))
                  {
                     return undefined;
                  }
                  if(_root.ui.dlgInv.hitTest(_root._xmouse,_root._ymouse,true))
                  {
                     return undefined;
                  }
                  if(_root.ui.dlgChar.hitTest(_root._xmouse,_root._ymouse,true))
                  {
                     return undefined;
                  }
                  if(_root.ui.dlgQuest.hitTest(_root._xmouse,_root._ymouse,true))
                  {
                     return undefined;
                  }
                  if(_root.ui.dlgSkill.hitTest(_root._xmouse,_root._ymouse,true))
                  {
                     return undefined;
                  }
                  if(_root.ui.dlgMenu.hitTest(_root._xmouse,_root._ymouse,true))
                  {
                     return undefined;
                  }
               }
               if(_root.game.map.player.jump)
               {
                  return undefined;
               }
               if(this._parent.special != "town")
               {
                  return undefined;
               }
               if(_root.mouseCursor.down && _root._ymouse > 330)
               {
                  _root.mouseCursor.down = false;
                  return undefined;
               }
               _root.mouseCursor.down = false;
               if(_root.ui.dialog._x && (_root.ui.dlgCompose._name || _root.ui.dlgSellStuff._name || _root.ui.dlgStore._name))
               {
                  return undefined;
               }
               this.chapter = _root.game.map.player.chapter;
               this.phase = _root.game.map.player.phase;
               if(!_root.ui.dialog._x)
               {
                  this.updateSpeech();
                  _loc5_ = _root.ui.attachMovie("dialog","dialog",_root.ui.getNextHighestDepth());
                  _root.ui.dialog.lonelyDialog = undefined;
                  _loc3_ = _root.game.map.player.secondaryQuest[this.chapter][this.subQuestId[this.chapter]];
                  if(this.checkPastSecQuest())
                  {
                     _loc4_ = this.checkPastSecQuest().getPrice();
                  }
                  else if(_root.game.map[_root.quest[this.chapter][this.phase - 1].rewardNpc] == this)
                  {
                     _loc4_ = _root.quest[this.chapter][this.phase - 1].getPrice();
                  }
                  else if(_root.game.map[_root.quest[this.chapter][this.phase - 2].rewardNpc] == this)
                  {
                     _loc4_ = _root.quest[this.chapter][this.phase - 2].getPrice();
                  }
                  else if(_loc3_ == 1)
                  {
                     _loc4_ = _root.sQuest[this.chapter][this.subQuestId[this.chapter]].getPrice();
                  }
                  else if(_loc3_ == 2)
                  {
                     _loc4_ = _root.sQuest[this.chapter][this.subQuestId[this.chapter]].getPrice();
                  }
                  else if(this.chapter == 0 && this._name == "npc1")
                  {
                     if(!_root.npc1firstTalking)
                     {
                        _root.npc1firstTalking = true;
                        if(this.speech.length > 1)
                        {
                           _loc4_ = this.speech[random(this.speech.length)];
                        }
                        else
                        {
                           _loc4_ = this.speech[0];
                        }
                     }
                     else
                     {
                        _loc4_ = ["..."];
                     }
                  }
                  else if(this.speech.length > 1)
                  {
                     _loc4_ = this.speech[random(this.speech.length)];
                  }
                  else
                  {
                     _loc4_ = this.speech[0];
                  }
                  _loc5_.init(this.npcName,_loc4_);
                  this._parent.player.talkTo(this);
                  this.talking = true;
               }
               else if(_root.ui.dialog.nextText() == "end")
               {
                  _loc3_ = _root.game.map.player.secondaryQuest[this.chapter][this.subQuestId[this.chapter]];
                  trace(this.chapter + "::" + this.phase);
                  if(this.checkPastSecQuest())
                  {
                     this.checkPastSecQuest().freshPhase();
                     _root.ui.dialog.closeDlg();
                  }
                  else if(_root.ui.dialog.strings == _root.quest[this.chapter][this.phase - 2].dialog[4])
                  {
                     _root.quest[this.chapter][this.phase - 2].freshPhase();
                     _root.ui.dialog.closeDlg();
                  }
                  else if(_root.ui.dialog.strings == _root.sQuest[this.chapter][this.subQuestId[this.chapter]].dialog[4])
                  {
                     _root.sQuest[this.chapter][this.subQuestId[this.chapter]].freshPhase();
                     _root.ui.dialog.closeDlg();
                  }
                  else if(this.questId[this.chapter][this.phase - 1] == 1 && _root.ui.dialog.strings == _root.quest[this.chapter][this.phase - 1].dialog[1])
                  {
                     _root.ui.dialog.closeDlg();
                     trace("close1");
                  }
                  else if(this.questId[this.chapter][this.phase] == 1)
                  {
                     if(_root.ui.dialog.strings == _root.quest[this.chapter][this.phase].dialog[2])
                     {
                        trace("close-12");
                        _root.ui.dialog.closeDlg();
                     }
                     else
                     {
                        if(this.speech != _root.quest[this.chapter][this.phase].dialog[0])
                        {
                           this.speech = _root.quest[this.chapter][this.phase].dialog[0];
                           _root.ui.dialog.init(this.npcName,this.speech);
                           _root.ui.dialog.quest = _root.quest[this.chapter][this.phase];
                           return undefined;
                        }
                        if(_root.ui.dialog.btnYes._visible == false)
                        {
                           _root.ui.dialog.confirmOption();
                        }
                     }
                  }
                  else if(_loc3_ == 0)
                  {
                     if(_root.ui.dialog.strings == _root.sQuest[this.chapter][this.subQuestId[this.chapter]].dialog[2])
                     {
                        trace("close-22");
                        _root.ui.dialog.closeDlg();
                     }
                     else
                     {
                        if(this.speech != _root.sQuest[this.chapter][this.subQuestId[this.chapter]].dialog[0])
                        {
                           this.speech = _root.sQuest[this.chapter][this.subQuestId[this.chapter]].dialog[0];
                           _root.ui.dialog.init(this.npcName,this.speech);
                           _root.ui.dialog.quest = _root.sQuest[this.chapter][this.subQuestId[this.chapter]];
                           return undefined;
                        }
                        if(_root.ui.dialog.btnYes._visible == false)
                        {
                           _root.ui.dialog.confirmOption1(this);
                        }
                     }
                  }
                  else if(_loc3_ == 1 && _root.ui.dialog.strings == _root.sQuest[this.chapter][this.subQuestId[this.chapter]].dialog[1])
                  {
                     _root.ui.dialog.closeDlg();
                     trace("close1");
                  }
                  else
                  {
                     trace("close3");
                     if(!this.specialEnd())
                     {
                        if(this.ifEmptyStore() == false)
                        {
                           this.showStore();
                        }
                        else
                        {
                           _root.ui.dialog.closeDlg();
                        }
                     }
                  }
               }
            }
         }
         else
         {
            this.keyD = false;
         }
      }
      this.gForce();
   }
   function updateSpeech()
   {
      this.chapter = _root.game.map.player.chapter;
      this.phase = _root.game.map.player.phase;
      if(this.str[this.chapter][this.phase] == undefined)
      {
         this.speech = this.str[this.chapter][0];
      }
      else
      {
         this.speech = this.str[this.chapter][this.phase];
      }
   }
   function showStore()
   {
   }
   function specialEnd()
   {
   }
   function checkPastSecQuest()
   {
      return false;
   }
   function ifEmptyStore()
   {
      for(var _loc2_ in this.goods)
      {
         if(this.goods[_loc2_] != undefined)
         {
            return false;
         }
      }
      return true;
   }
}
