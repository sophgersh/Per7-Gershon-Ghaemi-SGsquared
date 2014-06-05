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
  
  void findAdjSettlements(){
    Hexagon h = adjHexs[0];
    int thisIsNthRoad = 0;
    for(int i = 0; i<6; i++){
     if(h.roads[i] == null){
       //println("YO ROAD NOT LEGIT ON "+ h);
     }
     else if(this.equals(h.roads[i])){ thisIsNthRoad = i;} 
    }
    int firstAdjSet = thisIsNthRoad;
    int secondAdjSet = (firstAdjSet+1)%6;
    adjSets[0] = h.settlements[firstAdjSet];
    adjSets[1] = h.settlements[secondAdjSet];
    //println("findAdjSettlements success for "+this+" road between "+h+" and "+adjHexs[1]);
    println("AdjSettlements to "+this+": "+adjSets[0] + " and "+adjSets[1]);
    float distToSet = h.radius*sin(30);   
  }
  
  void setColor(int c){
    col = c;
    fill(c);
    ellipse(cx,cy,15,15);
  }
  
  void drawRoad(){
     if (isBuilt){
       fill(col);
       ellipse(cx, cy, 15, 15);
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
     ellipse(cx,cy,15,15); 
   //}
  }
  
  String toString(){
    return "("+(int)cx+","+(int)cy+")"; 
  }
   
  boolean equals(Road other){
    return (this.cx ==other.cx) && (this.cy==other.cy); 
  }
  
  boolean inRadius(int x, int y){
    return sqrt(sq(x-cx)+sq(y-cy)) < 15/2; 
  }
  
  
}
