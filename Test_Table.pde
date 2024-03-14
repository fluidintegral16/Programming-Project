import java.util.Date;
Table table;
DataPoint DataPoints[];
ArrayList<Integer> airportWACs;
ArrayList<String> airports;
ArrayList<Integer> flightsOut;
ArrayList<Integer> cancellations;

void setup()
{
  size (1200, 700);
  table = loadTable("flights_full.csv", "header");   // flights2k flights_full
  DataPoints = new DataPoint[table.getRowCount()];   //last value is in 563738  563737  1999
  println("Table Row Count: " + table.getRowCount());
  int time = millis();
  println("Loading of table took " + (time) + " milliseconds to run\n");

  init_flights(table, DataPoints);
  int time1 = millis();
  println("Initialisation of DataPoints took " + (time1-time) + " milliseconds to run\n");
  airportWACs = new ArrayList<Integer>();
  airports = new ArrayList<String>();
  flightsOut = new ArrayList<Integer>();
  cancellations = new ArrayList<Integer>();
  gatherDisplayableData();
  int time2 = millis();
  println("Part 2 took " + (time2-time1) + " milliseconds to run\n");
}

void draw()
{
  background(255);
  fill(0);
  text(DataPoints[0].CRSArrTime, 100, 25 + 25);
  text(DataPoints[0].ArrTime, 100, 25 + 50);
  text(DataPoints[0].Cancelled, 100, 25 + 75);
  text(DataPoints[0].Distance, 100, 25 + 100);
}

void init_flights (Table table, DataPoint DataPoints[])
{
  for (int i = 0; i < DataPoints.length; i++)
  {
    DataPoints[i] = new DataPoint(table.getInt(i, 0), table.getString(i, 1), table.getInt(i, 2),
      table.getString(i, 3), table.getString(i, 4), table.getString(i, 5), table.getInt(i, 6),
      table.getString(i, 7), table.getString(i, 8), table.getString(i, 9), table.getInt(i, 10),
      table.getInt(i, 11), table.getInt(i, 12), table.getInt(i, 13), table.getInt(i, 14), table.getInt(i, 15),
      table.getInt(i, 16), table.getInt(i, 17));
  }
}

void gatherDisplayableData()
{
  // -Ben   Creates a list of all the airports by area code - strings (JFK, DCA...) wouldnt work???
  for(int i = 0; i < DataPoints.length; i++)
  {
    boolean valid = true;
    for(int j = 0; j < airportWACs.size(); j++)
    {
      // int currentOrigin = DataPoints[i].originWac();
      String currentOrigin = DataPoints[i].origin();
      // int comparingOrigin = airportWACs.get(j);
      String comparingOrigin = airports.get(j);
      if(comparingOrigin.equals(currentOrigin)) //<>//
      {
        valid = false;
      }
    }
    
    if(valid) 
    {
      airportWACs.add(DataPoints[i].originWac());
      airports.add(DataPoints[i].origin());
    }
  }
  
  // -Ben   Creates another list that corresponds to the first with the amount of appearances of the state
  for(int i = 0; i < airportWACs.size(); i++)
  {
    int appearances = 0;
    int cancels = 0;
    String currentAirport = airports.get(i);
    for(int j = 0; j < DataPoints.length; j++)
    {
      String comparingAirport = DataPoints[j].origin();
      if(currentAirport.equals(comparingAirport)) //<>//
      {
        appearances++;
        if(DataPoints[j].cancelled()==1)
        {
          cancels++;
        }
      }
    }
    cancellations.add(cancels);
    flightsOut.add(appearances);
  }
  
  println("Airports: " + airports);
  println("Flights out: " + flightsOut);
  println("Cancellations: " + cancellations);
  println("There are " + airports.size() + " airports in this data set");
  
  // -Ben   prints the state with the amount of appearances of it in the data set
  println("Airport : Flights Out : Cancellations");
  for(int i = 0; i < airports.size(); i++)
  {
    println(airports.get(i) + " : " + flightsOut.get(i) + " : " + cancellations.get(i) );
  }
}
