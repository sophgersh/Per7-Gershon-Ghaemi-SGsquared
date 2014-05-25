class Hexagon {
   float centerx;
   float centery;  
   int type; 
   /* 1 = forest, 2 = brick, 3 = sheep 
      4 = rock, 5 = wheat, 6 = desert */  
   int diceNum; //dice roll number, 2-12
   //int distanceToCenter; //1, 2, 3  
   Hexagon[] hexs;
   float radius; //60
   boolean isCenter;
  
  Hexagon(float cx, float cy, float r) {
    centerx = cx;
    centery = cy;
    radius = r; //50
    float angle = TWO_PI / 6;
    hexs = new Hexagon[6];
    beginShape();
    for (int i = 0; i < 6; i++) {
      vertex(cx + r * cos(angle * i),
        cy + r * sin(angle * i) );
        //println(""+i+": "+(angle*i));
        
    }
    endShape(CLOSE);  
    noFill();
    ellipse(centerx,centery,sqrt(3)*radius,sqrt(3)*radius);
    isCenter = false;
  }

  void center(){
     float angle = TWO_PI / 6;
     for (int i = 0; i < 6; i++){
        float x = centerx+2*radius*cos(angle*i+PI/6);
        float y = centery+2*radius*sin(angle*i+PI/6);
        //ellipse(x,y,10,10);
        hexs[i] = new Hexagon(x,y,radius);
     }
    isCenter = true;
  }
  
  

  boolean inRadius(int x, int y){
      return sqrt(sq(x-centerx)+sq(y-centery)) < sqrt(3)/2*radius;  
  }

  void setColor(float c){
    fill(c);
    ellipse(centerx,centery,radius,radius);
  }
  
  void add(int pos, Hexagon h){
     hexs[pos] = h; 
  }
  
  Hexagon get(int pos){
     return hexs[pos]; 
  }

}
