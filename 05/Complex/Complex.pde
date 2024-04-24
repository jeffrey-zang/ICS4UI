float aSlope = 3.0 / 800;
float bSlope = -3.0 / 800;

int col = 0;
int vel = 1;

void setup() {
  size(800, 800);
  noLoop();
  // pixelDensity(displayDensity());
}

void draw() {
  background(0);
  for (int x = 0; x <= 800; x++) {
    float a = get_a_value(x);
        
    for (int y = 0; y <= 800; y++) {
      float b = get_b_value(y);
      
      ComplexNum c = new ComplexNum(a, b);
      ComplexNum z = c;

      int row = 1;
      
      while(row < 200 && z.absValue() < 2) {
        z = z.mult(z).add(c);
        row++;
      }
      
      if (row >= 200) {
        set(x, y, color(255));
      }
    }

    col += vel;

    if (col >= 150) {
      vel = -1;
    } else if (col <= 0) {
      vel = 1;
    }
  }
}

float get_a_value(float x) {
  return(x * aSlope) - 2.0;
}
float get_b_value(float y) {
  return(y * bSlope) + 1.5;
}