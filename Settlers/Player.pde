class Player{
  int col;
  boolean isUser;
  HexGrid hg;

  Player(int c){
      col = c;
      isUser = false;
  }
  
  void addHG(HexGrid h){
    hg = h; 
  }
  
  void isUser(){
     isUser = true;
  }
   
  void placeSet(boolean b){
    Hexagon h = hg.hexs[(int)random(19)];
    h.setColor(col);
    /*boolean cs = false;
    while (!cs){
      cs = h.checkSettlement((int)random(6),col);
    }*/
   if (b){
      //also build road adjacent 
   }
    
  }
  
  
  
  
  
}
