int[] ar = {5, 2, 3, 1, 4};
int n = ar.length;
int p = 0;
int i = 0;

println(ar);

for (p = 0; p < n; p++) {
  for (i = 0; i < n-p-1; i++) {
    if (ar[i] > ar[i + 1]) {
      int temp = ar[i];
      ar[i] = ar[i + 1];
      ar[i + 1] = temp;
    }
  }
}

println();
println(ar);