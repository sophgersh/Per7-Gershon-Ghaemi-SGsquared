void setup(){
  size(700,800);
  background(255);
  smooth();
  
  for(int x = 100; x<700; x+=100){
    for(int y = 100; y<800; y+=100){
      for(int j = x/100; j<7; j+=1){
       polygon(6, x, y, 50); }
    }
  }
}

void draw(){
    PShape[] hexes = new PShape[10];
    if(mousePressed){
      polygon(6, mouseX, mouseY, 10);
    }
    
}

void polygon(int n, float cx, float cy, float r) { 
  float angle = 360.0 / n; 
  beginShape(); 
  for (int i = 0; i < n; i++) { 
    vertex(cx + r * cos(radians(angle * i)), cy + r * sin(radians(angle * i))); 
  } 
  endShape(CLOSE); 
} 
