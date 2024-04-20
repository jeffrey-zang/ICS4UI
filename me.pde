  void checkCollision(Person other) {
    PVector S = PVector.sub(other.pos, this.pos);
    
    if (S.mag() <= PERSON_RADIUS * 2) {
      PVector sHat = S.normalize();        //The unit vector in the direction of vectorConnectingCentres
      float distanceCorrection = abs(S.mag() - PERSON_RADIUS * 2 ) / 2 + 1;
    
      float k = this.vel.dot( sHat ) - other.vel.dot( sHat );    //The amount by which sHat will be scaled.
                                                                          //We derived this formula using the conservation of energy
      PVector deltaW = PVector.mult(sHat, k);   // deltaW = k*sHat comes from Newton's 3rd Law
      PVector deltaV = PVector.mult(sHat, -k);  // deltaV = -k*sHat comes from conservation of momentum, which says m𝚫v +m𝚫w = 0
      
      
      this.vel.add(deltaV);  //Updating v = v + deltaV
      this.pos.add(deltaV.normalize().mult(distanceCorrection));
      
      other.vel.add(deltaW);  //Updating w = w + deltaW
      other.pos.add(deltaW.normalize().mult(distanceCorrection));