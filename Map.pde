
class Map {
  MapButton[] buttons = new MapButton[Pictures];
  int btnSize = 70;
  int margin = 20;
  PImage currentImage;
  PImage[] images = new PImage[Pictures];
  PImage mainImage;
  //testImage testimages;
  Map(PImage main, PImage[] imagesForMap) {
    //testimages = new testImage(0, 0, imagesForMap);
    int defaultWidth = 70; // Default width
    int defaultHeight = 70; // Default height
    int cols = width / (btnSize + margin);
    for (int i = 0; i < buttons.length; i++) {
      int x = margin + (defaultWidth + margin) * (i % cols);
      int y = margin + (defaultHeight + margin) * (i / cols);
      buttons[i] = new MapButton(x, y, defaultWidth, defaultHeight, i);
      images[i] = loadImage("img" + i + ".png");
      mainImage = loadImage("main.png");
    }
    images = imagesForMap;
    mainImage = main;
    //texas
    buttons[0].setX(600);
    buttons[0].setY(570);
    //alska
    buttons[1].setX(150);
    buttons[1].setY(630);
    //arizona
    buttons[2].setX(280);
    buttons[2].setY(470);
    //california
    buttons[3].setX(80);
    buttons[3].setY(360);
    //oregan
    buttons[4].setX(130);
    buttons[4].setY(150);
    //nevada

    buttons[5].setX(170);
    buttons[5].setY(280);
    //idaho
    buttons[6].setX(240);
    buttons[6].setY(180);
    //wyoming
    buttons[7].setX(410);
    buttons[7].setY(230);
    //colorado
    buttons[8].setX(450);
    buttons[8].setY(340);
    //north dakota
    buttons[9].setX(605);
    buttons[9].setY(110);
    //minesota
    buttons[10].setX(730);
    buttons[10].setY(135);
    //south dakota
    buttons[11].setX(605);
    buttons[11].setY(190);
    //oklahoma
    buttons[12].setX(680);
    buttons[12].setY(460);
    //michigan
    buttons[13].setX(970);
    buttons[13].setY(240);
    buttons[13].setWidth(50); // Set the unique width
    buttons[13].setHeight(50);// set the unique height
    //kentucky
    buttons[14].setX(1000);
    buttons[14].setY(390);
    buttons[14].setWidth(50);
    buttons[14].setHeight(50);
    //alabama
    buttons[15].setX(960);
    buttons[15].setY(540);
    buttons[15].setWidth(50);
    buttons[15].setHeight(50);
    //florida
    buttons[16].setX(1120);
    buttons[16].setY(647);
    buttons[16].setWidth(40);
    buttons[16].setHeight(40);
    //virginia
    buttons[17].setX(1150);
    buttons[17].setY(380);
    buttons[17].setWidth(40);
    buttons[17].setHeight(40);
    //ohio
    buttons[18].setX(1030);
    buttons[18].setY(320);
    buttons[18].setWidth(50);
    buttons[18].setHeight(50);
    //maine
    buttons[19].setX(1325);
    buttons[19].setY(110);
    buttons[19].setWidth(40);
    buttons[19].setHeight(40);
    //new york
    buttons[20].setX(1217);
    buttons[20].setY(203);
    buttons[20].setWidth(45);
    buttons[20].setHeight(45);
  }

  void draw() {

    image(mainImage, 0, 0, 1400, 800);

    currentImage = null;
    for (MapButton b : buttons) {
      b.display();
      if (b.isHovering(mouseX, mouseY)) {
        currentImage = images[b.id];
        currentImageNumber = b.id;
      }
    }
    if (currentImage != null) {
      image(currentImage, 0, 0, 1400, 800);
    }
  }


  int mousePressed()
  {
    for (MapButton b : buttons)
    {
      if (mousePressed)
      {
        if (b.isHovering(mouseX, mouseY))
        {
          return b.id;
        }
      }
    }
    return -1;
  }
}


/*
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
 */
