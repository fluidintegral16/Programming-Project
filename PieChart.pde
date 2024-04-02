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
  
  float[] pieChartData;
  void setup(String airport)
  {
     pieChartData = gatherData(airport);
     onTimeAngle = pieChartData[0];
     delayedAngle = pieChartData[1];
     cancelledAngle = pieChartData[2];
     onTimeAngleIn = pieChartData[3];
     delayedAngleIn = pieChartData[4];
     cancelledAngleIn = pieChartData[5];
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
    text("Flights Out: " + int(pieChartData[6]), 150, 500);
    text("Flights In: ", 1150, 500);
    text("Key goes here ", 600, 200);
    text("Relation to national statistics here", 600, 500);
  }
}
