class Letter {
  float x = random(width);
  float y = random(-1500, 0);
  float z = random(10, 255);
  float speed = random(4, 10);
  char c;
  ArrayList history = new ArrayList();

  PFont f = createFont("Arial", 16, true);

  void Fall() {
    y = y+speed;
    if (y>height+10) {
      y=random(-200, -100);
      SetDisplayChar();
    }
    history.add(y);
    println(history);
  }

  void Show() {
    textFont(f, 16);
    fill(95, 244, 66, z);
    text(c, x, y);
  }

  void SetDisplayChar() {
    for (int i = 0; i < 20; i++) {
      c = (char) int(random(33, 127));
    }
  }
}