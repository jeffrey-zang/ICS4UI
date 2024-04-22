void setup() {
  ComplexNum one = new ComplexNum(1, 5);
  ComplexNum two = new ComplexNum(2, 0);

  one.display();
  two.display();
  ComplexNum three = one.add(two);
  three.display();
}