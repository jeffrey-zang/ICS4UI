float decimal = 0.3;
float n;
float d = 1;

void setup() {
  toFrac(decimal);
  float g = gcd(n, d);
  println(int(n/g), "/", int(d/g));
}

void toFrac(float i) {
  while (i % 1 != 0) {
    i *= 10;
    d *= 10;
  }
  n = i;
}

float gcd(float max, float min) {
  float rem = max % min;
  while (rem != 0) {
    max = min;
    min = rem;
    rem = max % min;
  }
  return min;
}
