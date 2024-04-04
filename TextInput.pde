class TextInput {
  int x, y;
  String label;
  int labelX, labelY;
  String text = "";
  boolean active = false;
  String myText;
  
  TextInput(int x, int y) {
    this.x = x;
    this.y = y;
    this.labelX = x - 120;
    this.labelY = y + 15;
    myText = "";
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
 
  //void setActive(boolean active) {
  //  this.active = active;
  //}
  
  String keyPressed() {
    if(active){
      while(keyCode!=ENTER){
    if (keyCode!=SHIFT && keyCode!= CONTROL && keyCode!=ALT){
      myText = myText + keyCode;
    }
    }
    }
    return myText;
    //if(active) {
    //  if(key == BACKSPACE && text.length() > 0) {
    //    text = text.substring(0, text.length() -1);
    //  }
    //  else if(key != BACKSPACE) {
    //    text += key;
    //  }
    //}
  }
  
  void click(int mx, int my) {
    if(mx > x && mx < x + 200 && my > y && my < y + 20) {
      active = true;
    }
    else {
      active = false;
    }
  }
}
