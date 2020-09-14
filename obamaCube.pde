PImage tex;
PImage img1;
PImage img2;
PImage img3;
float rotx = 0;
float roty = 0;
float rotz = 0;
int zTrans = 0;
int xTrans;
int yTrans;
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
  float rate = 0.01;
  rotx += (pmouseY-mouseY) * rate;
  roty += (mouseX-pmouseX) * rate;
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
void up() {yTrans = yTrans+2;}
void down(){yTrans = yTrans-2;}
void left(){xTrans = xTrans+2;}
void right(){xTrans = xTrans-2;}
void in(){zTrans = zTrans+2;}
void out(){zTrans = zTrans-2;}
void rotLeft(){rotz=rotz-0.06;}
void rotRight(){rotz=rotz+0.06;}
