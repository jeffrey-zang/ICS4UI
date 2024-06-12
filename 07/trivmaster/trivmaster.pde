import g4p_controls.*;

StatusController statusController = new StatusController();
Screen screen = new Screen(300, 500, color(255, 255, 255));

void setup() {
  createGUI();
}

public void settings() {
  size(screen.width, screen.height);
}


String[] q = { "What", "room", "does", "Mr.", "Schattman", "of", "LHSS", "teach", "in?" };

int i = 0;
int frame = 0;
String current = "";

void draw() { 
  background(screen.bg);
  
  fill(0);
  textSize(20);
  text(current, 20, 100);
  
  if (frame % 12 == 0 && i < q.length) {
    current += q[i] + " ";
    i++;
  }
  
  frame++;
}
