
// sourced from https://www.quora.com/What-is-the-code-to-make-a-bar
//-graph-in-processing#:~:text=In%20the%20loop%2C%20each%20bar,rect()%20draws%2
//0each%20bar.
// but will take it as a basis and develop it more over the course of the project
class BarChart{
int colourVariance = 200;
int[] data = {30, 75, 50, 110, 90}; // Sample data values
int numBars = data.length;
int barWidth = width / numBars;
void setupBarChart(){
 // size(400, 300);
}
 
void drawBarChart(){
  for(int i = 0; i < numBars; i++){
    float barHeight = map(data[i], 0, max(data), 0, height);
    float x = i * barWidth;
    float y = height - barHeight;
    fill(0, 150, colourVariance -= 20);
    rect(x, y, barWidth, barHeight);
  }
}

}
