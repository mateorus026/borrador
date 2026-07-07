PImage fondo, poster, yellowguy, redguy, duck, maestro1, maestro2, maestro3; 
PFont titulo, texto; 
String posterT, yellowT, redguyT, duckT, maestroT;
int estado, inicio; 

/* Explicación de abreviaturas
T: Titulo
I: Introduccion
Y: Yellow guy
R: Red guy
D: Duck guy
r: rect
t: text
i: image
y: y
x: x
*/

// Titulo
float Ty1, Ty2;

// Introduccion
float Iyr, Iyt, Iyi, Ixr, Ixt, Ixi;

// Yellow guy
float Yxi1, Yxr1, Yxt1, Yxi2, Yxr2, Yxt2;

// Red guy
float Rxi1, Rxr1, Rxt1, Rxi2, Rxr2, Rxt2;

// Duck guy
float Dxi1, Dxr1, Dxt1, Dxi2, Dxr2, Dxt2; 

// Variable para la entrada de los maestros desde arriba
float M_y; 

float vel; 

// Dimensiones y posición del botón de reinicio
float btnX, btnY, btnW, btnH;

void setup() { 
  size(640, 480); 
  // Imagenes cargadas 
  fondo = loadImage("fondo.jpg"); 
  poster = loadImage("poster.jpg"); 
  duck = loadImage("Duck.png"); 
  yellowguy = loadImage("yellow guy.png"); 
  redguy = loadImage("red guy.png"); 
  maestro1 = loadImage("maestro1.png"); 
  maestro2 = loadImage("maestro2.png"); 
  maestro3 = loadImage("maestro3.png"); 
   
  //textos
  posterT="Es una serie británica creada el 29 de julio del 2011 por un canal con el mismo nombre que la serie. Este busca burlarse de series para niños como Plaza Sésamo o los Muppets y los lleva a un lado más terrorífico y turbio. Sus protagonistas son:";
  yellowT="YELLOW GUY: Es el mas chico y el unico niño del elenco, por lo tanto el mas inocente y es el blanco de las burlas o regaños por parte de los maestros, y en ocaciones de sus amigos.";
  redguyT="RED GUY: Es un adulto joven pero algo mas malhumorado, pero es el primero en cuestionar las lecciones de sus maestros y el primero que logra escapar";
  duckT="DUCK: Es el personaje más excéntrico y de mayor edad. Le encanta argumentar y es muy refinado, pero suele sufrir destinos bastante extraños en los episodios.";
  maestroT="LOS MAESTROS: Son objetos cotidianos parlantes que aparecen de la nada para imponer lecciones sobre temas abstractos (como el tiempo, el amor o la tecnología). Aunque fingen ser amables y educativos al principio, se vuelven agresivos, manipuladores y llevan a los protagonistas a situaciones de pura pesadilla surrealista.";
   
  // Fuentes cargadas 
  titulo = loadFont("AgencyFB-Bold-100.vlw"); 
  texto = loadFont("AgencyFB-Reg-27.vlw"); 
  
  // Coordenadas fijas para el botón de reinicio (centrado)
  btnW = 200;
  btnH = 60;
  btnX = (width - btnW) / 2;
  btnY = (height - btnH) / 2;
   
  // Inicializar variables del juego
  restablecerVariables();
}

// Función auxiliar para inicializar y resetear todas las posiciones
void restablecerVariables() {
  estado = 0;
  inicio = millis();
  vel = 3;
   
  Ty1 = 225;
  Ty2 = 320;
   
  Iyr = 560;
  Iyt = 590;
  Iyi = 480;
  Ixr = 270;
  Ixt = 274;
  Ixi = 15;
   
  // Yellow guy: Entrada
  Yxi1 = -300;   
  Yxr1 = -640;   
  Yxt1 = -633;  
   
  // Yellow guy: Salida
  Yxi2 = 350;
  Yxr2 = 10;
  Yxt2 = 17;
   
  // Red guy: Entrada
  Rxi1 = -210;    
  Rxr1 = -590;    
  Rxt1 = -580;   
   
  // Red guy: Salida
  Rxi2 = 420;
  Rxr2 = 30;
  Rxt2 = 40;

  // Duck: Entrada
  Dxi1 = -210;
  Dxr1 = -590;
  Dxt1 = -580;

  // Duck: Salida
  Dxi2 = 100; 
  Dxr2 = 220; 
  Dxt2 = 228; 
  
  // Maestros
  M_y = -300; 
  
  // Asegurar que el bucle draw siga corriendo si se reinicia
  loop(); 
}

