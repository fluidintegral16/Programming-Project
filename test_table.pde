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
boolean flipPage, nextPage, drawPage, endReached, backPage;
int lengthCopy;
int startIndex;

int rowNums[];
String airportsInZone [];
int selectedIndex = 0;

boolean screen1 = true;
boolean screen2 = false;
boolean screen3 = false;
boolean screen4 = false;
boolean screen5 = false;

// ALL THE ARRAYS WITH THE WAC'S FOR THE MAP  --- USED AS INPUT FOR THE returnAirportsInArea FUNCTION
int stateSelect = 0;
int[] wacGrouping0 = { 74 }; // TEXAS
int[] wacGrouping1 = { 1, 2 }; // ALASKA, HAWAII
int[] wacGrouping2 = { 81, 86 }; // ARIZONA, NEW MEXICO
int[] wacGrouping3 = { 91 }; // CALIFORNIA
int[] wacGrouping4 = { 92, 93 }; // OREGON, WASHINGTON
int[] wacGrouping5 = { 85, 87 }; // NEVADA, UTAH
int[] wacGrouping6 = { 83, 84 }; // IDAHO
int[] wacGrouping7 = { 88 }; // WYOMING
int[] wacGrouping8 = { 82 }; // COLORADO
int[] wacGrouping9 = { 66 }; // NORTH DAKOTA
int[] wacGrouping10 = { 63, 61 }; // MINNESOTA, IOWA
int[] wacGrouping11 = { 67, 65, 62 }; // SOUTH DAKOTA, NEBRASAKA, KANSAS
int[] wacGrouping12 = { 73, 64, 71, 72 }; // OKLAHOMA, MISSOURI, ARKANSAS, LOUISIANA
int[] wacGrouping13 = { 43 }; // MICHIGAN
int[] wacGrouping14 = { 52, 42, 53 }; // KENTUCKY, INDIANA, TENNESSEE
int[] wacGrouping15 = { 51, 53, 34, 37 }; // ALABAMA, MS, GA ,SOUTH CAROLINA
int[] wacGrouping16 = { 33 }; // FLORIDA
int[] wacGrouping17 = { 38, 36 }; // VIRGINIA, NORTH CAROLINA
int[] wacGrouping18 = { 44, 39, 23 }; // OHIO, WV, PA
int[] wacGrouping19 = { 12, 35, 31, 21, 15, 11, 13, 14, 16 }; // MAINE, MD, DE, NJ, RI, CT, MA, NH, VT
int[] wacGrouping20 = { 22 }; // NEW YORK
int[] wacGrouping21 = {  }; //

PieChart drawPieChart;


void setup(){
  size (1400,800);
  background(255);
   // Arnav Sanghi, Loaded the table and initizlized the array, 7pm, 8/3/2024
   
  table = loadTable("flights_full.csv", "header");   // flights2k flights_full
  DataPoints = new DataPoint[table.getRowCount()];   //last value is in 563738
  
  init_flights(table, DataPoints);

  queryLines = new UserQueriesDisplay[1000]; // prelim. size, can be extended later depending on search result sizes - Habiba (3pm, 25/03)
  testAccess = new UserQueriesDisplay(0,0,0);

  airportWACs = new ArrayList<String>();
  airports = new ArrayList<String>();
  flightsOut = new ArrayList<Integer>();
  flightsIn = new ArrayList<Integer>();
  cancellationsOut = new ArrayList<Integer>();
  cancellationsIn = new ArrayList<Integer>();
  lateArrivals = new ArrayList<Integer>();
  lateDepartures = new ArrayList<Integer>();
  
  
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

  numberOfPages = 0;
  tempArray = new int[rowNums.length];
  flipPage = false; endReached = false; nextPage = false; drawPage = false; backPage = false;
  drawPieChart = new PieChart();

}

