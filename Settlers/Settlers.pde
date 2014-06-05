HexGrid grid;
Game g;

void setup(){
 size(1200,700); //x=1200 
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


void mousePressed(){
  //println("mouse at: "+mouseX+","+mouseY);
  g.mpressed(/*mouseX,mouseY*/);
}
  
  
void keyPressed() {
  if (key == 'b' || key == 'B') {
     g.bpressed();
  }
 }
  

  



