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
     setValues();
     setResources();
   }

  //creates the HexGrid with 19 hexagons   
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

  void background(){
   PImage photo = loadImage("catan5.jpg");
   image(photo,0,0);
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
                   13,14,15,16,17,18};
   tiles = scramble(tiles);
   int[] resourceAmts = {4,4,4,3,3,1};
   //4 forest tiles, 4 wheat, 4 sheep, 
   //3 stone tiles, 3 brick, 1 desert
   int total = 0; 
   for(int a = 0; a<resourceAmts.length; a++){
    for(int b = 0; b<resourceAmts[a]; b++){
     //***DIAG***
     //println("a: "+a+"\tb: "+b+"\ttotal: "+total);
     //int randomTile = tiles[total];
     //Hexagon randomHex = hexs[randomTile];
     //randomHex.setResource( RESOURCES[a] );
     hexs[ tiles[total] ].setResource( RESOURCES[a] );
     total++;
    }
   }
   
  } 
}
