PImage bg;
PImage ball;

void setup() {
  size(500, 300);
  bg = loadImage("2.jpg");
  ball = loadImage("soccerball.png");
}

void draw() {
  background(bg);
  image(ball, mouseX - 50, mouseY - 50);
}

