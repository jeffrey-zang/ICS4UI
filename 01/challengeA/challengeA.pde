String multiplyInSciNotation(String a, String b) { // Set up multiplyInSciNotation function, taking in the two numbers in scientific notation as parameters

  int x_indexA = a.indexOf("x"); // Get the index of the "multiply" symbol in both strings
  int x_indexB = b.indexOf("x");

  float coefficientA = float(a.substring(0, x_indexA)); // Extract the coefficient before the "x"
  int powerA = Integer.parseInt(a.substring(x_indexA+4, a.length())); // Extract the exponent after the "^"

  float coefficientB = float(b.substring(0, x_indexB));
  int powerB = Integer.parseInt(b.substring(x_indexB+4, b.length()));

  float product = coefficientA * coefficientB; // Computes new coefficient
  int power = powerA + powerB; // Computes new exponent

  if (product > 10) { // If the coefficient has more than one digit before the decimal point, divide it by 10 and increase the power by 1
    product /= 10;
    power += 1;
  }

  return String.valueOf(product) + "x10^" + String.valueOf(power); // Combine the new coefficient with "x10^" and the new power
}

void setup() {
  String a = "3.15x10^4"; // That’s 31,500
  String b = "4.000x10^3"; // That’s 4,000
  String aTimesb = multiplyInSciNotation( a, b ); // Should return "1.26x10^8"
  println( aTimesb );

  String c = "4.000x10^-3"; // That’s 0.004
  String aTimesC = multiplyInSciNotation( a, c ); // Should return "1.26x10^2"
  println( aTimesC );
}