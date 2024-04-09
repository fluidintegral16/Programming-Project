import java.util.Date;
import java.util.Map; // added for dictionary - Habiba

class DataPoint
{

  // Arnav Sanghi, Added the instance variables for each flight object to have, 8pm, 8/3/2024.

  int FlightDate;   /// Date
  String IATA_Code_Marketing_Airline;
  int Flight_Number_Marketing_Airline;
  String Origin;
  String OriginCityName;
  String OriginState;
  int OriginWac;
  String Dest;
  String DestCityName;
  String DestState;
  int DestWac;
  int CRSDepTime;   /// Date
  int DepTime;       /// Date
  int CRSArrTime;    /// Date
  int ArrTime;         /// Date
  int Cancelled;  /// Boolean
  int Diverted;    /// Boolean
  int Distance;
  HashMap flightDict;


  DataPoint(String FlightDateUnRef, String IATA_Code_Marketing_Airline, int Flight_Number_Marketing_Airline,
    String Origin, String OriginCityName, String OriginState, int OriginWac,
    String Dest, String DestCityName, String DestState, int DestWac,
    int CRSDepTime, int DepTime, int CRSArrTime, int ArrTime, int Cancelled, int Diverted, int Distance)
  {
    // FlightDate - FlightDateUnRef, type changed from int to String type
    String [] x = FlightDateUnRef.split("/");
    FlightDate = Integer.parseInt(x[1]); //  Habiba - fixed bug storing full mmddyyyy into just storing dd
    this.IATA_Code_Marketing_Airline = IATA_Code_Marketing_Airline;
    this.Flight_Number_Marketing_Airline = Flight_Number_Marketing_Airline;
    this.Origin = Origin;
    this.OriginCityName = OriginCityName;
    this.OriginState = OriginState;
    this.OriginWac = OriginWac;
    this.Dest = Dest;
    this.DestCityName = DestCityName;
    this.DestState = DestState;
    this.DestWac = DestWac;
    this.CRSDepTime = CRSDepTime;                                                           /// Date
    this.DepTime = DepTime;                                                                 /// Date
    this.CRSArrTime = CRSArrTime;                                                           /// Date
    this.ArrTime = ArrTime;                                                                 /// Date
    this.Cancelled = Cancelled;                                                             /// Boolean
    this.Diverted = Diverted;                                                               /// Boolean
    this.Distance = Distance;
    // dictionary added to allow ease of access to all variables
    // fixes problem of needing a string to search for variable name - Habiba
    flightDict = new HashMap<String, Object>();
    flightDict.put("FlightDate", FlightDate);
    flightDict.put("IATA_Code_Marketing_Airline", IATA_Code_Marketing_Airline);
    flightDict.put("Flight_Number_Marketing_Airline", Flight_Number_Marketing_Airline);
    flightDict.put("Origin", Origin);
    flightDict.put("OriginCityName", OriginCityName);
    flightDict.put("OriginState", OriginState);
    flightDict.put("OriginWac", OriginWac);
    flightDict.put("Dest", Dest);
    flightDict.put("DestCityName", DestCityName);
    flightDict.put("DestState", DestState);
    flightDict.put("DestWac", DestWac);
    flightDict.put("CRSDepTime", CRSDepTime);
    flightDict.put("DepTime", DepTime);
    flightDict.put("CRSArrTime", CRSArrTime);
    flightDict.put("ArrTime", ArrTime);
    flightDict.put("Cancelled", Cancelled);
    flightDict.put("Diverted", Diverted);
    flightDict.put("Distance", Distance);

    // Arnav Sanghi, Added the constructor class to assign the values to each flight object, 8pm, 8/3/2024
  }


void draw()
{
}

int originWac()
{
  return OriginWac;
}

String originState()
{
  return OriginState;
}

String originCityName()
{
  return OriginCityName;
}

String origin()
{
  return Origin;
}

String dest()
{
  return Dest;
}

int cancelled()
{
  return Cancelled;
}

int crsDepTime()
{
  return CRSDepTime;
}

int depTime()
{
  return DepTime;
}

int crsArrTime()
{
  return CRSArrTime;
}

int arrTime()
{
  return ArrTime;
}



//class GatherData extends DataPoint
//{
//    super();
//    DataPoint(String FlightDateUnRef, String IATA_Code_Marketing_Airline, int Flight_Number_Marketing_Airline,
//    String Origin, String OriginCityName, String OriginState, int OriginWac,
//    String Dest, String DestCityName, String DestState, int DestWac,
//    int CRSDepTime, int DepTime, int CRSArrTime, int ArrTime, int Cancelled, int Diverted, int Distance)
    
float[] gatherData(DataPoint[] dataPoints) // Siddhi - created function to retrieve angles in desired format for Pie Chart
{

int appearances = 0;
int cancels = 0;
int lates = 0;
String currentAirport = Origin;
for (int j = 0; j < dataPoints.length; j++)
{
  String comparingAirport = dataPoints[j].origin();
  if (currentAirport.equals(comparingAirport))
  {
    appearances++;
    if (DataPoints[j].cancelled()==1)
    {
      cancels++;
    }
    if (DataPoints[j].crsDepTime() < DataPoints[j].depTime())
    {
      lates++;
    }
  }
  
}
currentAirport = Dest;
int appearsIn = 0;
int cancellation = 0;
int lateArrival = 0;

for (int k = 0; k < dataPoints.length; k++)
{
   String comparingAirport = dataPoints[k].origin();
   if (currentAirport.equals(comparingAirport))
   {
     appearsIn++;
     if(DataPoints[k].cancelled() == 1)
     {
       cancellation++;
     } 
     if (DataPoints[k].crsArrTime() < DataPoints[k].arrTime())
     {
       lateArrival++;
     }
   }
}
//println(Origin);
//println("Flights out: " + appearances);
//println("Late Departures: " + lates);
//println("Cancellations: " + cancels);


float percentCancelledIn = ((cancellation)/(appearsIn)) * 100;
float percentLateIn = ((lateArrival)/(appearsIn)) * 100;
float percentOnTimeIn = 100 - percentLateIn - percentCancelledIn;
float percentCancelled = (cancels)/(appearances)*100;
float percentLate = (lates)/(appearances)*100;
float percentOnTime = 100-percentLate-percentCancelled;
 // println("On time: " + percentOnTime + "%\nLate: " + percentLate + "%\nCancelled: " + percentCancelled + "%");

float cancelledAngle = percentCancelled * (2* PI);
float lateAngle = percentLate* (2* PI);
float onTimeAngle = percentOnTime * (2 * PI);
float cancelledInAngle = percentCancelledIn * (2 * PI);
float lateAngleIn = (percentLateIn) * (2 * PI);
float onTimeAngleIn = (percentOnTimeIn) * (2 * PI);

float radians[];
radians = new float[6];
radians[0] = onTimeAngle;
radians[1] = lateAngle;
radians[2] = cancelledAngle;
radians[3] = onTimeAngleIn;
radians[4] = lateAngleIn;
radians[5] = cancelledInAngle;

return radians;
}
