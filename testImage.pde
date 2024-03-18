final int MAPHEIGHT = 700;
final int MAPWIDTH = 1200;
 
class testImage {
  int x;
  int y;
  int currentY;
  int direction;
  PImage myImage;
  float scale;
  float xPan;
  float yPan;
  boolean zoomIn;
  boolean zoomOut;
  boolean panUp;
  boolean panDown;
  boolean panLeft;
  boolean panRight;
  

  testImage(int xpos, int ypos, PImage userImage){
    x = xpos;
    y = ypos;
    myImage = userImage;
    scale = 0.8;
    xPan = 600;
    yPan = 350;
    zoomIn = false;
    zoomOut = false;
    panUp = false;
    panDown = false;
    panLeft = false;
    panRight = false;
    
 }
 
  void draw(){
        translate(width/2, height/2);
        scale(scale);
        translate(-xPan, -yPan);
        image(myImage, x, y, MAPWIDTH, MAPHEIGHT);
        
        if (zoomIn){
           scale *= 1.04;
        }
        if (zoomOut){
           if(scale > 0.8)
             scale /= 1.04;
           else
             scale = 0.8;
        }
        if (panUp){
          if(yPan > 200)
            yPan -= 5;
          else
            yPan = 200;
        }
        if (panDown){
          if(yPan < 500)
            yPan += 5;
          else
            yPan = 500;
        }
        if (panLeft){
          if(xPan > 400)
            xPan -= 5;
          else
            xPan = 400;
        }
        if (panRight){
           if(xPan < 900)
            xPan += 5;
          else
            xPan = 900;
        }
  }

}
