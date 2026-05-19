class Npc小女孩 extends Npc
{
   var _name;
   var npcName;
   var questId;
   var str;
   var subQuestId;
   var updateSpeech;
   function Npc小女孩()
   {
      super();
      if(this._name.slice(0,8) != "instance")
      {
         this.npcName = _root.textNpcName[5][_root.lang];
         this.setDlg();
         this.updateSpeech();
         this.questId = [];
         this.questId[3] = [];
         this.questId[3][0] = 1;
         this.subQuestId = [];
         this.subQuestId[1] = 2;
      }
   }
   function checkPastSecQuest()
   {
      if(_root.game.map.player.chapter > 1)
      {
         if(_root.game.map.player.secondaryQuest[1][2] == 2)
         {
            return _root.sQuest[1][2];
         }
      }
      return false;
   }
   function setDlg()
   {
      this.npcName = _root.textNpcName[5][_root.lang];
      this.str = [];
      this.str[0] = [];
      this.str[0][0] = [[_root.textNpc6[0][_root.lang]]];
      this.str[1] = [];
      this.str[1][0] = [[_root.textNpc6[0][_root.lang]],[_root.textNpc6[1][_root.lang]]];
      this.str[2] = [];
      this.str[2][0] = [];
      this.str[2][0][0] = [_root.textNpc6[2][_root.lang]];
      this.str[2][0][1] = [_root.textNpc6[3][_root.lang]];
      if(_root.game.map.player.secondaryQuest[1][2] == 3)
      {
         this.str[2][0][2] = [_root.textNpc6[4][_root.lang]];
      }
      this.str[2][4] = [[_root.textNpc6[5][_root.lang]]];
      this.str[3] = [];
      this.str[3][0] = [];
      this.str[3][0][0] = [_root.textNpc6[6][_root.lang],_root.textNpc6[7][_root.lang]];
      this.str[3][0][1] = [_root.textNpc6[8][_root.lang]];
      this.str[4] = [];
      this.str[4][0] = [];
      if(_root.game.map.player.chapter == 4 && _root.game.map.player.phase >= 9)
      {
         this.str[4][0][0] = [_root.textNpc6[12][_root.lang]];
         this.str[4][0][1] = [_root.textNpc6[13][_root.lang]];
      }
      else
      {
         this.str[4][0][0] = [_root.textNpc6[9][_root.lang]];
         this.str[4][0][1] = [_root.textNpc6[10][_root.lang]];
         this.str[4][0][2] = [_root.textNpc6[11][_root.lang]];
      }
      this.str[5] = [];
      this.str[6] = [];
      this.str[7] = [];
      this.str[8] = [];
      this.str[9] = [];
   }
}
