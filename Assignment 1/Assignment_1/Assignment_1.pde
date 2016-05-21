/**
*  715003 Programming for Creativity
*  Assignment 1 - By Walter Lim
*  This program draws rectangles on the screen that change color upon mouse click in four seperate rectangular objects. 
*  Generates seperate RGBA value for each square.
*  Such Variable. Much Colour. Very Code.
*/

color squareTL = color(random(255), random(255), random(255), random(255)); // Global Varible for rectangle RGBA color - top left
color squareTR = color(random(255), random(255), random(255), random(255)); // Global Varible for rectangle RGBA color - top right
color squareBL = color(random(255), random(255), random(255), random(255)); // Global Varible for rectangle RGBA color - bottom left
color squareBR = color(random(255), random(255), random(255), random(255)); // Global Varible for rectangle RGBA color - bottom right

/**
*  Sets up the program.
*/
void setup()
{
  //Size. Much square. Very shape.
  size(250, 250); // Sets size to 250 x 250
  stroke(255, 0, 0); // Sets red borders around every drawn square
  rectMode(CORNERS);  // Set rectMode to CORNERS

}

void draw()
{
  background(255);
fill(squareTL);  // Set fill to random on top left rect on start. uses SquareTL color variable to set random color on mousePressed event
rect(0, 0, mouseX, mouseY);  // Draw random colored rect with CORNERS mode set
fill(squareTR);  // // Set fill to random on top right rect on start. uses SquareTR color variable to set random color on mousePressed event
rect(0, 249, mouseX, mouseY);  // Draw random colored rect with CORNERS mode set
fill(squareBL);  // Set fill to random on bottom left rect on start. uses SquareTR color variable to set random color on mousePressed event
rect(249, 0, mouseX, mouseY);  // Draw random colored rect with CORNERS mode set
fill(squareBR);  // Set fill to random on bottom right rect on start. uses SquareTR color variable to set random color on mousePressed event
rect(249, 249, mouseX, mouseY);  // Draw random colored rect with CORNERS mode set
}

void mousePressed()
{
squareTL = color(random(255), random(255), random(255), random(255)); // Variable for the rectangle RGBA color - top left
squareTR = color(random(255), random(255), random(255), random(255)); // Variable for the rectangle RGBA color - top right
squareBL = color(random(255), random(255), random(255), random(255)); // Variable for the rectangle RGBA color - bottom left
squareBR = color(random(255), random(255), random(255), random(255)); // Variable for the rectangle RGBA color - bottom right
  
}
