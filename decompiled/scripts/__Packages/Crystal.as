class Crystal
{
   var Type;
   var attrib;
   var attribName;
   var itemName;
   var param;
   var price;
   function Crystal(frame1)
   {
      this.param = ["",frame1];
      this.Type = this.param[0] = "Crystal";
      this.attrib = this.attribName = [];
      this.attribName[0] = "frame";
      this.attrib[0] = frame1;
      this.attribName[1] = "type";
      switch(frame1)
      {
         case "ec1":
            this.itemName = _root.textCrystal[0][_root.lang];
            this.attrib[1] = "crystal";
            this.price = 100;
            break;
         case "ec2":
            this.itemName = _root.textCrystal[1][_root.lang];
            this.attrib[1] = "crystal";
            this.price = 300;
            break;
         case "ec3":
            this.itemName = _root.textCrystal[2][_root.lang];
            this.attrib[1] = "crystal";
            this.price = 800;
            break;
         case "fc1":
            this.itemName = _root.textCrystal[3][_root.lang];
            this.attrib[1] = "crystal";
            this.price = 100;
            break;
         case "fc2":
            this.itemName = _root.textCrystal[4][_root.lang];
            this.attrib[1] = "crystal";
            this.price = 300;
            break;
         case "fc3":
            this.itemName = _root.textCrystal[5][_root.lang];
            this.attrib[1] = "crystal";
            this.price = 800;
            break;
         case "wc1":
            this.itemName = _root.textCrystal[6][_root.lang];
            this.attrib[1] = "crystal";
            this.price = 100;
            break;
         case "wc2":
            this.itemName = _root.textCrystal[7][_root.lang];
            this.attrib[1] = "crystal";
            this.price = 300;
            break;
         case "wc3":
            this.itemName = _root.textCrystal[8][_root.lang];
            this.attrib[1] = "crystal";
            this.price = 800;
            break;
         case "wdc1":
            this.itemName = _root.textCrystal[9][_root.lang];
            this.attrib[1] = "crystal";
            this.price = 100;
            break;
         case "wdc2":
            this.itemName = _root.textCrystal[10][_root.lang];
            this.attrib[1] = "crystal";
            this.price = 300;
            break;
         case "wdc3":
            this.itemName = _root.textCrystal[11][_root.lang];
            this.attrib[1] = "crystal";
            this.price = 800;
            break;
         case "stone1":
            this.itemName = _root.textCrystal[12][_root.lang];
            this.attrib[1] = "stone";
            this.price = 1000;
            break;
         case "stone2":
            this.itemName = _root.textCrystal[13][_root.lang];
            this.attrib[1] = "stone";
            this.price = 3000;
            break;
         case "stone3":
            this.itemName = _root.textCrystal[14][_root.lang];
            this.attrib[1] = "stone";
            this.price = 8000;
         default:
            return;
      }
   }
}
