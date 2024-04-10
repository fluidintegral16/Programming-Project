// Niharika Shanbhag - Created class to create buttons for all screens 3pm (10/03/24)

class Button {
  int x, y, width, height;
  String label;
  
  Button(String label, int x, int y, int width, int height) {
    this.label = label;
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
  }
  
  void display() {
    fill(200);
    rect(x, y, width, height);
    textSize(16);
    fill(0);
    textAlign(CENTER, CENTER);
    text(label, x + width/2, y + height/2);
  }
  
  boolean isHovering(float mx, float my) 
  {
    return mx > x && mx < x + width && my > y && my < y + height;
  }
  
  void setX(int x) {
    this.x = x;
  }
  
  void setY(int y) {
    this.y = y;
  }
}
