class Npc游侠 extends Npc
{
   var _name;
   var npcName;
   var questId;
   var str;
   var subQuestId;
   var updateSpeech;
   function Npc游侠()
   {
      super();
      if(this._name.slice(0,8) != "instance")
      {
         this.npcName = _root.textNpcName[6][_root.lang];
         this.setDlg();
         this.updateSpeech();
         this.questId = [];
         this.questId[2] = [];
         this.questId[2][0] = 1;
         this.questId[3] = [];
         this.questId[3][3] = 1;
         this.subQuestId = [];
         this.subQuestId[1] = 1;
      }
   }
   function checkPastSecQuest()
   {
      if(_root.game.map.player.chapter > 1)
      {
         if(_root.game.map.player.secondaryQuest[1][1] == 2)
         {
            return _root.sQuest[1][1];
         }
      }
      return false;
   }
   function setDlg()
   {
      this.npcName = _root.textNpcName[6][_root.lang];
      this.str = [];
      this.str[0] = [];
      this.str[0][0] = [[_root.textNpc7[0][_root.lang]]];
      this.str[1] = [];
      this.str[1][0] = [[_root.textNpc7[0][_root.lang]],[_root.textNpc7[1][_root.lang],_root.textNpc7[2][_root.lang],_root.textNpc7[3][_root.lang]],[_root.textNpc7[4][_root.lang],_root.textNpc7[5][_root.lang],_root.textNpc7[6][_root.lang]]];
      this.str[2] = [];
      this.str[2][0] = [];
      this.str[2][0][0] = [_root.textNpc7[7][_root.lang]];
      this.str[2][0][1] = [_root.textNpc7[8][_root.lang],_root.textNpc7[9][_root.lang]];
      this.str[2][0][2] = [_root.textNpc7[10][_root.lang]];
      this.str[2][0][3] = [_root.textNpc7[11][_root.lang]];
      this.str[3] = [];
      this.str[3][0] = [];
      this.str[3][0][0] = [_root.textNpc7[12][_root.lang],_root.textNpc7[13][_root.lang]];
      this.str[3][0][1] = [_root.textNpc7[14][_root.lang]];
      this.str[4] = [];
      this.str[4][0] = [];
      if(_root.game.map.player.chapter == 4 && _root.game.map.player.phase >= 9)
      {
         this.str[4][0][0] = [_root.textNpc7[17][_root.lang]];
         this.str[4][0][1] = [_root.textNpc7[18][_root.lang]];
      }
      else
      {
         this.str[4][0][0] = [_root.textNpc7[15][_root.lang]];
         this.str[4][0][1] = [_root.textNpc7[16][_root.lang]];
      }
      this.str[5] = [];
      this.str[6] = [];
      this.str[7] = [];
      this.str[8] = [];
      this.str[9] = [];
   }
}
