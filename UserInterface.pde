class UserInterface
{
  int x, y, width, height;
  String label; int event; 
  // event should be assigned in screen and incremented in parameter list at each
  // creation, at end, each event variable should align with DataPoint index
  // of corresponding variable
  PFont widgetFont; color hovering;
  
  UserInterface(int x, int y, int height, int width, String label, PFont widgetFont,
    int event)
  {
      this.x = x; this.y = y; this.width = width; this.height = height;
      this.label = label; this.widgetFont = widgetFont; 
      this.event = event; hovering = 255;
  }
  
  void draw(){
    fill(hovering);
    stroke(0);
    rect(x, y, width, height);
    fill(0);
    textFont(widgetFont);
    text(label, x + 30, y-5 + height);
  }
  int getEvent(int mX, int mY){
    if (mX > x && mX < x+width && mY > y && mY < y+height)
      return event;
    else return -1;
  }
  void mouseMoved(int mX, int mY){
    if (getEvent(mX, mY)==event)
      hovering = 0;
    else hovering = 255;
  }
  
//  int getIntData(DataPoint flightX)
//  {
//    return DataPoints[widgetCode];
//  }
//  String getStringData(DataPoint flightX)
//  {
//    return DataPoints[widgetCode];
//  }
}
