class HexGrid{
   Hexagon[] hexs;   
   final int[] VALUES = {2,3,3,4,4,5,5,6,6,8,8,9,9,10,10,11,11,12};
   final String[] RESOURCES = {"wood", "wheat", "sheep", "stone", "brick"};
   
   HexGrid(){
     hexs = new Hexagon[19]; 
     makethemhexs();
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
  
}
