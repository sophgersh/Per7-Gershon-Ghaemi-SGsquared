class Player{
  int col;
  String pColor;
  boolean isUser;
  HexGrid hg;
  int VP;
  ArrayList<Road> roads;
  ArrayList<Settlement> settlements;
  int wood, brick, stone, wheat, sheep;
  int extraroads;
  boolean saveforcity;

  Player(int c){
      col = c;
      if(c == #F50C0C){pColor = "RED";}
      else if(c == #1411F2){pColor = "BLUE";}
      else if(c == #07B405){pColor = "GREEN";}
      else{pColor = "PURPLE";}
      isUser = false;
      VP = 0;
      saveforcity = false;
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




  
  boolean makeMove(){
     Settlement set = null;    
       for (Settlement s : hg.settlements){
          if (s.isValidPlacement() && s.isConnected(col)){
             //if (s.
             set = s;
          }                        
       }
       if (set != null){ 
         if (canBuildSet()){
           set.build(this);
           subSetRes();
           if (addVP())
             return true;
         } else {
           saveforcity = true;
         }
       } if (canBuildCity()){
        for (Settlement s: hg.settlements){
           if (s.canBuildCity(col)){
              s.buildCity();
              subCityRes();
              if (addVP())
                return true; 
              extraroads = 0;
           }
        } 
        saveforcity = false;
     } else if (canBuildRoad() &&  !saveforcity){
        Road ro = null;
        for (Road r : hg.roads){
           if (r.isValidPlacement(col)){
             ro = r;

             ro.build(col);
             subRoadRes();
             ro.build(col);
             extraroads++;
             subRoadRes();  
           }
        }
     
     }    
     return false;
  }
  
}
