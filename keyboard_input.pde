// keyboard input code, to be incorporated into homepage code to lead to user query table - Habiba 7pm 05/04
String myText = "type search";
boolean endType;
boolean startType;
void setup() {
  size(500, 500);
  textAlign(CENTER, CENTER);
  textSize(30);
  fill(0);
  endType = false;
  startType =false;
}
 
void draw() {
  background(255);
  fill(0);
  rect(20, 50, 200, 50);
  fill(255);
  text(myText, 100, 75);
}
 
void keyPressed() {
  if (mousePressed){ // to get working, hold down mouse then type a letter, release mouse and continue typing
    startType = true; // need to create mousePressed() method that checks if mousePressed INSIDE search box dimensions
    endType = false;
  }
  if (!endType && startType){
    if (keyCode == BACKSPACE) {
      if (myText.length() > 0) {
        myText = myText.substring(0, myText.length()-1);
      }
    } else if (keyCode == DELETE) {
      myText = "";
    } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
      if (keyCode == ENTER){
        endType = true; // press enter to end search/typing
      }
      else {
      myText = myText + key;
      }
    }
  }
}

