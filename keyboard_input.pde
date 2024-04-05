String myText = "type search";
boolean endType;
void setup() {
  size(500, 500);
  textAlign(CENTER, CENTER);
  textSize(30);
  fill(0);
  endType = false;
}
 
void draw() {
  background(255);
  fill(0);
  rect(20, 50, 200, 50);
  fill(255);
  text(myText, 100, 75);
}
 
void keyPressed() {
  if (!endType){
    if (keyCode == BACKSPACE) {
      if (myText.length() > 0) {
        myText = myText.substring(0, myText.length()-1);
      }
    } else if (keyCode == DELETE) {
      myText = "";
    } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
      if (keyCode == ENTER){
        endType = true;
      }
      else {
      myText = myText + key;
      }
    }
  }
}
