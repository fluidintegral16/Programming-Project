import java.util.Date;
import java.util.Map; // added for dictionary - Habiba (4pm, 12/03)
import java.util.LinkedHashMap; // added to make keySet() in order - Habiba (3pm, 20/03)

class DataPoint
{

  // Arnav Sanghi, Added the instance variables for each flight object to have so that they can be stored and later be used for display, 8pm, 8/3/2024.

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
  LinkedHashMap<String, Object> flightDict; // changed from HashMap - Habiba (3pm, 20/03)


  DataPoint(String FlightDateUnRef, String IATA_Code_Marketing_Airline, int Flight_Number_Marketing_Airline,
    String Origin, String OriginCityName, String OriginState, int OriginWac,
    String Dest, String DestCityName, String DestState, int DestWac,
    int CRSDepTime, int DepTime, int CRSArrTime, int ArrTime, int Cancelled, int Diverted, int Distance)
  {
    // FlightDate - FlightDateUnRef, type changed from int to String type - Habiba (4pm, 12/03) 
    String [] x = FlightDateUnRef.split("/"); // month = x[0], year + time = x[2]
    FlightDate = Integer.parseInt(x[1]); //  Habiba (4pm, 12/03) - allows direct access to day date as an int value
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
    
    // dictionary added to allow ease of access to all variables - Habiba, (4pm, 12/03)
    flightDict = new LinkedHashMap<>(); // switched from HashMap to keep order intact - Habiba (3pm, 20/03)
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

// added to make more user friendly than 1s and 0s - Habiba (6pm, 20/03)
    switch((int)flightDict.get("Diverted"))
    {
      case 1:
        flightDict.replace("Diverted", "Yes");
        break;
      case 0:
        flightDict.replace("Diverted", "No");
        break;
    }
    switch((int)flightDict.get("Cancelled"))
    {
      case 1:
        flightDict.replace("Cancelled", "Yes");
        flightDict.replace("ArrTime", "--");
        flightDict.replace("DepTime", "--");
        break;
      case 0:
        flightDict.replace("Cancelled", "No");
        break;
     }
  }


  void draw()
  {
  }


  int flightDate()
  {
    return FlightDate;
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

  float[] gatherData(DataPoint[] dataPoints)
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
    println(Origin);
    println("Flights out: " + appearances);
    println("Late Departures: " + lates);
    println("Cancellations: " + cancels);

    float percentCancelled = float(cancels)/float(appearances)*100;
    float percentLate = float(lates)/float(appearances)*100;
    float percentOnTime = 100-percentLate-percentCancelled;
    println("On time: " + percentOnTime + "%\nLate: " + percentLate + "%\nCancelled: " + percentCancelled + "%");

    float cancelledAngle = percentCancelled*PI/50;
    float lateAngle = percentLate*PI/50;
    float onTimeAngle = percentOnTime*PI/50;

    float radians[];
    radians = new float[3];
    radians[0] = onTimeAngle;
    radians[1] = lateAngle;
    radians[2] = cancelledAngle;

    //println(cancelledAngle+lateAngle+onTimeAngle);
    return radians;
  }
}
