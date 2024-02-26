// int cols = data
// println(data);

String cols;
String rows;
String w;
String h;

void setup() {
  String[] data = loadStrings("grid.txt");
  cols = split(data[0], ' ')[0];
  rows = split(data[0], ' ')[1];
  w = split(data[1], ' ')[0];
  h = split(data[1], ' ')[1];
  
  size(800, 800); // draws the screen. width 800 height 400
}

void draw() {

  background(0); // background colour white
  fill(255);
  strokeWeight(8);

  for (int i = 0; i < int(cols); i++) {
    for (int j = 0; j < int(rows); j++) {
      circle(int(w) + j*80, int(h) + i * 80, 40);
    }
  }
}