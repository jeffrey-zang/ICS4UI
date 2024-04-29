import g4p_controls.*;

float x = 100;
float xSpeed = 5;

float red = 0;
float green = 0;
float blue = 0;

void setup() {
  size(1000, 600);
  createGUI();
}
  
void draw() {
  background(200);
  fill(red, green, blue);
  circle(x, height/2, 60);

  x += xSpeed;

  if (x - 30 >= width) {
    x = -30;
  }
}
