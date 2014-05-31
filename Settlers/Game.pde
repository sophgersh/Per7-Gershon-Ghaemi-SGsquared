class Game{
  Player[] players; //length 4
  boolean isOver;
  HexGrid hg;
  
  Game(){
    players = new Player[4]; 
    firstscreen();
  }
  
  void firstscreen(){
    //PFont font;  
    //font = loadFont("LetterGothicStd-32.vlw");
    //textFont(font, 32);
    rect(250,150,200,50); //x, y, width, height
    //text("word", 350, 325); //string, x, y
    list();
  }
  
  
  
}
