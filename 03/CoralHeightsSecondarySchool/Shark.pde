class Shark {
  
  float sightRadius; // how far th' shark can see
  float collisionRadius; // how close th' shark can get t' another shark afore it turns away
  
  float x; // x position o' th' shark
  float y; // y position o' th' shark
  
  color colour; // colour o' th' shark
  
  float strength; // how strong be th' shark?
  float speed; // how fast be th' shark?
  
  int hungriness = 0; // how hungry be th' shark?
  int lastEaten = 1; // frames since th' shark last eat
  
  // velocity o' th' shark
  float vx = random( - 1, 1);
  float vy = random( - 1, 1);
  
  Shark(float xC, float yC, color c) { // constructor to create ye shark
    this.x = int(xC);
    this.y = int(yC);
    this.colour = c;
    
    this.strength = sharkStrength; // set th' strength o' th' shark
    this.sightRadius = sightRad * this.strength; // set th' sight radius o' th' shark. make it STRONG
    this.collisionRadius = colRad; // set th' collision radius o' th' shark
  }

  void move() { // method to move ye shark
    // average position of nearby fish
    int xavg = 0;
    int yavg = 0;
    // number of nearby fish
    int nearbyFish = 0;

    // average position of nearby sharks
    int closex = 0;
    int closey = 0;

    lastEaten++; // increment th' frames since th' shark last eat
    
    if (lastEaten % 60 == 0) { // every second, th' shark be gettin' hungrier
      hungriness++;

      if (hungriness >= deathTolerance) { // if th' shark be too hungry, then it be dyin'
        ocean.sharks.remove(this);
      }
    }
    if (hungriness >= hungerTolerance) { // if th' shark be too hungry, then it be eatin' fish
      
      this.speed = sharkSpeed; // make th' shark FAST
      
      // loop to find th' average position and velocity o' nearby fish
      for (int i = 0; i < ocean.fishes.size(); i++) {
        Fish fish = ocean.fishes.get(i);
        float d = dist(this.x, this.y, fish.x, fish.y);
        
        if (d < this.sightRadius) { // if th' fish be within th' sight radius o' th' shark, then it's feastin' time
          xavg += fish.x;
          yavg += fish.y;
          nearbyFish++;
        }
      }
      
      // if there be nearby fish, then th' shark be attracted to 'em
      if (nearbyFish > 0) {
        xavg /= nearbyFish;
        yavg /= nearbyFish;
        
        this.vx += (xavg - this.x) * this.strength * centering;
        this.vy += (yavg - this.y) * this.strength * centering;
      }
      
      this.colour = color(215, 105, 73);
    } else {
      this.speed = 0.5;
      this.colour = color(255);
    }

    for (int i = 0; i < ocean.sharks.size(); i++) {
      Shark shark = ocean.sharks.get(i);
      float d = dist(this.x, this.y, shark.x, shark.y);
      
      if (d < this.collisionRadius) { // if th' shark be within th' collision radius o' th' shark, gotta move away
        closex += this.x - shark.x;
        closey += this.y - shark.y;
      }
    }
    
    this.vx += closex * avoidance;
    this.vy += closey * avoidance;

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
    if (speed < (minspeed * this.speed)) {
      this.vx = (this.vx / speed) * minspeed * this.speed;
      this.vy = (this.vy / speed) * minspeed * this.speed;
    }
    // or slow down, ye scurvy dog!
    if (speed > (maxspeed * this.speed)) {
      this.vx = (this.vx / speed) * maxspeed * this.speed;
      this.vy = (this.vy / speed) * maxspeed * this.speed;
    }
    
    // move th' shark
    this.x += this.vx;
    this.y += this.vy;
  }
  
  void draw() {

    // ye shark aye just a big ol' fish, ye see
    // ain't so shiver me timbers about it
    noFill();
    if (debug) {
      stroke(0);
      ellipse(this.x, this.y, this.sightRadius, this.sightRadius);
    }
    
    noStroke();
    fill(colour);
    ellipse(this.x, this.y, size * this.strength, size * this.strength);

    if (debug) {
      fill(0);
      textSize(20);
      text(this.hungriness, this.x - 5, this.y + 5);
      noFill();
    }
  }
}