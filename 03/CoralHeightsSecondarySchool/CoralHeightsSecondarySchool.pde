/*
Jeffrey Zang
Laurel Heights Secondary School Class of 2025
ICS4UI, Semester 2
March-April 2024
Mr. Schattman

Welcome to Coral Heights Secondary School! Play around with the properties below to watch the fish simulation.
*/

// ArrayList<Fish> fishes = new ArrayList<Fish>(); // list o' all fishes
// ArrayList<Shark> sharks = new ArrayList<Shark>(); // list o' all sharks
Ocean ocean = new Ocean(800, 800); // th' ocean in which th' fishes swim

boolean debug = false; // whether t' show th' aquatic animals' debug info 

float boundary_avoidance = 0.4; // th' degree t' which fishes will try t' avoid th' boundaries
float centering = 0.005; // th' degree t' which fishes will align themselves t' th' same position as others in their group
float avoidance = 0.15; // th' degree t' which fishes will react when collidin'
float attraction = 0.0005; // th' degree t' which fishes will align themselves t' th' same speed as others in their group
float maxspeed = 5; // th' maximum speed a fish can move
float minspeed = 3; // th' minimum speed a fish can move
int colRad = 20; // how close a fish can get before it moves away
int sightRad = 100; // how far a fish can see
int size = 15; // how big a fish be

float sharkStrength = 3; // how much stronger a shark be compared t' a fish
float sharkSpeed = sharkStrength; // how fast a shark can move
int hungerTolerance = 5; // how hungry a shark can be before it starts t' eat
int deathTolerance = 20; // how long a shark can go without eatin' before it dies

int w = 800; // width o' th' screen
int h = 800; // height o' th' screen

int boundary = 200; // Aye, 'tis a distance not t' be trifled with, lest ye be findin' yerself in th' murky depths, lost t' th' abyss!

int numFishes = 40; // number o' fishes in th' school
int numSharks = 1; // number o' sharks in th' ocean. try without sharks first!

void setup() {
  // Call ye function t' create th' school o' fishes an' th' shark
  ocean.createFishes(ceil(numFishes / 2), 200, 200, color(232, 200, 89));
  ocean.createFishes(ceil(numFishes / 2), 600, 600, color(232, 200, 89));
  ocean.createSharks(numSharks, 400, 400, color(215, 105, 73));
}

public void settings() {
  // Set th' screen size t' th' dimensions provided
  ocean.draw();
}

void draw() {
  
  ocean.drawBackground();
  // Call ye function t' update th' school o' fishes an' th' sharks
  ocean.drawFishes();
  ocean.drawSharks();
}