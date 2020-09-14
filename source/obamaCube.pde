//Written by Mark Lyons, mlyons23@sidwell.edu
//Only authorized use of this code is permitted, with permission from Mark Lyons, and only me. 
//I will sue you, legit, for stealing this. Anyone can settle a lawsuit for $100, provided they also surrender the code.
float moveRate = 3.5;
float rotZRate = 0.06;
float mouseRotRate = 0.007;
PImage tex;
PImage img1;
PImage img2;
PImage img3;
float rotx = 0;
float roty = 0;
float rotz = 0;
float zTrans = 0;
float xTrans;
float yTrans;
boolean w =false;
boolean a =false;
boolean s = false;
boolean d = false;
boolean c =false;
boolean space =false;
boolean q = false;
boolean e = false;
float fov = 3.0;
void setup() {
  fullScreen(P3D);
  frameRate(144);
  smooth(64);
  img1 = loadImage("img1.jpg");
  img2 = loadImage("img2.jpg");
  img3 = loadImage("img3.jpg");
  tex = img1;
  textureMode(NORMAL);
  fill(255);
  stroke(color(44,48,32));
  xTrans = width/2;
  yTrans = height/2;
  perspective(PI/fov,(float)width/height,1,1000000);
}
void draw() {
  perspective(PI/fov,(float)width/height,1,1000000);
  background(0);
  noStroke();
  translate(xTrans, yTrans, zTrans);
  rotateX(rotx);
  rotateY(roty);
  rotateZ(rotz);
  scale(250);
  TexturedCube(tex);
  move();
}
void TexturedCube(PImage tex) {
  beginShape(QUADS);
  texture(tex);
  // +Z "front" face
  vertex(-1, -1,  1, 0, 0);
  vertex( 1, -1,  1, 1, 0);
  vertex( 1,  1,  1, 1, 1);
  vertex(-1,  1,  1, 0, 1);
  // -Z "back" face
  vertex( 1, -1, -1, 0, 0);
  vertex(-1, -1, -1, 1, 0);
  vertex(-1,  1, -1, 1, 1);
  vertex( 1,  1, -1, 0, 1);
  // +Y "bottom" face
  vertex(-1,  1,  1, 0, 0);
  vertex( 1,  1,  1, 1, 0);
  vertex( 1,  1, -1, 1, 1);
  vertex(-1,  1, -1, 0, 1);
  // -Y "top" face
  vertex(-1, -1, -1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1, -1,  1, 1, 1);
  vertex(-1, -1,  1, 0, 1);
  // +X "right" face
  vertex( 1, -1,  1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1,  1, -1, 1, 1);
  vertex( 1,  1,  1, 0, 1);
  // -X "left" face
  vertex(-1, -1, -1, 0, 0);
  vertex(-1, -1,  1, 1, 0);
  vertex(-1,  1,  1, 1, 1);
  vertex(-1,  1, -1, 0, 1);
  endShape();
}
void mouseDragged() {
  rotx += (pmouseY-mouseY) * mouseRotRate;
  roty += (mouseX-pmouseX) * mouseRotRate;
}
void move(){
  if(a) left();
  if(d) right();
  if(w) in();
  if(s) out();
  if(space) up();
  if(c) down();
  if(q) rotLeft();
  if(e) rotRight();
}
void keyTyped(){
  switch(key){
    case('w'): w = true; break;
    case('s'): s = true; break;
    case('a'): a = true; break;
    case('d'): d = true; break;
    case(' '): space = true; break;
    case('c'): c = true; break;
    case('q'): q = true; break;
    case('e'): e = true; break;
    case('1'): tex = img1; break;
    case('2'): tex = img2; break;
    case('3'): tex = img3; break;
  }
}
void keyReleased(){
  switch(key){
    case('w'): w = false; break;
    case('s'): s = false; break;
    case('a'): a = false; break;
    case('d'): d = false; break;
    case(' '): space = false; break;
    case('c'): c = false; break;
    case('q'): q = false; break;
    case('e'): e = false; break;
  }
}
void up() {yTrans = yTrans+moveRate;}
void down(){yTrans = yTrans-moveRate;}
void left(){xTrans = xTrans+moveRate;}
void right(){xTrans = xTrans-moveRate;}
void in(){zTrans = zTrans+moveRate;}
void out(){zTrans = zTrans-moveRate;}
void rotLeft(){rotz=rotz-rotZRate;}
void rotRight(){rotz=rotz+rotZRate;}
