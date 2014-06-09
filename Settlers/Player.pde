class Player{
  int col;
  String pColor;
  boolean isUser;
  HexGrid hg;
  int VP;
  ArrayList<Road> roads;
  ArrayList<Settlement> settlements;
  int wood, brick, stone, wheat, sheep;

  Player(int c){
      col = c;
      if(c == #F50C0C){pColor = "RED";}
      else if(c == #1411F2){pColor = "BLUE";}
      else if(c == #07B405){pColor = "GREEN";}
      else{pColor = "PURPLE";}
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
    s.build(this);
    if (placeRoad){
       s.buildRoad(col); 
    } 
    return addVP();   
  }
  
  String toString(){
   if(isUser){return pColor+"--USER";}
   else{return pColor;} 
  }
  
  boolean equals(Player other){
   return col==other.col && isUser == other.isUser; 
  }
<<<<<<< HEAD
  
  boolean makeMove(){
     Settlement set = null;
     if (canBuildSet()){      
       int i;
       for (Settlement s : hg.settlements){
          if (s.isValidPlacement() && s.isConnected(col)){
             //if (s.
             set = s;
          }                        
       }
       if (set != null){
         set.build(this);
         subSetRes();
         if (addVP())
           return true;
       }
     } if (canBuildCity()){
        for (Settlement s: hg.settlements){
           if (s.canBuildCity(col)){
              s.buildCity();
              subCityRes();
              if (addVP())
                return true; 
           }
        } 
     } else if (canBuildRoad()){
        Road ro = null;
        for (Road r : hg.roads){
           if (r.isValidPlacement(col)){
             ro = r;
           }
           ro.build(col);
           subRoadRes();            
        } 
     }    
     return false;
  }
  
  

  
  
  
}
