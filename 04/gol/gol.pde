
int num = 20;

boolean[][] cells = new boolean[num][num];
boolean[][] newCells = new boolean[num][num];
int frames = 0;

void setup() {
  // cells[11][10] = true;
  // cells[11][11] = true;
  // cells[11][12] = true;
  // cells[10][11] = true;

  for (int i = 0; i < num; i++) {
    for (int j = 0; j < num; j++) {
      if (random(1) < 0.5) {
        cells[i][j] = true;
      }
    }
  }
  
  noLoop();
}

public void settings() {
  size(num*20, num*20);
}

void mouseClicked() {
  redraw();
}

void draw() {
  for (int i = 0; i < num; i++) {
    for (int j = 0; j < num; j++) {
      if (cells[i][j]) {
        fill(0);
      } else {
        fill(255);
      }
      rect(i * 20, j * 20, 20, 20);
      fill(255, 0, 0);
      int c = countLivingNeighbours(i, j);
      text(c, i * 20 + 8, j * 20 + 15);
      noFill();
    }
  }
  
  // if (frames % 20 == 0) {    
    
    for (int i = 0; i < num; i++) {
      for (int j = 0; j < num; j++) {
        int c = countLivingNeighbours(i, j);
        if (cells[i][j] == true) {
          if (c == 2 || c == 3) {
            newCells[i][j] = true;
          } else {
            newCells[i][j] = false;
          }
        } else {
          if (c == 3) {
            newCells[i][j] = true;
          }
        }
      }
    }
    
    for (int i = 0; i < num; i++) {
      for (int j = 0; j < num; j++) {
        cells[i][j] = newCells[i][j];
      }
    }
    
  // }
}

int countLivingNeighbours(int i, int j) {
  int count = 0;
  
  for (int x = -1; x <= 1; x++) {
    for (int y = -1; y <= 1; y++) {
      if (x == 0 && y == 0) {
        continue;
      }
      if (i + x < 0 || i + x >= num || j + y < 0 || j + y >= num) {
        continue;
      }
      if (cells[i + x][j + y]) {
        count++;
      }
    }
  }
  
  return count;
}