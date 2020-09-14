import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class obamaCube extends PApplet {

float moveRate = 3.5f;
float rotZRate = 0.06f;
float mouseRotRate = 0.007f;
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
float fov = 3.0f;
public void setup() {
  
  frameRate(144);
  
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
public void draw() {
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
public void TexturedCube(PImage tex) {
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
public void mouseDragged() {
  rotx += (pmouseY-mouseY) * mouseRotRate;
  roty += (mouseX-pmouseX) * mouseRotRate;
}
public void move(){
  if(a) left();
  if(d) right();
  if(w) in();
  if(s) out();
  if(space) up();
  if(c) down();
  if(q) rotLeft();
  if(e) rotRight();
}
public void keyTyped(){
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
public void keyReleased(){
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
public void up() {yTrans = yTrans+moveRate;}
public void down(){yTrans = yTrans-moveRate;}
public void left(){xTrans = xTrans+moveRate;}
public void right(){xTrans = xTrans-moveRate;}
public void in(){zTrans = zTrans+moveRate;}
public void out(){zTrans = zTrans-moveRate;}
public void rotLeft(){rotz=rotz-rotZRate;}
public void rotRight(){rotz=rotz+rotZRate;}
  public void settings() {  fullScreen(P3D);  smooth(64); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "obamaCube" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
