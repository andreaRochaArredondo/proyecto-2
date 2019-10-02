class Paloma {

  Body body;
  float r;

  color col;
  int pto;
  int ima;
  boolean borrar = false;
 boolean tronado = false;
 
  Paloma(float x, float y, float r_) {
    r = r_;
    makeBody(x, y, r);
    body.setUserData(this);
    col = color(255,175,0);
    
  }

  void killBody() {
   box2d.destroyBody(body);
   }

  void borrar() {
    borrar = true;
  }
  
  
  void change() {
    tronado = true;
  }

  boolean done() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    if (pos.y > height+r*2 || borrar) {
      killBody();
      return true;
    }
    return false;
  }
   
  void display() {
    
    Vec2 pos = box2d.getBodyPixelCoord(body);

    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(a);
    fill(col);
    stroke(0);
    strokeWeight(1);
    imageMode(CENTER);
   image(grano,0, 0, r*4, r*4);
   
    popMatrix();
    
    if(tronado == true){
   
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(a);
    fill(col);
    stroke(0);
    strokeWeight(1);
    imageMode(CENTER);
   image(paloma,0, 0, r*6, r*6);
   
    popMatrix();
  }
  }

 
  void makeBody(float x, float y, float r) {

    BodyDef bd = new BodyDef();
   
    bd.position = box2d.coordPixelsToWorld(x, y);
    bd.type = BodyType.DYNAMIC;
    body = box2d.createBody(bd);

    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);

    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
   
    fd.density = 1;
    fd.friction = 0.1;
    fd.restitution = random(0.6,0.9);
    box2d.setGravity(0,random(-200,-500));

    body.createFixture(fd);

    body.setAngularVelocity(random(-10, 10));
  }
}
