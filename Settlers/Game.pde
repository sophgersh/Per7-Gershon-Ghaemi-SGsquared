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
    PFont font;  
    font = loadFont("AcademyEngravedLetPlain-48.vlw");
    textFont(font, 32);
    rect(250,150,200,50); //x, y, width, height
    fill(0);
    text("Settlers", 300, 175); //string, x, y
    list();
  }
  
  void hexs(){
    background(#05E7FA);
    hg = new HexGrid();  
    stage++;  
    hg.background();
  }
  
  
}
