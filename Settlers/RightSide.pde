class RightSide{
 Player player;
 int pColor;
 //trade info
 String r1Str;
 PImage r1Img;
 String r2Str;
 PImage r2Img;
 int die1; 
 int die2;
 String[] dice = {"dice1.png", "dice2.png", "dice3.png", "dice4.png", "dice5.png", "dice6.png"};
 
 RightSide(Player p){
  player = p;
  r1Str = "";
  r2Str = "";
  r1Img = getImage(r1Str);
  r2Img = getImage(r2Str);
  //pColor = p.col;
 } 
 
 void displayRules(){
   PFont font = loadFont("TrebuchetMS-Bold-48.vlw");
   int Y = 370;
   textFont(font, 20);   
   fill(0);
   text("ROAD (0 VP) = 1 Brick + 1 Wood",675,290);
   text("SETTLEMENT (1 VP) = 1 Brick + 1 Wood + 1 Wheat + 1 Sheep",675,310);
   text("CITY (2 VP) = 1 Pre-existing Settlement + 2 Wheat + 3 Stone",675,330);
   text("GENERAL RULES:",675,Y);
   textFont(font,15);
   text("1. All Settlements must be separated by at least 2 Roads", 850,Y);
   text("2. Resources (Brick,Wood,Stone,Sheep,Wheat) are distributed at the beginning of", 675,Y+=15);
   text("each player's turn. The Desert does not yield a resource.",675, Y+=15);
   text("3. The dice are rolled and every Hex with that value yields its resource to all players ",675,Y+=15);
   text("who own a Settlement adjacent to that Hex. Cities recieve double yield.", 675,Y+=15);
   //text("4. The Desert does not yield a resource", 675, Y+=15);
   //text("5. On your turn, you may place Roads,Settlements, or upgrade a Settlement to a City (yields double resources)",675,Y+=15);
   //text("6. The resource costs for Roads, Settlements, and Cities are above",675,Y+=15);
   //text("4. Click Next move from one turn to the next (press even on the AI's turn)",675,Y+=15);
   textFont(font,20);
   text("ON YOUR TURN: ",675,Y+=30);
   textFont(font,15);
   text("1. Click on the dice to roll and get resources",850,Y);
   text("2. If you can, build a Road/Settlement or upgrade a Settlement to a City",675,Y+=15);
   text("3. Trade three of one resource for one of another (ex. 3 Sheep <--> 1 Wood)",675,Y+=15);
   text("4. Click Next to end turn. Order is RED-BLUE-GREEN-PURPLE.",675,Y+=15);
   text("5. Click to advance through AI's turns.",675,Y+=15);
   textFont(font,20);
   text("START OF GAME:",675,Y+=30);
   textFont(font, 15);
   text("1. Each player may place 2 initial Settlements. " , 850,Y);
   text("You must also place a Road adjacent to each initial Settlement.", 675,Y+=15);
   text("2. The initial order is RED-BLUE-GREEN-PURPLE-PURPLE-GREEN-BLUE-RED", 675,Y+=15); 
   text("(Each player gets to place 2 Settlements, one at a time)",675,Y+=15);
   //text("3. During regular gameplay, the order is RED-BLUE-GREEN-PURPLE",675,Y+=15);
 }
 
 void displayStats(){
   PFont font = loadFont("TrebuchetMS-Bold-48.vlw");
   //textFont(font, 48);
   fill(0);
   //text("Player stats:",800,50);
   textFont(font,25);
   text("Victory Points: "+player.VP,800,100); //needs to be updated
   textFont(font, 15);
  // text("Roads (0 VP)", 1100,80);
   //text("Settlements (1 VP) Cities (2 VP)",1050,100);
   PImage cards = loadImage("catan5.jpg");
   cards.resize(600,120);
   image(cards,675,120);
   noFill();
   int X = 675;
   rect(X,120,120,120);
   rect(X+=120,120,120,120);
   rect(X+=120,120,120,120);
   rect(X+=120,120,120,120);
   rect(X+=120,120,120,120);
   textFont(font,15);
   text("Brick: "+player.brick, 700,260);
   text("Wood: "+player.wood, 820, 260);
   text("Stone: "+player.stone, 940,260);
   text("Sheep: "+player.sheep, 1060, 260);
   text("Wheat: "+player.wheat, 1180, 260);
      
  } 
  /*
  boolean inTextBox(int x, int y){
     return 700 < x &&  x < 1150 && 550 < y && y < 650;
  }*/
  boolean inNextButton(){
     return 800 < mouseX && mouseX < 1050 && 600< mouseY && mouseY < 695; 
  }
  boolean inCheat(){
     return mousePressed && mouseX<50 && mouseX>0 && mouseY<50 && mouseY>0; 
  }
  boolean inTradeButton(){
     return mousePressed && mouseX>1100 && mouseX<1250 && mouseY<770 && mouseY > 620;
  }
  boolean inTradeWindow(){
     return mouseX>675 && mouseX<1275 && mouseY>370 && mouseY<670;
  }
  boolean inResources(){
     return mouseX>675 && mouseX<1275 && mouseY>120 && mouseY<240; 
  }
  boolean inLeftBox(){
    return mousePressed && mouseX>720 && mouseX <840 && mouseY>445 && mouseY<605; 
   }
  boolean inRightBox(){
    return mousePressed && mouseX>990 && mouseX <1110 && mouseY>445 && mouseY<605;    
   }
  
  void displayButtons(){
   fill(255);
   rect(800,620,250,75);
   rect(1100,620,150,75);
   PFont font =loadFont("TrebuchetMS-Bold-48.vlw");
   textFont(font,30);
   fill(0);
   //String turn = 
   text("Next",875,665);
   text("Trade",1150,665); 
   

  }
  
  void displayDice(){
     PImage d1;
     d1 = loadImage(dice[die1-1]);
     image(d1,640,50,50,50);
     PImage d2;
     d2 = loadImage(dice[die2-1]);
     image(d2, 700, 50,50,50);
  }
  
  void setDice(int d1, int d2){
    die1 = d1;
    die2 = d2;
  }
 
  void winningScreen(Player victor){
     victor.VP+=10000;
     //???
     if(victor.equals(player)){ 
       stroke(0);
       fill(#FFF529);
       rect(675,290,600,400);
       PFont font = loadFont("ChaparralPro-Bold-48.vlw");
       fill(0);
       textFont(font, 50);
       text("YOU WIN",870,380);
       textFont(font,20);
       text("Your nation is the envy of Catan. You are #basedGod",730,430);
       PImage winBackground = loadImage("city-on-a-hill.jpg");
       winBackground.resize(440,180);
       image(winBackground,775,460,440,180);
     }
     displayPlayersTurn();
     displayStats();
     displayDice();
   }
   boolean inTradeMode(){
     return !inNextButton() && (inTradeWindow() || inTradeButton() || inResources());
   }
   void tradeScreen(){
     stroke(0);
     fill(#7AB0D3);
     rect(675,350,600,300);
     textFont(loadFont("TrebuchetMS-Bold-48.vlw"),16);
     fill(0);
     int Y = 375;
     text("Welcome to the Iron Bank of Catan",780,Y);
     text("You will give us 3 of one resource for 1 of your desired resource. ",685,Y+=20); 
     //text("Click on the left box, then the resource. Click right, then resource.",685,Y+=20);
     text("...for...",880,Y+100);
     noFill();
     if(r1Str.equals(""))pick1();
     if(r2Str.equals(""))pick2();
     displayTradeDeal();
     fill(0);
     //if(inLeftBox()){
     //pick1();
     //}
     //if(inRightBox()){
     //pick2();
     //}
     /*image(r1Img,720,445,120,160);
     text(r1Str,740,625);
     image(r2Img,720,445,120,160);
     text(r2Str,740,625);*/
     //if r1 not enough supply
     PFont font = loadFont("TrebuchetMS-Bold-48.vlw");
     textFont(font, 20);   
     fill(0);
     text("ROAD (0 VP) = 1 Brick + 1 Wood",675,290);
     text("SETTLEMENT (1 VP) = 1 Brick + 1 Wood + 1 Wheat + 1 Sheep",675,310);
     text("CITY (2 VP) = 1 Pre-existing Settlement + 2 Wheat + 3 Stone",675,330);
     displayStats();
     displayDice();
   }
   void displayTradeDeal(){
     rect(720,445,120,160);
     rect(990,445,120,160);
     image(r1Img,720,445,120,160);
     text(r1Str,740,625);
     image(r2Img,990,445,120,160);
     text(r2Str,1010,625);
   }
   boolean pick1(){
     r1Str = pickResource();
     r1Img = getImage(r1Str);
     return true;
   }
   boolean pick2(){
     r2Str = pickResource();
     r2Img = getImage(r2Str);
     return true;
   }
   String pickResource(/*String importExport*/){
     String s = "";
     //if not enough supply
     if(mousePressed){
       if(mouseX>675){
         if(mouseX<795 && mouseY>120 && mouseY<240){s="Brick";}
         else if(mouseX<915 && mouseY>120 && mouseY<240){s="Wood";}
         else if(mouseX<985 && mouseY>120 && mouseY<240){s="Stone";}
         else if(mouseX<1105 && mouseY>120 && mouseY<240){s="Sheep";}
         else if(mouseX<1275 && mouseY>120 && mouseY<240){s="Wheat";}
         }
     }
     return s;
   }
   PImage getImage(String s){
    PImage rtImg = new PImage();
    if(s.equals("Wood")){rtImg = loadImage("cardWood.png");}
    else if(s.equals("Brick")){rtImg = loadImage("cardBrick.png");}
    else if(s.equals("Sheep")){rtImg = loadImage("cardSheep.png");}
    else if(s.equals("Wheat")){rtImg = loadImage("cardWheat.png");}
    else if(s.equals("Stone")){rtImg = loadImage("cardStone.png");}
    return rtImg;
   }
     
   void displayPlayersTurn(){
      //????
    /* fill(player.col);
     if(c == #F50C0C){text("Red Player";}
     else if(c == #1411F2){pColor = "BLUE";}
     else if(c == #07B405){pColor = "GREEN";}
     else{pColor = "PURPLE";} */
   }
  void drawInfo(){
     displayPlayersTurn();
     displayRules();
     displayStats();
     displayButtons();
     displayDice();
  }
  
}
