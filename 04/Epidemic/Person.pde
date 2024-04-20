class Person {
  PVector pos, vel;
  color status;
  int timessick = 0;
  boolean immune = false;
  
  void drawMe() { // draw the person
    fill(status);
    circle(this.pos.x, this.pos.y, radius * 2);
    noFill();
  }
  
  void updatePos() { // update the position of the person
    // check wall collision
    if (this.pos.x - radius < 0) {
      this.vel.x *= -1;
    }
    if (this.pos.x - radius < -1) {
      this.pos.x = 0 + radius*2;
    }
    if (this.pos.x + radius > width) {
      this.vel.x *= -1;
    }
    if (this.pos.x + radius > width + 1) {
      this.pos.x = width - radius*2;
    }
    if (this.pos.y - radius < 0) {
      this.vel.y *= -1;
    }
    if (this.pos.y - radius < -1) {
      this.pos.y = 0 + radius*2;
    }
    if (this.pos.y + radius > height) {
      this.vel.y *= -1;
    }
    if (this.pos.y + radius > height + 1) {
      this.pos.y = width - radius*2;
    }
    this.pos.add(this.vel); // update the position using velocity vector
  }
  
  void checkCollision(Person other) {
    PVector collision = PVector.sub(this.pos, other.pos); // vector from this person to other person
    
    if (collision.mag() < radius * 2) {
      float anticlump = abs(collision.mag() - (radius * 2) ) + 0; // prevent clumping
      PVector unit = collision.normalize();

      float k = this.vel.dot(unit) - other.vel.dot(unit);
      
      PVector deltaV = PVector.mult(unit, -k);
      PVector deltaW = PVector.mult(unit, k);
      
      this.vel.add(deltaV);
      this.pos.add(deltaV.normalize().mult(anticlump));

      other.vel.add(deltaW);
      other.pos.add(deltaW.normalize().mult(anticlump));
      
      if (!this.immune) { // if this person is not immune
        if (this.status == color(0, 255, 0) && other.status == color(255, 0, 0)) {
          this.status = color(255, 0, 0);
          this.timessick++;
        }
        if (this.status == color(255, 0, 0) && other.status == color(0, 255, 0)) {
          other.status = color(255, 0, 0);
          this.timessick++;
        }
      }

      if (timessick == 5) { // if this person has been sick 5 times, they are now immune
        this.immune = true;
        this.status = color(255, 255, 255);
      }

      if (this.status == color(0, 0, 255) && other.status == color(255, 0, 0)) {
        other.status = color(0, 255, 0);
      }
      if (this.status == color(255, 0, 0) && other.status == color(0, 0, 255)) {
        this.status = color(0, 255, 0);
      }
    }
  }
  
  Person(float x, float y, float velx, float vely) { // constructor
    this.pos = new PVector(x, y);
    this.vel = new PVector(velx, vely);
    
    float statusRandom = floor(random(3));
    if (statusRandom == 0) this.status = color(0, 255, 0);
    if (statusRandom == 1) this.status = color(0, 0, 255);
    if (statusRandom == 2) this.status = color(255, 0, 0);
  }
}