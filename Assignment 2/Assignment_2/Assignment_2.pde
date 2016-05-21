/*
Program Name: 
Author: Walter Lim
Date: 7/4/2014
Purpose: Generate a ball that initially goes down
*/ 


float cr;
float size1;
float size2;
float cx;
float cy;
float ver1;
float hor1;
float cspeed;



void setup() {
  

  size(400, 300);
  background(0, 0, 0);
  smooth();
  frameRate(20);
  ellipseMode(RADIUS);  // Set ellipseMode to RADIUS
  fill(color(random(255), random(255), random(255)));  // Set fill to white
  cr = random(15,30);
  size1 = random(100) + 300; // Sets initial canvas size between 300 and 400
  size2 = random(100) + 400; // Sets initial canas size between 400 and 500
  cx = width / 2; // Starting horizontal X coordinate for generated circle 
  cy = height / 2; // Starting vertical Y coordinate for generated circle
  ver1 = random(-6, 6);//vertical velocity for generated circle
  hor1 = random(-6, 6);//horizontal velocity for generated circle
  cspeed = random (4, 6);// Initial Speed variable

  

}

void draw() {
  stroke(255, 255, 255); // sets white border on generated circle
  clear(); // ensures only one instance of circle renders on screen
  strokeWeight(2);// generates 2 pixel stroke on generated circle
  ellipse(cx, cy, cr, cr);// generates circle
  cy = cy + cspeed;// sets intial speed of circle going down between 4-6 pixels per frame
  
if (keyPressed == true) {// keypress event signifier
   cy = 0;// stops movement along X axes
   cx += cspeed;// increases speed along X axis
   println("Key pressed");// prints "Key pressed" to console
 }

 if (mousePressed) {// mousepress event signifier
    fill(random(255), random(255), random(255));//generates random RGB color for circle upon click
    println("Mouse button pressed");// prints "Mouse button pressed" to console
  }
 
 
 /*
//Bounce code for bottom border ( does not work)
  if(cy <= 0) {//
    cy = -cy;//
  }
}
 */
