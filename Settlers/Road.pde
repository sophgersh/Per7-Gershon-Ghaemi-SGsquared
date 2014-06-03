class Road{
  boolean isBuilt;
  float cx, cy;
  Hexagon[] adjHexs;
  Settlement[] adjSettlements;
  //Player owner;
  
  Road(float x, float y,Hexagon h1, Hexagon h2){
   cx = x;
   cy = y;
   adjSettlements = new Settlement[2];
   findAdjSettlements();
   adjHexs = new Hexagon[2];
   adjHexs[0] = h1;
   adjHexs[1] = h2; //will be null for seaside road
   ellipse(x,y,15,15); 
  }
  
  void findAdjSettlements(){
   Hexagon h = adjHexs[0];
    
  }
  
  void drawRoad(){
   //width 30, length from one settlement to other 
    
  }
  
  
  
  
}
