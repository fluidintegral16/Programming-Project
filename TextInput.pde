// Niharika Shanbhag - created class to set labels for all text boxes and their positions 3pm (10/03/24)

class TextInput {
  int x, y;
  String label;
  int labelX, labelY;
  String text = "";
  
  
  TextInput(int x, int y) {
    this.x = x;
    this.y = y;
    this.labelX = x - 120;
    this.labelY = y + 15;
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
    //textAlign(LEFT, TOP);
    text(label, labelX, labelY);
    //fill(0);
    text(text, x + 10, y + 15);
  }
  
  
 boolean mousePressed(float mX, float mY)
  {
    if (mousePressed && mX > x && mX < x + 200 && mY > y
    && mY < y + 20)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
}
