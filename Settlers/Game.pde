class Game{
  Player[] players; //length 4
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

  void selectColor(int x, int y){
    players[0] = new Player(#F50C0C);
    players[1] = new Player(#1411F2);
    players[2] = new Player(#07B405);
    players[3] = new Player(#9808C1);
    if (330<x && x<400 && 300<y && y<325){
      players[0].isUser();
      println("Red");
    } else if (330<x && x<426 && 350<y && y<375){
      players[1].isUser();
      println("blue");
    } else if (330<x && x<447 && 400<y && y<425){
      players[2].isUser();
      println("green");
    } else if (330<x && x<475 && 450<y && y<475){
      players[3].isUser();
      println("purple");
    }
  }
  
  void hexs(){
    background(#05E7FA);
    hg = new HexGrid();  
    stage++;  
    hg.background();
  }
  
  
}
