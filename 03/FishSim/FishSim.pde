ArrayList<Fish> fishes = new ArrayList<Fish>();

void setup() {

  for ( int i = 0; i < 100; i++ ) {
    fishes.add( new Fish(random(0, 500), random(0, 500), color(255, 0, 0), 50) );
  }

  size(500, 500);

}

void draw() {

  background(255);
  
  for ( int i = 0; i < fishes.size(); i++ ) {
    Fish fish = fishes.get(i);
    fish.move();    
  }

}