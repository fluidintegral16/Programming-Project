// just to test this out, we're gonna assume 75% of the flights out of Tucson Int are on time,
// 5% are delayed and 20% are cancelled
// on time angle in radians = 3pi/2
// delayed angle in radians = pi/10
// cancelled angle in radians = 2pi/5
class PieChart{

  float[] angles = DataPoints[809].gatherData(DataPoints);
  float onTimeAngle = angles[0];
  float delayedAngle = angles[1];
  float cancelledAngle = angles[2];


void setup(){
  size(400, 400);
  fill(0, 220, 240);
  arc(200, 200, 320, 320, 0, onTimeAngle, PIE);
  fill(150, 160, 240);
  arc(200, 200, 320, 320, onTimeAngle, onTimeAngle + delayedAngle, PIE);
  fill(70, 150, 240);
  arc(200, 200, 320, 320, onTimeAngle + delayedAngle, onTimeAngle + delayedAngle + cancelledAngle, PIE);
}

}
