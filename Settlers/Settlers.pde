ArrayList<Hexagon> hexs = new  ArrayList<Hexagon>(); 
void setup(){
 size(1200,700);

 background(#05E7FA);
 smooth();  

  hexs.add(new Hexagon(150, 150, 50)); 
  hexs.add(new Hexagon(150, 250, 50)); 
  hexs.add(new Hexagon(250, 200, 50));
  
    for (int y = 0; y < 700; y+=50){
      for (int x = 0; x < 1200; x+=50){
         stroke(0, 50);
         ellipse(x, y, 50, 50);
      }
    } 
}



void draw(){
}

void mousePressed(){
  for (Hexagon h : hexs){
    if(h.inRadius(mouseX,mouseY)){
      h.setColor(random(255));
    }
  }
  
  
}
  



