class Teleporter
{
   var Type;
   var _alpha;
   var attrib;
   var attribName;
   var count;
   var itemName;
   var param;
   var price;
   function Teleporter()
   {
      this.Type = "Teleporter";
      this.param = ["Teleporter"];
      this.itemName = _root.textItem[16][_root.lang];
      this.attrib = this.attribName = [];
      this.attribName[0] = "frame";
      this.attrib[0] = "tele";
      this.attrib[1] = 1;
      this.price = 200;
      this.count = 0;
      this.attribName[1] = _root.textItem[17][_root.lang];
   }
   function work()
   {
      _root.playSound("开传送门.mp3");
      var _loc4_ = "map_" + _root.game.map.areaName + "_" + _root.game.map.mapName;
      var _loc6_ = _root.game.map.player._x;
      var _loc5_ = _root.game.map.player._y;
      _root.game.map.player.tele = [_loc4_,_loc6_,_loc5_];
      var _loc3_ = _root.game.map.attachMovie("传输坐标","传输坐标",98);
      _loc3_._x = _root.game.map.player._x;
      _loc3_._y = _root.game.map.player._y;
      _loc3_.blendMode = 8;
      _loc3_._alpha = 0;
      _root.game.map.player.onEnterFrame = undefined;
      _root.game.map.player.defLv = 10;
      _loc3_.onEnterFrame = function()
      {
         this._alpha += 5;
         if(this._alpha > 100)
         {
            _root.game.map.changeMap(_root.map_01_0101);
            _root.game.map.player.defLv = 3;
         }
      };
      if(_root.game.map.player.ach[17][0] == 0)
      {
         if(++_root.game.map.player.ach[17][1] >= 200)
         {
            _root.game.map.player.ach[17][0] = 1;
            _root.newMessage(_root.textSys[23][_root.lang]);
         }
      }
      return true;
   }
}
