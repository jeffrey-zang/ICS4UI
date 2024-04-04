class Fish {
  float sightRadius;
  float collisionRadius;

  float x;
  float y;

  color colour;

  float vx = -1;
  float vy = -1;

  Fish( float xC, float yC, color c, float sr ) {
    this.x = int(xC);
    this.y = int(yC);
    this.colour = c;

    this.sightRadius = sr;
    this.collisionRadius = 20;
  }

  void move() {
    
    int xavg = 0;
    int yavg = 0;
    int xvelavg = 0;
    int yvelavg = 0;
    int nearby = 0;
    int closex = 0;
    int closey = 0;

    for ( int i = 0; i < fishes.size(); i++ ) {
      Fish fish = fishes.get(i);
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

    if (nearby > 0) {
      xavg /= nearby;
      yavg /= nearby;
      xvelavg /= nearby;
      yvelavg /= nearby;

      this.vx += (xavg - this.x)*centering_factor + (xavg - this.vx)*matching_factor;
      this.vy += (yavg - this.y)*centering_factor + (yavg - this.vy)*matching_factor;
    }

    this.vx += closex*avoid_factor;
    this.vy += closey*avoid_factor;

    if (this.y < 200) {
      this.vy += turn_factor;
    }
    if (this.x > 500) {
      this.vx -= turn_factor;
    }
    if (this.x < 200) {
      this.vx += turn_factor;
    }
    if (this.y > 500) {
      this.vy -= turn_factor;
    }

    float speed = sqrt(this.vx*this.vx + this.vy*this.vy);

    if (speed < minspeed) {
      this.vx = (this.vx/speed)*minspeed;
      this.vy = (this.vy/speed)*minspeed;
    }
    if (speed > maxspeed) {
      this.vx = (this.vx/speed)*maxspeed;
      this.vy = (this.vy/speed)*maxspeed;
    }

    this.x += this.vx;
    this.y += this.vy;
  }
  
  void draw() {
    // ellipse(x, y, sightRadius, sightRadius);
    fill(colour);
    ellipse(x, y, 15, 15);
    noFill();
  }
}