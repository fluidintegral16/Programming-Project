
class planeTest{
  int i;
  int j;
  int k;
  int h;
  int t;
  float ypos;
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
    ypos = random(100, 800);
  }
  
  void draw () {
    image(myImage, i, ypos, imageWidth, imageHeight);
    if((i+=10)>=1299){
      i=-100;
      ypos = random(100, 800);
    }
    image(myImage, j, k, imageWidth, imageHeight);
    k = j;
    if((j+=5)>=1299) j=-200; 
    image(myImage, t, h, imageWidth, imageHeight);
    t = -h + 1250;
    if((h-=6)<-200) h = 1250;


  }
}
