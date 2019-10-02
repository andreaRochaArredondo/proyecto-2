import processing.sound.*;

import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;


PImage paloma;
PImage grano;
PImage micro;
PImage titulo;
PImage que;
PImage fin;
PImage ay;

Texto tx;
Box2DProcessing box2d;
SoundFile file;
SoundFile beel;
SoundFile intro;
SoundFile ups;


int pantalla = 0;
float x;
float y;
float a;
float b;
boolean aparecio = false;
int contador;


ArrayList<Paloma> palomas;

Plato plat;
Paloma pop;
flujoPantallas uno;


class flujoPantallas{
  int estado;
  
  flujoPantallas(){
    this.estado = 0;
  }
  
  void display(){
    switch(this.estado){
    case 0:
    background(200,20,0);
     imageMode(CORNER);
      image(titulo,0,0);   
      tx.Tcaso1();
     
    break;
    case 1:
    background(200,20,0);    
    if(random(2)>1.94){
     aparecio = true;
     x = random(800);
     y = random(500);
     a = random(800);
     b = random(500);
  }
  
  if(aparecio == true){
    imageMode(CENTER);
    image(paloma,x,y,50,50);
    imageMode(CENTER);
    image(paloma,a,b,60,60);
    contador++;
  }
  
  if(contador>100){
    aparecio = false;
    contador = 0;
  }
    
    tx.Tcaso2();
    
      break;
    case 2:
      background(0,255,0);
      imageMode(CORNER);
      image(micro,0,0);
      if (random(1) < 0.2) {
    float sz = random(10,10);
    palomas.add(new Paloma(random(width),10, sz));
}
 for (int i = palomas.size()-1; i >= 0; i--) {
    Paloma p = palomas.get(i);
    p.display();
   
    if (p.done()) {
      palomas.remove(i);
    }
  }
      
    break;
    case 3:
     imageMode(CORNER);
      image(fin,0,0);
      tx.Tcaso4();
      
    break;
    case 4:
     imageMode(CORNER);
      image(ay,0,0);
      tx.Tcaso5();
    break;
  }
}

  
  
  
  void cambioPantalla(){
    estado++;
  if(estado>4){
    estado = 0;
  }
  }
  }
  
  




void setup(){
    size(895,531);
   uno = new flujoPantallas(); 
   
  smooth();
 
  file= new SoundFile(this,"pop_mezcla_01.wav");
  beel= new SoundFile(this,"campana_01.wav");
  intro= new SoundFile(this,"cangrejo.wav");
  ups= new SoundFile(this,"ayy.wav");
 
  tx = new Texto();
  paloma = loadImage("popcorn-single.png");
  grano = loadImage("granomaiz.png");
  micro = loadImage("La-Casa-Tecno-el-plato-de-microondas-2.jpg");
  titulo = loadImage("TITULO.png");
  que = loadImage("cropped-Popcorn-ca-BG-01.jpg");
  fin = loadImage("listas.jpg");
  ay = loadImage("ay.jpg");
  box2d = new Box2DProcessing(this);
  box2d.createWorld();

  box2d.listenForCollisions();

  palomas = new ArrayList<Paloma>();

  plat = new Plato(width/2, height-5, width, 10);
  
  if(pantalla == 0){
    intro.loop();
  }
  

}



void draw(){
  background(255);
  uno.display();  

  box2d.step();

}



void mousePressed(){
  uno.cambioPantalla();
 pantalla ++;
  
  if(pantalla==1){
  intro.loop();
    file.stop();
    beel.stop();
    ups.stop();
}
  
  
if(pantalla==2){
  file.loop();
    intro.stop();
    beel.stop();
    ups.stop();
  
}
if(pantalla==3){
    beel.play();
    intro.stop();
    file.stop();
     ups.stop();
}

if(pantalla==4){
    ups.play();
    intro.stop();
    file.stop();
     beel.stop();
}

if(pantalla == 5){
pantalla = 0;
intro.loop();
}
}



void beginContact(Contact cp) {
 
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();
  Body b1 = f1.getBody();
  Body b2 = f2.getBody();

  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();

  if (o1.getClass() == Paloma.class && o2.getClass() == Paloma.class) {
    Paloma p1 = (Paloma) o1;
    p1.borrar();
    Paloma p2 = (Paloma) o2;
    p2.borrar();
  }

  if (o1.getClass() == Plato.class) {
    Paloma p = (Paloma) o2;
    p.change();
  }
  if (o2.getClass() == Plato.class) {
    Paloma p = (Paloma) o1;
    p.change();
  }

}

void endContact(Contact cp) {
}
