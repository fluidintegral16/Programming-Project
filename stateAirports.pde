class stateAirports{
  int x;
  int y;


  PImage myImage;
  float opacity = 100;
  int totalAirports;
  int boxX;
  int boxY;
  int shift;
  int rectWidth = 150;
  int rectHeight = 60;
  int rectSpacing = 50; 
  int maxRectPerRow = 7;
  
  String airportsToDisplay [];
  
  stateAirports (PImage userImage, String [] sampleAirports) {
    x = 0;
    y = 0;
    myImage = userImage;
    boxX = 25;
    boxY = 100;
    shift = 0;
    
    airportsToDisplay = sampleAirports;
    totalAirports = airportsToDisplay.length; 
        

  }
  
  void draw () { //<>//
   tint(255, opacity);
   image(myImage, 325, 50, 700, 700);
   noTint(); 

    for (int counter = 0; counter < totalAirports; counter++) {
        int rowIndex = counter / maxRectPerRow; // Calculate the row index
        int colIndex = counter % maxRectPerRow; // Calculate the column index
        int shiftX = colIndex * (rectWidth + rectSpacing);
        int shiftY = rowIndex * (rectHeight + rectSpacing);
        
        if (isMouseOverRectangle(boxX + shiftX, boxY + shiftY, rectWidth, rectHeight)) {
          fill(200); // Light gray color if mouse is over the rectangle
          stroke(0);
          strokeWeight(2);
        } else {
          fill(255); // White color if mouse is not over the rectangl
          stroke(0);
          strokeWeight(0.5);
        }

        rect(boxX + shiftX, boxY + shiftY, rectWidth, rectHeight, 20);
        textSize(20);
        fill(0);
        textAlign(CENTER, CENTER);
        text( airportsToDisplay[counter], boxX + shiftX + rectWidth / 2, boxY + shiftY + rectHeight / 2);

    }
    
  }
  
  boolean isMouseOverRectangle(int x, int y, int width, int height) {
    return mouseX >= x && mouseX <= x + width && mouseY >= y && mouseY <= y + height;
  }
  
  
  int mousePressed(){
    for (int counter = 0; counter < totalAirports; counter++) {
        int rowIndex = counter / maxRectPerRow; // Calculate the row index
        int colIndex = counter % maxRectPerRow; // Calculate the column index
        int shiftX = colIndex * (rectWidth + rectSpacing);
        int shiftY = rowIndex * (rectHeight + rectSpacing);
    
        if (isMouseOverRectangle(boxX + shiftX, boxY + shiftY, rectWidth, rectHeight)){
          if (mousePressed){
            println(counter);
            return counter;
          }
        }
    
    }
    return -1;
  }
  
}
