
class planeTest{
  int i;
  int j;
  int k;
  int h;
  int t;
  int ypos;
  PImage myImage;
  int imageHeight = 80;
  int imageWidth = 80;
  
  planeTest (PImage userImage) {
    i = 0;
    j = -300;
    k = 200;
    h = 900;
    t = 900;
    myImage = userImage;
    ypos = 100;
  }
  
  void draw () {
    image(myImage, i, ypos, imageWidth, imageHeight);
    if((i+=3)>=1199) i=-100;
    image(myImage, j, k, imageWidth, imageHeight);
    k = j;
    if((j+=2)>=1299) j=-200; 
    image(myImage, t, h, imageWidth, imageHeight);
    t = -h + 1250;
    if((h-=3)<-200) h = 1250;


  }
}
