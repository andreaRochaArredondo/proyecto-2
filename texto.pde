class Texto{
  
  void Tcaso1(){
    PFont f = createFont("AGENCYR.TTF",48);
    textFont(f);
    textAlign(CORNER);
    fill(0,0,0);
     textSize(30);
    text("Presiona con el mouse para continuar",269,450);
}
  void Tcaso2(){
     fill(0,0,0);
     textSize(30);
    text("Bienvenido al simulador de palomitas",255,50);
   text("toda la diversión de hacer palomitas sin",255,100);
   text("comer palomitas.",255,150);
   textSize(25);
   text("Presiona >continuar< para ver palomitas virtuales ",255,200);
   text("explotando acompañadas de la canción Popcorn.",255,250);
   text("Diviertete, en cuanto ya no quieras divertirte",255,300);
    text("presiona la pantalla con el mouse y estarán listas",255,350);
    text("tus palomitas virtuales. :)",255,400);
   fill(0,0,0);
     textSize(30);
    text("Presiona con el mouse para continuar",269,500);
}

 void Tcaso4(){
 fill(255);
    textSize(80);
    text("Palomitas listas!",450,100);
 }
 
  void Tcaso5(){
 fill(255);
    textSize(40);
    text("Ay! se te cayeron :C",550,100);
    textSize(30);
    text("tendras que iniciar de nuevo",550,150);
    text("clickea la pantalla",550,200);
 }
}
