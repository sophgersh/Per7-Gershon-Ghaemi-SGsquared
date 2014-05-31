HexGrid grid;
Game g;

void setup(){
 size(700,700); //x=1200 so that we can have space to put stats and stuff
 background(#05E7FA);
 smooth();    
 g = new Game();
 //grid = new HexGrid();  
    
    
 /*for (int i = 0; i < grid.getGrid().length; i++){
     print(i+": ");
     for (Hexagon hex : grid.getGrid()[i].adjHexs){
        if (hex != null)
          print(hex.num+" ");
        else 
          print("null "); 
     }    
     println();
  }*/
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
  if (pressed != null){
    pressed.checkSettlement(mouseX,mouseY);
    pressed = null;
  }
  for (Hexagon h : grid.getGrid()){
    if(h != null && h.inHex(mouseX,mouseY)){
      print(h+": ");
      println(h.adjHexs);
      pressed = h;
      h.setColor(h.col+50);      
    }
  }
  
  
  
}
  



