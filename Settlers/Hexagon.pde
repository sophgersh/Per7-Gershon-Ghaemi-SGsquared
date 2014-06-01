class Hexagon {
   int num;
   String resource;
   float centerx;
   float centery;  
   //vertices 
   //neighbor
   Road[] roads;
   Settlement[] settlements;
   Hexagon[] adjHexs;
   float radius; //60
   //---game mechanics--- 
   int type; /* 1 = forest, 2 = brick, 3 = sheep 
                4 = rock, 5 = wheat, 6 = desert */    
   int dieValue; //dice roll number, 2-12 
   boolean hasRobber;
  // ---pieces on board--- (settlements/cities/roads)
  int col;
  
  Hexagon(int n){
     num = n;
     radius = 60; 
     adjHexs = new Hexagon[6];  
     roads = new Road[6];
     settlements = new Settlement[6];        
  }
    
  Hexagon(float cx, float cy, float r, int n) {
    num = n;   
    //if (n == 0) { center(); }
    radius = r; 
    drawHex(cx, cy);   
    adjHexs = new Hexagon[6];  
    roads = new Road[6];
    settlements = new Settlement[6];   
  }

  void drawHex(float cx, float cy){
    centerx = cx;
    centery = cy;
    float angle = TWO_PI / 6;
    int r;
    if (resource.equals("forest")) {r = #177E0A; }
    else if (resource.equals("wheat")) {r = #DBA307; }
    else if (resource.equals("desert")) {r = #F7F700; }
    else if (resource.equals("stone")) {r = #7E7E7A; }
    else if (resource.equals("brick")) {r = #BC4E09; }
    else /*(resource.equals("sheep"))*/ {r = #4EFF15; }
    fill(r);
    beginShape();
    for (int i = 0; i < 6; i++) {
      vertex(centerx + radius * cos(angle * i),
             centery + radius * sin(angle * i) );      
    }
    endShape(CLOSE);  
    noFill(); 
    //stroke(0); 
    //ellipse(centerx,centery,sqrt(3)*radius,sqrt(3)*radius); 
    surroundingS();
    surroundingRoads();
  }

  String toString(){
    return "Hex#"+this.num; 
  }

  void surroundingS(){    
    float angle = TWO_PI / 6;
    float r = (2/sqrt(3)*radius - sqrt(3)/2*radius)*2; //diameter
    float rad = 2/sqrt(3)*radius; //displacement
    for (int i = 0; i < 6; i++) {
      settlements[i] = new Settlement(centerx+rad*cos(angle * i), 
                                      centery+rad*sin(angle * i), r);                                      
      noFill();
      stroke(i*10);              
    }
  }

  void surroundingRoads(){
   float rad = 2/sqrt(3)*radius;
   int j = 0;
   for(float i = 0.5; i<6; i+=1){
    float x = centerx + rad*cos( (PI/3) * i);
    float y = centery + rad*sin( (PI/3) * i);
    roads[j] = new Road(x,y);
    j++;
   } 
  }
    
  
  void setNum(int n){
     num = n; 
  }
  
  void background(){
   PImage photo = loadImage("catan5.jpg");
   image(photo,700,0);
  } 

  boolean inHex(int x, int y){
      return sqrt(sq(x-centerx)+sq(y-centery)) < sqrt(3)/2*radius;  
  }  
  /*boolean onRoad(int x, int y){
  
  }*/
  void checkSettlement(int x, int y, int c){
    for (int i = 0; i < settlements.length; i++){
      if (settlements[i].inRadius(x,y)){
        if (!settlements[i].isBuilt){
          if (checkAdjSets(i)){
             buildSettlement(i); 
             settlements[i].setColor(c); 
          } else 
             settlements[i].setColor(#FF15F0);  //not valid   
        }else if (c == settlements[i].col)  //already built     
          settlements[i].buildCity();
        
      }
    }
  }
  
  Hexagon hexInDir(float angleFromCenter){
   for(int i = 0; i<6; i++){
    float j = (float)(i) + 0.5;
    int nextX =(int)(3/2 * (centerx + radius*cos( (PI/3)*j ) ) );
    int nextY =(int)(3/2 * (centery + radius*sin( (PI/3)*j ) ) );
    if( adjHexs[i].inHex(nextX, nextY) ){return adjHexs[i];}
   } 
   return null;
  }

  boolean checkAdjSets(int i){
     if (settlements[(i+1)%6].isBuilt || settlements[(i+5)%6].isBuilt)
        return false; 
     if (adjHexs[(i+5)%6] != null){
       if (adjHexs[(i+5)%6].settlements[(i+1)%6].isBuilt)
           return false;
     } if (adjHexs[i] != null){
       if (adjHexs[i].settlements[(i+5)%6].isBuilt)
           return false;
     }
     return true;     
  }
  
  void buildSettlement(int i){
    settlements[i].build();
    settlements[i].add(this);
    if (adjHexs[(i+5)%6] != null){
       adjHexs[(i+5)%6].addSet((i+2)%6, settlements[i]);
       settlements[i].add(adjHexs[(i+5)%6]);
    } if (adjHexs[i%6] != null){
       adjHexs[i].addSet((i+4)%6, settlements[i]);
       settlements[i].add(adjHexs[i%6]);
    }
    
  }

  void setColor(int c){
    fill(c);
    ellipse(centerx,centery,radius,radius);
    if (col != 255)
      col = c;
    else 
      col = 0;
  }
  
  /*void mouseOver(boolean b){  
    //the 0 opacity does not undo the others, so they accumulate
      int col;
      if (b) 
         col = 10;
      else 
          col = 0;
      float angle = TWO_PI/6;
      beginShape();
      fill(255,col);
      for (int i = 0; i < 6; i++) {
        vertex(centerx + radius * cos(angle * i),
          centery + radius * sin(angle * i) );        
      }    
      endShape(CLOSE); 
  }*/
  
  void add(int pos, Hexagon h){
     adjHexs[pos] = h; 
  }
  void addSet(int pos, Settlement s){
     settlements[pos] = s; 
  }
  
  Hexagon get(int pos){
     return adjHexs[pos]; 
  }
  
  boolean setValue(int val){
    dieValue = val;
    return true;
  }
  boolean setResource(String r){
     resource = r;
     return true;
   } 

}
