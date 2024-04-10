final int DOWN_GAP = 20;
final int ACROSS_GAP = 80;
final int SEPARATING_LINE_Y_COORD = 50;
final int Y = 25;

import java.util.Set;
import java.util.Collection; 
class UserQueriesDisplay //
{

  int rowNum;
  int queryResultNum;
  String label;
  PFont font;
  int x;
  int nextBoxX, boxY;
  int backBoxX;
  int wdth;
  int hght;
  PImage forwardArrow, backwardArrow;
  
  // changed y value to constant + removed from constructor, x!=constant as it gets mutated during runtime - Habiba (3pm, 25/03)
  boolean hovering; // added scrolling feature - 2pm (28/03)
  
  UserQueriesDisplay(int rowNum, int queryResultNum, int x)
  {
    this.rowNum = rowNum; this.queryResultNum = queryResultNum; this.x = x;
    hovering = false;
    background(0);
    nextBoxX = 1320; boxY = 765; wdth = 50; hght = 20; // initialized separate box coordinates - Habiba+Siddhi 5pm 03/04
    backBoxX = 1265; 
    forwardArrow = loadImage("forward arrow.jpg");
    backwardArrow = loadImage("backward arrow.png");
  }
  
  void draw(){
// next page button - Habiba+Siddhi (4pm, 01/04)
    Set<String> keys = DataPoints[rowNum].flightDict.keySet();
    fill(255);
    rect(nextBoxX, boxY, wdth, hght);
    rect(backBoxX, boxY, wdth, hght);
    image(backwardArrow, backBoxX+15, boxY+1);
    image(forwardArrow, nextBoxX+10, boxY+1);
    if (hovering){
      fill(255, 0, 0, 50); rect (0, SEPARATING_LINE_Y_COORD+(DOWN_GAP*(queryResultNum))+2, 1400, textDescent()+DOWN_GAP-0.5);
    }
    fill(255); rect(0, SEPARATING_LINE_Y_COORD, 1400, 3);
    for (String key : keys){
      label = key;
      fill(255);
      font = loadFont("Calibri-Light-14.vlw");
      textFont(font);
      textAlign(CENTER);
      if (queryResultNum==0){
        if (key.equals("FlightDate")){
          text("Flight", x+16, Y-7);
          text("Date", x+16, Y+6);
          text("Jan 2023", x+17, Y+16);
        }
        else if (key.equals("IATA_Code_Marketing_Airline")) {
          text("IATA", x+4, Y-10);
          text("Code", x+4, Y);
          text("Marketing", x+4, Y+10);
          text("Airline", x+4, Y+20);
        }
        else if (key.equals("Flight_Number_Marketing_Airline")){
          text("Flight", x+4, Y-10);
          text("Number", x+4, Y);
          text("Marketing", x+4, Y+10);
          text("Airline", x+4, Y+20); 
        } else text(label, x, Y);
      }
      valueDraw();
    }
  }
  
  void valueDraw(){
    Object value = DataPoints[rowNum].flightDict.get(label);
    if (queryResultNum < 35) {
      if (value!=null){
        fill(255);
        textFont(font);
        textAlign(CENTER);
        text(""+value+"", x, (DOWN_GAP*(queryResultNum+1))+SEPARATING_LINE_Y_COORD);
        x += ACROSS_GAP;
      }else text("N/A", x+10, (DOWN_GAP*(queryResultNum+1))+SEPARATING_LINE_Y_COORD);
    }
  }
  
 // highlighting feature - habiba (2pm, 28/03)
  void mousePressed(float mY){
    if (mousePressed && mY > SEPARATING_LINE_Y_COORD+(DOWN_GAP*(queryResultNum))+2 && mY < SEPARATING_LINE_Y_COORD+(DOWN_GAP*(queryResultNum))+textDescent()+DOWN_GAP-1 
      && queryResultNum<35 && queryResultNum!=18 && queryResultNum!=19){ // fixed bug that triggers highlight when search button is pressed - Habiba
      hovering = true;
    }
    else hovering = false;
  }
}