void draw () {
  image(fondo, 0, 0, width, height);

  // ---------------- PANTALLA 1 ----------------
  if (estado == 0) {
    textFont(titulo);
    text("DON´T HUG ME", 75, Ty1);
    text("I´M SCARED", 115, Ty2);

    if (millis() - inicio > 2000) {
      estado = 1;
    }
  }

  // ---------------- PANTALLA 2 (Créditos subiendo) ----------------
  else if (estado == 1) {
    textFont(titulo);
    text("DON´T HUG ME", 75, Ty1);
    text("I´M SCARED", 115, Ty2);

    noStroke();
    fill(255, 0, 0, 120);
    rect(270, Iyr, 355, 250);

    fill(255);
    textFont(texto);
    text(posterT, 274, Iyt, 350, 430);
    image(poster, 15, Iyi, 250, 400);

    Ty1 -= vel;
    Ty2 -= vel;
    Iyr -= vel;
    Iyt -= vel;
    Iyi -= vel;

    if (Ty2 < -50) {
      estado = 2;
      inicio = millis();
    }
  }

  // ---------------- PANTALLA 3 (Espera de la intro) ----------------
  else if (estado == 2) {
    noStroke();
    fill(255, 0, 0, 120);
    rect(270, 115, 355, 250);

    fill(255);
    textFont(texto);
    text(posterT, 274, 140, 350, 430);

    image(poster, 15, 56, 250, 400);

    if (millis() - inicio > 2000) {
      estado = 3;
      Ixr = 270;
      Ixt = 274;
      Ixi = 15;
    }
  }

  // ---------------- PANTALLA 4 (ENTRADA YELLOW GUY) ----------------
  else if (estado == 3) {
    noStroke();
    fill(255, 0, 0, 120);
    rect(Ixr, 115, 355, 250);
    fill(255);
    textFont(texto);
    text(posterT, Ixt, 140, 350, 430);
    image(poster, Ixi, 56, 250, 400);

    image(yellowguy, Yxi1, 40, 300, 480);
    fill(0, 76, 0, 120);
    rect(Yxr1, 240, 380, 140);
    fill(255);
    text(yellowT, Yxt1, 248, 370, 347);

    Ixr += vel;
    Ixt += vel;
    Ixi += vel;
    
    Yxi1 += vel;
    Yxr1 += vel;
    Yxt1 += vel;
    
    if (Yxi1 >= 350) {
      estado = 4;
      inicio = millis();
    }
  }

  // ---------------- PANTALLA 5 (YELLOW GUY SE QUEDA 2 SEGUNDOS) ----------------
  else if (estado == 4) {
    image(yellowguy, 350, 40, 300, 480);
    fill(0, 76, 0, 120);
    rect(10, 240, 380, 140);
    fill(255);
    text(yellowT, 17, 248, 370, 347);

    if (millis() - inicio > 2000) {
      estado = 5; 
    }
  }

  // ---------------- PANTALLA 6 (SALIDA YELLOW GUY + ENTRADA RED GUY) ----------------
  else if (estado == 5) {
    image(yellowguy, Yxi2, 40, 300, 480);
    fill(0, 76, 0, 120);
    rect(Yxr2, 240, 380, 140);
    fill(255);
    text(yellowT, Yxt2, 248, 370, 347);
    
    image(redguy, Rxi1, 80, 190, 500);
    fill(0, 0, 78, 120);
    rect(Rxr1, 200, 400, 150);
    fill(255);
    text(redguyT, Rxt1, 210, 380, 390);

    Yxi2 += vel;
    Yxr2 += vel;
    Yxt2 += vel;
    
    Rxi1 += vel;
    Rxr1 += vel;
    Rxt1 += vel;
    
    if (Rxi1 >= 420) {
      estado = 6;
      inicio = millis();
    }
  }

  // ---------------- PANTALLA 7 (RED GUY SE QUEDA 2 SEGUNDOS) ----------------
  else if (estado == 6) {
    image(redguy, 420, 80, 190, 500);
    fill(0, 0, 78, 120);
    rect(30, 200, 400, 150);
    fill(255);
    text(redguyT, 40, 210, 380, 390);

    if (millis() - inicio > 2000) {
      estado = 7;
    }
  }

  // ---------------- PANTALLA 8 (SALIDA RED GUY + ENTRADA DUCK) ----------------
  else if (estado == 7) {
    image(redguy, Rxi2, 80, 190, 500);
    fill(0, 0, 78, 120);
    rect(Rxr2, 200, 400, 150);
    fill(255);
    text(redguyT, Rxr2 + 10, 210, 380, 390);

    image(duck, Dxi1, 100, 250, 450); 
    fill(255, 213, 0, 120); 
    rect(Dxr1, 220, 400, 140);
    fill(255);
    text(duckT, Dxt1, 228, 370, 340);

    Rxi2 += vel;
    Rxr2 += vel;
    Rxt2 += vel;

    Dxi1 += vel;
    Dxr1 += vel;
    Dxt1 += vel;

    if (Dxi1 >= 420) { 
      estado = 8;
      inicio = millis();
    }
  }

  // ---------------- PANTALLA 9 (DUCK SE QUEDA ESTÁTICO) ----------------
  else if (estado == 8) {
    image(duck, 420, 100, 250, 450);
    fill(255, 213, 0, 120);
    rect(30, 220, 400, 140);
    fill(255);
    text(duckT, 40, 228, 370, 340);

    if (millis() - inicio > 2000) {
      estado = 9;
    }
  }

  // ---------------- PANTALLA 10 (SALIDA DE DUCK + ENTRADA MAESTROS) ----------------
  else if (estado == 9) {
    image(duck, 420, Dxi2, 250, 450);
    fill(255, 213, 0, 120);
    rect(30, Dxr2, 400, 140);
    fill(255);
    text(duckT, 40, Dxt2, 370, 340);

    Dxi2 += vel;
    Dxr2 += vel;
    Dxt2 += vel;

    image(maestro1, 120, M_y, 120, 180);
    image(maestro2, 260, M_y, 120, 180);
    image(maestro3, 400, M_y, 120, 180);
    
    noStroke();
    fill(0, 0, 255, 160); 
    rect(110, M_y + 200, 420, 180); 
    fill(255);
    text(maestroT, 116, M_y + 210, 410, 170); 
   
    if (M_y < 80) {
      M_y += vel;
    }

    if (Dxi2 > height && millis() - inicio > 6000) {
      estado = 10;
    }
  }
  
  // ---------------- PANTALLA 11 (SALIDA MAESTROS + BOTÓN REINICIO) ----------------
  else if (estado == 10) {
    
    image(maestro1, 120, M_y, 120, 180);
    image(maestro2, 260, M_y, 120, 180);
    image(maestro3, 400, M_y, 120, 180);
    
    noStroke();
    fill(0, 0, 255, 160); 
    rect(110, M_y + 200, 420, 180); 
    fill(255);
    text(maestroT, 116, M_y + 210, 410, 170);
    
    M_y += vel; 
    
    if (M_y + 200 > height) {
      stroke(255);
      strokeWeight(2);
      fill(200, 0, 0); 
      rect(btnX, btnY, btnW, btnH, 10); 
      
      fill(255);
      textAlign(CENTER, CENTER);
      textFont(texto);
      text("REINICIO", btnX + btnW/2, btnY + btnH/2 - 4);
      textAlign(LEFT, TOP); 
    }
  }
}


 void mousePressed() {
  if (estado == 10 && M_y + 200 > height) {
    if (mouseX >= btnX && mouseX <= btnX + btnW && mouseY >= btnY && mouseY <= btnY + btnH) {
      restablecerVariables();
    }
  }
}
