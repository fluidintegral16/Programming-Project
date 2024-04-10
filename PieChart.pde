// just to test this out, we're gonna assume 75% of the flights out of Tucson Int are on time,
// 5% are delayed and 20% are cancelled
// on time angle in radians = 3pi/2
// delayed angle in radians = pi/10

// cancelled angle in radians = 2pi/5

float onTimeAngle;
float delayedAngle;
float cancelledAngle;
float onTimeAngleIn;
float delayedAngleIn;
float cancelledAngleIn;
class PieChart
{
  String airportCode = "";
  float[] pieChartData;
  int[] nationalDataArray;
  
  // Niharika Shanbhag - created the "Go Back" button 5pm (28/03/24)
  
  int buttonWidth = 100;
  int buttonHeight = 30;
  int margin = 10;
  Button goBackButton;
  Button barChartButton;
  
  void setup(String airport)
  {
    airportCode = airport;
    pieChartData = gatherData(airport);
    onTimeAngle = pieChartData[0];
    delayedAngle = pieChartData[1];
    cancelledAngle = pieChartData[2];
    onTimeAngleIn = pieChartData[3];
    delayedAngleIn = pieChartData[4];
    cancelledAngleIn = pieChartData[5];
    goBackButton = new Button("Go Back", margin, height - buttonHeight - margin - 30, buttonWidth, buttonHeight);
    barChartButton = new Button("Click here", 650, 450, 100, 30);
  }


  void draw()
  {
    fill(0, 220, 240);
    arc(200, 200, 320, 320, 0, onTimeAngle, PIE);
    fill(150, 160, 240);
    arc(200, 200, 320, 320, onTimeAngle, onTimeAngle + delayedAngle, PIE);
    fill(70, 150, 240);
    arc(200, 200, 320, 320, onTimeAngle + delayedAngle, onTimeAngle + delayedAngle + cancelledAngle, PIE);

    fill(0, 220, 240);
    arc(1200, 200, 320, 320, 0, onTimeAngleIn, PIE);
    fill(150, 160, 240);
    arc(1200, 200, 320, 320, onTimeAngleIn, onTimeAngleIn + delayedAngleIn, PIE);
    fill(70, 150, 240);
    arc(1200, 200, 320, 320, onTimeAngleIn + delayedAngleIn, onTimeAngleIn + delayedAngleIn + cancelledAngleIn, PIE);

    fill(200);
    textSize(30);
    fill(0);
    text("Flights Out: " + int(pieChartData[6]), 200, 600);
    text("Flights late from "+ airportCode + ": " + int(pieChartData[7]), 200, 650);
    text("Flights cancelled from "+ airportCode + ": " + int(pieChartData[8]), 200, 700);
    text("Flights In: " + int(pieChartData[9]), 1200, 600);
    text("Flights late to "+ airportCode + ": " + int(pieChartData[10]), 1200, 650);
    text("Flights cancelled to "+ airportCode + ": " + int(pieChartData[11]), 1200, 700);
    text("On time\n\nDelayed\n\nCancelled ", 600, 250);
    square(750, 170, 30);
    square(750, 240, 30);
    square(750, 310, 30);
    fill(0, 220, 240);
    square(753, 173, 24);
    fill(150, 160, 240);
    square(753, 243, 24);
    fill(70, 150, 240);
    square(753, 313, 24);
    fill(0);
    text("To view the comparison to national data, ", 700, 430);
    textSize(70);
    text(airportCode, 700, 50);
    goBackButton.display();
    barChartButton.display();
  }
  
  // Niharika Shanbhag - created the mousePressed function to make the button functional 5pm (28/03/24)
  
  int mousePressed() {
    if(goBackButton.isHovering(mouseX, mouseY)) {
      if(mousePressed){
        //if (screen5) {
          screen5 = false;
          screen4 = true;
        //}
      }
      return 0;
    }
    if(barChartButton.isHovering(mouseX, mouseY)) {
      if(mousePressed) {
        screen5 = false;
        screen6 = true;
      }
    }
    return -1;
  }
  
}
