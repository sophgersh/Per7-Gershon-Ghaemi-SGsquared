class Player{
  int col;
  boolean isUser;
  HexGrid hg;
  int VP;
  ArrayList<Road> roads;
  ArrayList<Settlement> settlements;

  Player(int c){
      col = c;
      isUser = false;
      VP = 0;
  }
  
  void addHG(HexGrid h){ hg = h; }
  
  void isUser(){ isUser = true; }
  
  void addVP(){ VP++; }
   
  void placeSet(boolean b){
    Settlement s = hg.randSet();
    while (!s.isValidPlacement()){
      s = hg.randSet();
    }
    s.build(col);
    addVP();
    if (b){
       s.buildRoad(col); 
    }    
  }
  
  
  
  
  
}
