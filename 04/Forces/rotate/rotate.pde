void setup() {
  size(500, 500);
}

int rotate = 0;

void draw() {
  background(255);
  rotate(rotate);
  fill(0);
  triangle(250, 250, 300, 300, 200, 300);
  rotate += 1;
}