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
    //rect(400,150,200,50); //x, y, width, height
      
    
   
    
    

    
    
  }
  
  void hexs(){
    background(#05E7FA);
    hg = new HexGrid();  
    stage++;  
    hg.background();
  }
  
  
}
