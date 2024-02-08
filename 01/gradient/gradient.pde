int r = 0;
int g = 0;
int b = 0;

void setup() {
  size(500, 500);
}

void draw() {

  r = 0;
  g = 0;
  b = 0;

  for (int i = 0; i < 100; i++) {
    stroke(r, g, b);
    fill(r, g, b);
    rect(i*5, 0, 5, 500);
    r++;
    g++;
    b++;
  }
}