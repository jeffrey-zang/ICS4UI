PVector pos, vel, acc;
float r, d;

void setup() {
  size(1000, 500);
  r = 15;
  d = 2*r;

  pos = new PVector(100, height/2); // initial position
  vel = new PVector(5, 1);
  acc = new PVector(0, 0.3);
}

void draw() {
  // background(255);

  line(0, 450, width, 450);
  circle(pos.x, pos.y, d);

  pos.add(vel);
  vel.add(acc);

  if (pos.y > 450-r) {
    pos.y = 450-r;
    vel.y *= -0.9;
  }
}