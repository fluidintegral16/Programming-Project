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
UserQueriesDisplay categoryLine, line2, line3;
UserQueriesDisplay queryLines[];

testImage testss;
PImage testImag; 
PImage planeImag;
planeTest planess;
Project projectFile;
int Pictures = 21;
int currentImageNumber = 0;
MapButton MapButtons;
Map maps;
PImage[] imagesForMap = new PImage[Pictures];
PImage main;
PImage sample;
String sampleAirports []; 
stateAirports stateAirport;
PImage state;




void setup(){
  size (1400,800);
   // Arnav Sanghi, Loaded the table and initizlized the array, 7pm, 8/3/2024
   
  table = loadTable("flights_full.csv", "header");
  //table = loadTable("flights2k.csv", "header");   // flights2k flights_full
  DataPoints = new DataPoint[table.getRowCount()];   //last value is in 563738  563737  1999\
  
  init_flights(table, DataPoints);

   queryLines = new UserQueriesDisplay[1000]; // prelim. size, can be extended later depending on search result sizes - Habiba (3pm, 25/03)
  
  println("Table Row Count: " + table.getRowCount());
  int time = millis();
  println("Loading of table took " + (time) + " milliseconds to run\n");
  
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

  int [] rowNums = new int[10]; // dummy array to be replaced with ben's array of search row numbers - Habiba (4pm, 25/03)
  init_query_table(rowNums);
  draw_query_table(rowNums);

  
  ///////// 
  
  testImag = loadImage("main.png"); 
  planeImag = loadImage("plane.png");
  planess = new planeTest (planeImag);
  projectFile = new Project(testImag);
  for (int i = 0; i < imagesForMap.length; i++) {
    imagesForMap[i] = loadImage("img" + i + ".png");
  }
  main = loadImage("main.png");
  maps = new Map(main, imagesForMap);
  testss = new testImage (0,0, imagesForMap, main);
  state = loadImage("state.png");
  sampleAirports = new String[3];
  sampleAirports[0] = "JFK";
  sampleAirports[1] = "LAX";
  sampleAirports[2] = "LAX";
  stateAirport = new stateAirports(state, sampleAirports);
  
  

}

void draw(){
  background(255);
  fill(0);

  text(DataPoints[0].CRSArrTime, 100, 25 + 25);
  text(DataPoints[0].ArrTime, 100, 25 + 50);
  text(DataPoints[0].Cancelled, 100, 25 + 75);
  text(DataPoints[0].Distance, 100, 25 + 100);
//  categoryLine.draw();
//  line2.draw();
//  line3.draw();
  
  sample = imagesForMap[currentImageNumber];
  
  //testss.draw(sample);
  //maps.draw();
  //planess.draw();
  //projectFile.draw();
  
  
  stateAirport.draw();
  stateAirport.mousePressed();

}

// Arnav Sanghi, created a method, to take the data from table and create each flight as an object with its respective variables, 7pm, 8/3/2024

void init_flights (Table table, DataPoint DataPoints[]){
 for(int i = 0; i < DataPoints.length; i++){ 
    DataPoints[i] = new DataPoint(table.getString(i,0), table.getString(i,1), table.getInt(i,2),
                          table.getString(i,3), table.getString(i,4), table.getString(i,5), table.getInt(i,6),
                          table.getString(i,7), table.getString(i,8),table.getString(i,9),table.getInt(i,10),
                          table.getInt(i,11),table.getInt(i,12), table.getInt(i,13),table.getInt(i,14),table.getInt(i,15),
                          table.getInt(i,16), table.getInt(i,17));
  }
}


// query_table methods added by Habiba to loop through ben's search results which will come in the
// form of row numbers - Habiba (4pm 25/03)
void init_query_table(int [] rowNums)
{
  if (rowNums!=null)
  {
    int queryNum = 0;
    for (int rowNum=0; rowNum<rowNums.length; rowNum++)
    {
      queryLines[queryNum] = new UserQueriesDisplay(rowNum, queryNum++, 8);
    }
  }
}
void draw_query_table(int [] rowNums)
{
  for (int i=0; i<rowNums.length; i++)
  {
    queryLines[i].draw();
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
  
