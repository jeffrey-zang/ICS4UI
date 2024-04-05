class Fish {
  
  float sightRadius; // how far th' fish can see
  float collisionRadius; // how close th' fish can get t' another fish afore it turns away
  
  float x; // x position o' th' fish
  float y; // y position o' th' fish
  
  color colour; // colour o' th' fish
  
  float vx = random( - 1, 1); // current x velocity o' th' fish
  float vy = random( - 1, 1); // current y velocity o' th' fish
  
  Fish(float xC, float yC, color c) { // constructor to create ye fish
    this.x = int(xC);
    this.y = int(yC);
    this.colour = c;
    
    this.sightRadius = sightRad;
    this.collisionRadius = colRad;
  }
  
  void move() { // method to move ye fish
    // average position of nearby fish
    int xavg = 0;
    int yavg = 0;
    // average velocity of nearby fish
    int xvelavg = 0;
    int yvelavg = 0;
    // number of nearby fish
    int nearby = 0;
    // position o' fishes that be too close
    int closex = 0;
    int closey = 0;
    
    // loop to check all th' fish for collisions and to find th' average position and velocity o' nearby fish
    for (int i = 0; i < ocean.fishes.size(); i++) {
      Fish fish = ocean.fishes.get(i);
      float d = dist(this.x, this.y, fish.x, fish.y);
      
      if (d < this.sightRadius) {
        if (d < this.collisionRadius) {
          closex += this.x - fish.x;
          closey += this.y - fish.y;
        } else {
          xavg += fish.x;
          yavg += fish.y;
          xvelavg += fish.vx;
          yvelavg += fish.vy;
          nearby++;
        }
      }
    }
    
    // loop to GET AWAY FROM TH' SHARKS SHIVER ME TIMBERS
    for (int i = 0; i < ocean.sharks.size(); i++) {
      Shark shark = ocean.sharks.get(i);
      float d = dist(this.x, this.y, shark.x, shark.y);
      
      if (d < this.sightRadius) {
        this.colour = color(232, 164, 89);
        if (d < size) { // if thy shark be too close, ye be dead
          shark.hungriness = 0;
          ocean.fishes.remove(this);
        }
        closex += this.x - shark.x;
        closey += this.y - shark.y;
      } else {
        this.colour = color(232, 200, 89);
      }
    }
    
    // if there be sharks + fishes nearby, update ye fish's velocity t' avoid th' sharks and to move towards th' average position and velocity o' nearby fish
    if (nearby > 0) {
      xavg /= nearby;
      yavg /= nearby;
      xvelavg /= nearby;
      yvelavg /= nearby;
      
      this.vx += (xavg - this.x) * centering + (xvelavg - this.vx) * attraction;
      this.vy += (yavg - this.y) * centering + (yvelavg - this.vy) * attraction;
    }
    
    // if there be fishes too close, update ye fish's velocity t' avoid them
    this.vx += closex * avoidance;
    this.vy += closey * avoidance;
    
    // if we be venturin' to thy abyss, turn back
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
    if (speed < minspeed) {
      this.vx = (this.vx / speed) * minspeed;
      this.vy = (this.vy / speed) * minspeed;
    }
    // or slow down, ye scurvy dog!
    if (speed > maxspeed) {
      this.vx = (this.vx / speed) * maxspeed;
      this.vy = (this.vy / speed) * maxspeed;
    }
    
    // move th' fish
    this.x += this.vx; 
    this.y += this.vy;
  }
  
  void draw() {
    
    // help ye visualize th' fish's sight radius
    noFill();
    if (debug) {
      stroke(0);
      ellipse(this.x, this.y, this.sightRadius, this.sightRadius);
    }
    
    // draw th' fish
    fill(colour);
    noStroke();
    ellipse(x, y, size, size);
    noFill();
  }
}