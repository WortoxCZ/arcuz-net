this.es = _root.game.map.controller.score - _root.game.map.controller.cbs - _root.game.map.controller.timer;
this.cbs = _root.game.map.controller.cbs;
this.tbs = _root.game.map.controller.timer;
this.arbs = [0,1,2,4,10];
if(!this.win)
{
   this.arbs = [0,0.5,0.5,1,2];
}
this.score = int(_root.game.map.controller.score * this.arbs[_root.areaMode]);
_root.game.map.player.saveData = SharedObject.getLocal("Arcuz");
_root.game.map.player.saveData.data.totalPlayTime += int((getTimer() - _root.game.map.player.beginTime) / 1000);
_root.mouseCursor.swapDepths(_root.getNextHighestDepth());
_root.game.pauseCharacters();
