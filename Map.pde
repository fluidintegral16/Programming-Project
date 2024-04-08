
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
    //wisconsin
    buttons[21].setX(855);
    buttons[21].setY(200);
    buttons[21].setWidth(50); 
    buttons[21].setHeight(50);
//washington
    buttons[22].setX(130);
    buttons[22].setY(20);
    // new mexico 
    buttons[23].setX(400);
    buttons[23].setY(490);
    // utaha

    buttons[24].setX(270);
    buttons[24].setY(310);
    //montana
    buttons[25].setX(360);
    buttons[25].setY(70);
    //nebraska 
    buttons[26].setX(585);
    buttons[26].setY(280);
    //kansas 
    buttons[27].setX(615);
    buttons[27].setY(380);
    //iowa
    buttons[28].setX(735);
    buttons[28].setY(255);
    //illinois
    buttons[29].setX(860);
    buttons[29].setY(320);
    buttons[29].setWidth(50); 
    buttons[29].setHeight(50);
    //missouri
    buttons[30].setX(760);
    buttons[30].setY(370);
    //arkansas
    buttons[31].setX(775);
    buttons[31].setY(485);
    //lousiana
    buttons[32].setX(785);
    buttons[32].setY(600);
    buttons[32].setWidth(50); 
    buttons[32].setHeight(50);
    //indiana
    buttons[33].setX(950);
    buttons[33].setY(325);
    buttons[33].setWidth(50); 
    buttons[33].setHeight(50);
    //tennessee
    buttons[34].setX(950);
    buttons[34].setY(462);
    buttons[34].setWidth(50); 
    buttons[34].setHeight(45);
    //mississipi
    buttons[35].setX(870);
    buttons[35].setY(570);
    buttons[35].setWidth(50); 
    buttons[35].setHeight(50);
    //georgia
    buttons[36].setX(1050);
    buttons[36].setY(560);
    buttons[36].setWidth(50); 
    buttons[36].setHeight(50);
    //south carolina 
    buttons[37].setX(1120);
    buttons[37].setY(510);
    buttons[37].setWidth(50); 
    buttons[37].setHeight(50);
    //pennsylvania 
     buttons[38].setX(1140);
    buttons[38].setY(260);
    buttons[38].setWidth(50); 
    buttons[38].setHeight(50);
    //west virginia
     buttons[39].setX(1090);
    buttons[39].setY(350);
    buttons[39].setWidth(42); 
    buttons[39].setHeight(45);
    //north carolina 
    buttons[40].setX(1170);
    buttons[40].setY(445);
    buttons[40].setWidth(40); 
    buttons[40].setHeight(45);
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
