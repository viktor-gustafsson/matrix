Letter[] letters = new Letter[150];

void setup() {
  size(1024, 768);
  for (int i = 0; i<letters.length; i++) {
    letters[i] = new Letter();
    letters[i].SetDisplayChar();
  }
}

void draw() {
  background(0);
  for (int i = 0; i<letters.length; i++) {
    letters[i].Fall();
    letters[i].Show();
  }
}