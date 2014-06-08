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
  
  
  if(game.stage > 0 && grid!=null && game.nextMoveButton(mouseX,mouseY)){
    println("drawing in Settlers mouse @" + mouseX+","+mouseY);
    grid.drawBoard();
    game.rightSide.drawInfo();}
}

void mousePressed(){
  //println("mouse at: "+mouseX+","+mouseY);
  //game.mousePressed(mouseX, mouseY);
  /*for (Road r1 : game.hg.roads){
     if (r1.inRadius(mouseX, mouseY)){
       r1.setColor(#0BA074);
       for (Road r2 : r1.adjRoads)
          if (r2 != null) r2.setColor(#7DA00B);
       //for (Road adjR : r.adjRoads)
         // if (adjR != null) adjR.setColor(#706DEA); 
     }
  }*/
  
    if (game.stage == 0){
       if (game.selectColor(mouseX, mouseY))
          game.hexs();    
    } else if (game.stage == 1) {
        game.stageOne(mouseX,mouseY); 
    } else if (game.stage == 2){ 
        game.stageTwo(mouseX,mouseY);
    } else if (game.stage == 3){     
        game.stageThree(mouseX,mouseY);
    }
    
    /*if (game.diceClick()){
      game.rollDice();
      game.rightSide.displayDice();   
    }*/
  
}
  
void keyPressed() {
  if (key == 'b' || key == 'B') {
     //game.bpressed();
  }
 }

