class Game{
  Player[] players; //length 4
  int u;
  int stage;
  HexGrid hg;
  
  Game(){
    players = new Player[4]; 
    stage = 0;
    firstscreen();
  }
  
  void firstscreen(){
    PImage photo = loadImage("catan-logo.jpg");
    image(photo,200,50);
    PFont font = loadFont("AppleMyungjo-48.vlw");
    textFont(font, 35);
    fill(0);
    text("Choose your color:",325,275);
    fill(#F50C0C); 
    text("RED", 330, 325);
    fill(#1411F2); 
    text("BLUE", 330, 375);
    fill(#07B405); 
    text("GREEN", 330, 425);
    fill(#9808C1); 
    text("PURPLE", 330, 475);      
  }

  boolean selectColor(int x, int y){
    players[0] = new Player(#F50C0C);
    players[1] = new Player(#1411F2);
    players[2] = new Player(#07B405);
    players[3] = new Player(#9808C1);
    if (330<x && x<400 && 300<y && y<325){
      players[0].isUser();
      u = 0;
      println("red");
      return true;
    } else if (330<x && x<426 && 350<y && y<375){
      players[1].isUser();
      u = 1;
      println("blue");
      return true;
    } else if (330<x && x<447 && 400<y && y<425){
      players[2].isUser();
      u = 2;
      println("green");
      return true;
    } else if (330<x && x<475 && 450<y && y<475){
      players[3].isUser();
      u = 3;
      println("purple");
      return true;
    } else 
      return false;
  }
  
  void hexs(){
    background(#05E7FA);
    hg = new HexGrid();  
    stage++;  
    hg.background();
    for (Player p : players)
      p.addHG(hg);
  }
  
  void firstSets(){
    for (Player p : players){
       if (p.isUser){
         mpressed(mouseX,mouseY);
       } else {
         p.placeSet(true);
       }
    }
  }
  void secondSets(){
    for (int i = 3; i >= 0; i--){
       if (players[i].isUser){
         mpressed(mouseX,mouseY);
       } else {
         players[i].placeSet(true);
       }
    }
  }
  
  void mpressed(int x, int y){
    if (stage == 0){
      if (selectColor(mouseX, mouseY))
        hexs();
    }else{
      if (pressed != null){
        pressed.checkSettlement(mouseX,mouseY,players[u].col);
        pressed = null;
      }
      for (Hexagon h : hg.getGrid()){
        if(h != null && h.inHex(mouseX,mouseY)){
          /*print(h+": ");
          println(h.adjHexs);*/
          pressed = h;
          h.setColor(h.col+50);      
        }
      }
    }
  }
  
}
