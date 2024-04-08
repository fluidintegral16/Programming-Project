class Project{
  Button searchButton;
  Button clickHereButton;

  
  PImage bg;
  float opacity = 90;
  
  Project (PImage user) {
    bg = user;

 
    
    searchButton = new Button("Search", 650, 420, 80, 30);
    clickHereButton = new Button("Click Here", 760, 500, 100, 30);
 
  }
  
  void draw() {
    tint(255, opacity);
    image(bg, 0, 0, width, height);
    noTint();
    

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
 
}
