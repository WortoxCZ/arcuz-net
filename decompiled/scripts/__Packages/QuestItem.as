class QuestItem
{
   var Type;
   var attrib;
   var attribName;
   var itemName;
   var param;
   var price;
   var questItem;
   var setPosNum;
   var setPosX;
   var setPosY;
   function QuestItem(p1)
   {
      this.questItem = true;
      this.param = [",",p1];
      this.Type = this.param[0] = "QuestItem";
      this.attrib = this.attribName = [];
      this.attribName[0] = "frame";
      this.attrib[0] = p1;
      this.attrib[1] = 1;
      this.price = 0;
      switch(p1)
      {
         case "fm":
            this.itemName = _root.textItem[0][_root.lang];
            this.attribName[1] = _root.textItem[1][_root.lang];
            break;
         case "brmzj":
            this.itemName = _root.textItem[2][_root.lang];
            this.attribName[1] = _root.textItem[3][_root.lang];
            break;
         case "ywbf":
            this.itemName = _root.textItem[4][_root.lang];
            this.attribName[1] = _root.textItem[5][_root.lang];
            break;
         case "ablzj":
            this.itemName = _root.textItem[6][_root.lang];
            this.attribName[1] = _root.textItem[7][_root.lang];
            break;
         case "xxf":
            this.itemName = _root.textItem[8][_root.lang];
            this.attribName[1] = _root.textItem[9][_root.lang];
            break;
         case "gldjz":
            this.itemName = _root.textItem[10][_root.lang];
            this.attribName[1] = _root.textItem[11][_root.lang];
            break;
         case "tks":
            this.itemName = _root.textItem[12][_root.lang];
            this.attribName[1] = _root.textItem[13][_root.lang];
            break;
         case "npks":
            this.itemName = _root.textItem[14][_root.lang];
            this.attribName[1] = _root.textItem[15][_root.lang];
            break;
         case "tdx":
            this.itemName = _root.textItem[18][_root.lang];
            this.attribName[1] = _root.textItem[19][_root.lang];
            break;
         case "hwd":
            this.itemName = _root.textItem[20][_root.lang];
            this.attribName[1] = _root.textItem[21][_root.lang];
            break;
         case "ssdyj":
            this.itemName = _root.textItem[22][_root.lang];
            this.attribName[1] = _root.textItem[23][_root.lang];
            break;
         case "npzc":
            this.itemName = "没有了";
            this.attribName[1] = "表面闪耀着一种独特的光芒...像是能解开什么封印的样子";
            this.attribName[2] = "Weight : " + this.attrib[2];
            this.Type = "Weapon";
            this.attrib[2] = 5;
            this.attrib[3] = 0;
            this.attrib[4] = 0;
            this.setPosX = 291;
            this.setPosY = 22;
            this.setPosNum = 10;
            this.setup = function()
            {
               _root.game.map.player.weaponFrame = this.attrib[0];
            };
            this.remove = function()
            {
               _root.game.map.player.weaponFrame = "nothing";
            };
         default:
            return;
      }
   }
   function setup()
   {
   }
   function remove()
   {
   }
}
