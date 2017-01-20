Letter[] letters = new Letter[300];
void setup() {
  size(1024, 768);
  for (int i = 0; i<letters.length; i++) {
    letters[i] = new Letter();
    letters[i].SetDisplayChar();
    frameRate(60);
  }
}

void draw() {
  background(0);
  for (int i = 0; i<letters.length; i++) {
    letters[i].Fall();
    letters[i].Show();
  }
}