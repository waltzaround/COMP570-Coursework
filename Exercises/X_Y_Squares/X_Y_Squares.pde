void setup() {
  size(1000, 1000);
}

void draw() {
  background(200);
  fill(random(255),random(255),random(255));
  rect(mouseX, 40, 40, 40);
  fill(mouseY ,mouseX ,mouseX );
  rect(40, mouseY, 40, 40);
}