void draw(){
  fill(0);
  
  sample = imagesForMap[currentImageNumber];
  
  
  if(screen1) 
  {
    projectFile.draw(); //Nikkis screen
    int buttonResult = projectFile.mousePressed(); //Nikkis screen
    if(buttonResult == 0)
    {
      screen1 = false;
      screen2 = true;
      println("ITS BROKEN");
      rowNums = returnFlights(1, 3, "JFK", "LAX", ""); // dummy array to be replaced with array of row numbers - Habiba (4pm, 25/03) - updated to the actual array, still needs the info from nikki - Ben (5:30 30/03)
      init_query_table(rowNums);
      draw_query_table(rowNums);
    }
    else if(buttonResult == 1)// make a button to get to the map page and have it return 1
    {
      screen1 = false;
      screen3 = true;
    }
  }
  
  if(screen2) 
  {
  mousePressed(mouseX, mouseY); //Habiba's??? - how work
 if (nextPage || flipPage|| backPage){
    init_query_table(tempArray);
    flipPage = false;
    drawPage = true;
  }
  if (drawPage){
    draw_query_table(tempArray);
  } else {
    draw_query_table(rowNums);
  }
  
  }
  
  if(screen3)
  {
    testss.draw(sample);
    maps.draw(); //Selecty Map that highlights
    stateSelect = maps.mousePressed();
    planess.draw(); //Moving Planes
    if(stateSelect != -1)
    {
      screen3 = false;
      screen4 = true;
      airportsInZone = switchFunction(stateSelect); // returns the airports in the state for arnav's function
      stateAirport = new stateAirports(state, airportsInZone);
    }
    
  }
  
  
  if(screen4)
  {
    stateAirport.draw();
    int airportSelected = stateAirport.mousePressed();
    if(airportSelected != -1)
    {
      screen4 = false;
      screen5 = true;
      drawPieChart.setup(airportsInZone[airportSelected]);
    }
    
  }
  
  if(screen5) drawPieChart.draw();
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
  if (rowNums!=null)
  { // changed position of this for loop to vastly improve efficiency - Habiba 4pm 03/04
    if (endReached) {
      for (int j=0; j<lengthCopy; j++){
        queryLines[j].mousePressed(mouseY); // fixed bug that stopped final page from highlighting - Habiba 4pm 03/04
        queryLines[j].draw();
      }
      println("END");
    }
    else{
      for (int i=0; i<rowNums.length; i++)
      { // changed the way the function approaches drawing the table depending on page number (Habiba+Siddhi 4pm, 01/04)
        if (nextPage){
          flipPage = true;
          nextPage = false;
        }
        queryLines[i].mousePressed(mouseY);
        queryLines[i].draw();
      }
    }
  }
}
// separate mousePressed method from highlighting feature to access next page - Habiba+Siddhi 5pm(01/04)
void mousePressed(float mX, float mY){
  if (mousePressed && mX > testAccess.boxX && mX < testAccess.boxX + testAccess.wdth 
    && mY > testAccess.boxY && mY < testAccess.boxY + testAccess.hght){
    forwardPage();
    nextPage = true;
    println("Next");
  }
  else if (mousePressed && mX > testAccess.backBoxX && mX < testAccess.backBoxX + testAccess.wdth && mY > testAccess.boxY 
    && mY < testAccess.boxY + testAccess.hght){
    backPage();
    backPage = true;
    println("Back");   
  }
}

// automated process of flipping any number of pages of user queries - Habiba+Siddhi(5pm 01/04)
// added backPage functionality and adjusted forwardPage to differentiate between them - Habiba+Siddhi 6pm 03/04
void forwardPage() {
  numberOfPages++; // moved position to fix bug where first page just refreshes instead of turning to page 2 - Habiba 11pm 03/04
  startIndex = ((35*numberOfPages)>=rowNums.length)? rowNums.length-lengthCopy : 35*numberOfPages;  
  lengthCopy = ((startIndex+35)>=rowNums.length)? rowNums.length - startIndex : 35;
  arrayCopy(rowNums, startIndex, tempArray, 0, lengthCopy);
  if (lengthCopy!=35){
    endReached = true;
  }
}
void backPage() {
  if (numberOfPages != 0) 
  {
    startIndex = (startIndex>0)? startIndex - 35: 0;
    numberOfPages--;
  }
  lengthCopy = 35;
  arrayCopy(rowNums, startIndex, tempArray, 0, lengthCopy);
  endReached = false;
}

void keyPressed()
{
    if (keyCode == UP)
    {
       testss.zoomIn = true;
       testss.zoomOut = false;
    }
    if (keyCode == DOWN)
    {
       testss.zoomOut = true;
       testss.zoomIn = false;
    }
    if (keyCode == 'W')
    {
       testss.panUp = true;
       testss.panDown = false;
    }
    if (keyCode == 'S')
    {
       testss.panDown = true;
       testss.panUp = false;
    }
    if (keyCode == 'A')
    {
       testss.panLeft = true;
       testss.panRight = false;
    }
    if (keyCode == 'D')
    {
       testss.panRight = true;
       testss.panLeft = false;
    }
}
  
  void keyReleased()
  {
    if (keyCode == UP)
    {
       testss.zoomIn = false;
    }
    if (keyCode == DOWN)
    {
       testss.zoomOut = false;
    }
    if (keyCode == 'W')
    {
       testss.panUp = false;
    }
    if (keyCode == 'S')
    {
       testss.panDown = false;
    }
    if (keyCode == 'A')
    {
       testss.panLeft = false;
    }
    if (keyCode == 'D')
    {
       testss.panRight = false;
    }
    
  }
  
