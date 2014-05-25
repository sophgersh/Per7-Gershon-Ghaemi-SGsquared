class HexGrid{
   ArrayList<Hexagon> hexs;
   
   HexGrid(){
     hexs = new  ArrayList<Hexagon>(); 
   }
   
    void add(Hexagon h){
     hexs.add(h); 
    }
  
  Hexagon get(int i){
    return hexs.get(i);
  }
  
}
