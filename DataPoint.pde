import java.util.Date;
import java.util.Map; // added for dictionary - Habiba

class DataPoint {
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
   
  
   // Arnav Sanghi, Added the constructor class to assign the values to each flight object, 8pm, 8/3/2024
   
  DataPoint(int FlightDate, String IATA_Code_Marketing_Airline, int Flight_Number_Marketing_Airline,
     String Origin, String OriginCityName, String OriginState, int OriginWac,
     String Dest, String DestCityName, String DestState, int DestWac,
     int CRSDepTime, int DepTime, int CRSArrTime, int ArrTime, int Cancelled, int Diverted, int Distance){

// FlightDate - FlightDateUnRef, type changed from int to String type
     String [] x = FlightDateUnRef.split("/");
     FlightDate = Integer.parseInt((x[1]); //  Habiba - fixed bug storing full mmddyyyy into just storing dd
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
     
    
  }

    
  }



  void draw(){
  
  }
  
}
