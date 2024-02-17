// define f(x) = square root of x + 5
float f(float x) {
  if (x < -5) {
    return -999999;
  }
  return sqrt(x+5);
}