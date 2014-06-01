HexGrid grid;
Game g;

void setup(){
 size(700,700); //x=1200 so that we can have space to put stats and stuff
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
  if (g.stage == 0){
    if (g.selectColor(mouseX, mouseY))
      g.hexs();
  }else{
    if (pressed != null){
      pressed.checkSettlement(mouseX,mouseY);
      pressed = null;
    }
    for (Hexagon h : g.hg.getGrid()){
      if(h != null && h.inHex(mouseX,mouseY)){
        /*print(h+": ");
        println(h.adjHexs);*/
        pressed = h;
        h.setColor(h.col+50);      
      }
    }
  }
  
  
}
  



