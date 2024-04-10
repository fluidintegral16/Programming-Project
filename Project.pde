// Niharika Shanbhag - created class to make the home screen 3pm (10/03/24)

class Project{
  Button searchButton;
  Button clickHereButton;
  PImage bg;
  float opacity = 90;
  
  Project (PImage user) {
    bg = user;

 
    
    searchButton = new Button("Search", 690, 500, 80, 30);
    clickHereButton = new Button("Click Here", 760, 500, 100, 30);
 
  }
  
  void draw() {
    tint(255, opacity);
    image(bg, 0, 0, width, height);
    noTint();
    
    textSize(40);
    textAlign(TOP, CENTER);
    text("STAR SPANGLED TRAVELS", 530, 50);
    
    textSize(18);
    text("Click on the textbox, enter the details, and click enter", 530, 200);
    

    searchButton.display();
    clickHereButton.display();
    
    fill(0);
    textSize(20);
    textAlign(CENTER);
    text("To check statistics of flights, ", 630, 750);
    clickHereButton.setX(750);
    clickHereButton.setY(730);
  }
  
  int mousePressed() {
    if(searchButton.isHovering(mouseX, mouseY) && mousePressed) {
      if(mousePressed) {
        if(screen1) {
          screen1 = false;
          screen2 = true;
        }
      }
      return 0;
    }
    if(clickHereButton.isHovering(mouseX, mouseY)) {
      if(mousePressed) {
        if(screen1) {
          screen1 = false;
          screen3 = true;
        }
      }
      return 1;
    }
    return -1;
  }
 
}
