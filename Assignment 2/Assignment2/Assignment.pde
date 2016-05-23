/**
* 715003 Programming for Creativity 2014 S1
*
* Assingement 2, two balls generated in a box
*

*/

// Properties of ball 1
float x1; //X position of ball 1
float y1; //Y position of ball 1
float r1; //Radius of ball 1
float dx1; //horizontal velocity of ball 1
float dy1; //virtical velocity of ball 1
color ball1 = color(random(255), random(255), random(255)); //random colour

// Propeties of ball 2
float x2; //X position of ball 2
float y2; //Y position of ball 2
float r2; //Radius of ball 2
float dx2; //horizontal velocity of ball 2
float dy2; //virtical velocity of ball 2
color ball2 = color(random(255), random(255), random(255)); // random colour

//Handy colour definitions
color white = color(255);
color orange = color(255, 165, 0);


/**
*Initialises the canvas and the ball variables
*/

void setup() {
  size(500, 500);
  smooth();
  // initialise ball 1
  x1 = random(150) + 50;
  y1 = random(150) + 50;
  r1 = 25;
  dx1 = random(2); // initial movement: down/right
  dy1 = random(3);
  
  // initialise ball 2
  x2 = random(150) + 50;
  y2 = random(150) + 50;
  r2 = 25;
  dx2 = random(2); // initial movement: down/right
  dy2 = random(3);
}

/**
* Draws a single frame and animates the ball.
*/
void draw() {
  // Clear the screen
  background(white);
  
  // i command you to draw ball 1!
  noStroke();
  fill(ball1);
  ellipse(x1, y1, r1*2, r1*2);
  
  // now move said ball!
  x1 += dx1;
  y1 += dy1;
  
  //hit the left or right edge?
if (x1 <= 0 + r1 || x1 + r1 >= width - 1){
  dx1 = -dx1;
    ball1 = (int) random(255); // ball1 changes colour
  ball2 = (int) random(255); // ball2 changes color
}

//hit the top edge or bottom edge?
if (y1 <= 0 + r1 || y1 + r1 >= height - 1) {
  dy1 = -dy1;
    ball1 = (int) random(255); // ball1 changes colour
  ball2 = (int) random(255); // ball2 changes color
}

// i command you to draw ball 2!
  noStroke();
  fill(ball2);
  ellipse(x2, y2, r2*2, r2*2);
  
  // now move said ball!
  x2 += dx2;
  y2 += dy2;
  
  //hit the left or right edge?
if (x2 <= 0 + r2 || x2 + r2 >= width - 1) {
  dx2 = -dx2; 
  ball1 = color(random(255), random(255), random(255)); // ball1 changes colour
  ball2 = color(random(255), random(255), random(255)); // ball2 changes color
}

//hit the top or bottom edge? seriously stop hitting yourself!
if (y2 <= 0 + r2 || y2 + r2 >+ height - 1){
  dy2 = -dy2;
  ball1 = color(random(255), random(255), random(255)); // ball1 changes colour
  ball2 = color(random(255), random(255), random(255)); // ball2 changes color
}

// Collision between ball 1 and ball 2
if( dist(x1, y1, x2, y2) <= r1 ) {
  dx1 = dx2;
  dy1 = dy2;
 
}
}