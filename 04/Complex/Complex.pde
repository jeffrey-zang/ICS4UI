float aMin = -2.25;
float aMax = 0.75;
float bMin = -1.5;
float bMax = 1.5;

float aSlope;
float bSlope;

int col = 0;
int vel = 1;

void setup() {
  size(800, 800);
  frameRate(60);
  // pixelDensity(displayDensity());
}

void draw() {
  background(0);
  
  aMin += 0.1;
  aMax -= 0.1;
  bMin += 0.1;
  bMax -= 0.1;
  // aSlope = (aMax - aMin) / width*0.5;
  // bSlope = (bMin - bMax) / height*0.5;
  aSlope = (aMax - aMin) / width;
  bSlope = (bMin - bMax) / height;  
  
  for (int x = 0; x <= width; x++) {
    float a = get_a_value(x);
    
    for (int y = 0; y <= height; y++) {
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
    
    if (col >= 200) {
      vel = -1;
    } else if (col <= 100) {
      vel = 1;
    }
  }
}

float get_a_value(float x) {
  return aSlope * x + aMin;
}
float get_b_value(float y) {
  return bSlope * y + bMax;
}