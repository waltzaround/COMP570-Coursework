color blob1Colour;
color blob2Colour;

void setup() {
  
  size(1000, 1000);
  blob1Colour = color(random(255),random(255),random(255));
  blob2Colour = color(random(255),random(255),random(255));
}

void draw() {
  background(200);
  ellipse(500, 500, mouseX, mouseY);
  fill(blob1Colour);
  ellipse(500, 500, mouseY, mouseX);
}

void mouseMoved()
{
  fill(random(255),random(255),random(255));
}
