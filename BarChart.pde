/// Siddhi - created Bar Chart class 8/4/24 @ 6pm
class BarChart{
  String[] barLabels = {"Cancelled", "Late", "On-Time"};
  String airportCode;
  
  // Niharika Shanbhag - created the "Go Back" button 6pm (09/04/24) 
  
  int buttonWidth = 100;
  int buttonHeight = 30;
  int margin = 10;
  Button goBackButton;
  float[] nationalDataArray;
  float[] barChartData;
  
 void setup(String airport, float[] nationalData)
 {
   barChartData = gatherBarChartData(airport);
  airportCode = airport;
  textSize(30);
  text(airportCode, 230, 700);
  text("National Average", 1100, 700);
  goBackButton = new Button("Go Back", margin, height - buttonHeight - margin, buttonWidth, buttonHeight);
  nationalDataArray = nationalData;
 }
 
 void draw()
 {
  //textSize(30);
  //text("DFW", 230, 700); // replace with whatever way Ben gets name of airport in for Pie Chart
  //text("National Average", 1100, 700);
   goBackButton.display();
   int numBars = barChartData.length;
   int barWidth = 250 / numBars;
  
  for(int i = 0; i < numBars; i++)
  {
    float barHeight = map(barChartData[i], 0, max(barChartData), 0, 500);
    float x = 100 + (i * barWidth);
    float y = 600 - barHeight;
    fill(0, 150, 180);
    rect(x, y, barWidth, barHeight);
    
    fill(0);
    rect(100 - 15, 60, 3, 540); // y-axis itself
    rect(100 - 15, y, -10, 3); // y-axis labels
    
    textSize(15);
    textAlign(CENTER);
    text(barChartData[i], 100 - 30, y - 7); // y - axis label values
    text("        %  ", x + 30, 615);
    text(barLabels[i], x + 40, 630);
    
  }
  
  for(int i = 0; i < numBars; i++)
  {
    float barHeight = map(nationalDataArray[i], 0, max(nationalDataArray), 0, 500);
    float x = 975 + (i * barWidth);
    float y = 600 - barHeight;
    fill(0, 150, 180);
    rect(x, y, barWidth, barHeight);
    
    fill(0);
    rect(975 - 15, 60, 3, 540); // y-axis itself
    rect(975 - 15, y, -10, 3); // y-axis labels
    
    textSize(15);
    textAlign(CENTER);
    text(nationalDataArray[i],975 - 30, y - 7); // y - axis label values
    text("        %  ", x + 30, 615);
    text(barLabels[i], x + 40, 630);
    
  }

}

// Niharika Shanbhag - created the mousePressed function to make the button functional 7pm (09/04/24)

int mousePressed() {
  if(goBackButton.isHovering(mouseX, mouseY)) {
    if(mousePressed) {
        screen6 = false;
        screen5 = true;
    }
    return 0;
  }
  return -1;
}




}
