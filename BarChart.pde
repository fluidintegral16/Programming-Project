
// sourced from https://www.quora.com/What-is-the-code-to-make-a-bar
//-graph-in-processing#:~:text=In%20the%20loop%2C%20each%20bar,rect()%20draws%2
//0each%20bar.
// but will take it as a basis and develop it more over the course of the project
class BarChart{
String[] barLabels = {"Cancelled", "Late", "On-Time"};
int numBars = data.length;
int barWidth = 250 / numBars;
void setupBarChart(){
  textSize(30);
  text("DFW", 230, 700);
  text("National Average", 1100, 700);

}
 
void drawBarChart(int xpos, int[] data){
  //textSize(30);
  //text("DFW", 230, 700); // replace with whatever way Ben gets name of airport in for Pie Chart
  //text("National Average", 1100, 700);
  
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
