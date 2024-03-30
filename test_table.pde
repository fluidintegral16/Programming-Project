import java.util.Date;
Table table;
DataPoint DataPoints[];
ArrayList<String> airportWACs;
ArrayList<String> airports;
ArrayList<Integer> flightsOut;
ArrayList<Integer> flightsIn;
ArrayList<Integer> cancellationsOut;
ArrayList<Integer> cancellationsIn;
ArrayList<Integer> lateDepartures;
ArrayList<Integer> lateArrivals;
int rowsThatFitParameters [];
String airportsInZone [];

// ALL THE ARRAYS WITH THE WAC'S FOR THE MAP  --- USED AS INPUT FOR THE returnAirportsInArea FUNCTION
int stateSelect = 0;
int[] wacGrouping0 = { 74 }; //TEXAS
int[] wacGrouping1 = { 1 }; //ALASKA
int[] wacGrouping2 = { 81, 86 }; // ARIZONA, NEW MEXICO
int[] wacGrouping3 = { 91 }; // CALIFORNIA
int[] wacGrouping4 = { 92, 93 }; // OREGON, WASHINGTON
int[] wacGrouping5 = { 85, 87 }; // NEVADA, UTAH
int[] wacGrouping6 = { 83, 84 }; // IDAHO
int[] wacGrouping7 = { 88 }; // WYOMING
int[] wacGrouping8 = { 82 }; // COLORADO
int[] wacGrouping9 = { 66 }; // NORTH DAKOTA
int[] wacGrouping10 = { 63, 61 }; // MINNESOTA, IOWA
int[] wacGrouping11 = { 67, 65, 62 }; // SOUTH DAKOTA, NEBRASAKA, KANSAS
int[] wacGrouping12 = { 73, 64, 71, 72 }; // OKLAHOMA, MISSOURI, ARKANSAS, LOUISIANA
int[] wacGrouping13 = { 43 }; // MICHIGAN
int[] wacGrouping14 = { 52, 42, 53 }; // KENTUCKY, INDIANA, TENNESSEE
int[] wacGrouping15 = { 51, 53, 34, 37 }; // ALABAMA, MS, GA ,SOUTH CAROLINA
int[] wacGrouping16 = { 33 }; // FLORIDA
int[] wacGrouping17 = { 38, 36 }; // VIRGINIA, NORTH CAROLINA
int[] wacGrouping18 = { 44, 39, 23 }; // OHIO, WV, PA
int[] wacGrouping19 = { 12, 35, 31, 21, 15, 11, 13, 14, 16 }; // MAINE, MD, DE, NJ, RI, CT, MA, NH, VT
int[] wacGrouping20 = { 22 }; // NEW YORK



PieChart drawPieChart;

void setup()
{
  size (1200, 700);
  table = loadTable("flights_full.csv", "header");   // flights2k flights_full
  DataPoints = new DataPoint[table.getRowCount()];   //last value is in 563738  563737  1999
  println("Table Row Count: " + table.getRowCount());
  int time = millis();
  //println("Loading of table took " + (time) + " milliseconds to run\n");

  init_flights(table, DataPoints);
  int time1 = millis();
  //println("Initialisation of DataPoints took " + (time1-time) + " milliseconds to run\n");

  airportWACs = new ArrayList<String>();
  airports = new ArrayList<String>();
  flightsOut = new ArrayList<Integer>();
  flightsIn = new ArrayList<Integer>();
  cancellationsOut = new ArrayList<Integer>();
  cancellationsIn = new ArrayList<Integer>();
  lateArrivals = new ArrayList<Integer>();
  lateDepartures = new ArrayList<Integer>();
  //gatherDisplayableData();
  int time2 = millis();
  //println("Part 2 took " + (time2-time1) + " milliseconds to run\n");

  drawPieChart = new PieChart();
  //DataPoints[100].gatherData(DataPoints);
  rowsThatFitParameters = returnFlights(1, 3, "JFK", "LAX", ""); // THIS IS THE FUNCTION THAT WE PUT NIKKI'S PARAMETERS INTO TO GET THE FLIGHTS THAT FIT IN
  println(rowsThatFitParameters);

  airportsInZone = switchFunction(stateSelect);
  println(airportsInZone);
}

void draw()
{
  background(255);
  drawPieChart.setup();
  /*fill(0);
   text(DataPoints[0].CRSArrTime, 100, 25 + 25);
   text(DataPoints[0].ArrTime, 100, 25 + 50);
   text(DataPoints[0].Cancelled, 100, 25 + 75);
   text(DataPoints[0].Distance, 100, 25 + 100);*/
}

// Arnav Sanghi, created a method, to take the data from table and create each flight as an object with its respective variables, 7pm, 8/3/2024
void init_flights(Table table, DataPoint DataPoints[])
{
  for (int i = 0; i < DataPoints.length; i++)
  {
    DataPoints[i] = new DataPoint(table.getString(i, 0), table.getString(i, 1), table.getInt(i, 2),
      table.getString(i, 3), table.getString(i, 4), table.getString(i, 5), table.getInt(i, 6),
      table.getString(i, 7), table.getString(i, 8), table.getString(i, 9), table.getInt(i, 10),
      table.getInt(i, 11), table.getInt(i, 12), table.getInt(i, 13), table.getInt(i, 14), table.getInt(i, 15),
      table.getInt(i, 16), table.getInt(i, 17));
  }
}
