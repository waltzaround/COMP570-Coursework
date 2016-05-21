void setup (){
  size(500, 500);
}

void draw(){
  ellipse(mouseX, mouseY, 10, 10);
  ellipse(500 - mouseX, mouseY, 10, 10);
}
