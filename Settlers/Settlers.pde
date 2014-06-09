HexGrid grid;
Game game;

void setup(){
 size(1300,700); //x=1200 
 background(255);
 smooth();    
 game = new Game();
 //grid = new HexGrid();  
    
}


void draw(){
  
  //every cycle of the draw function, redraw whole canvas
  //LAYER 1: Hexagon Tile Grid
  //Layer 2: Settlements
  //Layer 3: Roads
  //Layer 4: Right Side With Info (Rules, Cards, Next Button, etc)
  
  //HexGrid.drawBoard() -- Layers 1 - 3
  //RightSide.drawInfo() -- componenents of Layer 4
  //Game.hexs() -- HexGrid.drawBoard() + RightSide.drawInfo() ****BUT FOR MOVING ON FROM FIRST SCREEN, NOT FOR CONTINUAL DRAWING****
  //Settlers.draw() -- HexGrid.drawBoard() + RightSide.drawInfo()
  
  
  /*if(game.stage > 0 && grid!=null && game.nextMoveButton(mouseX,mouseY)){
    println("drawing in Settlers mouse @" + mouseX+","+mouseY);
    grid.drawBoard();
    game.rightSide.drawInfo();}*/
  if(game.stage > 0 && mousePressed /*&& !game.rightSide.inResources()*/){
    display();
  }
}

void mousePressed(){
  //println("mouse at: "+mouseX+","+mouseY);
  //game.mousePressed(mouseX, mouseY);
  /*for (Settlement s1 : game.hg.settlements){
     if (s1.inRadius(mouseX, mouseY)){
       s1.setColor(#0BA074);
       for (Settlement r2 : s1.adjSets)
          r2.setColor(#7DA00B);
       //for (Road adjR : r.adjRoads)
         // if (adjR != null) adjR.setColor(#706DEA); 
     }
  }*/
  
    if (game.stage == 0){//choose color and create board
       if (game.selectColor(mouseX, mouseY))
          game.hexs();    
    } else if (game.stage == 1) {//first settlement
//        display();
        game.stageOne(mouseX,mouseY); 
    } else if (game.stage == 2){ //second settlement
//        display();
        game.stageTwo(mouseX,mouseY);
    } else if (game.stage == 3){ //regular gameplay
//        display();    
        game.stageThree(mouseX,mouseY);
    }
    
    /*if (game.diceClick()){
      game.rollDice();
      game.rightSide.displayDice();   
    }*/
  
}

void display(){
   println("displayed");
   clear();
   background(#05E7FA);
   smooth();   
   game.hg.drawBoard();
   if(cheat()){//skip to winning screen
    game.rightSide.winningScreen(game.players[game.user]); 
   }
   else if(game.winner!=null){
     game.rightSide.winningScreen(game.winner);
   }
   else if(game.rightSide.inTradeButton()){  
       game.rightSide.tradeScreen();  
   }
   else{
     if(game.rightSide.inTradeMode()){
       game.rightSide.tradeScreen();
     }
     else{  
       game.rightSide.drawInfo();
     }
   }  
   
}
  
void keyPressed() {
  if (key == 'b' || key == 'B') {
     //game.bpressed();
  }
 }
 
boolean cheat(){
  return mousePressed && mouseX<50 && mouseX>0 && mouseY<50 && mouseY>0;
}

