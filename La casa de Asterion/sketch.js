let fondo1;
let fondo2;
let fondo3;
let fondo4;
let letrero;
let InicoB;
let creditos;
let siguiente;

let textbox;
let fuente;
let eleccion;

let lineas; 
let pantallaActual = 0;


function preload(){
InicoB = loadImage ("img/inicio.png");
fondo1 = loadImage ("img/fondo1.png");
fondo2 = loadImage ("img/fondo2.png");
fondo3 = loadImage ("img/fondo3.png");
fondo4 = loadImage ("img/fondo4.png");
letrero = loadImage ("img/letrero.png");
creditos = loadImage ("img/creditos.png");
textbox = loadImage ("img/textbox.png");
siguiente = loadImage ("img/Flecha.png");

lineas = loadStrings("text/textojuego.txt");
fuente = loadFont("text/Grenze-SemiBoldItalic.ttf");
eleccion = loadImage("img/eleccion.png");

}

function setup() {
  createCanvas(800, 450);


}

function draw() {
 if (pantallaActual === 0) {
  dibujarPantallaInicio();
 } else if (pantallaActual === 1) {
  dibujarSegundaPantalla();
  } else if (pantallaActual === 2) {
  dibujarTerceraPantalla();
 } else if (pantallaActual === 3) {
  dibujarCuartaPantalla();
 }
}

function dibujarPantallaInicio() {
  background(220);
  image(fondo1, 0, 0, width, height);
  image(InicoB, 300, 300, 180, 140);
  image(letrero, 220, 20, 320 , 120);
  image(creditos, 600, 380, 180, 60);
}

function dibujarSegundaPantalla() {
  background(220);
  image(fondo2, 0, 0, width, height);
  image(textbox, 100, 280, 600, 180);
  textFont(fuente);
  textSize(18);
  text(lineas[4], 160, 360, 515, 80);
  image(siguiente, 700, 380, 90, 60);
}

function dibujarTerceraPantalla() {
  background(220);
  image(fondo3, 0, 0, width, height);
  image(textbox, 100, 240, 600, 180);
  textFont(fuente);
  textSize(18);
  text(lineas[7], 160, 310, 500, 80); 
  
  image(eleccion, 120, 360, 220, 80);
  textSize(14);
  textAlign(CENTER, CENTER); 
  text(lineas[11],160,328,140,140);
  
  
  image(eleccion, 420, 360, 220, 80);
  textAlign(LEFT, BASELINE); 
  text(lineas[14], 480, 405);
}

function dibujarCuartaPantalla() {
  background(220);
  image(fondo4, 0, 0, width, height);
  image(textbox, 100, 280, 600, 180);
  textFont(fuente);
  textSize(18);
  fill(0);
  text(lineas[18], 160, 360, 500, 80);
  image(siguiente, 700, 380, 90, 60);
}

function dibujarquintaPantalla() {
  background(220);
  image(fondo3, 0, 0, width, height);
  image(textbox, 100, 280, 600, 180);
  textFont(fuente);

}

function mousePressed() {
  if (pantallaActual === 0) {
    if (mouseX >= 300 && mouseX <= 480 && mouseY >= 300 && mouseY <= 440) {
      pantallaActual = 1;
    }
  } else if (pantallaActual === 1) {
    if (mouseX >= 700 && mouseX <= 790 && mouseY >= 380 && mouseY <= 440) {
      pantallaActual = 2; 
    }
  } else if (pantallaActual === 2) {
  if ((mouseX >= 140 && mouseX <= 360 && mouseY >= 370 && mouseY <= 415) ||
        (mouseX >= 420 && mouseX <= 640 && mouseY >= 370 && mouseY <= 415)) {
      pantallaActual = 3; 
    }
  } else if (pantallaActual === 3) {
  if (mouseX >= 700 && mouseX <= 790 && mouseY >= 380 && mouseY <= 440) {
      pantallaActual = 0; 
    }
  }
}



