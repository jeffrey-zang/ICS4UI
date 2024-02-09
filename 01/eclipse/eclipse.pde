float[][] coordinates;
coordinates[0] = new float[];

void setup() {
  size(500, 500);
  
  for (int i = 0; i < 100; i++) {
    float a = random(-500, 500);
    float b = random(-500, 500);
    float[] coord = new float[2];
    coord[0] = a;
    coord[1] = b;
    coordinates = append(coordinates, coord);
  }
}

void draw() {
  float x = mouseX - 250;
  float y = mouseY - 250;
  fill(0);
  background(0);
  
  fill(50, 100, 200);

  circle((x/10)+250, (y/10)+250, 210);
    
  fill(50);  
  circle(250, 250, 200);
  
  fill(255);
  for (int i = 0; i < 100; i++) {
    circle(coordinates[i][0], coordinates[i][1], 5);
  }
}