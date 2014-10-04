class Misil {
  PVector pos, vel;
  float tam;
  int[] dir = {-1, 1}; 
  boolean marcado;

  Misil(float _x, float _y) {
    pos = new PVector(_x, _y);
    vel = new PVector(random(0.5, 2)*dir[int(random(2))], 0);
    tam = 2*escala;
  }

  void dibujar() {
    pushStyle();
    rectMode(CENTER);
    if (marcado) fill(0, 255, 0); else fill(255);
    noStroke();
    rect(pos.x, pos.y, tam, tam);
    popStyle();
  }

  void act() {
    pos.add(vel);
    bordes();
  }

  void bordes() {
    if ((pos.x > width) || (pos.x < 0)) {
      vel.x = vel.x * -1;
    }
    if ((pos.y > height) || (pos.y < 0)) {
      vel.y = vel.y * -1;
    }
  }
  
  boolean kill(Colector c) {
    return ( pos.dist(c.pos) < c.getRadio()/2 );
  }
  
  void marcar() {
    marcado = true;
  }
  
}
