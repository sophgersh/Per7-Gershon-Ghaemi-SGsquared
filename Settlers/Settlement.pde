class Settlement{
  float radius;
  float centerx;
  float centery;
  int col;
  boolean isBuilt;
  boolean isCity;
  //Hexagon[] adjHexs;
  ArrayList<Hexagon> adjHexs;
  ArrayList<Settlement> adjSets;
  ArrayList<Road> adjRoads;
  //Road[] adjRoads;
  Player owner;
  
  Settlement(float x, float y, float r){    
     centerx = x;
     centery = y;
     radius = r;
     isBuilt = false;
     isCity = false;
     adjHexs = new ArrayList<Hexagon>(); 
     adjSets = new ArrayList<Settlement>();
     adjRoads = new ArrayList<Road>();
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
     } if (isCity){
        fill(col+5);
        ellipse(centerx, centery, radius-15, radius-15);
     } else {
       noFill();
       ellipse(centerx, centery, radius, radius );
     }
  }

  //void build(int c){
  void build(Player p){
    owner = p;
    isBuilt = true; 
    setColor(p.col);
  }
  
  void buildCity(){
    isCity = true;
    //setColor(col+100); 
  }
  
  void add(Hexagon h1){
     adjHexs.add(h1);    
  }
  
  void addRoad(Road r){
     adjRoads.add(r); 
  }
  
  void addSet(Settlement s){
    adjSets.add(s); 
  }
  
  boolean inRadius(int x, int y){
     return sqrt(sq(x-centerx)+sq(y-centery)) < radius/2; 
  }

  boolean isValidPlacement(){
     if (isBuilt)
       return false;
     for (Settlement s : adjSets){
        if (s.isBuilt)
             return false;            
     }
     return true; 
  }
  
  boolean isConnected(int c){
     for (Road r : adjRoads){
        if (r.col == c)
          return true;
     } 
     return false;
  }
  
  
  boolean canBuildCity(int c){
     return isBuilt && c == col && !isCity;
  }
  
 
  
  void buildRoad(int c){
     Road r;
     do {
       r = adjRoads.get((int)(random(adjRoads.size())));
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
