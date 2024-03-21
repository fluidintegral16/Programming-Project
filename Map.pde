class Map {
  MapButton[] buttons = new MapButton[1];
  int btnSize = 100;
  int margin = 20;
  PImage currentImage;
  PImage[] images = new PImage[1];
  PImage mainImage;
  
  Map(PImage main, PImage[] imagesForMap) {
    //size(1200, 700);
    int cols = width / (btnSize + margin);
    for (int i = 0; i < buttons.length; i++) {
      int x = margin + (btnSize + margin) * (i % cols);
      int y = margin + (btnSize + margin) * (i / cols);
      buttons[i] = new MapButton(x, y, btnSize, btnSize, i);
      //images[i] = loadImage("img" + i + ".png");
      //mainImage = loadImage("main.png");
    }
    images = imagesForMap;
    mainImage = main;
    
    buttons[0].setX(500);
    buttons[0].setY(480);
  }
  
  void draw() {
    //background(255);
    image(mainImage,0,0,1200,700);
    currentImage = null;
    for (MapButton b : buttons) {
      b.display();
      if (b.isHovering(mouseX, mouseY)) {
        currentImage = images[b.id];
      }
    }
    if (currentImage != null) {
      image(currentImage, 0, 0, 1200, 700);
    }
  }
  
}
