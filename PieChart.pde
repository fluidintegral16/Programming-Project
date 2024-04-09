class PieChart {

  private float onTimeAngle;
  private float delayedAngle;
  private float cancelledAngle;
  private float onTimeAngleIn;
  private float delayedAngleIn;
  private float cancelledAngleIn;


  void setGatheredAngles(float[] angles) 
  {
    angles[0] = onTimeAngle;
    angles[1] = delayedAngle;
    angles[2] = cancelledAngle;
    angles[3] = onTimeAngleIn;
    angles[4] = delayedAngleIn;
    angles[5] = cancelledAngleIn;
  }

  void setup() {
    //size(400, 400);
    fill(0, 220, 240);
    arc(200, 200, 320, 320, 0, onTimeAngle, PIE);
    fill(150, 160, 240);
    arc(200, 200, 320, 320, onTimeAngle, onTimeAngle + delayedAngle, PIE);
    fill(70, 150, 240);
    arc(200, 200, 320, 320, onTimeAngle + delayedAngle, onTimeAngle + delayedAngle + cancelledAngle, PIE);

    fill(0, 220, 240);
    arc(400, 400, 320, 320, 0, onTimeAngleIn, PIE);
    fill(150, 160, 240);
    arc(400, 400, 320, 320, onTimeAngleIn, onTimeAngleIn + delayedAngleIn, PIE);
    fill(70, 150, 240);
    arc(400, 400, 320, 320, onTimeAngleIn + delayedAngleIn, onTimeAngleIn + delayedAngleIn + cancelledAngleIn, PIE);
    
    fill(0, 220, 240);
    rect(80, 420, 35, 35);
    fill(150, 160, 240);
    rect(80, 500, 35, 35);
    fill(70, 150, 240);
    rect(80, 580, 35, 35); 
  }
