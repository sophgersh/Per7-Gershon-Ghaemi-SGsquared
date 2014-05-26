HexGrid grid;

void setup(){
 size(1200,700); //x=1200 so that we can have space to put stats and stuff
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
    
    for (int i = 0; i < grid.getGrid().length; i++){
     print(i+": ");
     for (Hexagon hex : grid.getGrid()[i].adjHexs){
        if (hex != null)
          print(hex.num+" ");
        else 
          print("null "); 
     }    
     println();
  }
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
    pressed.onSet(mouseX,mouseY);
    pressed = null;
  }
  for (Hexagon h : grid.getGrid()){
    if(h != null && h.inHex(mouseX,mouseY)){
      pressed = h;
      h.setColor(random(255));      
    }
  }
  
  
  
}
  



