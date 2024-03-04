void setup() {
  int i = 5;
  Dog ruby = new Dog("Ruby", "female", "Golden Doodle", 35);
  Dog max = new Dog("Max", "male", "Rottweiler", 85);

  ruby.describe();
  ruby.taketovet();
  ruby.describe();
  ruby.givetreat(5);
  ruby.describe();
  ruby.walk();
  ruby.describe();
}