
float[] gatherDisplayableData() // Ben - function to gather the universal data to display and compare
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
  
  // Siddhi - getting percentages for the national data 10/4/24 @ 2pm
  float percentLateNationally = (float(nationalLates) / float(nationalFlights)) * 100;
  float percentCancelledNationally = (float(nationalCancels) / float(nationalFlights)) * 100;
  float percentOnTimeNationally = 100 - percentLateNationally - percentCancelledNationally;
  println("National Totals of Flights Out: " + percentOnTimeNationally + " : " + percentLateNationally + " : " + percentCancelledNationally);
  float[] nationalDataArray = { percentCancelledNationally, percentLateNationally, percentOnTimeNationally};
  // cancelled, late, ontime
  return nationalDataArray;
}

// Ben - returns only the flights that fit the parameters put into the search baar on screen1
int[] returnFlights(int fromDate, int toDate, String originAirportCode, String destinationAirportCode, String lateness) // uses nikkis parameters to return only the airports that fit
{
  ArrayList<Integer> masterList = new ArrayList<Integer>();

  for (int i = 0; i < DataPoints.length; i++)
  {
    if (((DataPoints[i].flightDate() >= fromDate) && (DataPoints[i].flightDate() <= toDate)) && (DataPoints[i].origin().equals(originAirportCode)) && (DataPoints[i].dest().equals(destinationAirportCode)))
    {
      masterList.add(i);
      println(i);
    }
  }
  int masterArray[] = new int[masterList.size()];
  for (int i = 0; i < masterList.size(); i++)
  {
    masterArray[i] = masterList.get(i);
  }
  return masterArray;
}



// Ben - returns the airports in the state zone selected to ve used on the buttons for selecting the airport
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

// Ben - returns the airports specific to what area is selected
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
  case 21:
    return returnAirportsInArea(wacGrouping21);
  case 22:
    return returnAirportsInArea(wacGrouping4);
  case 23:
    return returnAirportsInArea(wacGrouping2);
  case 24:
    return returnAirportsInArea(wacGrouping5);
  case 25:
    return returnAirportsInArea(wacGrouping6);
  case 26:
    return returnAirportsInArea(wacGrouping11);
  case 27:
    return returnAirportsInArea(wacGrouping11);
  case 28:
    return returnAirportsInArea(wacGrouping10);
  case 29:
    return returnAirportsInArea(wacGrouping21);
  case 30:
    return returnAirportsInArea(wacGrouping12);
  case 31:
    return returnAirportsInArea(wacGrouping12);
  case 32:
    return returnAirportsInArea(wacGrouping12);
  case 33:
    return returnAirportsInArea(wacGrouping14);
  case 34:
    return returnAirportsInArea(wacGrouping14);
  case 35:
    return returnAirportsInArea(wacGrouping15);
  case 36:
    return returnAirportsInArea(wacGrouping15);
  case 37:
    return returnAirportsInArea(wacGrouping15);
  case 38:
    return returnAirportsInArea(wacGrouping18);
  case 39:
    return returnAirportsInArea(wacGrouping18);
  case 40:
    return returnAirportsInArea(wacGrouping17);
  }
  return airportsInZone;
}

// Ben - makes the seperate buttons that lead to the same output link together
int whatImageSwitch(int number)
{
  switch(number)
  {
  case 0:
    return 0;
  case 1:
    return 1;
  case 2:
    return 2;
  case 3:
    return 3;
  case 4:
    return 4;
  case 5:
    return 5;
  case 6:
    return 6;
  case 7:
    return 7;
  case 8:
    return 8;
  case 9:
    return 9;
  case 10:
    return 10;
  case 11:
    return 11;
  case 12:
    return 12;
  case 13:
    return 13;
  case 14:
    return 14;
  case 15:
    return 15;
  case 16:
    return 16;
  case 17:
    return 17;
  case 18:
    return 18;
  case 19:
    return 19;
  case 20:
    return 20;
  case 21:
    return 21;
  case 22:
    return 4;
  case 23:
    return 2;
  case 24:
    return 5;
  case 25:
    return 6;
  case 26:
    return 11;
  case 27:
    return 11;
  case 28:
    return 10;
  case 29:
    return 21;
  case 30:
    return 12;
  case 31:
    return 12;
  case 32:
    return 12;
  case 33:
    return 14;
  case 34:
    return 14;
  case 35:
    return 15;
  case 36:
    return 15;
  case 37:
    return 15;
  case 38:
    return 18;
  case 39:
    return 18;
  case 40:
    return 17;
  }
  return -1;
}

