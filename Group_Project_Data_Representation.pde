final int SCREENX = 800;
final int SCREENY = 800;
PieChart drawPieChart;
BarChart drawBarChart;

void setup() 
{
  drawPieChart = new PieChart();
  drawBarChart = new BarChart();
}

void draw(){
  background(255);
  drawPieChart.setup();
  //drawBarChart.setupBarChart();
  //drawBarChart.drawBarChart();
}
