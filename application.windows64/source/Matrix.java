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

public class Matrix extends PApplet {

ArrayList<Letter> letters = new ArrayList<Letter>();
Letter l = new Letter();
public void setup() {
  
  int x = 0;
  while (x<width) {
    x=x+15;
    for (int i = 0; i<10; i++) {
      l = new Letter();
      l.SetDisplayChar();
      l.x=x;
      letters.add(l);
    }
  }
  frameRate(60);
}

public void draw() {
  background(0);
  if (frameCount%5==0)
  {
    l = letters.get((int)random(letters.size()));
    l.Flash();
  }
  for (int i = 0; i<letters.size(); i++) {
    l = letters.get(i);
    l.Fall();
    l.Show();
  }
}
class Letter {
  float x;
  float y = random(-1500, 0);
  float z = random(50, 185);
  float speed = random(3, 5);
  float newz = 0;
  char c;
  ArrayList<PVector> history = new ArrayList<PVector>();

  public void Fall() {
    y = y+speed;
    if (y>height+150) {
      ResetChar();
    }
    if (history.size() > 10) {
      history.remove(0);
    }
    if (frameCount %6 ==0) {
      history.add(new PVector(x, y, z/2.5f));
    }
  }

  public void ResetChar() {
    y = random(-200, 0);
    z = random(50, 185);
    speed=random(3, 5);
    //set new char
    SetDisplayChar();
  }
  public void Flash() {
    fill(187, 255, 186, 200);
    rect(x, y, 10, 20);
  }

  public void Show() {
    fill(187, 255, 186, z); 
    text(c, x, y);
    ShowHistory();
    if(random(0,200)<1.0f){
     SetDisplayChar(); 
    }
  }

  public void ShowHistory() {
    for (int i = 0; i < history.size(); i++) {
      PVector v = history.get(i);
      newz = map(v.z*i, 50, 255, i, v.z);
      if (newz <0) {
        newz = 0;
      }
      fill(95, 244, 66, newz);   
      text(c, v.x, v.y);
    }
  }

  public void SetDisplayChar() {
    for (int i = 0; i < 20; i++) {
      c = (char) PApplet.parseInt(random(33, 255));
    }
  }
}
  public void settings() {  size(1024, 768); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Matrix" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
