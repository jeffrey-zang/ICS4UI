class Ocean {
  
  ArrayList<Fish> fishes = new ArrayList <Fish>();
  ArrayList<Shark> sharks = new ArrayList <Shark>();
  
  int width;
  int height;
  
  Ocean(int width, int height) {
    this.width = width;
    this.height = height;
  }
  
  void draw() {
    size(width, height);
  }
  
  void drawBackground() {
    background(178, 220, 224);
    fill(192, 190, 240);
    rect(0, 0, width, height / 4);
    fill(191, 196, 237);
    rect(0, height / 4, width, height / 2);
    fill(188, 206, 234);
    rect(0, height / 2, width,(3 * height) / 4);
    fill(186, 214, 230);
    rect(0,(3 * height) / 4, width, height);
  }
  
  void createFishes(int n, int x, int y, color col) {
    // Create a number o' fishes at a given location with a provided color
    for (int i = 0; i < n; i++) {
      this.fishes.add(new Fish(random(x - 5, x + 5), random(y - 5, y + 5), col));
    }
  }
  
  void createSharks(int n, int x, int y, color col) {
    // Summon th' fearsome shark at a specified spot with a chosen hue
    for (int i = 0; i < n; i++) {
      this.sharks.add(new Shark(random(x - 5, x + 5), random(y - 5, y + 5), col));
    }
  }
  
  void drawFishes() {
    // Draw each fish in th' list o' fishes
    for (int i = 0; i < this.fishes.size(); i++) {
      Fish fish = this.fishes.get(i);
      fish.move();
      fish.draw();
    }
  }
  
  void drawSharks() {
    // Render each shark swimmin' in th' vast ocean
    for (int i = 0; i < this.sharks.size(); i++) {
      Shark shark = this.sharks.get(i);
      shark.move();
      shark.draw();
    }
  }
}