ArrayList<Polygon> polys = new ArrayList<Polygon>();


void setup(){
 size(300,300);
 background(255);
 //smooth();  
  Polygon p = new Polygon(6, 150, 150, 100);
  polys.add(p);
  
  
}


void draw(){
}

void mousePressed(){
  if(polys.get(0).inRadius(mouseX,mouseY)){
    polys.get(0).setColor();
    
  }
  
  
}
  



