class Letter {
  float x = random(width);
  float y = random(-1500,0);
  float z = random(50, 200);
  float speed = random(2, 4);
  float newz = 0;
  char c;
  ArrayList<PVector> history = new ArrayList<PVector>();

  PFont f = createFont("Arial", 16, true);
  void Fall() {
    for(int i = 0; i < width; i++){
      x = i;
    }
    y = y+speed;
    if (y>height+75) {
      y = random(-1500,0);
      z = random(50, 200);
      x = random(width);
      speed=random(2, 4);
      SetDisplayChar();
    }
    if (history.size() > 5) {
      history.remove(0);
    }
    if (y%2 < 0.3) {
      history.add(new PVector(x, y, z/2));
    }
  }

  void Show() {
    textFont(f, 16);
    fill(187, 255, 186, z);
    text(c, x, y);
    ShowHistory();
  }

  void ShowHistory() {
    for (int i = 0; i < history.size(); i++) {
      PVector v = history.get(i);
      newz = map(v.z*i, 50, 255, i, v.z);
      if (newz <0) {
        newz = 0;
      }
      fill(95, 244, 66, newz);   
      text(c, x, v.y);
    }
  }

  void SetDisplayChar() {
    for (int i = 0; i < 20; i++) {
      c = (char) int(random(33, 255));
    }
  }
}