class Dog {
  // fields: things that every dog has
  String name, gender, breed;
  float weight;
  String emostate;

  // constructor: a function that takes  in data from setup and fills in the field values
  Dog(String n, String g, String b, float w) {
    this.name = n;
    this.gender = g;
    this.breed = b;
    this.weight = w;
    this.emostate = "normal";
  }

  // methods
  void describe() {
    println("Hi my name is " + this.name + " I am a " + this.gender + " " + this.breed + ". I weigh " + this.weight + " tons. I'm feeling " + this.emostate);
  }
  void bark(int n) {
    for (int i = 0; i < n; i++) {
      println("WOOF! - " + this.name);
    }
  }

  void taketovet() {
    this.emostate = "nervous";
  }

  void givetreat(int size) {
    this.emostate = "happy";
    this.weight += size;
  }
  
  void walk() {
    this.emostate = "tired";
    this.weight = this.weight * 0.9;
  }
  
  
}