// Ben - gathers the angles to use in the pie chart on screen5
float[] gatherData(String airport) // for pie chart
{
  int outAppearances = 0;
  int outCancels = 0;
  int outLates = 0;
  int inAppearances = 0;
  int inCancels = 0;
  int inLates = 0;
  String currentAirport = airport;
  for (int j = 0; j < DataPoints.length; j++)
  {
    String comparingAirport = DataPoints[j].origin();
    if (currentAirport.equals(comparingAirport))
    {
      outAppearances++;
      if (DataPoints[j].cancelled()==1)
      {
        outCancels++;
      }
      if (DataPoints[j].crsDepTime() < DataPoints[j].depTime())
      {
        outLates++;
      }
    }
    comparingAirport = DataPoints[j].dest();
    if (currentAirport.equals(comparingAirport))
    {
      inAppearances++;
      if (DataPoints[j].cancelled()==1)
      {
        inCancels++;
      }
      if (DataPoints[j].crsDepTime() < DataPoints[j].depTime())
      {
        inLates++;
      }
    }
  }
  println();
  println(airport);
  println("Flights out: " + outAppearances);
  println("Late Departures: " + outLates);
  println("Cancellations going out: " + outCancels);
  println("Flights in: " + inAppearances);
  println("Late Arrivals: " + inLates);
  println("Cancellations coming in: " + inCancels);

  float percentCancelledOut = float(outCancels)/float(outAppearances)*100;
  float percentLateOut = float(outLates)/float(outAppearances)*100;
  float percentOnTimeOut = 100-percentLateOut-percentCancelledOut;
  float percentCancelledIn = float(inCancels)/float(inAppearances)*100;
  float percentLateIn = float(inLates)/float(inAppearances)*100;
  float percentOnTimeIn = 100-percentLateIn-percentCancelledIn;
  //println("On time: " + percentOnTimeOut + "%\nLate: " + percentLateOut + "%\nCancelled: " + percentCancelledOut + "%");

  float cancelledAngleOut = percentCancelledOut*PI/50;
  float lateAngleOut = percentLateOut*PI/50;
  float onTimeAngleOut = percentOnTimeOut*PI/50;
  float cancelledAngleIn = percentCancelledIn*PI/50;
  float lateAngleIn = percentLateIn*PI/50;
  float onTimeAngleIn = percentOnTimeIn*PI/50;

  float radians[] = {onTimeAngleOut, lateAngleOut, cancelledAngleOut, onTimeAngleIn, lateAngleIn, cancelledAngleIn, outAppearances, outLates, outCancels, inAppearances, inLates, inCancels};

  return radians;
}

float[] gatherBarChartData(String airport)
{
  int outAppearances = 0;
  int outCancels = 0;
  int outLates = 0;
  int inAppearances = 0;
  int inCancels = 0;
  int inLates = 0;
  String currentAirport = airport;
  for (int j = 0; j < DataPoints.length; j++)
  {
    String comparingAirport = DataPoints[j].origin();
    if (currentAirport.equals(comparingAirport))
    {
      outAppearances++;
      if (DataPoints[j].cancelled()==1)
      {
        outCancels++;
      }
      if (DataPoints[j].crsDepTime() < DataPoints[j].depTime())
      {
        outLates++;
      }
    }
    comparingAirport = DataPoints[j].dest();
    if (currentAirport.equals(comparingAirport))
    {
      inAppearances++;
      if (DataPoints[j].cancelled()==1)
      {
        inCancels++;
      }
      if (DataPoints[j].crsDepTime() < DataPoints[j].depTime())
      {
        inLates++;
      }
    }
  }
  
  
  
  float percentCancelledOut = float(outCancels)/float(outAppearances)*100;
  float percentLateOut = float(outLates)/float(outAppearances)*100;
  float percentOnTimeOut = 100-percentLateOut-percentCancelledOut;
  
  
  float[] dataForBarChart = new float[3];
  // cancelled, late, ontime
  dataForBarChart[0] = percentCancelledOut;
  dataForBarChart[1] = percentLateOut;
  dataForBarChart[2] = percentOnTimeOut;
  
  return dataForBarChart;
}
