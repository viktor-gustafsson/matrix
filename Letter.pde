class Letter {
  float x = random(width);
  float y = random(-1500, 0);
  float z = random(50, 255);
  float speed = random(6, 12);
  char c;
  ArrayList<PVector> history = new ArrayList<PVector>();
  
  PFont f = createFont("Arial", 16, true);

  void Fall() {
    y = y+speed;
    if (y>height+50) {
      y=random(-200, -100);
      SetDisplayChar();
    }
    if (history.size() > 5) {
      history.remove(0);
    }
    if(y%2 < 0.5){
     history.add(new PVector(x,y,z)); 
    }
  }

  void Show() {
    textFont(f, 16);
    fill(95, 244, 66, z);
    text(c, x, y);
  }

  void ShowHistory() {
    for (int i = 0; i < history.size(); i++) {
      PVector v = history.get(i);
      fill(95, 244, 66, v.z);   
      text(c, x, v.y);
    }
  }

  void SetDisplayChar() {
    for (int i = 0; i < 20; i++) {
      c = (char) int(random(33, 127));
    }
  }
}