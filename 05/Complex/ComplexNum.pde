class ComplexNum {
  float rp, ip;

  ComplexNum(float a, float b) {
    this.rp = a;
    this.ip = b;
  }

  float absValue() {
    return (float) Math.sqrt(rp * rp + ip * ip);
  }

  ComplexNum add(ComplexNum c) {
    return new ComplexNum(rp + c.rp, ip + c.ip);
  }

  void display() {
    println(rp + " + " + ip + "i");
  }
}