void setup() {
  String[] data = loadStrings("data.txt");
  for (int i = 0; i < data.length; i++) {
    println(data[i].split("\t"));
  }
}