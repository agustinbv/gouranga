class Colector {
  PVector pos;
  PVector mov;
  float r;
  
  Colector(float _x, float _y){
    pos = new PVector(_x, _y);
    mov = new PVector(_x, _y);
    r = 10*escala;
  }
  
  void dibujar() {
    pushStyle();
    float c = constrain(r, 0, 255);
    fill(c, 180);
      
    strokeWeight(2*(r/100)*escala);
    //noStroke();
    ellipse(pos.x, pos.y, r, r); //ellipse usa el radio como diametro en X e Y, entonces queda de mitad de tamaño
    popStyle();
  }
  
  void mouseDragged() {
    mov.x = mouseX;
    mov.y = mouseY;
    r = pos.dist(mov);
  }
  
  PVector getPos(){
    return pos;
  }
  float getRadio(){
    return r;
  }
}
