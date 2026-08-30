PImage [] noelleW = new PImage[4];
PImage [] noelleS = new PImage[4];
PImage [] noelleJ = new PImage[12];
PImage [] noelleD = new PImage[4];

PImage maus;
PImage queso;
PImage fondo;

PFont deltaruneF;

int frameIndice = 0;   
int ultimoTiempo = 0;    
int velocidadAnimacionMs = 150;

//posicion y limtes de noelle
float posX = 117;
float posY = 610;

float velocidadMovimiento = 2.0; 
float velocidadRapida = 6.0;    
float limiteArriba = 310; 
float limiteDerecha = 326; 
float limiteIzquierda = 122; 
float limiteAbajo = 610;    

//variables y estado de maus
float mausX = 800;
float mausY = 356;
float mausVelocidad = 2.5;
float mausVelocidadEscape = 4.0;
float mausDestinoX = 592;

float quesoX = 536;
float quesoY = 334;

String estadoMaus = "ESPERANDO_SALTO";
int tiempoEsperaMaus = 0;
int duracionPausaMs = 2000; 

String estado = "SUBIR"; 

void setup(){
  size(800, 600);
  
  // carga de animaciones optimizada con función propia y ciclo for
  noelleW = cargarAnimacion("noelleW", 4);
  noelleS = cargarAnimacion("noelleS", 4);
  noelleJ = cargarAnimacion("noelleJ", 12);
  noelleD = cargarAnimacion("noelleD", 4);
  
  maus = loadImage("maus.png");
  queso = loadImage("cheese.png");
  fondo = loadImage("noelleroom.png");
  
  deltaruneF = createFont("deltarune.ttf", 32);
}

void draw(){
  image(fondo, -12, -12, 820, 620);
  
  controlarMaus();
  controlarEstado();
}

// función propia para cargar frames usando un array y ciclo for
PImage[] cargarAnimacion(String prefijo, int cantidadFrames) {
  PImage[] anim = new PImage[cantidadFrames];
  for (int i = 0; i < cantidadFrames; i++) {
    anim[i] = loadImage(prefijo + i + ".png");
  }
  return anim;
}

// logica del maus y el queso
void controlarMaus() {
  switch(estadoMaus) {
    
    case "ESPERANDO_SALTO":
      image(queso, quesoX, quesoY, 60, 75);
      if (estado.equals("SALTO")) {
        estadoMaus = "IR_AL_QUESO";
      }
      break;

    case "IR_AL_QUESO":
      image(queso, quesoX, quesoY, 60, 75);
      if (mausX > mausDestinoX) {
        mausX -= mausVelocidad;
      } else {
        estadoMaus = "ESPERAR_TIEMPO";
        tiempoEsperaMaus = millis();
      }
      image(maus, mausX, mausY, 60, 40);
      break;

    case "ESPERAR_TIEMPO":
      image(queso, quesoX, quesoY, 60, 75);
      image(maus, mausX, mausY, 60, 40);
      if (millis() - tiempoEsperaMaus > duracionPausaMs) {
        estadoMaus = "ESCAPAR_CON_QUESO";
      }
      break;

    case "ESCAPAR_CON_QUESO":
      mausX += mausVelocidadEscape;
      quesoX = mausX - 15;

      if (mausX <= width) {
        image(queso, quesoX, quesoY, 60, 75);
        reproducirInvertidoEstatico(maus, mausX, mausY, 60, 40);
      }
      break;
  }
}
// control de estados de noellle y mensaje final
void controlarEstado() {
  switch(estado) {
    
    case "SUBIR":
      if (posY > limiteArriba) {
        posY -= velocidadMovimiento;
        reproducirAnimacion(noelleW, posX, posY, velocidadAnimacionMs);
      } else {
        cambiarEstado("DERECHA"); 
      }
      break;
      
    case "DERECHA":
      if (posX < limiteDerecha) {
        posX += velocidadMovimiento; 
        reproducirAnimacion(noelleD, posX, posY, velocidadAnimacionMs);
      } else {
        cambiarEstado("SALTO");
      }
      break;
      
    case "SALTO":
      reproducirAnimacion(noelleJ, posX, posY, 100); 
      if (esUltimoFrame(noelleJ, frameIndice)) {
        cambiarEstado("IZQUIERDA");
      }
      break;
      
    case "IZQUIERDA":
      if (posX > limiteIzquierda) {
        posX -= velocidadRapida; 
        reproducirAnimacionInvertida(noelleD, posX, posY, 60); 
      } else {
        cambiarEstado("BAJAR"); 
      }
      break;

    case "BAJAR":
      if (posY < limiteAbajo) {
        posY += velocidadRapida; 
        reproducirAnimacion(noelleS, posX, posY, 60); 
      } else {
        cambiarEstado("DETENIDO");
      }
      break;
      
    case "DETENIDO":
      image(noelleS[0], posX, posY, 80, 100); 
      
      // mostrar texto cuando el ratón haya salido del lienzo
      if (mausX > width) {
        mostrarTextoContinuar();
      }
      break;
  }
}

void mostrarTextoContinuar() {
  textFont(deltaruneF);
  textAlign(CENTER, CENTER);
  
  float xCentrado = width / 2;
  float yCentrado = height - 60;
  
  // sombra
  fill(0);
  text("Presionar R para reiniciar", xCentrado + 2, yCentrado + 2);
  
  // mexto principal
  fill(39, 255, 242);
  text("Presionar R para reiniciar", xCentrado, yCentrado);
}
//funciones propias de reproduccion y control
void reproducirAnimacion(PImage[] animArray, float x, float y, int intervaloMs) {
  if (millis() - ultimoTiempo > intervaloMs) {
    frameIndice = (frameIndice + 1) % animArray.length;
    ultimoTiempo = millis();
  }
  image(animArray[frameIndice], x, y, 80, 100);
}

void reproducirAnimacionInvertida(PImage[] animArray, float x, float y, int intervaloMs) {
  if (millis() - ultimoTiempo > intervaloMs) {
    frameIndice = (frameIndice + 1) % animArray.length;
    ultimoTiempo = millis();
  }
  
  pushMatrix();
  translate(x + 80, y); 
  scale(-1, 1);         
  image(animArray[frameIndice], 0, 0, 80, 100);
  popMatrix();
}

void reproducirInvertidoEstatico(PImage img, float x, float y, float w, float h) {
  pushMatrix();
  translate(x + w, y);
  scale(-1, 1);
  image(img, 0, 0, w, h);
  popMatrix();
}

void cambiarEstado(String nuevoEstado) {
  estado = nuevoEstado;
  frameIndice = 0; 
  ultimoTiempo = millis();
}

// función propia con valor de retorno (boolean)
boolean esUltimoFrame(PImage[] animArray, int indiceActual) {
  return indiceActual == animArray.length - 1;
}

//reinicio
void keyPressed() {
  if ((key == 'r' || key == 'R') && estado.equals("DETENIDO") && mausX > width) {
    posX = 117;
    posY = 610;
    
    mausX = 800;
    quesoX = 536;
    quesoY = 334;
    estadoMaus = "ESPERANDO_SALTO";
    
    cambiarEstado("SUBIR");
  }
}
