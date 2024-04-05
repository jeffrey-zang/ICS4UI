PVector posSun, posMars;
PVector vel;
PVector acc;
float yGround;
float sunRadius, marsRadius;

void setup() {
  
  size(1000, 500);
  sunRadius = 50;
  marsRadius = 20;
  yGround = 400;
  
  
  posSun = new PVector(width/2, height/2);
  posMars = new PVector(posSun.x - 200, height / 2);
  vel = new PVector(0, 4);
  acc = new PVector(0, 0);
}

void draw() {
  background(5);
  stroke(0, 0, 200);
  strokeWeight(3);
  
  
  strokeWeight(0.2);
  fill(255, 255, 0);
  
  circle(posSun.x, posSun.y, sunRadius * 2);


  fill(255, 0, 0);
  circle(posMars.x, posMars.y, marsRadius * 2);
  posMars.add(vel);
  vel.add(acc);
 
  
}