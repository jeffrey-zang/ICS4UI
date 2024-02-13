void setup() {
  int x = 5;
  println(16/float(x)); // --> the decimals are chopped off, it gets 'rounded' automatically
  
  println( pow(2, 5) );
  println( sqrt(144) );
  println( pow(225, 0.5) );

  println(sin(radians(30)));
}