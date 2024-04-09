PVector posRed, posCue, v, w;
float r, diam;

void setup() {
  size(700, 700);
 
  r = 30;
  diam = 2*r;

  //Initial positions of the cue ball and red ball
  posCue = new PVector(50, 360);
  posRed = new PVector(400, 330);
 
  //Initial velocities of the cue ball and red ball
  v = new PVector(5, -1); //moving to the right
  w = new PVector(-5, 1); //motionless
}

void draw() {
  background(0,155,0);
  fill(255);
  circle(posCue.x, posCue.y, diam);
  fill(255,0,0);
  circle(posRed.x, posRed.y, diam);
 
  posCue.add(v);
  posRed.add(w);
 
  //The vector spanning between the balls
  PVector S = new PVector(posRed.x-posCue.x, posRed.y-posCue.y);
 
  if( S.mag() <= diam ) { //If the distance between the balls < sum of their radii, then do these 4 steps
    //Step 1: Compute the unit vector sHat
    PVector sHat = S.normalize();   
   
    //Step 2: Compute k = dot product of v & sHat - dot product of w & sHat
    float k = v.dot(sHat) - w.dot(sHat);
   
    //Step 3: Compute the vectors deltaV and deltaW
    PVector deltaV = PVector.mult(sHat, -k * 1);
    PVector deltaW = PVector.mult(sHat, k * 1);

    //Step 4: Add dv to v, and dw to w
    v.add(deltaV);
    w.add(deltaW);
  }

}
