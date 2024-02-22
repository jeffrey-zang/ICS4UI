void setup() {
  float coolnessPerA = 10;
  float coolnessPerB = 10.1;

  float[] coolness = {6, 10, 2, 3};

  float avgCoolness = getAverage( coolness );
  println(avgCoolness);

  int[] a = makeRandomArray(10, -50, 50);
  println(a);
}