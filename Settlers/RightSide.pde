class RightSide{
 Player player;
 int pColor;
 
 RightSide(Player p){
  player = p;
  //pColor = p.col;
 } 
 
 void displayRules(){
   
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
   fill(255);
   rect(700,550,450,100);   
  } 
  /*
  boolean inTextBox(int x, int y){
     return 700 < x &&  x < 1150 && 550 < y && y < 650;
  }*/
  boolean inNextButton(){
     return 700 < mouseX && mouseX < 1150 && 550< mouseY && mouseY < 650; 
  }
  
  void displayButtons(){
   PFont font =loadFont("TrebuchetMS-Bold-48.vlw");
   textFont(font,12);
   fill(0);
   text("Click here for Next",800,600); 
  }
 
  void drawInfo(){
   displayRules();
   displayStats();
   displayButtons();
  }
  
}
