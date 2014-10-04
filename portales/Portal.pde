class Portal {
  float x, y, altura, ancho;
  int t;

  Portal(float _x, float _y) {
    x = _x;
    y = _y;
    t = 0;
    altura = 20*escala;
    ancho = 2*escala;
  }

  void dibujar() {
    pushStyle();
    rectMode(CENTER);
    fill(255, 50, 50);
    noStroke();
    if (t < 180) rect(x, y, ancho, altura*sin(radians(t)));
    if (t == 90) misiles.add(new Misil(x, y));
    popStyle();
  }

  void act() {
    t += 3; //multiplo de 90 grados
  }

  boolean termino() {
    return (t > 180);
  }
}
