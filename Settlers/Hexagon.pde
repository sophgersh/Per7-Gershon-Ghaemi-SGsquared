class Hexagon {

   String resource;
   float centerx;
   float centery;  
   //vertices 
   //neighbor
   Road[] roads;
   Settlement[] settlements;
   Hexagon[] adjHexs;
   float radius; //60
   boolean isCenter;
   //---game mechanics--- 
   int type; /* 1 = forest, 2 = brick, 3 = sheep 
                4 = rock, 5 = wheat, 6 = desert */    
   int dieValue; //dice roll number, 2-12 
   boolean hasRobber;
  // ---pieces on board--- (settlements/cities/roads)
  
  Hexagon(float cx, float cy, float r) {
    centerx = cx;
    centery = cy;
    radius = r;
    float angle = TWO_PI / 6;
    adjHexs = new Hexagon[6];
    beginShape();
    for (int i = 0; i < 6; i++) {
      vertex(cx + r * cos(angle * i),
             cy + r * sin(angle * i) );      
    }
    endShape(CLOSE);  
    noFill();
    ellipse(centerx,centery,sqrt(3)*radius,sqrt(3)*radius);
    roads = new Road[6];
    settlements = new Settlement[6];
    isCenter = false;
    surroundingS();
  }

  void surroundingS(){    
    float angle = TWO_PI / 6;
    float r = (2/sqrt(3)*radius - sqrt(3)/2*radius)*2;
    float rad = 2/sqrt(3)*radius;
    for (int i = 0; i < 6; i++) {
      settlements[i] = new Settlement(centerx+rad*cos(angle * i), centery+rad*sin(angle * i), r);                                      
      noFill();
      stroke(i*10);              
    }
  }

  void center(){
     float angle = TWO_PI / 6;
     for (int i = 0; i < 6; i++){
        float x = centerx+2*radius*cos(angle*i+PI/6);
        float y = centery+2*radius*sin(angle*i+PI/6);
        adjHexs[i] = new Hexagon(x,y,radius);
     }
    isCenter = true;
  }
  
  void background(){
   PImage photo = loadImage("catan5.jpg");
   image(photo,0,0);
  } 

  boolean inHex(int x, int y){
      return sqrt(sq(x-centerx)+sq(y-centery)) < sqrt(3)/2*radius;  
  }  
  /*boolean onRoad(int x, int y){
  
  }*/
  void onSet(int x, int y){
    for (Settlement s : settlements){
      if (s.inRadius(x,y)){
        s.setColor(random(255));
      }
    }
  }

  void setColor(float c){
    fill(c);
    ellipse(centerx,centery,radius,radius);
  }
  
  void mouseOver(boolean b){  
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
  }
  
  void add(int pos, Hexagon h){
     adjHexs[pos] = h; 
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
