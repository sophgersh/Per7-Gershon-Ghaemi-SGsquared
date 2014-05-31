class HexGrid{
   Hexagon[] hexs;   
   final int[] VALUES = {2,3,3,4,4,5,5,6,6,8,8,9,9,10,10,
                          11,11,12};
    final String[] RESOURCES = {"forest", "wheat", "sheep", 
                                "stone", "brick", "desert"};
    //4 forest tiles, 4 wheat, 4 sheep, 
    //3 stone tiles, 3 brick, 1 desert
   HexGrid(){
     hexs = new Hexagon[19]; 
     makethemhexs();
   }

  //creates the HexGrid with 19 hexagons, and the web of connection between them   
   void makethemhexs(){   
     for (int i = 0; i < hexs.length; i++){
        hexs[i] = new Hexagon(i); 
     }   
     //DO THE THING HERE 
     hexs[0].drawHex(350,350);
     center();
     float angle = TWO_PI/6;
     for (int i = 1; i <= 6; i++){
        hexs[i].add((i+1)%6,hexs[i%6+1]); //i and i+1
        hexs[i].add((i+2)%6,hexs[0]); //i and i-1
        hexs[i].add((i+3)%6,hexs[(i+4)%6+1]);
        for (int j = i-1; j <= i; j++){          
          float x = hexs[i].centerx + 2*hexs[i].radius * cos(angle*(j%6)+PI/6);
          float y = hexs[i].centery + 2*hexs[i].radius * sin(angle*(j%6)+PI/6);
          hexs[i+j+6].drawHex(x,y); 
          mutualAdd((j+3)%6, i,  j%6, i+j+6); //i and generated (both)
          if (j == i){
            mutualAdd((i+1)%6, i+j+6,  (i+4)%6, i+j+5); //two generated with each other
            mutualAdd((i+2)%6, i%6+1,  (i+5)%6, i+j+6);//second generated with i+1
            int pos2 = ( i+j+7 < 18 ? i+j+7 : 7 );
            mutualAdd((i+4)%6, i+j+6,  (i+1)%6, pos2);           
          }          
        }
     }
   }
   
   void center(){
     Hexagon h = hexs[0];
     float angle = TWO_PI / 6;
     for (int i = 1; i <= 6; i++){
        float x = h.centerx + 2*h.radius*cos(angle*(i-1)+PI/6);
        float y = h.centery + 2*h.radius*sin(angle*(i-1)+PI/6);
        hexs[i].drawHex(x,y);
        hexs[0].add(i-1, hexs[i]);        
     }  
  }
   
   void mutualAdd(int pos1, int h1, int pos2, int h2){
     hexs[h1].add(pos2, hexs[h2]);
     hexs[h2].add(pos1, hexs[h1]);
   }

  void background(){
   PImage photo = loadImage("catan5.jpg");
   image(photo,700,0);
  } 

  //sets the dieValues of the Hexagons
  void setValues(){
    int[] chosenValues = scramble(VALUES);
    for(int i = 0; i<18; i++){
      hexs[i].setValue(chosenValues[i]);
    }
  }
  
  //randomly scrambles the values in an array
  //returns a new array, does not alter parameter
  int[] scramble(int[] arr){
   int[] newArr = new int[arr.length];
   for(int a =0; a<arr.length; a++){ newArr[a] = arr[a];}
   for(int i = 0; i<newArr.length; i++){
    int random = (int)random(newArr.length);
    int temp = newArr[i];
    newArr[i] = newArr[random];
    newArr[random] = temp;
   } 
   return newArr;
  }
  
  Hexagon get(int i){
    return hexs[i];
  }
  
  Hexagon[] getGrid(){
    return hexs;
  }
  
  //creates 4 forest tiles, 4 wheat, 4 sheep...etc. randomize
   void setResources(){
    int[] tiles = {0,1,2,3,4,5,6,7,8,9,10,11,12,
                    13,14,15,16,17,18,19};
    tiles = scramble(tiles);
    int[] resourceAmts = {4,4,4,3,3,1};
    //4 forest tiles, 4 wheat, 4 sheep, 
    //3 stone tiles, 3 brick, 1 desert
    int total = 0; 
    int j = 0;
    for(int a = 0; a<resourceAmts.length; a++){
     for(int b = 0; b<resourceAmts[a]; b++){
      hexs[ tiles[total] ].setResource( RESOURCES[j] );
      total++;
     }
     if(j<RESOURCES.length){j++;} 
    }
    
   } 
}
