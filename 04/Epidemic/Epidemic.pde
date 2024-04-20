ArrayList<Person> people = new ArrayList<Person>();

int width = 500;
int height = 500;
int radius = 20;
int numpeople = 20;

void setup() {
  for (int i = 0; i < numpeople; i++) {
    people.add(new Person(random(width), random(height), random(-2, 2), random(-2, 2)));
  }
}

public void settings() {
  size(width, height);
}

void draw() {
  background(0);

  for (int i = 0; i < numpeople; i++) {
    Person p = people.get(i);
    p.drawMe();
    p.updatePos();
  }

  for (int i = 0; i < numpeople; i++) {
    for (int j = i+1; j < numpeople; j++) {
      people.get(i).checkCollision(people.get(j));
    }
  }
}