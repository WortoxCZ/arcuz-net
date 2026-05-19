class Npc村长 extends Npc
{
   var _name;
   var npcName;
   var questId;
   var str;
   var subQuestId;
   var updateSpeech;
   function Npc村长()
   {
      super();
      if(this._name.slice(0,8) != "instance")
      {
         this.npcName = _root.textNpcName[0][_root.lang];
         this.setDlg();
         this.updateSpeech();
         this.questId = [];
         this.questId[0] = [];
         this.questId[0][0] = this.questId[0][3] = this.questId[0][6] = this.questId[0][9] = this.questId[0][12] = 1;
         this.questId[2] = [];
         this.questId[2][3] = 1;
         this.subQuestId = [];
      }
   }
   function setDlg()
   {
      this.npcName = _root.textNpcName[0][_root.lang];
      this.str = [];
      this.str[0] = [];
      this.str[0][0] = [[_root.textNpc1[0][_root.lang],_root.textNpc1[1][_root.lang],_root.textNpc1[2][_root.lang],_root.textNpc1[3][_root.lang]]];
      this.str[1] = [];
      this.str[1][0] = [[_root.textNpc1[4][_root.lang],_root.textNpc1[5][_root.lang]],[_root.textNpc1[6][_root.lang]]];
      this.str[2] = [];
      this.str[2][0] = [];
      this.str[2][0][0] = [_root.textNpc1[7][_root.lang],_root.textNpc1[8][_root.lang]];
      this.str[2][0][1] = [_root.textNpc1[9][_root.lang]];
      this.str[2][0][2] = [_root.textNpc1[10][_root.lang],_root.textNpc1[11][_root.lang]];
      this.str[3] = [];
      this.str[3][0] = [];
      this.str[3][0][0] = [_root.textNpc1[12][_root.lang]];
      this.str[3][0][1] = [_root.textNpc1[13][_root.lang]];
      this.str[3][0][2] = [_root.textNpc1[14][_root.lang]];
      this.str[4] = [];
      this.str[4][0] = [];
      if(_root.game.map.player.chapter == 4 && _root.game.map.player.phase >= 9)
      {
         this.str[4][0][0] = [_root.textNpc1[17][_root.lang]];
         this.str[4][0][1] = [_root.textNpc1[18][_root.lang],_root.textNpc1[19][_root.lang]];
         this.str[4][0][2] = [_root.textNpc1[20][_root.lang],_root.textNpc1[21][_root.lang]];
         this.str[4][0][3] = [_root.textNpc1[22][_root.lang],_root.textNpc1[23][_root.lang]];
      }
      else
      {
         this.str[4][0][0] = [_root.textNpc1[15][_root.lang]];
         this.str[4][0][1] = [_root.textNpc1[16][_root.lang]];
      }
      this.str[5] = [];
      this.str[6] = [];
      this.str[7] = [];
      this.str[8] = [];
   }
}
