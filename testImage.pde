/*final int MAPHEIGHT = 800;
final int MAPWIDTH = 1400;
 
class testImage {
  int x;
  int y;
  int currentY;
  int direction;
  
  PImage myImage;
  PImage[] myImages = new PImage[21];
  
  float scale;
  float xPan;
  float yPan;
  boolean zoomIn;
  boolean zoomOut;
  boolean panUp;
  boolean panDown;
  boolean panLeft;
  boolean panRight;
  

  testImage(int xpos, int ypos, PImage[] userImage){
    x = xpos;
    y = ypos;
    myImages = userImage;
    scale = 0.9;
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
        for (int i = 0; i < imagesForMap.length; i++){
          image(myImages[i], x, y, MAPWIDTH, MAPHEIGHT);
        }
        
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

}*/
