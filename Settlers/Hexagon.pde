class Hexagon {
   float centerx;
   float centery;
   float radius;
   int type; 
   /* 1 = forest, 2 = brick, 3 = sheep 
      4 = rock, 5 = wheat, 6 = desert
   */
   int num; //dice roll number
  
  Hexagon(float cx, float cy, float r) {
    centerx = cx;
    centery = cy;
    radius = r;
    float angle = TWO_PI / 6;
  
    beginShape();
    for (int i = 0; i < 6; i++) {
      vertex(cx + r * cos(angle * i),
        cy + r * sin(angle * i) );
        //println(""+i+": "+(angle*i));
        
    }
    endShape(CLOSE);
    
    noFill();
    ellipse(centerx,centery,sqrt(3)*radius,sqrt(3)*radius);
  
}

  boolean inRadius(int x, int y){
      return sqrt(sq(x-centerx)+sq(y-centery)) < sqrt(3)/2*radius;  
  }

  void setColor(float c){
    fill(c);
    ellipse(centerx,centery,radius,radius);
  }
  
  

}
