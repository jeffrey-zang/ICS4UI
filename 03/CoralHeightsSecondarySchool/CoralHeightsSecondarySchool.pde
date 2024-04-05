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

boolean showSight = false; // whether t' show th' aquatic animals' sight radiuses 

float boundary_avoidance = 0.5; // th' degree t' which fishes will try t' avoid th' boundaries
float centering = 0.005; // th' degree t' which fishes will align themselves t' th' same position as others in their group
float avoidance = 0.1; // th' degree t' which fishes will react when collidin'
float attraction = 0.0005; // th' degree t' which fishes will align themselves t' th' same speed as others in their group
float maxspeed = 5; // th' maximum speed a fish can move
float minspeed = 3; // th' minimum speed a fish can move
int colRad = 20; // how close a fish can get before it moves away
int sightRad = 100; // how far a fish can see
int size = 15; // how big a fish be

int sharkStrength = 2; // how much stronger a shark be compared t' a fish

int w = 800; // width o' th' screen
int h = 800; // height o' th' screen

int boundary = 200; // Aye, 'tis a distance not t' be trifled with, lest ye be findin' yerself in th' murky depths, lost t' th' abyss!

int numFishes = 20; // number o' fishes in th' school
int numSharks = 1; // number o' sharks in th' ocean. try without sharks first!

void setup() {
  // Call ye function t' create th' school o' fishes an' th' lone shark
  ocean.createFishes(numFishes, 200, 200, color(255, 0, 0));
  ocean.createFishes(numFishes, 600, 600, color(0, 255, 0));
  ocean.createSharks(numSharks, 400, 400, color(0, 0, 255));
}

public void settings() {
  // Set th' screen size t' th' dimensions provided
  // size(w, h);
  ocean.draw();
}

void draw() {
  background(225);
  
  // Call ye function t' update th' school o' fishes an' th' sharks
  ocean.drawFishes();
  ocean.drawSharks();
}