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
UserQueriesDisplay queryLines[];
UserQueriesDisplay testAccess; // dummy instance used to access UserDisplayQueries attributes - Habiba 3pm, (02/04)

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
int [] rowNums; 

// variables added to facilitate switching pages in UserQueriesDisplay board - Habiba + Siddhi (3pm, 01/04)
int [] tempArray;
int numberOfPages;
boolean flipPage, nextPage, drawPage, endReached;
int lengthCopy;



void setup(){
  size (1400,800);
  background(255);
   // Arnav Sanghi, Loaded the table and initizlized the array, 7pm, 8/3/2024
   
  table = loadTable("flights_full.csv", "header");
  //table = loadTable("flights2k.csv", "header");   // flights2k flights_full
  DataPoints = new DataPoint[table.getRowCount()];   //last value is in 563738  563737  1999\
  
  init_flights(table, DataPoints);

  queryLines = new UserQueriesDisplay[1000]; // prelim. size, can be extended later depending on search result sizes - Habiba (3pm, 25/03)
  testAccess = new UserQueriesDisplay(0,0,0);

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

  rowNums = new int[10]; // dummy array to be replaced with ben's array of search row numbers - Habiba (4pm, 25/03)
  init_query_table(rowNums);
  
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

  numberOfPages = 0;
  tempArray = new int[rowNums.length];
  flipPage = false; endReached = false; nextPage = false; drawPage = false;

}

void draw(){
  fill(0);

  text(DataPoints[0].CRSArrTime, 100, 25 + 25);
  text(DataPoints[0].ArrTime, 100, 25 + 50);
  text(DataPoints[0].Cancelled, 100, 25 + 75);
  text(DataPoints[0].Distance, 100, 25 + 100);
  
  sample = imagesForMap[currentImageNumber];
  
  //testss.draw(sample);
  //maps.draw();
  //planess.draw();
  //projectFile.draw();
  
  
  stateAirport.draw();
  stateAirport.mousePressed();

  if (nextPage || flipPage){
    init_query_table(tempArray);
    flipPage = false;
    drawPage = true;
  }
  else {
    draw_query_table(rowNums);
  }
  if (drawPage){
    draw_query_table(tempArray);
  }
  mousePressed(mouseX, mouseY);

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
      queryLines[queryNum] = new UserQueriesDisplay(rowNums[rowNum], queryNum++, 8);
      // changed parameter rowNum to rowNums[rowNum] to work with real not dummy values (Habiba+Siddhi 4pm, 01/04)
    }
  }
}
void draw_query_table(int [] rowNums)
{
  for (int i=0; i<rowNums.length; i++)
  { // changed the way the function approaches drawing the table depending on page number (Habiba+Siddhi 4pm, 01/04)
    if (nextPage){
      flipPage = true;
      nextPage = false;
    }
    queryLines[i].mousePressed(mouseY);
    if (endReached) {
      for (int j=0; j<lengthCopy; j++){
        queryLines[j].draw();
      }
    }
    else queryLines[i].draw();
  }
}

// separate mousePressed method from highlighting feature to access next page - Habiba+Siddhi 5pm(01/04)
void mousePressed(float mX, float mY){
  if (mousePressed && mX > testAccess.boxX && mX < testAccess.boxX + testAccess.wdth 
    && mY > testAccess.boxY && mY < testAccess.boxY + testAccess.hght){
    flipPages();
    nextPage = true;
    println("Next");
  }
}

// automated process of flipping any number of pages of user queries - Habiba+Siddhi(5pm 01/04)
void flipPages() {
  int startIndex = ((35*numberOfPages)>=rowNums.length)? rowNums.length-lengthCopy : 35*numberOfPages;   
  numberOfPages++;
  println(startIndex);
  lengthCopy = ((startIndex+35)>=rowNums.length)? rowNums.length - startIndex : 35;
  println(lengthCopy);
  arrayCopy(rowNums, startIndex, tempArray, 0, lengthCopy);
  if (lengthCopy!=35){
    endReached = true;
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
  
