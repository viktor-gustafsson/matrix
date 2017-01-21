ArrayList<Letter> letters = new ArrayList<Letter>();
Letter l = new Letter();
void setup() {
  size(1024, 768);
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

void draw() {
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