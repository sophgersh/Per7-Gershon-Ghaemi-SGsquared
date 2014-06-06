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
  g.mpressed();
  for (Road r : g.hg.roads){
     if (r.inRadius(mouseX, mouseY)){
       r.setColor(#0BA074);
       for (Settlement s : r.adjSets)
          if (s != null) s.setColor(#7DA00B);
     }
  }
}
  
void keyPressed() {
  if (key == 'b' || key == 'B') {
     g.bpressed();
  }
 }
  

  



