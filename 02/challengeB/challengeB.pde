String simplifyRadical(int n) { // init function to simplify radicals when given int n

  String complex = ""; // checks if the root is negative. if so, then the complex number "i" is tacked on to the end
  if (n < 0) {
    n = abs(n);
    complex = "i";
  }

  if (sqrt(n) % 1 == 0) { // checks if n is a perfect square. if so, just return n with the complex number
    return String.valueOf(int(sqrt(n))) + complex;
  }

  int largestFactor = int(sqrt(n)); // get the largest factor of n
  int coefficient = 1; // inits variables for the coefficient and the rical
  int radical = n;

  for (int i = 2; i < largestFactor; i++) { // counts starting from 2, dividing n by i until it can't be divided anymore
    int timesDivided = 0;
    while (n % i == 0) {
      timesDivided += 1;
      if (timesDivided == 2) { // if the factor appears twice, multiply the coefficient and divide the radical
        coefficient *= i;
        radical /= pow(i, 2);
        timesDivided = 0;
      }
      n /= i;
    }
  }

  return ((coefficient != 1) ? String.valueOf(coefficient) : "") + "√" + String.valueOf(radical) + complex; // coefficient? + square root symbol + radical + complex number?
}

void setup() {
  size(800, 400); // draws the screen. width 800 height 400
}

void draw() {
  background(255); // background colour white
  textSize(50); // text size 50
  fill(0); // text colour black

  text("√18 = " + simplifyRadical(18), 25, 75); // test cases
  text("√2400 = " + simplifyRadical(2400), 25, 150);
  text("√37800 = " + simplifyRadical(37800), 25, 225);
  text("√81 = " + simplifyRadical(81), 25, 300);
  text("√19 = " + simplifyRadical(19), 25, 375);

  text("√-18 = " + simplifyRadical(-18), 425, 75); 
  text("√-2400 = " + simplifyRadical(-2400), 425, 150);
  text("√-37800 = " + simplifyRadical(-37800), 425, 225);
  text("√-81 = " + simplifyRadical(-81), 425, 300);
  text("√-19 = " + simplifyRadical(-19), 425, 375);
}