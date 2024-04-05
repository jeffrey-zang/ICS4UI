class Shark {
  
  float sightRadius; // how far th' shark can see
  
  float x; // x position o' th' shark
  float y; // y position o' th' shark
  
  color colour; // colour o' th' shark
  
  float strength; // how strong be th' shark?
  
  int hungriness = 0; // how hungry be th' shark?
  int lastEaten = 1; // frames since th' shark last eat
  
  // velocity o' th' shark
  float vx = random( - 1, 1);
  float vy = random( - 1, 1);
  
  Shark(float xC, float yC, color c) { // constructor to create ye shark
    this.x = int(xC);
    this.y = int(yC);
    this.colour = c;
    
    this.strength = 1; // set th' strength o' th' shark
    this.sightRadius = sightRad * this.strength; // set th' sight radius o' th' shark. make it STRONG
  }
  
  void move() { // method to move ye shark
    // average position of nearby fish
    int xavg = 0;
    int yavg = 0;
    // number of nearby fish
    int nearby = 0;
    
    lastEaten++; // increment th' frames since th' shark last eat
    
    if (lastEaten % 60 == 0) { // every second, th' shark be gettin' hungrier
      hungriness++;
    }
    if (hungriness > 5) { // if th' shark be too hungry, then it be eatin' fish
      
      this.strength = 2; // make th' shark STRONG
      
      // loop to find th' average position and velocity o' nearby fish
      for (int i = 0; i < ocean.fishes.size(); i++) {
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
        
        this.vx += (xavg - this.x) * this.strength * centering;
        this.vy += (yavg - this.y) * this.strength * centering;
      }
      
      this.colour = color(215, 105, 73);
    } else {
      this.strength = 1;
      this.colour = color(255);
    }
    
    // move th' shark away from th' edges o' th' screen
    if (this.y < boundary) {
      this.vy += boundary_avoidance;
    }
    if (this.x > w - boundary) {
      this.vx -= boundary_avoidance;
    }
    if (this.x < boundary) {
      this.vx += boundary_avoidance;
    }
    if (this.y > h - boundary) {
      this.vy -= boundary_avoidance;
    }
    
    // how fast be we goin'?
    float speed = sqrt(this.vx * this.vx + this.vy * this.vy);
    
    // NOW speed up, ye scurvy dog!
    if (speed < minspeed / this.strength) {
      this.vx = (this.vx / speed) * minspeed / this.strength;
      this.vy = (this.vy / speed) * minspeed / this.strength;
    }
    // or slow down, ye scurvy dog!
    if (speed > maxspeed * this.strength) {
      this.vx = (this.vx / speed) * maxspeed * this.strength;
      this.vy = (this.vy / speed) * maxspeed * this.strength;
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
    ellipse(x, y, size * this.strength, size * this.strength);
    noFill();
  }
}