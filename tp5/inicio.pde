class Inicio {

  String puntaje = ("Puntos:");
  String vidas = ("vidas:");
  String texto= ("Presione la letra i para volver al inicio.");
  PFont fuente;
  String estado;
  boolean choque, recolectar;
  PImage fondo, principal, ganaste, perdiste, creditos;
  int puntos, a, b, vida, u;
  Personaje personaje ;
  Caramelo[] caramelos;
  Tumba[] tumbas;


  Inicio () {
    a= 0;
    b= mouseY;
    u=1;


    personaje= new Personaje ( b, a++); //PERSONAJE
    estado = "inicio";
    //IMAGENES
    principal= loadImage ("inicio.png"); 
    fondo= loadImage ("fondo.png");
    ganaste= loadImage ("ganaste.png"); 
    perdiste= loadImage ("perdiste.png"); 
    creditos= loadImage ("credito.png"); 
    //VALOR VARIABLES
    puntos=0;
    vida=3;
    fuente= loadFont ("letra.vlw");

    //TUMBAS 
    tumbas= new Tumba [4];
    for (int i=0; i< tumbas.length; i++) {
      float yr=(random(235, 410));
      float xr=(random(150, 800));

      tumbas[i]=new Tumba(xr, yr);
    }
    //CARAMELOS 
    caramelos= new Caramelo [4];
    for (int i=0; i< caramelos.length; i++) {
      float yr=(random(235, 410));
      float xr=(random(150, 800));

      caramelos[i]=new Caramelo(xr, yr);
    }
  }
  void dibujar() {
    //FONDOS Y ESTADOS
    principal.resize (900, 600);
    image (principal, 0, 0); 
    println(estado);
    println(choque);

    b=mouseY;
    //  println( a,b);


    if (estado== "jugar") {   //ESTADO JUGAR
      fondo.resize (900, 600);
      image (fondo, 0, 0); 
      textFont(fuente);
      textSize(25);
      text (puntaje+puntos, 30, 100);
      text (vidas+vida, 230, 100);
        player.play();


      //caramelos.dibujar();

      //tumba.dibujar();
      personaje.dibujar(a++, b);
    }
    if (estado=="ganaste") {   //GANAR
      ganaste.resize (900, 600);
      image (ganaste, 0, 0);
    }
    if (estado=="perdiste") {  //PERDER
      perdiste.resize (900, 600);
      image (perdiste, 0, 0);
    }
  }


  void constTumbas() {
    if (estado== "jugar") {
      for (int i=0; i< tumbas.length; i++) {
        tumbas[i].dibujar();
        if (dist (personaje.returnX(), personaje.returnY(), tumbas[i].returnX(), tumbas[i].returnY()) <= 10 && choque == false) {
          vida--;
          player1.play();
          choque = true;
       
        }
        if (dist (personaje.returnX(), personaje.returnY(), tumbas[i].returnX(), tumbas[i].returnY()) >= 10 && choque == true) {
          choque = false;
        }
      }
    }
  }


  void constCaramelos() {
    if (estado== "jugar") {
      for (int i=0; i< caramelos.length; i++) {
        caramelos[i].dibujar();

        if (dist (personaje.returnX(), personaje.returnY(), caramelos[i].returnX(), caramelos[i].returnY())<= 10 && recolectar == false) {
          puntos ++;
          player2.play();
          recolectar = true;
        }
        if (dist (personaje.returnX(), personaje.returnY(), tumbas[i].returnX(), tumbas[i].returnY()) >= 10 && recolectar == true) {
          recolectar = false;
        }
      }
    }
  }

  void estados() {
    if (mousePressed && estado== "inicio" ) {
      estado= "jugar" ;
    }
    if (a >= 900) {
      estado="ganaste";
      a=0;
    }
    if (  mousePressed && estado=="ganaste") {
      estado="creditos";
    }
    if (estado=="perdiste" && mousePressed) {
      estado="creditos";
      vida=3;
    }

    if (estado=="creditos" && key=='i') {
      estado="inicio";
    }
  }


  void perder() {
    //if ( choque == true) {
    //vida-=1;
    // }
    if (vida == 0) {
      estado="perdiste";
    }
  }
  void creditos() {
    if (estado=="creditos") {
      creditos.resize (900, 600);
      image (creditos, 0, 0); 
      text (texto, 50, 550);
      puntos=0;
      vida=3;
      a= 0;
      b= mouseY;
    }
  }
  void reiniciar() {
    if (estado == "inicio") {
      puntos=0;
      vida=3;
      a= 0;
      b= mouseY;
    }
  }
}
