
PieChart drawPieChart;
BarChart drawBarChart;
int data[];
int secondaryData[];

void setup() 
{
  size(1400, 800);
  data = new int [3]; // Sample data values
  secondaryData = new int[3];
  int startingPoint = 25;
  
  for (int k = 0; k < 3; k++)
  {
    data[k] = startingPoint + (10 * k);
  }
  
  for(int j = 0; j < 3; j++)
  {
    secondaryData[j] = startingPoint + (15 * j);
  }
  //drawPieChart = new PieChart();
  drawBarChart = new BarChart();
}

void draw(){
  background(255);
  drawBarChart.setupBarChart();
  drawBarChart.drawBarChart(100, data);
  drawBarChart.drawBarChart(975, secondaryData);
}
