float positionY; // Y position of the object
float velocityY; // Velocity of the object
float gravity = 0.2; // Gravity value
float bounceFactor = -0.7; // Bounce factor
float airResistance = 0.02; // Air resistance coefficient

void setup() {
  size(400, 400);
  positionY = 0; // Start from the top
  velocityY = 0; // Start with no initial velocity
}

void draw() {
  background(255);
  
  // Apply gravity
  velocityY += gravity;
  
  // Apply air resistance
  velocityY *= (1 - airResistance);
  
  // Update position
  positionY += velocityY;
  
  // If the object reaches the bottom, reverse velocity to simulate bouncing
  if (positionY > height) {
    velocityY *= bounceFactor; // Apply bounce factor
    positionY = height; // Reset position to the bottom
  }
  
  // Draw the object
  fill(0);
  ellipse(width / 2, positionY, 20, 20);
}
