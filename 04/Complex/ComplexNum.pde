class ComplexNum {
  float realPart;
  float imagPart;
  
  ComplexNum(float a, float b) {
    this.realPart = a;
    this.imagPart = b;
  }
  
  void display() {
    println(this.realPart + "+" + this.imagPart + "i");
  }
  
  float absValue() {
    return sqrt(pow(this.realPart, 2) + pow(this.imagPart, 2));
  }
  
  ComplexNum add(ComplexNum other) {
    float newReal = this.realPart + other.realPart;
    float newImag = this.imagPart + other.imagPart;
    
    ComplexNum newCN = new ComplexNum(newReal, newImag);
    return newCN;
  }
  
  ComplexNum mult(ComplexNum other) {
    float newReal = this.realPart * other.realPart - this.imagPart * other.imagPart;
    float newImag = this.realPart * other.imagPart + this.imagPart * other.realPart;
    
    ComplexNum newCN = new ComplexNum(newReal, newImag);
    return newCN;
  }
  
}