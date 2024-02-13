String req = "Draw a blue circle at center (300, 255) with diameter 10";

float x, y, d;
String c;

void setup() {
  size(600, 600);
  
  extract();

  if (c.equals("blue")) {
    fill(0, 0, 255);
  } else if (c.equals("red")) {
    fill(255, 0, 0);
  } else if (c.equals("green")) {
    fill(0, 255, 0);
  }
  circle(x, y, d);
}

void extract() {
  String[] words = split(req, " ");
  c = words[2];
  
  x = float(words[6].substring(1, words[6].length()-1));
  y = float(words[7].substring(0, words[7].length()-1));
  d = float(words[10]);
}
