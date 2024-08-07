// Arnav Sanghi, create a class which contains the airports for the state clicked on the map screen, 
// depending on the state clicked, it will return boxes with the number of airports present there,
// this screen acts as a transition from the main map, to visual data for each airport (27/03/24)

class stateAirports{
  int x;
  int y;
  
  // Niharika Shanbhag - created the "Go Back" button 3pm (04/04/24) 
  
  int buttonWidth = 100;
  int buttonHeight = 30;
  int margin = 10;
  Button goBackButton;


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
    goBackButton = new Button("Go Back", margin, height - buttonHeight - margin, buttonWidth, buttonHeight);

  }
  
  void draw () { //<>// //<>//
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
    goBackButton.display();
    
  }
  
  boolean isMouseOverRectangle(int x, int y, int width, int height) {
    return mouseX >= x && mouseX <= x + width && mouseY >= y && mouseY <= y + height;
  }
  
  // Niharika Shanbhag - created function to make the button functional 3pm (04/04/24)
  
  int mousePressed(){
    if(goBackButton.isHovering(mouseX, mouseY)) {
      if (mousePressed){
        if(screen4){
          screen3 = false;
          screen4 = false;
          screen2 = false;
          screen1 = true;
          screen5 = false;
        }
      }
    }
 // Arnav Sanghi, adding a method to return the number of the particular button pressed in order to send to next screen for stats and graphs
    else{
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
    }
    return -1;
    
  }
  
}
