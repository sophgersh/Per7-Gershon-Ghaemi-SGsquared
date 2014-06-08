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
   fill(0);
   text("GENERAL RULES:",675,Y);
   textFont(font,12);
   text("All Settlements must be separated by no fewer than 2 Roads", 850,Y);
   text("Resources (Brick,Wood,Stone,Sheep,Wheat) are distributed at the beginning of each player's turn", 675,Y+=12);
   text("The dice are rolled and every player who has a Settlement adjacent to a Hexagon",675,Y+=12);
   text("with the value on the dice recieves that Hex's resource", 675,Y+=12);
   text("On your turn, you may place Roads,Settlements, or upgrade a Settlement to a City (yeilds double resources)",675,Y+=12);
   text("The resource costs for Roads, Settlements, and Cities are above",675,Y+=12);
   text("Click the button below to move from one turn to the next (press even on the AI's turn)",675,Y+=12);
   textFont(font,20);
   Y+=30;
   text("START OF GAME:",675,Y);
   textFont(font, 12);
   text("each payer may place 2 initial Settlements by clicking " , 850,Y);
   text("on a Settlement space. You must also place a Road adjacent to each initial Settlement.", 675,Y+=12);
   text("The initial order is RED-BLUE-GREEN-PURPLE-PURPLE-GREEN-BLUE-RED. (Each player places 2 Settlements", 675,Y+=12); 
   text("During regular gameplay, the order is RED-BLUE-GREEN-PURPLE",675,Y+=12);
 }
 
 void displayStats(){
   //PImage photo = loadImage("catan5.jpg");
   //image(photo,700,0);
   PFont font = loadFont("TrebuchetMS-Bold-48.vlw");
   textFont(font, 48);
   fill(0);
   text("Player stats:",800,50);
   textFont(font,25);
   text("VP: "+player.VP,820,100); //needs to be updated
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
     return 700 < mouseX && mouseX < 1150 && 550< mouseY && mouseY < 650; 
  }
  
  void displayButtons(){
   fill(255);
   rect(700,550,450,100);
   PFont font =loadFont("TrebuchetMS-Bold-48.vlw");
   textFont(font,36);
   fill(0);
   text("Click here for Next",750,620); 
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
