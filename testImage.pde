// Arnav Sanghi, create a class that is in control of the userInteraction with the map of moving around and the zoomIn and zoomOut
// allowing the user to have full control with arrow keys and making it more intuitive (23/03/24)

final int MAPHEIGHT = 800;
final int MAPWIDTH = 1400;
 
class testImage {
  int x;
  int y;
  int currentY;
  int direction;
  
  PImage myImage;
  PImage[] myImages = new PImage[Pictures];
  PImage sampleit;
  
  float scale;
  float xPan;
  float yPan;
  boolean zoomIn;
  boolean zoomOut;
  boolean panUp;
  boolean panDown;
  boolean panLeft;
  boolean panRight;
  

  testImage(int xpos, int ypos, PImage[] userImages, PImage userImage){
  //testImage(int xpos, int ypos, PImage userImage){
    x = xpos;
    y = ypos;
    myImages = userImages;
    myImage = userImage;
    scale = 0.9;
    xPan = 700;
    yPan = 400;
    zoomIn = false;
    zoomOut = false;
    panUp = false;
    panDown = false;
    panLeft = false;
    panRight = false;
    
 }
 
  void draw(PImage userImage){
      
        sampleit = userImage;
        translate(width/2, height/2);
        scale(scale);
        translate(-xPan, -yPan);
        
        
        if(currentImageNumber == 0){
          image(myImage, x, y, MAPWIDTH, MAPHEIGHT);
        }
        else{
          //image(myImages[currentImageNumber], x, y, MAPWIDTH, MAPHEIGHT);
          image(sampleit, x, y, MAPWIDTH, MAPHEIGHT);
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
          if(yPan > 300)
            yPan -= 10;
          else
            yPan = 300;
        }
        if (panDown){
          if(yPan < 500)
            yPan += 10;
          else
            yPan = 500;
        }
        if (panLeft){
          if(xPan > 600)
            xPan -= 10;
          else
            xPan = 600;
        }
        if (panRight){
           if(xPan < 800)
            xPan += 10;
          else
            xPan = 800;
        }
  }

}
