class Letter {
  float x=random(width);
  float y=random(-200,-100);
  float speed =random(4,10);
  char c;

  PFont f = createFont("Arial", 16, true);

  void Fall() {
    y = y+speed;
  }

  void Show() {
    textFont(f, 16);
    fill(0);
    text(c, x, y);
  }

  void SetDisplayChar() {
    for (int i = 0; i < 20; i++) {
      c = (char) int(random(33, 127));
    }
  }
}