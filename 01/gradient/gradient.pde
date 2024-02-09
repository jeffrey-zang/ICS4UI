int r = 0;
int g = 0;
int b = 0;

void setup() {
  size(255, 500);
}

void draw() {

  r = 0;
  g = 0;
  b = 0;

  for (int i = 0; i < 255; i++) {
    stroke(r, g, b);
    fill(r, g, b);
    rect(i*1, 0, 1, 500);
    r++;
    g++;
    b++;
  }
}