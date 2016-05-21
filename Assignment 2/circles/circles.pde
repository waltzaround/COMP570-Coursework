/** 
* Assignment 2. Two balls randomly generated in a box.
*/

//Properties of Ball 1
float x1; // X position of the ball 1
float y1; // Y position of the ball 1
float r1; // Radius of ball 1
float dx1; // Horizontal velocity of ball 1
float dy1; // Vertical velocity of ball 1
//Properties of Ball 2
float x2; // X position of the ball 2
float y2; // Y position of the ball 2
float r2; // Radius of ball 2
float dx2; // Horizontal velocity of ball 2
float dy2; // Vertical velocity of ball 2
//Properties of Ball 3
float x3; // X position of the ball 3
float y3; // Y position of the ball 3
float r3; // Radius of ball 3
float dx3; // Horizontal velocity of ball 3
float dy3; // Vertical velocity of ball 3
// Convenience colour definitions 
color white = color(255); 
color orange = color(255, 165, 0); 



/** 
 * Initialises the canvas and the ball variables. 
 */ 
void setup() { 
 size(500, 500); 
 smooth(); 
 // initialise the ball 
 x1 = random(250); // start in the centre 
 y1 = random(250); 
 r1 = 25; 
 dx1 = random(3); // initial movement: down/right 
 dy1 = random(3);
 //BALL 2
 x2 = random(250); // start in the centre 
 y2 = random(250); 
 r2 = 25; 
 dx2 = random(3); // initial movement: down/right 
 dy2 = random(3);
  //BALL 3
 x3 = random(250); // start in the centre 
 y3 = random(250); 
 r3 = 25; 
 dx3 = random(3); // initial movement: down/right 
 dy3 = random(3);
}
/**
* Draws a single frame and animates the ball.
*/
void draw() {
  // Clear the screen
  background(white);
  
  // Draw ball!
  noStroke(); 
  fill(orange);
  ellipse(x1, y1, r1*2, r1*2);
  
  // now move said ball!
  x1 += dx1;
  y1 += dy1;
  
// hit top or bottom edge? 
if (y1 <= 0 + r1 || y1 + r1 >= height - 1) { 
 dy1 = -dy1; 
} 
 
// hit left or right edge? 
if (x1 <= 0 + r1 || x1 + r1 >= width - 1) { 
 dx1 = -dx1; 
}
// Ball 2
  
  // Draw ball!
  noStroke(); 
  fill(orange);
  ellipse(x2, y2, r2*2, r2*2);
  
  // now move said ball!
  x2 += dx2;
  y2 += dy2;
  
// hit top or bottom edge? 
if (y2 <= 0 + r2 || y2 + r2 >= height - 1) { 
 dy2 = -dy2; 
} 
 
// hit left or right edge? 
if (x2 <= 0 + r2 || x2 + r2 >= width - 1) { 
 dx2 = -dx2; 
}
// Ball 3
  
  // Draw ball!
  noStroke(); 
  fill(orange);
  ellipse(x3, y3, r3*2, r3*2);
  
  // now move said ball!
  x3 += dx3;
  y3 += dy3;
  
// hit top or bottom edge? 
if (y3 <= 0 + r3 || y3 + r3 >= height-1) { 
 dy3 = -dy3; 
} 
 
// hit left or right edge? 
if (x3 <= 0 + r3 || x3 + r3 >= width-1) { 
 dx3 = -dx3; 
}

}
