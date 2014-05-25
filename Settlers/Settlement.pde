class Settlement{
  float radius;
  float centerx;
  float centery;
  boolean isBuilt;
  Hexagon[] adjHexs;
  //Player owner;
  
  Settlement(float x, float y, float r){    
     centerx = x;
     centery = y;
     radius = r;
     isBuilt = false;
     adjHexs = new Hexagon[3]; 

  }

  boolean inRadius(int x, int y){
     return sqrt(sq(x-centerx)+sq(y-centery)) < radius; 
  }

  void setColor(float r){
    fill(r);
    ellipse(centerx,centery,radius,radius);
  }
}
