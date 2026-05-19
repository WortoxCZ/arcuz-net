class Wear extends Armor
{
   var Type;
   var attrib;
   var color;
   var frame;
   var itemName;
   var levelRequire;
   var param;
   var setPosNum;
   var setPosX;
   var setPosY;
   function Wear(frame1, l, g, p3, p4, p5, p6, p7, p8, p9, p10, p11)
   {
      super(frame1,l,g,p3,p4,p5,p6,p7,p8,p9,p10,p11);
      this.Type = this.param[0] = "Wear";
      this.setPosX = 338;
      this.setPosY = 56;
      this.setPosNum = 14;
      this.itemName = frame1;
      switch(frame1)
      {
         case "w1":
            this.itemName = _root.textWear[0][_root.lang];
            this.frame = "w0";
            this.color = undefined;
            break;
         case "w2":
            this.itemName = _root.textWear[1][_root.lang];
            this.frame = "w0";
            this.color = [0.716582626343832,1.4039357531129,-1.12051837945673,0,0,-0.0669126046960258,0.666773955825873,0.400138648870152,0,0,1.10089171928746,-0.391720357958482,0.290828638671024,0,0,0,0,0,1,0];
            break;
         case "w3":
            this.itemName = _root.textWear[2][_root.lang];
            this.frame = "w0";
            this.color = [1.16487573826482,-0.653800766022045,0.738925027757221,0,-15.875,0.0468344571151111,1.44817801512767,-0.245012472242779,0,-15.875,-0.708790542884889,0.508074233977955,1.45071630890693,0,-15.875,0,0,0,1,0];
            break;
         case "w4":
            this.itemName = _root.textWear[3][_root.lang];
            this.frame = "w0";
            this.color = [-1.14885933103413,1.58729015767741,0.561569173356724,0,0,0.544045319118771,0.39587328931515,0.0600813915660791,0,0,0.15892258000622,2.17946813287198,-1.3383907128782,0,0,0,0,0,1,0];
            break;
         case "w5":
            this.itemName = _root.textWear[4][_root.lang];
            this.frame = "w0";
            this.color = [-0.123195886256224,-0.628703307792341,1.87189919404856,0,-7.62000000000001,0.401083670498862,1.21154502305522,-0.492628693554079,0,-7.62,-1.41478002518277,2.1634311920192,0.371348833163568,0,-7.62,0,0,0,1,0];
            break;
         case "w6":
            this.itemName = _root.textWear[5][_root.lang];
            this.frame = "w1";
            this.color = undefined;
            break;
         case "w7":
            this.itemName = _root.textWear[6][_root.lang];
            this.frame = "w1";
            this.color = [-1.43915463372191,0.0560508439018483,2.63310378982007,0,-15.875,0.750057878434967,1.09085835141778,-0.590916229852747,0,-15.875,-1.72586170727578,3.86310999182268,-0.887248284546895,0,-15.875,0,0,0,1,0];
            break;
         case "w8":
            this.itemName = _root.textWear[7][_root.lang];
            this.frame = "w1";
            this.color = [3.25457820034419,1.88753568323268,-3.58211388357687,0,-35.56,-1.17277705008464,1.8286313211573,0.90414572892734,0,-35.56,2.2724925119541,-3.41002934226775,2.69753683031365,0,-35.56,0,0,0,1,0];
            break;
         case "w9":
            this.itemName = _root.textWear[8][_root.lang];
            this.frame = "w1";
            this.color = [-1.37945,2.40295,0.2265,0,-78.375,0.62055,0.40295,0.2265,0,-78.375,0.62055,2.40295,-1.7735,0,-78.375,0,0,0,1,0];
            break;
         case "w10":
            this.itemName = _root.textWear[9][_root.lang];
            this.frame = "w1";
            this.color = [-5.15467232673463,0.658907522594947,6.49576480413968,0,-113.5,1.76688418620879,1.67329601472329,-1.44018020093208,0,-113.5,-4.32760702330131,10.030006909261,-3.70239988595971,0,-113.5,0,0,0,1,0];
            break;
         case "w11":
            this.itemName = _root.textWear[10][_root.lang];
            this.frame = "w1";
            this.color = [8.15484176627594,-4.07693367193864,-1.4779080943373,0,-153.6,-2.52826851582715,5.50850232370334,-0.380233807876192,0,-153.6,-1.6852981719718,-5.37311387808181,9.65841205005361,0,-153.6,0,0,0,1,0];
            break;
         case "w12":
            this.itemName = _root.textWear[11][_root.lang];
            this.frame = "w1";
            this.color = [-7.21179769857516,9.4994191998416,0.0123784987335654,0,-71.05,1.66774103522177,-0.351139095055541,0.983398059833775,0,-71.05,2.41344557017073,8.35279824825341,-8.46624381842414,0,-71.05,0,0,0,1,0];
         default:
            return;
      }
   }
   function setDefence(武器帧, 武器等级, 武器品质)
   {
      var _loc4_ = 武器帧 + "-";
      var _loc3_ = _loc4_.slice(1,-1);
      this.levelRequire = (Number(_loc3_) - 1) * 5 + 1;
      var _loc2_ = 3 + (Number(_loc3_) - 1) * 12;
      _loc2_ += 武器等级 * 5;
      _loc2_ = int(((武器品质 - 1) / 2 + 1) * _loc2_);
      this.attrib[1] = _loc2_;
      this.attrib[2] = Number(_loc3_) * 10 + 8;
   }
   function setup()
   {
      super.setup();
      _root.game.map.player.wearFrame = this.frame;
      _root.game.map.player.wearColor = this.color;
      _root.changeColor(_root.game.map.player.mc.mc.wear,this.color);
   }
   function remove()
   {
      super.remove();
      _root.game.map.player.wearFrame = "nothing";
      _root.changeColor(_root.game.map.player.mc.mc.wear,_root.NM_ColorMatrix);
   }
}
