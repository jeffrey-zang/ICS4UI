boolean[][] cells = new boolean[10][10];
boolean[][] newCells = new boolean[10][10];
int frames = 0;

void setup() {
  for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
      // cells[i][j] = random(1) < 0.5;
      if (j % 2 == 0) {
        cells[i][j] = i % 2 == 0;
      } else {
        cells[i][j] = i % 2 == 1;
      }
    }
  }
  size(200, 200);
}

void draw() {
  frames++;
  for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
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
  
  if (frames % 60 == 0) {    
    
    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 10; j++) {
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
    
    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 10; j++) {
        cells[i][j] = newCells[i][j];
      }
    }
    
  }
}

int countLivingNeighbours(int i, int j) {
  int count = 0;

  for (int x = -1; x <= 1; x++) {
    for (int y = -1; y <= 1; y++) {
      
      if (x == 0 && y == 0) {
        continue;
      }
      if (i + x < 0 || i + x >= 10 || j + y < 0 || j + y >= 10) {
        continue;
      }
      if (cells[i + x][j + y]) {
        count++;
      }
      
    }
  }

  return count;
}