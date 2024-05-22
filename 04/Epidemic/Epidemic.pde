import g4p_controls.*;

ArrayList<Person> people = new ArrayList<Person>();

int width = 800;
int height = 800;
int numpeople = 50;
int immunityBuffer = 5;
boolean paused = false;
float radius = 20;

void setup() {
  reset();
  createGUI();
}

void reset() {
  people = new ArrayList<Person>();
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
    
    if (paused) {
      p.updatePos();
    }
  }

  if (paused) {
    for (int i = 0; i < numpeople; i++) {
      for (int j = i+1; j < numpeople; j++) {
        people.get(i).checkCollision(people.get(j));
      }
    }
  }
}
