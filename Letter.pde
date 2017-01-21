class Letter {
  float x;
  float y = random(-1500, 0);
  float z = random(50, 185);
  float speed = random(3, 5);
  float newz = 0;
  char c;
  ArrayList<PVector> history = new ArrayList<PVector>();

  void Fall() {
    y = y+speed;
    if (y>height+150) {
      ResetChar();
    }
    if (history.size() > 10) {
      history.remove(0);
    }
    if (frameCount %6 ==0) {
      history.add(new PVector(x, y, z/2.5));
    }
  }

  void ResetChar() {
    y = random(-1500, 0);
    z = random(50, 185);
    speed=random(3, 5);
    //set new char
    SetDisplayChar();
  }
  void Flash() {
    fill(187, 255, 186, 200);
    rect(x, y, 15, 15);
  }

  void Show() {
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
      text(c, v.x, v.y);
    }
  }

  void SetDisplayChar() {
    for (int i = 0; i < 20; i++) {
      c = (char) int(random(33, 255));
    }
  }
}