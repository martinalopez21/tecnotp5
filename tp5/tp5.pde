//import processing.sound.*;
import ddf.minim.*; 

Minim minim;
AudioPlayer player;
AudioPlayer player1;
AudioPlayer player2;

//AudioPlayer sonidoj, ganaste, choquetumba;
//SoundFile sonidoj, ganaste, choquetumba;

Personaje personaje;
Inicio inicio;
void setup() {
  size (900, 600);
  inicio= new Inicio();
  minim= new Minim (this);
  player= minim.loadFile("sonidojuego.mp3");
  player1= minim.loadFile("choque.mp3");
  player2= minim.loadFile("punto.mp3");

  //ganaste = new SoundFile (this, "punto.mp3");
  //sonidoj = new SoundFile (this, "sonido.mp3");
  // choquetumba = new SoundFile (this,"choque.mp3");
  // sonidoj.loop();
  //ganaste = minim.loadFile ( "punto.mp3");
  //sonidoj = minim.loadFile ( "sonido.mp3");
  //choquetumba = minim.loadFile ("choque.mp3");
}
void draw() {
  inicio.dibujar();
  inicio.estados();
  inicio.perder();
  inicio.creditos();
  inicio.reiniciar();
  //sonidoj.play();
  inicio.constTumbas();
  inicio.constCaramelos();
}
