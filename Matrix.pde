Letter[] letters = new Letter[100];

void setup() {
  size(640, 360);
  for (int i = 0; i<letters.length; i++) {
    letters[i] = new Letter();
    letters[i].SetDisplayChar();
  }
}

void draw() {
  background(255);
  for (int i = 0; i<letters.length; i++) {
    letters[i].Fall();
    letters[i].Show();
  }
}