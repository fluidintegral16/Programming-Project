import java.util.Date;

class DataPoint
{

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


  DataPoint(int FlightDate, String IATA_Code_Marketing_Airline, int Flight_Number_Marketing_Airline,
    String Origin, String OriginCityName, String OriginState, int OriginWac,
    String Dest, String DestCityName, String DestState, int DestWac,
    int CRSDepTime, int DepTime, int CRSArrTime, int ArrTime, int Cancelled, int Diverted, int Distance) 
    {

    this.FlightDate = FlightDate;                                                         /// Date
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
  
  
  void gatherData(DataPoint[] dataPoints)
  {
    int appearances = 0;
    int cancels = 0;
    int lates = 0;
    String currentAirport = Origin;
    for(int j = 0; j < dataPoints.length; j++)
    {
      String comparingAirport = dataPoints[j].origin();
      if(currentAirport.equals(comparingAirport))
      {
        appearances++;
        if(DataPoints[j].cancelled()==1)
        {
          cancels++;
        }
        if(DataPoints[j].crsDepTime() < DataPoints[j].depTime())
        {
          lates++;
          
        }
      }
      
    }
    println(Origin);
    println("Flights out: " + appearances);
    println("Late Departures: " + lates);
    println("Cancellations: " + cancels);
    
    
    double percentCancelled = float(cancels)/float(appearances)*100;
    double percentLate = float(lates)/float(appearances)*100; 
    double percentOnTime = 100-percentLate-percentCancelled;
    println("On time: " + percentOnTime + "%\nLate: " + percentLate + "%\nCancelled: " + percentCancelled + "%");
    
    double cancelledAngle = percentCancelled*PI/50;
    double lateAngle = percentLate*PI/50;
    double onTimeAngle = percentOnTime*PI/50;
    
    double radians[];
    radians = new double[3];
    radians[0] = onTimeAngle;
    radians[1] = lateAngle;
    radians[2] = cancelledAngle;
    
    println(cancelledAngle+lateAngle+onTimeAngle);
    
  }
  
}
