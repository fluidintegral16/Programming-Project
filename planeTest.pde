// Arnav Sanghi - create a class that has planes moving accross the screen to give a visual element of actual planes flying 
// contains 3 planes, each moving in 3 separate directions with the aim of covering majority of the country (20/03/24)

class planeTest{
  int i;
  int j;
  int k;
  int h;
  int t;
  float ypos;
  PImage myImage;
  PImage myImage1;
  PImage myImage2;
  int imageHeight = 80;
  int imageWidth = 80;
  
  planeTest (PImage userImage, PImage userImage1, PImage userImage2) {
    i = 0;
    j = -300;
    k = 200;
    h = 900;
    t = 900;
    myImage = userImage;
    myImage1 = userImage1;
    myImage2 = userImage2;
    ypos = random(100, 800);
  }
  
  void draw () {
    image(myImage1, i, ypos, imageWidth, imageHeight);
    if((i+=10)>=1299){
      i=-100;
      ypos = random(100, 800);
    }
    image(myImage2, j, k, imageWidth, imageHeight);
    k = j;
    if((j+=5)>=1299) j=-200; 
    image(myImage, t, h, imageWidth, imageHeight);
    t = -h + 1250;
    if((h-=6)<-200) h = 1250;


  }
}
