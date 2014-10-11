Colector buffer, colector; //<>//
ArrayList<Portal> portales;
ArrayList<Misil> misiles;
boolean tokenKill;
float escala;

void setup() {
  size(600, 600);
  //size(displayWidth, displayHeight);

  escala = width/200;
  misiles = new ArrayList<Misil>();
  portales = new ArrayList<Portal>();
  portales.add(new Portal(random(width), random(height)));
}

void draw() {
  background(0);

  if (frameCount % 60 == 0) portales.add(new Portal(random(width), random(height)));

  if (misiles.size() > 0) {
    int i = 0;
    while ( i < misiles.size () ) {
      Misil m = misiles.get(i);
      m.dibujar();
      m.act();
      if (tokenKill) {
        if (m.kill(colector)) {
          misiles.remove(i);
          i = 0;
        } else i++;
      } else i++;
    }
    tokenKill = false; //despues del loop
  }

  if (portales.size() > 0) {
    for (int i=0; i < portales.size(); i++) {
      Portal p = portales.get(i);
      p.dibujar();
      p.act();
      if (p.termino()) {
        portales.remove(i);
      }
    }
  }

  if (buffer != null) buffer.dibujar();

  text(frameRate, 5, height-5);
}

void mousePressed() {
  buffer = new Colector(mouseX, mouseY);
}

void mouseDragged() {
  buffer.mouseDragged();
}

void mouseReleased() {
  colector = buffer; //copio el buffer al colector
  buffer = null; //borro el buffer
  tokenKill = true; //habilito la ¡muerte!
}
