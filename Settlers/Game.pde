class Game{
  Player[] players; //length 4
  int user;
  int stage;
  //STAGE 0  = choose color
  //STAGE 1  = initial settlement (before tile reveal)
  //STAGE 2  = second settlement
  //          show AI turns
  //STAGE 3+ = play (check for mousePressed based on player's turn)
  //          text box to recap AI turns
  HexGrid hg;
  Hexagon pressed;
  int pturn;
  boolean noWinner;
  ArrayList<Road> roads;
  ArrayList<Settlement> settlements;
  int se;
  
  
  Game(){
    players = new Player[4]; 
    stage = 0;
    firstscreen();
    noWinner = true;
    pturn = 0;
    se = 0;
  }
  
  void firstscreen(){
    PImage photo = loadImage("catan-logo.jpg");
    image(photo,225,50);
    PFont font = loadFont("TrebuchetMS-Bold-48.vlw");
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
      user = 0;
      println("red");
      return true;
    } else if (330<x && x<426 && 350<y && y<375){
      players[1].isUser();
      user = 1;
      println("blue");
      return true;
    } else if (330<x && x<447 && 400<y && y<425){
      players[2].isUser();
      user = 2;
      println("green");
      return true;
    } else if (330<x && x<475 && 450<y && y<475){
      players[3].isUser();
      user = 3;
      println("purple");
      return true;
    } else 
      return false;
  }
  
  
  void mpressed(/*int x, int y*/){
    int x = mouseX;
    int y = mouseY;
    if (stage == 0){
      if (selectColor(x, y))
        hexs();
    } else if (stage == 1) {
        stageOne(x,y); 
    } else if (stage == 2){ 
        stageTwo(x,y);
    } else if (stage == 3){     
        stageThree(x,y);
    }
  }
  
  void bpressed(){
    if (stage == 1) {
       hg.settlements.get(se).setColor(#F5810C);
       se++;
    }
  }
  
  boolean userClick(int x, int y){
      if (pressed != null){
        int setPos = pressed.checkSettlement(x,y,players[user].col);
        if (setPos == 0) {
          pressed.buildSettlement(x, y, players[user].col);
          players[user].addVP(); 
          pressed = null;
          return true;
        } else if (setPos == 1){
          //pressed build city 
        }
      }
      for (Hexagon h : hg.getGrid()){
        if (h.inHex(x,y)){
          pressed = h;
          //h.setColor(h.col+50);
          return false;      
        }
      }
      return false;
  }
  
  void hexs(){
    background(#05E7FA);   
    hg = new HexGrid();  
    stage++;  
    rightSide();
    for (Player p : players)
      p.addHG(hg);
  }
  
  void rightSide(){
   //PImage photo = loadImage("catan5.jpg");
   //image(photo,700,0);
   PFont font = loadFont("TrebuchetMS-Bold-48.vlw");
   textFont(font, 48);
   fill(0);
   text("Player stats:",800,50);
   textFont(font,25);
   text("VP: "+players[user].VP,820,100); //needs to be updated
   
  } 
  
  void playGame(){
    
    while (noWinner){
      //turns();
    }
    //turns(); 
  }
  
  void stageOne(int x, int y){
    if (players[pturn].isUser){
      if (userClick(x,y)){
        if (pturn+1 < 4)
          pturn++;
        else 
          stage++;
      }      
    } else {
      players[pturn].placeSet(true);   
      if (pturn+1 < 4)
        pturn++;
      else 
        stage++;
    }    
  }
  void stageTwo(int x, int y){
    if (players[pturn].isUser){
      if (userClick(x,y)){
        if (pturn-1 >= 0)
          pturn--;
        else 
          stage++;
      }      
    } else {
      players[pturn].placeSet(true);   
      if (pturn-1 >= 0)
        pturn--;
      else 
        stage++;
    } 
  }
  void stageThree(int x, int y){
      if (players[pturn].isUser){
         /* roll die, build settlements,roads,etc. 
            userClick(x,y);
         */ 
      }
  }
  
  
}
