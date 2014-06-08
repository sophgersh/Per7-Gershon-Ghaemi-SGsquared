class Settlement{
  float radius;
  float centerx;
  float centery;
  int col;
  boolean isBuilt;
  boolean isCity;
  Hexagon[] adjHexs;
  Settlement[] adjSets;
  Road[] adjRoads;
  //Player owner;
  
  Settlement(float x, float y, float r){    
     centerx = x;
     centery = y;
     radius = r;
     isBuilt = false;
     isCity = false;
     adjHexs = new Hexagon[3]; 
     adjSets = new Settlement[3];
     adjRoads = new Road[3];
  }
  
  String toString(){
    return "settlement @ ("+(int)centerx+","+(int)centery+")"; 
  }
  
  void findAdjSets(){
    for(Road r: this.adjRoads){ 
      if (r != null){
        for(Settlement s: r.adjSets){ 
          if (s != null && s != this)
            addSet(s);
        }        
      }
    } 
  }
  
  
  void setColor(int r){
    col = r;
    fill(r);
    ellipse(centerx,centery,radius,radius);
  }
  
  void drawSet(){
     if (isBuilt){
       fill(col);
       ellipse(centerx, centery, radius, radius );
     } else {
       noFill();
       ellipse(centerx, centery, radius, radius );
     }
  }

  void build(int c){
    isBuilt = true; 
    setColor(c);
  }
  
  void buildCity(){
    isCity = true;
    //setColor(col+100); 
  }
  
  void add(Hexagon h1){
     for (int i = 0; i < adjHexs.length; i++){
        if (adjHexs[i] == null){
          adjHexs[i] = h1;
          //h1.setColor(#59D84F);
          return;
        }
     } 
  }
  
  void addRoad(Road r){
     for (int i = 0; i < adjRoads.length; i++){
        if (adjRoads[i] == null){
          adjRoads[i] = r;
          return;
        }
     } 
  }
  
  void addSet(Settlement s){
     for (int i = 0; i < adjSets.length; i++){
        if (adjSets[i] == null){
           adjSets[i] = s;
           return; 
        }
     } 
  }
  
  boolean inRadius(int x, int y){
     return sqrt(sq(x-centerx)+sq(y-centery)) < radius/2; 
  }

  boolean isValidPlacement(){
     for (Settlement s : adjSets){
        if (s != null){
           if (s.isBuilt)
             return false;  
        }          
     }
     return true; 
  }
  
  boolean canBuildCity(int c){
     return isBuilt && c == col;
  }
  
  void buildRoad(int c){
     Road r;
     do {
       r = adjRoads[(int)(random(adjRoads.length))];
     } while (r == null || r.isBuilt);
     r.build(c);
     
  }

  //checks to see if it settlement is in a legal placing
   //each Hexagon can have no more than 3 Settlments around it
   //each Settlement must be >=two sides away from each other
   /*boolean isValidPlacement(){
      for(Hexagon h: adjHexs){
       println(h);
       if(h.settlements.length > 2){return false;}
       //checks if there's a neighboring settlement
       for(int i = 0; i<h.settlements.length; i++){
         //three possible paths to go to a neighboring settlement
         for(int j = 1; j<=6; j++){
           int xAdj = (int)(centerx + cos((PI/3)*j)*(2*cos(PI/3)*h.radius));
           int yAdj = (int)(centery + sin((PI/3)*j)*(2*cos(PI/3)*h.radius));
          if(h.settlements[i].inRadius(xAdj, yAdj)){return false;}
         }
       } 
      }
      return true;
   }*/

  
  void printAdjSettlements(){
    String str = "sets adj to " + this;
    for(Settlement s: adjSets)
      str+=s+",";
    println(str);
  }
  
  void printAdjRoads(){
    String str = "roads adj to " + this;
    for(Road r: adjRoads){
     str+=r+" ";
    println(str);
    } 
  }
  
}
