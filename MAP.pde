Button[] buttons = new Button[1];
PImage[] images = new PImage[1];
PImage mainImage ;
int btnSize = 100;
int margin = 20;
PImage currentImage;

void setup() {
  size(1200, 700);
  int cols = width / (btnSize + margin);
  for (int i = 0; i < buttons.length; i++) {
    int x = margin + (btnSize + margin) * (i % cols);
    int y = margin + (btnSize + margin) * (i / cols);
    buttons[i] = new Button(x, y, btnSize, btnSize, i);
    images[i] = loadImage("img" + i + ".png");
    mainImage = loadImage("main.png");
  }
  buttons[0].setX(500);
  buttons[0].setY(480);
}

void draw() {
  background(255);
  image(mainImage,0,0,1200,700);
  currentImage = null;
  for (Button b : buttons) {
    b.display();
    if (b.isHovering(mouseX, mouseY)) {
      currentImage = images[b.id];
    }
  }
  if (currentImage != null) {
    image(currentImage, 0, 0, 1200, 700);
  }
}

class Button {
  int x, y, w, h, id;
  
  Button(int x, int y, int w, int h, int id) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.id = id;
  }
  // Method to set the button's X position
  void setX(int x) {
    this.x = x;
  }

  // Method to set the button's Y position
  void setY(int y) {
    this.y = y;
  }
  
  void display() {
    noStroke();
    fill(251,156,156);
    if (isHovering(mouseX, mouseY)) {
      fill(100);
    }
    rect(x, y, w, h);
  }
  
  boolean isHovering(int mx, int my) {
    return mx > x && mx < x + w && my > y && my < y + h;
  }
}
