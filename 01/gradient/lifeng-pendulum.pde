float x = 0; // float means that x is a decimal variable
float y = 0;
float frictionX = 0;
float frictionY = 0;

void setup() {
  size(600, 500);
}

void draw() {
  background(0);

  stroke(255, 255, 255);
  line(300, 50, sin(x)*(200 - frictionX) + 300, cos(y)*50 + 300);

  fill(0, 200, 120);
  stroke(0, 0, 0);
  circle(sin(x)*(200 - frictionX) + 300, cos(y)*50 + 300, 75);

  frictionX += 1;
  frictionY += 0.01;

  if (frictionX <= 0) {
    frictionX = 0;
    frictionY = 0;
  }

  x += 0.025;
  y += 0.05;
}