class Player{
  int col;
  boolean isUser;
  HexGrid hg;
  int VP;
  ArrayList<Road> roads;
  ArrayList<Settlement> settlements;
  int wood, brick, stone, wheat, sheep;

  Player(int c){
      col = c;
      isUser = false;
      VP = 0;
  }
  
  void addHG(HexGrid h){ hg = h; }
  
  void isUser(){ isUser = true; }
  
  boolean addVP(){ 
    VP++;
    return VP >= 10; 
  }
  
  boolean canBuildRoad(){
     return wood>0 && brick>0; 
  }
  
  boolean canBuildSet(){
    return sheep>0 && wood>0 && wheat>0 && brick>0;
  }
  
  boolean canBuildCity(){
    return stone>=3 && wheat>=2; 
  }
  
  void subRoadRes(){
     wood--;
     brick--; 
  }
  
  void subSetRes(){
     sheep--;
     wood--;
     wheat--;
     brick--;
  }
   
  void subCityRes(){
     stone -= 3;
     wheat -= 2;
  } 
   
  boolean placeSet(boolean placeRoad){
    Settlement s = hg.randSet();
    while (!s.isValidPlacement()){
      s = hg.randSet();
    }
    s.build(col);
    if (placeRoad){
       s.buildRoad(col); 
    } 
    return addVP();   
  }
  
  
  
  
  
}
