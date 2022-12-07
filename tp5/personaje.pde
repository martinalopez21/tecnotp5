class Personaje {
  int x, y;
  PImage p ;
float returnX(){
return x;
}
float returnY(){
return y;
}
  Personaje (int  x_, int y_) {
    p= loadImage ("personaje.png");
    x= x_;
    y= y_;
  }
  void dibujar(int xa, int ya) {
    x= xa;
    y= ya;

    p.resize (150, 150);
    image (p, x, y);
  }
}
