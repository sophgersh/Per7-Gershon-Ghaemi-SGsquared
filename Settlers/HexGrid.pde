class HexGrid{
   Hexagon[] hexs;  
   ArrayList<Road> roads;
   ArrayList<Settlement> settlements; 
   final int[] VALUES = {2,3,3,4,4,5,5,6,6,8,8,9,9,10,10,
                          11,11,12};
   final String[] RESOURCES = {"forest", "wheat", "sheep", 
                                "stone", "brick", "desert"};
    //4 forest tiles, 4 wheat, 4 sheep, 
    //3 stone tiles, 3 brick, 1 desert
    
   HexGrid(){
     hexs = new Hexagon[19]; 
     roads = new ArrayList<Road>();
     settlements = new ArrayList<Settlement>();   
     //new Road( 40, 500);
     makeHexs();
     makeSets();
     makeRoads();
   }
   
   void drawBoard(){
      for (int i = 0; i < hexs.length; i++){
         hexs[i].drawHex();
      } 
      for (int i = 0; i < settlements.size(); i++){
         settlements.get(i).drawSet(); 
      }
      for (int i = 0; i < roads.size(); i++){
         roads.get(i).drawRoad();
      }
   }

  //creates the HexGrid with 19 hexagons, and the web of connection between them   
   void makeHexs(){   
     for (int i = 0; i < hexs.length; i++){
        hexs[i] = new Hexagon(i); 
     }   
     setResourcesAll();
     setValuesAll();
     hexs[0].setXY(350,350);
     center();
     float angle = TWO_PI/6;
     for (int i = 1; i <= 6; i++){
        hexs[i].addHex((i+1)%6,hexs[i%6+1]); //i and i+1
        hexs[i].addHex((i+2)%6,hexs[0]); //i and i-1
        hexs[i].addHex((i+3)%6,hexs[(i+4)%6+1]);
        for (int j = i-1; j <= i; j++){          
          float x = hexs[i].centerx + 2*60 * cos(angle*(j%6)+PI/6);
          float y = hexs[i].centery + 2*60 * sin(angle*(j%6)+PI/6);
          hexs[i+j+6].setXY(x,y); 
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
        float x = h.centerx + 2*60*cos(angle*(i-1)+PI/6);
        float y = h.centery + 2*60*sin(angle*(i-1)+PI/6);
        hexs[i].setXY(x,y);
        hexs[0].addHex(i-1, hexs[i]);        
     }  
  }
   
  void makeRoads(){
    for(int i = 0; i < 19; i++){
       Hexagon h = hexs[i];
       Road[] r = h.roads;
       for (int j = 0; j < r.length; j++){
         if (r[j] == null){
           roads.add(h.newRoad(j));
           r[j].findAdjSettlements();          
         }
       } 
     }
     for (Road r : roads){
        r.findAdjRoads();
     }
   }
   
   
   /*
   void connectRoadsSetts(){
      for (Settlement s : settlements){
         for (int i = 0; i < s.adjRoads.length; i++){
            Road r = s.adjRoads[i];
            if (r != null){
               r.addRoad(???);
            }
         } 
       }
=======
    }*/
//>>>>>>> 6ded842f25804eb0831f6a5478e5e8a836036383
//>>>>>>> FETCH_HEAD
   //}
   //}
   
   void makeSets(){
      for (int i = 0; i < hexs.length; i++){
         Hexagon h = hexs[i];
         Settlement[] sets = h.settlements;
         for (int j = 0; j < sets.length; j++){
            if (sets[j] == null)
               settlements.add(h.newSet(j));
         }
      }
   }
  
   void mutualAdd(int pos1, int h1, int pos2, int h2){
     hexs[h1].addHex(pos2, hexs[h2]);
     hexs[h2].addHex(pos1, hexs[h1]);
   }

  

  //sets the dieValues of the Hexagons
  void setValuesAll(){
    int[] chosenValues = scramble(VALUES);
    int temp = 0;
    for(int i = 0; i<18; i++){
      if(hexs[i].resource.equals("desert")){
        //println("desert tile");
        hexs[i].setValue(-1); 
        /*Hexagon temp = hexs[i];
        hexs[i] = hexs[18];
        hexs[18] = temp;
        i--;*/
        temp = chosenValues[i];
      } else {
        hexs[i].setValue( chosenValues[i]);}
    }
    hexs[18].setValue(temp);
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
   void setResourcesAll(){
    int[] tiles = {0,1,2,3,4,5,6,7,8,9,10,11,12,
                    13,14,15,16,17,18};
    tiles = scramble(tiles);
    int[] resourceAmts = {4,4,4,3,3,1};
    //4 forest tiles, 4 wheat, 4 sheep, 
    //3 stone tiles, 3 brick, 1 desert
    int total = 0; 
    int j = 0;
    for(int a = 0; a<resourceAmts.length; a++){
     for(int b = 0; b<resourceAmts[a]; b++){
      //int l = tiles[total];
      //Hexagon m = hexs[l];
      //String resource = RESOURCES[j];
      //hexs[ tiles[total] ].setResource( RESOURCES[j] );
      hexs[ tiles[total] ].setResource(RESOURCES[j]);
      total++;
     }
     if(j<RESOURCES.length){j++;} 
    }
    for (Hexagon h : hexs)
      h.setBackground();
    
   } 
}
