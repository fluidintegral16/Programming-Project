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
  
  String originCityName()
  {
    return OriginCityName;
  }
  
  String origin()
  {
    return Origin;
  }
  
  int cancelled()
  {
    return Cancelled;
  }
}
