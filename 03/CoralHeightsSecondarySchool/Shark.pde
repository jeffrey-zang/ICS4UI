class Shark {

  float sightRadius; // how far th' shark can see

  float x; // x position o' th' shark
  float y; // y position o' th' shark

  color colour; // colour o' th' shark

  // velocity o' th' shark
  float vx = random(-1, 1);
  float vy = random(-1, 1);

  Shark( float xC, float yC, color c ) { // constructor to create ye shark
    this.x = int(xC);
    this.y = int(yC);
    this.colour = c;

    this.sightRadius = sightRad*sharkStrength; // set th' sight radius o' th' shark. make it STRONG
  }

  void move() { // method to move ye shark
    // average position of nearby fish
    int xavg = 0;
    int yavg = 0;
    // number of nearby fish
    int nearby = 0;

    // loop to find th' average position and velocity o' nearby fish
    for ( int i = 0; i < ocean.fishes.size(); i++ ) {
      Fish fish = ocean.fishes.get(i);
      float d = dist(this.x, this.y, fish.x, fish.y);

      if (d < this.sightRadius) { // if th' fish be within th' sight radius o' th' shark, then it's feastin' time
        xavg += fish.x;
        yavg += fish.y;
        nearby++;
      }
    }

    // if there be nearby fish, then th' shark be attracted to 'em
    if (nearby > 0) {
      xavg /= nearby;
      yavg /= nearby;

      this.vx += (xavg - this.x)*sharkStrength*centering;
      this.vy += (yavg - this.y)*sharkStrength*centering;
    }

    // move th' shark away from th' edges o' th' screen
    if (this.y < boundary) {
      this.vy += boundary_avoidance;
    }
    if (this.x > w-boundary) {
      this.vx -= boundary_avoidance;
    }
    if (this.x < boundary) {
      this.vx += boundary_avoidance;
    }
    if (this.y > h-boundary) {
      this.vy -= boundary_avoidance;
    }

    // how fast be we goin'?
    float speed = sqrt(this.vx*this.vx + this.vy*this.vy);

    // NOW speed up, ye scurvy dog!
    if (speed < minspeed/sharkStrength) {
      this.vx = (this.vx/speed)*minspeed/sharkStrength;
      this.vy = (this.vy/speed)*minspeed/sharkStrength;
    }
    // or slow down, ye scurvy dog!
    if (speed > maxspeed*sharkStrength) {
      this.vx = (this.vx/speed)*maxspeed*sharkStrength;
      this.vy = (this.vy/speed)*maxspeed*sharkStrength;
    }

    // move th' shark
    this.x += this.vx;
    this.y += this.vy;
  }
  
  void draw() {
    // ye shark aye just a big ol' fish, ye see
    // ain't so shiver me timbers about it
    stroke(0);
    if (showSight) {
      ellipse(this.x, this.y, this.sightRadius, this.sightRadius);
    }

    fill(colour);
    noStroke();
    ellipse(x, y, size*sharkStrength, size*sharkStrength);
    noFill();
  }
}