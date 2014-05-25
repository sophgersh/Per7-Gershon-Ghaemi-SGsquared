HexGrid grid;

void setup(){
 size(1200,700);
 background(#05E7FA);
 smooth();    
 grid = new HexGrid();
  
    /*for (int y = 0; y < 700; y+=50){
      for (int x = 0; x < 1200; x+=50){
         stroke(0, 50);
         noFill();
         ellipse(x, y, 50, 50);
      }
    } */
}



void draw(){
}

void mousePressed(){
  for (Hexagon h : grid.getGrid()){
    if(h.inRadius(mouseX,mouseY)){
      h.setColor(random(255));
    }
  }
  
  
}
  



