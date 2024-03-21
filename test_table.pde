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
testImage testss;
PImage testImag; 

PImage planeImag;
planeTest planess;

void setup()
{
  // Arnav Sanghi, Loaded the table and initizlized the array, 7pm, 8/3/2024
  size (1400, 800);
  table = loadTable("flights2k.csv", "header");   // flights2k flights_full
  DataPoints = new DataPoint[table.getRowCount()];   //last value is in 563738  563737  1999
  println("Table Row Count: " + table.getRowCount());
  int time = millis();
  println("Loading of table took " + (time) + " milliseconds to run\n");

  init_flights(table, DataPoints);
  int time1 = millis();
  println("Initialisation of DataPoints took " + (time1-time) + " milliseconds to run\n");
  airportWACs = new ArrayList<String>();
  airports = new ArrayList<String>();
  flightsOut = new ArrayList<Integer>();
  flightsIn = new ArrayList<Integer>();
  cancellationsOut = new ArrayList<Integer>();
  cancellationsIn = new ArrayList<Integer>();
  lateArrivals = new ArrayList<Integer>();
  lateDepartures = new ArrayList<Integer>();
  gatherDisplayableData();
  int time2 = millis();
  println("Part 2 took " + (time2-time1) + " milliseconds to run\n");


  DataPoints[13].gatherData(DataPoints);

  testImag = loadImage("test.png"); 
  testss = new testImage (0,0,testImag);
  
  planeImag = loadImage("plane.png");
  planess = new planeTest (planeImag);
}

void draw()
{
  background(255);
  fill(0);
  //text(DataPoints[0].CRSArrTime, 100, 25 + 25);
  //text(DataPoints[0].ArrTime, 100, 25 + 50);
  //text(DataPoints[0].Cancelled, 100, 25 + 75);
  //text(DataPoints[0].Distance, 100, 25 + 100);
  testss.draw();
  planess.draw();
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

void gatherDisplayableData()
{
  // -Ben   Creates a list of all the airports by area code
  for(int i = 0; i < DataPoints.length; i++)
  {
    boolean valid = true;
    for(int j = 0; j < airportWACs.size(); j++)
    {
      // int currentOrigin = DataPoints[i].originWac();
      String currentOrigin = DataPoints[i].origin();
      // int comparingOrigin = airportWACs.get(j);
      String comparingOrigin = airports.get(j);
      if(comparingOrigin.equals(currentOrigin))
      {
        valid = false;
      }
    }

    if(valid) 
    {
      airportWACs.add(DataPoints[i].originState());
      airports.add(DataPoints[i].origin());
    }
  }

  // -Ben   Creates another list that corresponds to the first with the amount of appearances of the airport
  for(int i = 0; i < airportWACs.size(); i++)
  {
    int appearancesOut = 0;
    int appearancesIn = 0;
    int cancelsOut = 0;
    int cancelsIn = 0;
    int lateDeps = 0;
    int lateArrs = 0;
    for(int j = 0; j < DataPoints.length; j++)
    {
      if(airports.get(i).equals(DataPoints[j].origin()))
      {
        appearancesOut++;
        if(DataPoints[j].cancelled()==1)
        {
          cancelsOut++;
        }
        if(DataPoints[j].crsDepTime() < DataPoints[j].depTime())
        {
          lateDeps++;
        }
      }
      if(airports.get(i).equals(DataPoints[j].dest()))
      {
        appearancesIn++;
        if(DataPoints[j].crsArrTime() < DataPoints[j].arrTime())
        {
          lateArrs++;
        }
        if(DataPoints[j].cancelled()==1)
        {
          cancelsIn++;
        }
      }
    }
    cancellationsOut.add(cancelsOut);
    cancellationsIn.add(cancelsIn);
    flightsOut.add(appearancesOut);
    flightsIn.add(appearancesIn);
    lateDepartures.add(lateDeps);
    lateArrivals.add(lateArrs);
  }


  println("Airports: " + airports);
  println("Airport WACs: " + airportWACs);
  println("Flights out: " + flightsOut);
  println("Flights In: " + flightsIn);
  println("Late Departures: " + lateDepartures);
  println("Late Arrivals: " + lateArrivals);
  println("Cancellations Out: " + cancellationsOut);
  println("Cancellations In: " + cancellationsIn);
  println("\nThere are " + airports.size() + " airports in this data set\n");

  // -Ben   prints the airports with the amount of appearances, cancellations, late departures, and percentages in the data set
  println("Airport : Flights Out : Late Departures : Cancellations : % On Time/Early, % Late, % Cancelled --- Flights In : Late Arrivals : Cancellations ");
  for(int i = 0; i < airports.size(); i++)
  {
    double percentCancelledOut = round(float(cancellationsOut.get(i))/float(flightsOut.get(i))*100);
    double percentLateOut = round(float(lateDepartures.get(i))/float(flightsOut.get(i))*100); 
    double percentOnTimeOut = 100-percentLateOut-percentCancelledOut;
    println(airports.get(i) + " : " + flightsOut.get(i) + " : " + lateDepartures.get(i) + " : " + cancellationsOut.get(i) + 
    " : " + percentOnTimeOut + "%, " + percentLateOut + "%, " + percentCancelledOut + "% --- " + flightsIn.get(i) + " : " + lateArrivals.get(i) + " : " + cancellationsIn.get(i));
  }

  int nationalFlights = 0;
  int nationalLates = 0;
  int nationalCancels = 0;
  for(int i = flightsOut.size()-1; i >= 0; i--)
  {
    nationalFlights += flightsOut.get(i);
    nationalLates += lateDepartures.get(i);
    nationalCancels += cancellationsOut.get(i);
  }
  println("National Totals of Flights Out: " + nationalFlights + " : " + nationalLates + " : " + nationalCancels);
}


void keyPressed(){
    if (keyCode == UP){
       testss.zoomIn = true;
       testss.zoomOut = false;
    }
    if (keyCode == DOWN){
       testss.zoomOut = true;
       testss.zoomIn = false;
    }
    if (keyCode == 'W'){
       testss.panUp = true;
       testss.panDown = false;
    }
    if (keyCode == 'S'){
       testss.panDown = true;
       testss.panUp = false;
    }
    if (keyCode == 'A'){
       testss.panLeft = true;
       testss.panRight = false;
    }
    if (keyCode == 'D'){
       testss.panRight = true;
       testss.panLeft = false;
    }
  }
  
  void keyReleased(){
    if (keyCode == UP){
       testss.zoomIn = false;
    }
    if (keyCode == DOWN){
       testss.zoomOut = false;
    }
    if (keyCode == 'W'){
       testss.panUp = false;
    }
    if (keyCode == 'S'){
       testss.panDown = false;
    }
    if (keyCode == 'A'){
       testss.panLeft = false;
    }
    if (keyCode == 'D'){
       testss.panRight = false;
    }
    
  }
