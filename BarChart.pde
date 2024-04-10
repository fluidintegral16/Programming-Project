class BarChart{
  String[] barLabels = {"Cancelled", "Late", "On-Time"};
  String airportCode;
  
  
 void setupBarChart(String airport)
 {
  airportCode = airport;
  textSize(30);
  text(airportCode, 230, 700);
  text("National Average", 1100, 700);
 }
 
 void drawBarChart(int xpos, int[] data){
  //textSize(30);
  //text("DFW", 230, 700); // replace with whatever way Ben gets name of airport in for Pie Chart
  //text("National Average", 1100, 700);
   int numBars = data.length;
   int barWidth = 250 / numBars;
  
  for(int i = 0; i < numBars; i++)
  {
    float barHeight = map(data[i], 0, max(data), 0, 500);
    float x = xpos + (i * barWidth);
    float y = 600 - barHeight;
    fill(0, 150, 180);
    rect(x, y, barWidth, barHeight);
    
    fill(0);
    rect(xpos - 15, 60, 3, 540); // y-axis itself
    rect(xpos - 15, y, -10, 3); // y-axis labels
    
    textSize(15);
    textAlign(CENTER);
    text(data[i], xpos - 30, y - 7); // y - axis label values
    text("        %  ", x + 30, 615);
    text(barLabels[i], x + 40, 630);
    
  }

}




}
