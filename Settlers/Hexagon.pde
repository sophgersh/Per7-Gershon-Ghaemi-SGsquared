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

   //---game mechanics---      
   int dieValue; //dice roll number, 2-12 
   boolean hasRobber;
   // ---pieces on board--- (settlements/cities/roads)
   int col;
  
  Hexagon(int n){
     num = n;
      
     adjHexs = new Hexagon[6];  
     roads = new Road[6];
     settlements = new Settlement[6];        
  } 
  
  String toString(){ return "Hex#"+this.num; }
  
  void setXY(float x, float y){
     centerx = x;
     centery = y;  
  }
  
  void setNum(int n){ num = n; }

  //set the tile backgrounds here, for now color fillers
  void setBackground(){  
    if (resource.equals("forest")) {col = #177E0A; }
    else if (resource.equals("wheat")) {col = #DBA307; }
    else if (resource.equals("desert")) {col = #F7F700; }
    else if (resource.equals("stone")) {col = #7E7E7A; }
    else if (resource.equals("brick")) {col = #BC4E09; }
    else if (resource.equals("sheep")) {col = #4EFF15; }
  }

  void drawHex(){
    float angle = TWO_PI / 6;
    
    fill(col);
    beginShape();
    for (int i = 0; i < 6; i++) {
      vertex(centerx + 60 * cos(angle * i),
             centery + 60 * sin(angle * i) );      
    }
    endShape(CLOSE);  
    //noFill(); 
    PFont font = loadFont("AppleMyungjo-48.vlw");
    textFont(font, 20);
    fill(0);
    text(""+dieValue,centerx,centery+5);
    //surroundingSets();
    //surroundingRoads();
  }
  
  Settlement newSet(int i){
    float r = (2/sqrt(3)*60 - sqrt(3)/2*60)*2; //diameter
    float rad = 2/sqrt(3)*60; //displacement
    float x = centerx + rad*cos(TWO_PI/6 * i);
    float y = centery + rad*sin(TWO_PI/6 * i);
    settlements[i] = new Settlement(x,y,r);
    settlements[i].add(this);                                
    //add this to the surrounding hexs
    if (adjHexs[(i+5)%6] != null){
       adjHexs[(i+5)%6].addSet((i+2)%6, settlements[i]);
       settlements[i].add(adjHexs[(i+5)%6]);
    } if (adjHexs[i] != null){
       adjHexs[i].addSet((i+4)%6, settlements[i]);
       settlements[i].add(adjHexs[i%6]);
    }
    return settlements[i];
  }
  
  Road newRoad(int i){
    //float rad = 2/sqrt(3)*60;
    float x1 = centerx + 60*cos(TWO_PI/6 * i + PI/6);
    float y1 = centery + 60*sin(TWO_PI/6 * i + PI/6);
    roads[i] = new Road(x1, y1);
    roads[i].add(this);
    if (adjHexs[i] != null){
       adjHexs[i].addRoad((i+3)%6,roads[i]);
       roads[i].add(adjHexs[i]);
    }
    return roads[i];
  }


  boolean inHex(int x, int y){
      return sqrt(sq(x-centerx)+sq(y-centery)) < sqrt(3)/2*60;  
  }  
  /*boolean onRoad(int x, int y){
  
  }*/
  
  /*used during the USER's turn to determine whether they can 
  build a settlement in a given location*/
  int checkSettlement(int x, int y, int c){
    for (int i = 0; i < settlements.length; i++){
      if (settlements[i].inRadius(x,y)){
        if (!settlements[i].isBuilt){
          if (checkAdjSets(i)){           
             //buildSettlement(i);    
             return 0;  //0 means that the settlement can be built
             //return true;
          } else {
             settlements[i].setColor(#FF15F0);  //not valid   
             return 2; // 2 means that the settlement cannot be built
          }
        }else if (c == settlements[i].col){  //already built     
          //settlements[i].buildCity(); 
          return 1; //means that a settlement of the players color has already been built here
        }       
      }
    }
    return 3; //did not click on a settlement
  }
  
  /*function used by COM player to determine whether a selected 
  settlement can be built
  randomly inputed j is a displacement, c is the color */
  boolean checkSettlement(int j, int c){
    for (int i = 0; i < settlements.length; i++){
        if (!settlements[(i+j)%6].isBuilt){
          if (checkAdjSets((i+j)%6)){
             buildSettlement((i+j)%6, c); 
             settlements[(i+j)%6].setColor(c);
             return true;    
        }else if (c == settlements[i].col)  //already built     
          settlements[i].buildCity();        
      }
    }
    return false;
  }
  
  Hexagon hexInDir(float angleFromCenter){
   for(int i = 0; i<6; i++){
    float j = (float)(i) + 0.5;
    int nextX =(int)(3/2 * (centerx + 60*cos( (PI/3)*j ) ) );
    int nextY =(int)(3/2 * (centery + 60*sin( (PI/3)*j ) ) );
    //printAdjHexs();
    if( adjHexs[i].inHex(nextX, nextY) ){return adjHexs[i];}
   } 
   return null;
  }
  
  void printAdjHexs(){
   String s = "adj to "+this+": ";
   for(int i = 0; i<adjHexs.length; i++){s+=adjHexs[i]+", ";}
   println(s); 
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
  
  void buildSettlement(int i, int col){
    settlements[i].build(col);   
  }
  void buildSettlement(int x, int y, int col){
    int i = 0;
    for (int j = 0; j < settlements.length; j++)
      if (settlements[j].inRadius(x,y)){ i = j; }
    settlements[i].build(col);
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
    ellipse(centerx,centery,60,60);
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
        vertex(centerx + 60 * cos(angle * i),
          centery + 60 * sin(angle * i) );        
      }    
      endShape(CLOSE); 
  }*/
  
  void addHex(int pos, Hexagon h){ adjHexs[pos] = h; }

  void addSet(int pos, Settlement s){ settlements[pos] = s; }

  void addRoad(int pos, Road r){ roads[pos] = r; }
  
  Hexagon get(int pos){
     return adjHexs[pos]; 
  }
  
  boolean setValue(int val){
    dieValue = val;
    if (resource.equals("desert")){ dieValue=-1; }
    return true;
  }
  boolean setResource(String r){
     resource = r;
     return true;
   } 

}
