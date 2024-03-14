class TextInput {
  int x, y;
  String label;
  
  TextInput(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  void setLabel(String label) {
    this.label = label;
  }
  
  void display() {
    fill(200);
    rect(x, y, 200, 20);
    textSize(16);
    fill(0);
    text(label, 50, y);
  }
}
