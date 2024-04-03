class Fish {
  float sightRadius;
  // float collisionRadius;

  // float minSpeed;
  // float maxSpeed;
  
  float x;
  float y;

  color colour;

  // float turnFactor;
  // float attractionFactor;
  // float mass;

  PVector velocity;

  PVector calculateVelocity(float x, float y) {
    return new PVector(int(x-random(-25, 25)), int(y-random(-25, 25)));
    // return new PVector(20, 20);
  }

  Fish( float xC, float yC, color c, float sr ) {
    this.x = int(xC);
    this.y = int(yC);
    this.colour = c;
    this.sightRadius = sr;
    this.velocity = calculateVelocity(this.x, this.y);
  }

  void move() {

    int avoidx = 0;
    int avoidy = 0;

    if (this.x < 25) {
      avoidx += 50;
    }
    if (this.x > 475) {
      avoidx -= 50;
    }
    if (this.y < 25) {
      avoidy += 50;
    }
    if (this.y > 475) {
      avoidy -= 50;
    }

    for ( int i = 0; i < fishes.size(); i++ ) {
      if (i == fishes.indexOf(this)) {
        continue;
      }
      Fish fish = fishes.get(i);

      if (dist(this.x, this.y, fish.x, fish.y) > this.sightRadius) {
        continue;
      }

      if (dist(this.velocity.x, this.velocity.y, fish.x, fish.y) < this.sightRadius) {
        avoidx += this.x - fish.x;
        avoidy += this.y - fish.y;
      }
    }

    if (avoidx != 0 || avoidy != 0) {
      this.velocity = new PVector(this.velocity.x + avoidx, this.velocity.y + avoidy);
    } else {
      if (this.x == this.velocity.x && this.y == this.velocity.y) {
        this.velocity = calculateVelocity(this.x, this.y);
      }
    }

    if (this.x < this.velocity.x) {
      this.x += 1;
    } else if (this.x > this.velocity.x) {
      this.x -= 1;
    }
    if (this.y < this.velocity.y) {
      this.y += 1;
    } else if (this.y > this.velocity.y) {
      this.y -= 1;
    }

    ellipse(x, y, sightRadius, sightRadius);
    fill(colour);
    ellipse(x, y, 15, 15);
    noFill();
  }
}