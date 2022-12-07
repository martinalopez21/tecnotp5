class Tumba {
  float x, y;
  PImage tumba ;
   float returnX(){
return x;
}
float returnY(){
return y;
}
   Tumba (float  x_, float y_) {
    tumba= loadImage ("tumba.png");
    x= x_;
    y= y_;
   }
   void dibujar(){
 
  tumba.resize (120, 120);
  image (tumba,x, y);
  
   }
}
   
