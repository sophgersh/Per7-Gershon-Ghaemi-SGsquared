class Road{
  boolean isBuilt;
  float cx, cy;
  Hexagon[] adjHexs;
  Settlement[] adjSets;
  Road[] adjRoads;
  int col;
  //Player owner;
  
  Road(float x, float y){
   cx = x;
   cy = y;
   adjHexs = new Hexagon[2]; 
   adjSets = new Settlement[2];
   adjRoads = new Road[4];
   //findAdjSettlements();  
   //ellipse(x,y,15,15); 
  }
  
  void add(Hexagon h){
    if (adjHexs[0] == null) 
      adjHexs[0] = h;
    else
      adjHexs[1] = h;
  }
  
  void addRoad(Road r){
     for (int i = 0; i < adjRoads.length; i++){
        if (adjRoads[i] == null){
           adjRoads[i] = r;
           return; 
        }
     } 
  }
  
  void findAdjSettlements(){
    Hexagon h = adjHexs[0];
    int thisIsNthRoad = 0;
    for(int i = 0; i<6; i++){
     //if(h.roads[i] == null){
       //println("YO ROAD NOT LEGIT ON "+ h);
     //}
     if(h.roads[i] != null && this.equals(h.roads[i])){ thisIsNthRoad = i;} 
    }
    int firstAdjSet = thisIsNthRoad;
    int secondAdjSet = (firstAdjSet+1)%6;
    adjSets[0] = h.settlements[firstAdjSet];
    adjSets[1] = h.settlements[secondAdjSet];
    adjSets[0].addRoad(this);
    adjSets[1].addRoad(this);
    //println("findAdjSettlements success for "+this+" road between "+h+" and "+adjHexs[1]);
    //println("AdjSettlements to "+this+": "+adjSets[0] + " and "+adjSets[1]);
    //float distToSet = 60*sin(30);   
  }
  
  void findAdjRoads(){
   for(Settlement s: this.adjSets){ //loop through adj sets
      //s.printAdjRoads();
      for(Road r: s.adjRoads){ //roads adjacent to Set from before
        if (r != null && r != this){
          addRoad(r);
        }     
      }
   }  
  }
  
  void setColor(int c){
    col = c;
    fill(c);
    ellipse(cx,cy,15,15);
  }
  void build(int c){
    isBuilt = true;
    col = c;
    fill(c);
    ellipse(cx,cy,15,15);
  }
  
  
  void drawRoad(){
     if (isBuilt){
       fill(col);
       //ellipse(cx, cy, 15, 15);
       /*
       int v[] = new int[4];
       v[0] = (int)(adjSets[0].cx-15);
       v[1] = (int)(adjSets[0].cy+adjSets[1]radius);
       v[2] = (int)(adjSets[1].cx-15);
       v[3] = (int)(adjSets[1].cy+adjSets[1]radius);*/
       beginShape();
       for(int i = 0; i<4; i++){
          vertex( (int)(adjSets[i/2].centerx-15), (int)(adjSets[i/2].centery) );
       }
       endShape(CLOSE);
     } else {
         noFill();
         ellipse(cx, cy, 15, 15);
       }
    }
   
    
   void drawRoad(int c){
     //width 30, length from one settlement to other 
     //if (isBuilt){
       col = c;
       fill(col);
       stroke(0);
       //ellipse(cx,cy,15,15); 
       beginShape();
       for(int i = 0; i<4; i++){
         vertex( (int)(adjSets[i/2].centerx-15), (int)(adjSets[i/2].centery) );
       }
       endShape(CLOSE);
       
     //}
  }
  
  
  
  String toString(){
    return "road @ ("+(int)cx+","+(int)cy+")"; 
  }
   
  boolean equals(Road other){
    //println(this);
    //println(other);
    return (this.cx ==other.cx) && (this.cy==other.cy); 
  }
  
  boolean inRadius(int x, int y){
    return sqrt(sq(x-cx)+sq(y-cy)) < 15/2; 
  }
  
  boolean adjToSet(int c){
    for (Settlement s: adjSets){
       if (s != null && s.col == c){
          for (Road r: s.adjRoads){
             if (r != null && r.isBuilt && r.col == c)
                return false;
          }
          return true;
        }
     } 
    return false;
  }
  
  boolean isValidPlacement(int c){
    return !isBuilt && isConnected(c);
  }
  
  boolean isConnected(int c){
     for (Road r : adjRoads){
        if (r != null && r.col == c)
          return true;
     }
     return false; 
  }
  
  
  
  
}
