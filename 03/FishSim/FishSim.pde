ArrayList<Fish> fishes = new ArrayList<Fish>();

float turn_factor = 0.4;
float centering_factor = 0.001;
float avoid_factor = 1;
float matching_factor = 0.00005;
float maxspeed = 5;
float minspeed = 3;

void setup() {

  for ( int i = 0; i < 20; i++ ) {
    // fishes.add( new Fish(random(0, 500), random(0, 500), color(255, 0, 0), 200) );
    fishes.add( new Fish(100, 250, color(255, 0, 0), 200) );
  }
  for ( int i = 0; i < 20; i++ ) {
    // fishes.add( new Fish(random(0, 500), random(0, 500), color(0, 255, 0), 200) );
    fishes.add( new Fish(400, 250, color(0, 255, 0), 200) );
  }

  size(1000, 1000);
}

void draw() {

  background(255);
  
  for ( int i = 0; i < fishes.size(); i++ ) {
    Fish fish = fishes.get(i);
    fish.move();
    fish.draw();
  }
}