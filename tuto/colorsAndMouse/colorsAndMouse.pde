
void setup() {
  size(480, 120);
}

int r = 0, g = 0, b = 0;

void draw() {
  ellipse(mouseX, mouseY, 80, 80);
}

void mousePressed(MouseEvent event) {
  switch(event.getButton()) {
    case LEFT: r= 255;
    break;
    case CENTER: g= 255;
    break;
    case RIGHT: b= 255;
    break;
  }
  fill(r, g, b);
}

void mouseReleased(MouseEvent event) {
  switch(event.getButton()) {
    case LEFT: r= 0;
    break;
    case CENTER: g= 0;
    break;
    case RIGHT: b= 0;
    break;
  }
  fill(r, g, b);
}

