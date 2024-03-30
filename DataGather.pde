
void gatherDisplayableData() // Ben  function to gather the universal data to display and compare
{
  // -Ben   Creates a list of all the airports by area code
  for (int i = 0; i < DataPoints.length; i++)
  {
    boolean valid = true;
    for (int j = 0; j < airportWACs.size(); j++)
    {
      // int currentOrigin = DataPoints[i].originWac();
      String currentOrigin = DataPoints[i].origin();
      // int comparingOrigin = airportWACs.get(j);
      String comparingOrigin = airports.get(j);
      if (comparingOrigin.equals(currentOrigin))
      {
        valid = false;
      }
    }

    if (valid)
    {
      airportWACs.add(DataPoints[i].originState());
      airports.add(DataPoints[i].origin());
    }
  }

  // -Ben   Creates another list that corresponds to the first with the amount of appearances of the airport
  for (int i = 0; i < airportWACs.size(); i++)
  {
    int appearancesOut = 0;
    int appearancesIn = 0;
    int cancelsOut = 0;
    int cancelsIn = 0;
    int lateDeps = 0;
    int lateArrs = 0;
    for (int j = 0; j < DataPoints.length; j++)
    {
      if (airports.get(i).equals(DataPoints[j].origin()))
      {
        appearancesOut++;
        if (DataPoints[j].cancelled()==1)
        {
          cancelsOut++;
        }
        if (DataPoints[j].crsDepTime() < DataPoints[j].depTime())
        {
          lateDeps++;
        }
      }
      if (airports.get(i).equals(DataPoints[j].dest()))
      {
        appearancesIn++;
        if (DataPoints[j].crsArrTime() < DataPoints[j].arrTime())
        {
          lateArrs++;
        }
        if (DataPoints[j].cancelled()==1)
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

  //println("Airports: " + airports);
  //println("Airport WACs: " + airportWACs);
  //println("Flights out: " + flightsOut);
  //println("Flights In: " + flightsIn);
  //println("Late Departures: " + lateDepartures);
  //println("Late Arrivals: " + lateArrivals);
  //println("Cancellations Out: " + cancellationsOut);
  //println("Cancellations In: " + cancellationsIn);
  //println("\nThere are " + airports.size() + " airports in this data set\n");

  // -Ben   prints the airports with the amount of appearances, cancellations, late departures, and percentages in the data set

  println("Airport : Flights Out : Late Departures : Cancellations : % On Time/Early, % Late, % Cancelled --- Flights In : Late Arrivals : Cancellations ");
  for (int i = 0; i < airports.size(); i++)
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
  for (int i = flightsOut.size()-1; i >= 0; i--)
  {
    nationalFlights += flightsOut.get(i);
    nationalLates += lateDepartures.get(i);
    nationalCancels += cancellationsOut.get(i);
  }
  println("National Totals of Flights Out: " + nationalFlights + " : " + nationalLates + " : " + nationalCancels);
}


int[] returnFlights(int fromDate, int toDate, String originAirportCode, String destinationAirportCode, String lateness) // uses nikkis parameters to return only the airports that fit
{
  ArrayList<Integer> masterList = new ArrayList<Integer>();

  for (int i = 0; i < DataPoints.length; i++)
  {
    if (((DataPoints[i].flightDate() >= fromDate) && (DataPoints[i].flightDate() <= toDate)) && (DataPoints[i].origin().equals(originAirportCode)) && (DataPoints[i].dest().equals(destinationAirportCode)))
    {
      masterList.add(i);
    }
  }
  int masterArray[] = new int[masterList.size()];
  for (int i = 0; i < masterList.size(); i++)
  {
    masterArray[i] = masterList.get(i);
  }
  return masterArray;
}




String[] returnAirportsInArea(int[] whatZone) // returns the airports in the zones
{
  ArrayList<String> airportsInArea = new ArrayList<String>();

  for (int i = 0; i < whatZone.length; i++)
  {
    for (int j = 0; j < DataPoints.length; j++)
    {
      if (DataPoints[j].originWac() == whatZone[i])
      {
        boolean notInList = true;
        for (int k = 0; k < airportsInArea.size(); k++)
        {
          if ((DataPoints[j].origin()).equals(airportsInArea.get(k)))
          {
            notInList = false;
          }
        }
        if (notInList)
        {
          airportsInArea.add(DataPoints[j].origin());
        }
      }
    }
  }

  String allAirports[] = new String[airportsInArea.size()];
  for (int i = 0; i < airportsInArea.size(); i++)
  {
    allAirports[i] = airportsInArea.get(i);
  }
  return allAirports;
}


String[] switchFunction(int stateSelect)
{
  switch(stateSelect)
  {
  case 0:
    return returnAirportsInArea(wacGrouping0);
  case 1:
    return returnAirportsInArea(wacGrouping1);
  case 2:
    return returnAirportsInArea(wacGrouping2);
  case 3:
    return returnAirportsInArea(wacGrouping3);
  case 4:
    return returnAirportsInArea(wacGrouping4);
  case 5:
    return returnAirportsInArea(wacGrouping5);
  case 6:
    return returnAirportsInArea(wacGrouping6);
  case 7:
    return returnAirportsInArea(wacGrouping7);
  case 8:
    return returnAirportsInArea(wacGrouping8);
  case 9:
    return returnAirportsInArea(wacGrouping9);
  case 10:
    return returnAirportsInArea(wacGrouping10);
  case 11:
    return returnAirportsInArea(wacGrouping11);
  case 12:
    return returnAirportsInArea(wacGrouping12);
  case 13:
    return returnAirportsInArea(wacGrouping13);
  case 14:
    return returnAirportsInArea(wacGrouping14);
  case 15:
    return returnAirportsInArea(wacGrouping15);
  case 16:
    return returnAirportsInArea(wacGrouping16);
  case 17:
    return returnAirportsInArea(wacGrouping17);
  case 18:
    return returnAirportsInArea(wacGrouping18);
  case 19:
    return returnAirportsInArea(wacGrouping19);
  case 20:
    return returnAirportsInArea(wacGrouping20);
  }
  return airportsInZone;
}

float[] gatherData(String airport)
{
  int appearances = 0;
  int cancels = 0;
  int lates = 0;
  String currentAirport = airport;
  for (int j = 0; j < DataPoints.length; j++)
  {
    String comparingAirport = DataPoints[j].origin();
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
  println(airport);
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

  println(cancelledAngle+lateAngle+onTimeAngle);
  return radians;
}
