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
     ellipse(x, y, r, r ); 
  };

  boolean addAdjHex(Hexagon h){
    for(int i=0; i<3; i++){
     if(adjHexs[i] == null){adjHexs[i] = h; return true;}
    }
    return false; 

  boolean inRadius(int x, int y){
     return sqrt(sq(x-centerx)+sq(y-centery)) < radius/2; 
  }

  //checks to see if it settlement is in a legal placing
   //each Hexagon can have no more than 3 Settlments around it
   //each Settlement must be >=two sides away from each other
   boolean isValidPlacement(){
      for(Hexagon h: adjHexs){
       println(h);
       if(h.settlements.length > 2){return false;}
       //checks if there's a neighboring settlement
       for(int i = 0; i<h.settlements.length; i++){
         //three possible paths to go to a neighboring settlement
         for(int j = 1; j<=6; j++){
           int xAdj = (int)(centerx + cos((PI/3)*j)*(2*cos(PI/3)*h.radius));
           int yAdj = (int)(centery + sin((PI/3)*j)*(2*cos(PI/3)*h.radius));
          if(h.settlements[i].inRadius(xAdj, yAdj)){return false;}
         }
       } 
      }
      return true;
   }

  void setColor(float r){
    fill(r);
    ellipse(centerx,centery,radius,radius);
  }
}
