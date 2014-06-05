class Road{
  boolean isBuilt;
  float cx, cy;
  Hexagon[] adjHexs;
  Settlement[] adjSettlements;
  //Player owner;
  
  Road(float x, float y,Hexagon h1, Hexagon h2){
   cx = x;
   cy = y;
   adjHexs = new Hexagon[2];
   adjHexs[0] = h1;
   adjHexs[1] = h2; //will be null for seaside road 
   adjSettlements = new Settlement[2];
   findAdjSettlements();  
   ellipse(x,y,15,15); 
  }
  
  void findAdjSettlements(){
    Hexagon h = adjHexs[0];
    int thisIsNthRoad = 0;
    for(int i = 0; i<h.roads.length; i++){
     if(h.roads[i] == null){
       //println("YO ROAD NOT LEGIT ON "+ h);
     }
     else if(this.equals(h.roads[i])){ thisIsNthRoad = i;} 
    }
    int firstAdjSet = thisIsNthRoad;
    int secondAdjSet = (firstAdjSet+1)%6;
    adjSettlements[0] = h.settlements[firstAdjSet];
    adjSettlements[1] = h.settlements[secondAdjSet];
    //println("findAdjSettlements success for "+this+" road between "+h+" and "+adjHexs[1]);
    println("AdjSettlements to "+this+": "+adjSettlements[0] + " and "+adjSettlements[1]);
    float distToSet = h.radius*sin(30);
    
  }
  
  void drawRoad(){
   //width 30, length from one settlement to other 
   ellipse(cx,cy,15,15); 
   
  }
  
  String toString(){
    return "("+(int)cx+","+(int)cy+")"; 
   }
   
   boolean equals(Road other){
    return (this.cx ==other.cx) && (this.cy==other.cy); 
   }

  
  
}
