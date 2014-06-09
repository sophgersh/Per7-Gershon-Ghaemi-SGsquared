class RightSide{
 Player player;
 int pColor;
 int die1; 
 int die2;
 String[] dice = {"dice1.png", "dice2.png", "dice3.png", "dice4.png", "dice5.png", "dice6.png"};
 
 RightSide(Player p){
  player = p;
  //pColor = p.col;
 } 
 
 void displayRules(){
   PFont font = loadFont("TrebuchetMS-Bold-48.vlw");
   int Y = 370;
   textFont(font, 20);
   text("ROAD = 1 Brick + 1 Wood",675,290);
   text("SETTLEMENT = 1 Brick + 1 Wood + 1 Wheat + 1 Sheep",675,310);
   text("CITY = 1 Pre-existing Settlement + 2 Wheat + 3 Stone",675,330);
   fill(0);
   text("GENERAL RULES:",675,Y);
   textFont(font,15);
   text("1. All Settlements must be separated by at least 2 Roads", 850,Y);
   text("2. Resources (Brick,Wood,Stone,Sheep,Wheat) are distributed at the beginning of", 675,Y+=15);
   text("each player's turn. The Desert does not yield a resource.",675, Y+=15);
   text("3. The dice are rolled and every Hex with that value yields its resource to all players ",675,Y+=15);
   text("who own a Settlement adjacent to that Hex.", 675,Y+=15);
   //text("4. The Desert does not yield a resource", 675, Y+=15);
   //text("5. On your turn, you may place Roads,Settlements, or upgrade a Settlement to a City (yields double resources)",675,Y+=15);
   //text("6. The resource costs for Roads, Settlements, and Cities are above",675,Y+=15);
   text("4. Click Next move from one turn to the next (press even on the AI's turn)",675,Y+=15);
   textFont(font,20);
   text("ON YOUR TURN: ",675,Y+=30);
   textFont(font,15);
   text("1. Click on the dice to roll and get resources",850,Y);
   text("2. You may build a Road/Settlement or upgrade a Settlement to a City (doubles yield)",675,Y+=15);
   text("3. Resource costs are listed above",675,Y+=15);
   text("4. Click Next to end turn. Order is RED-BLUE-GREEN-PURPLE",675,Y+=15);
   textFont(font,20);
   text("START OF GAME:",675,Y+=30);
   textFont(font, 15);
   text("1. Each payer may place 2 initial Settlements. " , 850,Y);
   text("You must also place a Road adjacent to each initial Settlement.", 675,Y+=15);
   text("2. The initial order is RED-BLUE-GREEN-PURPLE-PURPLE-GREEN-BLUE-RED", 675,Y+=15); 
   text("(Each player gets to place 2 Settlements, one at a time)",675,Y+=15);
   //text("3. During regular gameplay, the order is RED-BLUE-GREEN-PURPLE",675,Y+=15);
 }
 
 void displayStats(){
   //PImage photo = loadImage("catan5.jpg");
   //image(photo,700,0);
   PFont font = loadFont("TrebuchetMS-Bold-48.vlw");
   textFont(font, 48);
   fill(0);
   text("Player stats:",800,50);
   textFont(font,25);
   text("Victory Points: "+player.VP,800,100); //needs to be updated
   textFont(font, 15);
   text("Roads (0 VP)", 1100,80);
   text("Settlements (1 VP) Cities (2 VP)",1050,100);
   PImage cards = loadImage("catan5.jpg");
   cards.resize(600,120);
   image(cards,675,120);
   textFont(font,15);
   text("Wood: "+player.wood, 700,260);
   text("Brick: "+player.brick, 820, 260);
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
  
  void displayButtons(){
   fill(255);
   rect(800,620,250,75);
   PFont font =loadFont("TrebuchetMS-Bold-48.vlw");
   textFont(font,36);
   fill(0);
   text("Next",875,660); 
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
 
  void drawInfo(){
   displayRules();
   displayStats();
   displayButtons();
   displayDice();
  }
  
}
