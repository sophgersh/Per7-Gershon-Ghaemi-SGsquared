class Game{
  Player[] players; //length 4
  int user;
  int stage;
  int pturn;
  boolean placeRoad;
  //STAGE 0  = choose color
  //STAGE 1  = initial settlement (before tile reveal)
  //STAGE 2  = second settlement
  //          show AI turns
  //STAGE 3+ = play (check for mousePressed based on player's turn)
  //          text box to recap AI turns
  HexGrid hg;
  RightSide rightSide; 
  boolean noWinner;
  int b;
  Hexagon pressed;
  
 
  Game(){
    players = new Player[4]; 
    stage = 0;
    firstscreen();
    noWinner = true;
    pturn = 0;
    placeRoad = false;
    b = 0;
    hg = new HexGrid();
    
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
      rightSide = new RightSide(players[user]);
      return true;
    } else if (330<x && x<426 && 350<y && y<375){
      players[1].isUser();
      user = 1;
      rightSide = new RightSide(players[user]);
      return true;
    } else if (330<x && x<447 && 400<y && y<425){
      players[2].isUser();
      user = 2;
      rightSide = new RightSide(players[user]);
      return true;
    } else if (330<x && x<475 && 450<y && y<475){
      players[3].isUser();
      user = 3;
      rightSide = new RightSide(players[user]);
      return true;
    } 
    
    return false;
  }
  
  void hexs(){
    background(#05E7FA);   
    hg.drawBoard();
    stage++;  
    rightSide.drawInfo();
    for (Player p : players)
      p.addHG(hg);
  }
  
  /*
  void mousePressed(int x, int y){     
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
  }*/
  
      
  void bpressed(){
    if (stage == 1) {
       hg.roads.get(b).drawRoad(#F5810C);
       b++;
    }
  }
  
  boolean userClick(int x, int y){
   
     Hexagon h = onHex(x,y); //returns hexagon
     if (h != null) { /* check hex*/ }
     if (diceClick(x,y)) //boolean
        //roll dice 
        
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
      for (Hexagon he : hg.getGrid()){
        if (he.inRadius(x,y)){
          pressed = he;
          //h.setColor(h.col+50);
          return false;      
        }
      }
      return false;
  }
  
  boolean userStage12(int x, int y){
    if (!placeRoad){
       Settlement s = onSettlement(x,y);
       if (s != null){ 
         if (s.isValidPlacement()){
           s.build(players[user].col);
           placeRoad = true;
         }
       }
    } else {
       Road r = onRoad(x,y); 
       if (r != null){
         r.build(players[user].col);
         placeRoad = false;
         return true;
       }    
    }
    return false; 
  }
  
  Road onRoad(int x, int y){
     for (Road r : hg.roads){
        if (r.inRadius(x,y))
           return r; 
     }
     return null;
  }
  Settlement onSettlement(int x, int y){
    for (Settlement s : hg.settlements){
        if (s.inRadius(x,y))
           return s; 
     }
     return null;   
  }
  Hexagon onHex(int x, int y){
    for (Hexagon h : hg.hexs){
        if (h.inRadius(x,y))
           return h; 
     }
     return null;
  }
  boolean diceClick(int x, int y){
    //in bounds of x/y
    return true;
  }
  boolean nextMoveButton(int x, int y){
    //return rightSide.inTextBox(x,y); 
    fill(random(255),random(255),random(255));
    ellipse(700,400,15,15);
    return mousePressed && rightSide.inNextButton();
  }
 
  
  
  void playGame(){
    
    while (noWinner){
      //turns();
    }
    //turns(); 
  }
  
  void stageOne(int x, int y){
    if (pturn == user){
      if (userStage12(x,y)){
        if (pturn+1 < 4)
          pturn++;
        else 
          stage++;
      }      
    } else if (nextMoveButton(x,y)){
      players[pturn].placeSet(true);   
      if (pturn+1 < 4)
        pturn++;
      else 
        stage++;
    }    
  }
  
  void stageTwo(int x, int y){
    if (players[pturn].isUser){
      if (userStage12(x,y)){
        if (pturn-1 >= 0)
          pturn--;
        else 
          stage++;
      }      
    } else if (nextMoveButton(x,y)){
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
