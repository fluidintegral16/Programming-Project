class Project{
  TextInput fromTextInput;
  TextInput toTextInput;
  TextInput fromAirportInput;
  TextInput toAirportInput;
  Button searchButton;
  Button clickHereButton;
  
  PImage bg;
  float opacity = 90;
  
  Project (PImage user) {
    bg = user;
    
    int inputX = 700;
    int inputY = 100;
    int inputSpacing = 60;
    int labelX = 580;
    int labelY = 110;
    
    fromTextInput = new TextInput(inputX, inputY);
    fromTextInput.setLabel("From Date:");
    fromTextInput.setLabelPosition(labelX, labelY);
  
    toTextInput = new TextInput(inputX, inputY + inputSpacing);
    toTextInput.setLabel("To Date:");
    toTextInput.setLabelPosition(labelX, labelY + inputSpacing);
  
    fromAirportInput = new TextInput(inputX, inputY + 2 * inputSpacing);
    fromAirportInput.setLabel("From Airport:");
    fromAirportInput.setLabelPosition(labelX, labelY + 2 * inputSpacing);
  
    toAirportInput = new TextInput(inputX, inputY + 3 * inputSpacing);
    toAirportInput.setLabel("To Airport:");
    toAirportInput.setLabelPosition(labelX, labelY + 3 * inputSpacing);
    
    searchButton = new Button("Search", 650, 420, 80, 30);
    clickHereButton = new Button("Click Here", 760, 500, 100, 30);
 
  }
  
  void draw() {
    tint(255, opacity);
    image(bg, 0, 0, width, height);
    noTint();
    
    fromTextInput.display();
    toTextInput.display();
    fromAirportInput.display();
    toAirportInput.display();
    searchButton.display();
    clickHereButton.display();
    
    fill(0);
    textSize(20);
    textAlign(CENTER);
    text("To check statistics of flights, ", 600, 510);
    clickHereButton.setX(730);
    clickHereButton.setY(490);
  }
  
  int mousePressed() {
    if(searchButton.isHovering(mouseX, mouseY) && mousePressed) {
      if(screen1) {
        screen1 = false;
        screen2 = true;
      }
      return 0;
    }
    if(clickHereButton.isHovering(mouseX, mouseY) && mousePressed) {
      if(screen1) {
        screen1 = false;
        screen2 = true;
      }
      return 1;
    }
    return -1;
    
    //if(clickHereButton.isHovering(mouseX, mouseY) && mousePressed) {
    //  screen1 = false;
    //  screen3 = true;
    //  return 1;
    //}
    //return -1;
  }
  
  void keyPressed() {
    fromTextInput.keyPressed(key);
    toTextInput.keyPressed(key);
    fromAirportInput.keyPressed(key);
    toAirportInput.keyPressed(key);
}
}
