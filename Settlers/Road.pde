class Road{
  boolean isBuilt;
  float cx, cy;
  ArrayList<Hexagon> adjHexs;
  ArrayList<Settlement> adjSets;
  ArrayList<Road> adjRoads;
  int col;
  //Player owner;
  
  Road(float x, float y){
   cx = x;
   cy = y;
   adjHexs = new ArrayList<Hexagon>(); 
   adjSets = new ArrayList<Settlement>();
   adjRoads = new ArrayList<Road>();
   //findAdjSettlements();  
   //ellipse(x,y,15,15); 
  }
  
  void add(Hexagon h){
    adjHexs.add(h);
  }
  
  void addRoad(Road r){
     adjRoads.add(r); 
  }
  
  void findAdjSettlements(){
    Hexagon h = adjHexs.get(0);
    int thisIsNthRoad = 0;
    for(int i = 0; i<6; i++){
     //if(h.roads[i] == null){
       //println("YO ROAD NOT LEGIT ON "+ h);
     //}
     if(h.roads[i] != null && this.equals(h.roads[i])){ thisIsNthRoad = i;} 
    }
    int firstAdjSet = thisIsNthRoad;
    int secondAdjSet = (firstAdjSet+1)%6;
    adjSets.add(h.settlements[firstAdjSet]);
    adjSets.add(h.settlements[secondAdjSet]);
    adjSets.get(0).addRoad(this);
    adjSets.get(1).addRoad(this);
    //println("findAdjSettlements success for "+this+" road between "+h+" and "+adjHexs[1]);
    //println("AdjSettlements to "+this+": "+adjSets[0] + " and "+adjSets[1]);
    //float distToSet = 60*sin(30);   
  }
  
  void findAdjRoads(){
   for(Settlement s: adjSets){ //loop through adj sets
      //s.printAdjRoads();
      for(Road r: s.adjRoads){ //roads adjacent to Set from before
        if (r != this){
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
       ellipse(cx, cy, 15, 15);
       
       /*int[] coords = new int[8];
       int j = 0;
       for(int i =0;i<6;i++){
         int x = (int)(adjHexs[0].centerx + 60 * cos(i * PI/3));
         int y = (int)(adjHexs[0].centery + 60 * sin(i*PI/3));
         if(adjSets[0].inRadius(x,y)){
           coords[j]=x;
           coords[j+1]=y;
           j+=2;
         }
         else if(adjSets[1].inRadius(x,y)){
           coords[j]=x;
           coords[j+1]=y;
           j+=2;
         }
       }
       if(adjHexs[1] !=null){
         for(int i =0;i<6;i++){
           int x = (int)(adjHexs[1].centerx + 60 * cos(i * PI/3));
           int y = (int)(adjHexs[1].centery + 60 * sin(i*PI/3));
           if(adjSets[0].inRadius(x,y)){
             coords[j]=x;
             coords[j+1]=y;
             j+=2;
           }
           else if(adjSets[1].inRadius(x,y)){
             coords[j]=x;
             coords[j+1]=y;
             j+=2;
           }
         }
       }
       else{
        //????
       //for seaside roads 
       }
       noStroke();//causes all strokes to disappear -- needs to be fixed
       beginShape();
       for(int i = 0; i<8; i+=2){
          vertex( coords[i], coords[i+1] );
       }
       endShape(CLOSE);*/
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
         vertex( (int)(adjSets.get(i/2).centerx-15), (int)(adjSets.get(i/2).centery) );
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
       if (s.col == c){
          for (Road r: s.adjRoads){
             if (r.isBuilt && r.col == c)
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
        if (r.col == c)
          return true;
     }
     return false; 
  }
  
  
  
  
}
