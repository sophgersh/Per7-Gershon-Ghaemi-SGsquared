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
      
   }
 
  Hexagon get(int i){
    return hexs[i];
  }
  
  Hexagon[] getGrid(){
    return hexs;
  }
  
}
