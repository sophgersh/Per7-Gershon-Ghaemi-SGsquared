class HexGrid{
   Hexagon[] hexs;   
   
   HexGrid(){
     hexs = new Hexagon[19] ; 
     makethemhexs();
   }
   
   void makethemhexs(){     
     hexs[0] = new Hexagon(350,350,60);
     hexs[0].center();
     for (int i = 0; i < 6; i++){  
        hexs[i+1] = hexs[0].get(i);              
     }
     float angle = TWO_PI/6;
     for (int i = 1; i <= 6; i++){
        for (int j = i-1; j <= i; j++){
          
          float x = hexs[i].centerx+2*hexs[i].radius*
                    cos(angle*(j%6)+PI/6);
          float y = hexs[i].centery + 2*hexs[i].radius*
                    sin(angle*(j%6)+PI/6);
          hexs[i+j+6] = new Hexagon(x,y,hexs[i].radius); 
          hexs[i].add(j%6, hexs[i+j+6]);
        }
     }
   }
 
  Hexagon get(int i){
    return hexs[i];
  }
  
  Hexagon[] getGrid(){
    return hexs;
  }
  
}
