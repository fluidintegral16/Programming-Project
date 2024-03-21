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
}
