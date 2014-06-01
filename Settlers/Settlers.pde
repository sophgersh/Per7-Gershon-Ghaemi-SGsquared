HexGrid grid;
Game g;

void setup(){
 size(1200,700); //x=1200 so that we can have space to put stats and stuff
 background(255);
 smooth();    
 g = new Game();
 //grid = new HexGrid();  
    
}


void draw(){
  /* some way of highlighting the thing the mouse is over
  for (Hexagon h : grid.getGrid()){
    if (h != null){
      h.mouseOver(h.inRadius(mouseX,mouseY));
    }
  }*/
}

Hexagon pressed;
void mousePressed(){
  //println(mouseX+","+mouseY);
  g.mpressed(mouseX,mouseY);
}
  
  

  



