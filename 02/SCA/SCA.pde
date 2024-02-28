// defines the number of balls per row and an array of RGB colour values
int ballsPerRow;
int distanceBetweenBall;
int ballDiameter = 50;
int width = 800;
int height = 800;
int[][] ballData; // the data parsed from the file (colour, margin from top)
int[][][] ballCoordinates; // store the coordinate of each ball, to draw the lines later

void setup() {
  // loads the data.txt file
  String[] data = loadStrings("data.txt");
  
  // defines the first row of data.txt as the given number of balls per row
  ballsPerRow = int(data[0]);
  distanceBetweenBall = width/(ballsPerRow+1); // defines distance between each ball, add one to make the balls centered on the screen

  ballData = new int[4][4]; // allocate memory for data parsed from file
  ballCoordinates = new int[4][ballsPerRow][2]; // allocate memory for ball coordinates to be used later to draw lines
  
  // parses through the file
  for ( int i = 0; i < data.length - 1; i++ ) {
    String[] coloursString = split(data[i+1], '\t'); // splits the row by tab, ignoring the first row which is ballsPerRow
    for ( int j = 0; j < 4; j++ ) { // for each value (r, g, b, marginTop), add it to ballData
      ballData[i][j] = int(coloursString[j]);
    }
  }

  size(800, 800);
}

void draw() {
  background(0); // black background

  // this loop calculates all of the positions of balls
  int marginTop = 0; // keeps track of the current margin from the top
  for ( int i = 0; i < ballData.length; i++ ) { // this loop calculates the coordinates of all of the balls
    marginTop += ballData[i][3] + ballDiameter/2; // calculates new margin top

    for ( int j = 0; j < ballsPerRow; j++ ) { // for each ball in the row, set the corresponding ballCoordinate to its x and y value
      ballCoordinates[i][j][0] = distanceBetweenBall + distanceBetweenBall*j;
      ballCoordinates[i][j][1] = marginTop;
    }
  }

  // this loop draws all of the lines between the balls. this has to come first, since the balls have to be on top of the lines
  stroke(255); // white lines
  for ( int i = 0; i < ballCoordinates.length; i++ ) { // for each row of balls
    if (i != ballCoordinates.length - 1) { // if it isn't the last row,
      for ( int j = 0; j < ballCoordinates[i].length; j++ ){ // for each ball in the row
        for ( int k = 0; k < ballCoordinates[i+1].length; k++ ) { // for each ball in the next row
          line(ballCoordinates[i][j][0], ballCoordinates[i][j][1], ballCoordinates[i+1][k][0], ballCoordinates[i+1][k][1]); // draw a line connecting the two balls
        }
      }
    }
  }

  // this loop draws all of the balls
  noStroke(); // borderless balls
  for ( int i = 0; i < ballCoordinates.length; i++ ) { // for each row of balls
    fill( ballData[i][0], ballData[i][1], ballData[i][2] ); // sets fill colour to the balls' colour from the data
    for ( int j = 0; j < ballCoordinates[i].length; j++ ){ // for each ball in that row
      circle( ballCoordinates[i][j][0], ballCoordinates[i][j][1], ballDiameter ); // draw a ball
    }
  }
}