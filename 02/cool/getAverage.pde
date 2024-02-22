float getAverage(float[] arr) {
  float sum = 0;
  for (int i = 0; i < arr.length; i++) {
    sum += arr[i];
  }
  return sum / arr.length;
}

int[] makeRandomArray(int n, int min, int max) {
  int[] a = new int[n];

  for (int i = 0; i < n; i++) {
    a[i] = int(random(min, max));
  }

  return a;
}