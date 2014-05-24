class Polygon {
   int sides;
   float centerx;
   float centery;
   float radius;

  
  Polygon(int n, float cx, float cy, float r) {
    sides = n;
    centerx = cx;
    centery = cy;
    radius = r;
    float angle = 360.0 / n;
  
    beginShape();
    for (int i = 0; i < n; i++)
    {
      vertex(cx + r * cos(radians(angle * i)),
        cy + r * sin(radians(angle * i)));
       /*println(cx + r * cos(radians(angle * i)),
        cy + r * sin(radians(angle * i)));*/
    }
    endShape(CLOSE);
    
    noFill();
    ellipse(centerx,centery,2*radius,2*radius);
  
}

  boolean inRadius(int x, int y){
      return sqrt(sq(x-centerx)+sq(y-centery)) < radius;  
  }

  void setColor(){
    fill(random(100),random(100),random(255));
    ellipse(centerx,centery,radius,radius);
  }
  
  

}
