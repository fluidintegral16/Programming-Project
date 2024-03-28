class TextInput {
  int x, y;
  String label;
  int labelX, labelY;
  
  TextInput(int x, int y) {
    this.x = x;
    this.y = y;
    this.labelX = 550;
    this.labelY = y;
  }
  
  void setLabel(String label) {
    this.label = label;
  }

  void setLabelPosition(int labelX, int labelY) {
    this.labelX = labelX;
    this.labelY = labelY;
  }
  
  void display() {
    fill(200);
    rect(x, y, 200, 20);
    textSize(20);
    fill(0);
    text(label, labelX, labelY);
  }
}
