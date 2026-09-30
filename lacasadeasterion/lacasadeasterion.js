function cargarSecuencia(prefijo,cantidad){
  let listaImagenes = [];
  for (let i= 1; i <= cantidad; i++){
    let ruta = "data/" + prefijo + i + ".png"
    listaImagenes[i] = loadImage(ruta);
  }
  return listaImagenes;
}

let fondos = [];
let letrero, creditos, InicoB, siguiente,textbox,eleccion;

let fuente, lineas;

let pantallaActual = 0;

function preload(){
fondos = cargarSecuencia("fondo", 10);
InicoB = loadImage ("data/inicio.png");
letrero = loadImage ("data/letrero.png");
creditos = loadImage ("data/creditos.png");
textbox = loadImage ("data/textbox.png");
siguiente = loadImage ("data/Flecha.png");
eleccion = loadImage("data/eleccion.png");

lineas = loadStrings("data/textojuego.txt");
fuente = loadFont("data/Grenze-SemiBoldItalic.ttf");


}

function setup() {
  createCanvas(800, 450);
}

function draw() {
  //inicio
 if (pantallaActual === 0) {
  dibujarPantallaInicio();
 //primera pantalla
 } else if (pantallaActual === 1) {
  dibujarEscenaDialogo(fondos[2],4);
 //segunda pantalla
  } else if (pantallaActual === 2) {
  dibujarEscenaEleccion(fondos[3],7,11,14);
 //tercera pantalla
 } else if (pantallaActual === 3) {
  dibujarEscenaDialogo(fondos[4],18);
 }
 //cuarta pantalla
  else if (pantallaActual === 4) {
  dibujarEscenaEleccion(fondos[5],21,25,28);
}
 //quinta pantalla
 else if(pantallaActual===5){
  dibujarEscenaDialogo(fondos[6],32);
 }
 //sexta pantalla
 else if (pantallaActual===6){
  dibujarEscenaEleccion(fondos[7],35,39,42);
 }
 //septima pantalla
 else if (pantallaActual===7){
  dibujarEscenaDialogo(fondos[8],49);
 }
 //octava pantalla
 else if (pantallaActual===8){
  dibujarEscenaEleccion(fondos[9],49,53,56);
 }
 //novena pantalla
 else if(pantallaActual===9){
  dibujarEscenaDialogo(fondos[10],60);
 }



}

function dibujarPantallaInicio() {
  image(fondos[1], 0, 0, width, height);
  image(InicoB, 300, 300, 180, 140);
  image(letrero, 220, 20, 320 , 120);
  image(creditos, 600, 380, 180, 60);
}

function dibujarEscenaDialogo(imgFondo,texto) {
  image(imgFondo,0,0,width,height);
  image(textbox,100,280,600,180);
  image(siguiente,700,380,90,60);

  textFont(fuente);
  textSize(18);
  text(lineas[texto],150,360,515,80);
}

function dibujarEscenaEleccion(imgFondo,textoPrincipal,eleccion1,eleccion2){
  image(imgFondo,0,0,width,height);
  image(textbox,100,240,600,180);
  image(eleccion,120,360,220,80);
  image(eleccion,420,360,220,80);

  //texto principal
  textFont(fuente);
  textSize(18);
  textAlign(LEFT,BASELINE);
  text(lineas[textoPrincipal],160,315,500,80);

  //Texto elecciones
  textSize(14);
  textAlign(CENTER,CENTER);
  text(lineas[eleccion1],140,355,180,80);
  text(lineas[eleccion2],440,355,180,80);

  textAlign(LEFT, BASELINE);

}

function botonClickeado(x, y, ancho, alto) {
  return mouseX >= x && mouseX <= x + ancho && mouseY >= y && mouseY <= y + alto;
}

function clickSiguiente(pantallaaDestino){
  if(botonClickeado(700,380,90,60)){
    pantallaActual = pantallaaDestino;
  }
}

function clickelEccionIzquierda(pantallaDestino){
  if(botonClickeado(120,360,220,80)){
    pantallaActual = pantallaDestino;
  }
}

function clickEleccionDerecha(pantallaDestino){
  if (botonClickeado(420,360,220,80)){
    pantallaActual = pantallaDestino
  }
}

function mousePressed(){
  if (pantallaActual === 0) {
    if (botonClickeado(300, 300, 180, 140)) {
      pantallaActual = 1;
    }
  } else if (pantallaActual===1){
    clickSiguiente(2);
  } else if (pantallaActual===2){
    clickelEccionIzquierda(3);
    clickEleccionDerecha(5);
  }else if (pantallaActual===3){
  clickSiguiente(4);
  }else if (pantallaActual===4){
  clickelEccionIzquierda(7);
  clickEleccionDerecha(9);
  }
  else if (pantallaActual===5){
    clickSiguiente(6)
  }
  else if (pantallaActual===7){
    clickSiguiente(8)
  }
}
