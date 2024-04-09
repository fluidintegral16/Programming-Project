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
int[] nationalData;

UserQueriesDisplay queryLines[];
UserQueriesDisplay testAccess; // dummy instance used to access UserDisplayQueries attributes - Habiba 3pm, (02/04)

// Arnav Sanghi, initiating all the variables below and creating objects so that they can be merged (25/03/24)

testImage testss;
PImage testImag;
PImage planeImag;
PImage planeImag1;
PImage planeImag2;
planeTest planess;
Project projectFile;
int Pictures = 41;
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

String airportsInZone [];
int selectedIndex = 0;

boolean screen1 = true;
boolean screen2 = false;
boolean screen3 = false;
boolean screen4 = false;
boolean screen5 = false;

TextInput fromTextInput;
TextInput toTextInput;
TextInput fromAirportInput;
TextInput toAirportInput;
int boxToChoose;
int temp;
boolean startType;
boolean endType;
String myText = "";
String fromDateText = "";
String toDateText = "";
String fromAirportText = "";
String toAirportText = "";
String [] userInput;
int [] yValues;
int inputX;
int inputY;
int inputSpacing;
int labelX;
int labelY;

// ALL THE ARRAYS WITH THE WAC'S FOR THE MAP  --- USED AS INPUT FOR THE returnAirportsInArea FUNCTION
int stateSelect = 0;
int[] wacGrouping0 = { 74 };
PImage state0Image; // TEXAS
int[] wacGrouping1 = { 1, 2 };
PImage state1Image; // ALASKA, HAWAII
int[] wacGrouping2 = { 81, 86 };
PImage state2Image; // ARIZONA, NEW MEXICO
int[] wacGrouping3 = { 91 };
PImage state3Image; // CALIFORNIA
int[] wacGrouping4 = { 92, 93 };
PImage state4Image; // OREGON, WASHINGTON
int[] wacGrouping5 = { 85, 87 };
PImage state5Image; // NEVADA, UTAH
int[] wacGrouping6 = { 83, 84 };
PImage state6Image; // IDAHO
int[] wacGrouping7 = { 88 };
PImage state7Image; // WYOMING
int[] wacGrouping8 = { 82 };
PImage state8Image; // COLORADO
int[] wacGrouping9 = { 66 };
PImage state9Image; // NORTH DAKOTA
int[] wacGrouping10 = { 63, 61 };
PImage state10Image; // MINNESOTA, IOWA
int[] wacGrouping11 = { 67, 65, 62 };
PImage state11Image; // SOUTH DAKOTA, NEBRASAKA, KANSAS
int[] wacGrouping12 = { 73, 64, 71, 72 };
PImage state12Image; // OKLAHOMA, MISSOURI, ARKANSAS, LOUISIANA
int[] wacGrouping13 = { 43 };
PImage state13Image; // MICHIGAN
int[] wacGrouping14 = { 52, 42, 53 };
PImage state14Image; // KENTUCKY, INDIANA, TENNESSEE
int[] wacGrouping15 = { 51, 53, 34, 37 };
PImage state15Image; // ALABAMA, MS, GA ,SOUTH CAROLINA
int[] wacGrouping16 = { 33 };
PImage state16Image; // FLORIDA
int[] wacGrouping17 = { 38, 36 };
PImage state17Image; // VIRGINIA, NORTH CAROLINA
int[] wacGrouping18 = { 44, 39, 23 };
PImage state18Image; // OHIO, WV, PA
int[] wacGrouping19 = { 12, 35, 31, 21, 15, 11, 13, 14, 16 };
PImage state19Image; // MAINE, MD, DE, NJ, RI, CT, MA, NH, VT
int[] wacGrouping20 = { 22 };
PImage state20Image; // NEW YORK
int[] wacGrouping21 = {  };
PImage state21Image; //

PImage[] stateImageArray = new PImage[22];

boolean isEmpty;

PieChart drawPieChart;


void setup() {
  size (1400, 800);
  background(255);
  // Arnav Sanghi, Loaded the table and initizlized the array, 7pm, 8/3/2024

  table = loadTable("flights_full.csv", "header");   // flights2k flights_full
  DataPoints = new DataPoint[table.getRowCount()];   //last value is in 563738

  init_flights(table, DataPoints);

  queryLines = new UserQueriesDisplay[8000]; // prelim. size, can be extended later depending on search result sizes - Habiba (3pm, 25/03)

  testAccess = new UserQueriesDisplay(0, 0, 0);
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
  planeImag1 = loadImage("plane1.png");
  planeImag2 = loadImage("plane2.png");

  // SO. MANY. IMAGES.
  state0Image = loadImage("texas.png");
  stateImageArray[0] = state0Image;
  state1Image = loadImage("alaska.png");
  stateImageArray[1] = state1Image;
  state2Image = loadImage("arizona.png");
  stateImageArray[2] = state2Image;
  state3Image = loadImage("california.png");
  stateImageArray[3] = state3Image;
  state4Image = loadImage("oregon.png");
  stateImageArray[4] = state4Image;
  state5Image = loadImage("nevada.png");
  stateImageArray[5] = state5Image;
  state6Image = loadImage("idaho.png");
  stateImageArray[6] = state6Image;
  state7Image = loadImage("wyoming.png");
  stateImageArray[7] = state7Image;
  state8Image = loadImage("colorado.png");
  stateImageArray[8] = state8Image;
  state9Image = loadImage("north dakota.png");
  stateImageArray[9] = state9Image;
  state10Image = loadImage("minnesota.png");
  stateImageArray[10] = state10Image;
  state11Image = loadImage("south dakota.png");
  stateImageArray[11] = state11Image;
  state12Image = loadImage("oklahoma.png");
  stateImageArray[12] = state12Image;
  state13Image = loadImage("michigan.png");
  stateImageArray[13] = state13Image;
  state14Image = loadImage("kentucky.png");
  stateImageArray[14] = state14Image;
  state15Image = loadImage("alabama.png");
  stateImageArray[15] = state15Image;
  state16Image = loadImage("florida.png");
  stateImageArray[16] = state16Image;
  state17Image = loadImage("virginia.png");
  stateImageArray[17] = state17Image;
  state18Image = loadImage("ohio.png");
  stateImageArray[18] = state18Image;
  state19Image = loadImage("maine.png");
  stateImageArray[19] = state19Image;
  state20Image = loadImage("new york.png");
  stateImageArray[20] = state20Image;
  state21Image = loadImage("alaska.png");
  stateImageArray[21] = state21Image;

  // Arnav Sanghi, calling method in set-up (25/03/24)
  planess = new planeTest (planeImag, planeImag1, planeImag2);
  projectFile = new Project(testImag);
  for (int i = 0; i < imagesForMap.length; i++) {
    imagesForMap[i] = loadImage("img" + i + ".png");
  }
  main = loadImage("main.png");
  maps = new Map(main, imagesForMap);
  testss = new testImage (0, 0, imagesForMap, main);
  state = loadImage("state.png");

  numberOfPages = 0;
  flipPage = false;
  endReached = false;
  nextPage = false;
  drawPage = false;
  backPage = false;
  nationalData = gatherDisplayableData();
  drawPieChart = new PieChart();

// Habiba + Siddhi + Niharika - variable setups for boxes and their labels
    inputX = 700;
    inputY = 100;
    inputSpacing = 60;
    labelX = 580;
    labelY = 110;
    startType = false;
    endType = false;
    
    userInput = new String[5];
    yValues = new int[5];
    userInput[0] = "";
    userInput[1] = fromDateText;
    userInput[2] = toDateText;
    userInput[3] = fromAirportText;
    userInput[4] = toAirportText;
    
    yValues[0] = 0;
    
    
    
    fromTextInput = new TextInput(inputX, inputY);
    fromTextInput.setLabel("From Date:");
    fromTextInput.setLabelPosition(labelX, labelY);
  
    toTextInput = new TextInput(inputX, inputY + inputSpacing);
    toTextInput.setLabel("To Date:");
    toTextInput.setLabelPosition(labelX, labelY + inputSpacing);
  
    fromAirportInput = new TextInput(inputX, inputY + 2 * inputSpacing);
    fromAirportInput.setLabel("From Airport:");
    fromAirportInput.setLabelPosition(labelX, labelY + 2 * inputSpacing);
  
    toAirportInput = new TextInput(inputX, inputY + 3 * inputSpacing);
    toAirportInput.setLabel("To Airport:");
    toAirportInput.setLabelPosition(labelX, labelY + 3 * inputSpacing);

}

void draw()
{
  // Arnav Sanghi, creating the original draw method, which calls upon all the other classes draw method and other methods used
  // place where a lot of the merging was done (30/03/24)

  fill(0);

  sample = imagesForMap[currentImageNumber];


  if (screen1) // Habiba + Siddhi - adding user text input feature 7/4/24
  {
    background(255);
    projectFile.draw(); //Nikkis screen
    int buttonResult = projectFile.mousePressed(); //Nikkis screen
    textAlign(LEFT, TOP);
    textSize(15);
    fill(0);
    
    switch (boxToChoose)
    {
      case 1:
        temp = fromTextInput.y;
        yValues[1] = temp;
        break;
      case 2:
        temp = toTextInput.y;
        yValues[2] = temp;
        break;
      case 3:
        temp = fromAirportInput.y;
        yValues[3] = temp;
        break;
      case 4:
        temp = toAirportInput.y;
        yValues[4] = temp;
        break;
    }
    fromTextInput.display();
    toTextInput.display();
    fromAirportInput.display();
    toAirportInput.display();
    
    for(int i = 1; i < userInput.length; i++)
    {
      if(!userInput[i].equals(""))
      {
        text(userInput[i], inputX + 5, yValues[i]);
      }
    }
    if (buttonResult == 0)
    {
      for(int i = 1; i <= 4; i++) {
        if(userInput[i].equals("")) {
          isEmpty = true;
        }
        else {
          isEmpty = false;
        }
      }
      if(isEmpty) {
        rowNums = new int[100];
        for(int i = 0; i < rowNums.length; i++) {
          rowNums[i] = (int)random(0, 50000);  // dummy array to be replaced with array of row numbers - Habiba (4pm, 25/03) - updated to the actual array, still needs the info from nikki - Ben (5:30 30/03)
        }
        screen1 = false;
        screen2 = true;
        init_query_table(rowNums);
        //numberOfPages = 0;
        tempArray = new int[rowNums.length];
        //flipPage = false;
        //endReached = false;
        //nextPage = false;
        //drawPage = false;
      }
      else {
        rowNums = returnFlights(Integer.parseInt(userInput[1]), Integer.parseInt(userInput[2]), userInput[3], userInput[4], "");  // dummy array to be replaced with array of row numbers - Habiba (4pm, 25/03) - updated to the actual array, still needs the info from nikki - Ben (5:30 30/03)
        screen1 = false;
        screen2 = true;
        init_query_table(rowNums);
        //numberOfPages = 0;
        tempArray = new int[rowNums.length];
        //flipPage = false;
        //endReached = false;
        //nextPage = false;
        //drawPage = false;
      }      
      //screen1 = false;
      //screen2 = true;
       // dummy array to be replaced with array of row numbers - Habiba (4pm, 25/03) - updated to the actual array, still needs the info from nikki - Ben (5:30 30/03)
      //init_query_table(rowNums);
      //draw_query_table(rowNums);
      //numberOfPages = 0;
      //tempArray = new int[rowNums.length];
      //flipPage = false;
      //endReached = false;
      //nextPage = false;
      //drawPage = false;
    } //else if (buttonResult == 1)// make a button to get to the map page and have it return 1
    //{
    //  screen1 = false;
    //  screen3 = true;
    //}
  }

  if (screen2)
  {
    mousePressed(mouseX, mouseY);
    if (nextPage || flipPage|| backPage) {
      init_query_table(tempArray);
      flipPage = false;
      drawPage = true;
    }
    if (drawPage) {
      draw_query_table(tempArray);
    } else {
      draw_query_table(rowNums);
    }
  }

  if (screen3)
  {
    background(255);
    testss.draw(sample);
    maps.draw(); //Selecty Map that highlights
    stateSelect = maps.mousePressed();
    planess.draw(); //Moving Planes
    if (stateSelect != -1)
    {
      screen3 = false;
      screen4 = true;
      airportsInZone = switchFunction(stateSelect); // returns the airports in the state for arnav's function
      stateAirport = new stateAirports(stateImageArray[stateSelect], airportsInZone);
    }
  }


  if (screen4)
  {
    background(255);
    stateAirport.draw();
    int airportSelected = stateAirport.mousePressed();
    if (airportSelected != -1)
    {
      screen4 = false;
      screen5 = true;
      drawPieChart.setup(airportsInZone[airportSelected], nationalData);
    }
  }

  if (screen5)
  {
    background(255);
    drawPieChart.draw();
  }
}


// Arnav Sanghi, created a method, to take the data from table and create each flight as an object with its respective variables, 7pm, 8/3/2024

void init_flights (Table table, DataPoint DataPoints[]) {
  for (int i = 0; i < DataPoints.length; i++) {
    DataPoints[i] = new DataPoint(table.getString(i, 0), table.getString(i, 1), table.getInt(i, 2),
      table.getString(i, 3), table.getString(i, 4), table.getString(i, 5), table.getInt(i, 6),
      table.getString(i, 7), table.getString(i, 8), table.getString(i, 9), table.getInt(i, 10),
      table.getInt(i, 11), table.getInt(i, 12), table.getInt(i, 13), table.getInt(i, 14), table.getInt(i, 15),
      table.getInt(i, 16), table.getInt(i, 17));
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
      for (int j=0; j<lengthCopy; j++) {
        queryLines[j].mousePressed(mouseY); // fixed bug that stopped final page from highlighting - Habiba 4pm 03/04
        queryLines[j].draw();
      }
      println("END");
    } else {
      for (int i=0; i<rowNums.length; i++)
      { // changed the way the function approaches drawing the table depending on page number (Habiba+Siddhi 4pm, 01/04)
        if (nextPage) {
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
void mousePressed(float mX, float mY) {
  if (mousePressed && mX > testAccess.nextBoxX && mX < testAccess.nextBoxX + testAccess.wdth
    && mY > testAccess.boxY && mY < testAccess.boxY + testAccess.hght) {
    forwardPage();
    nextPage = true;
    println("Next");
  } else if (mousePressed && mX > testAccess.backBoxX && mX < testAccess.backBoxX + testAccess.wdth && mY > testAccess.boxY
    && mY < testAccess.boxY + testAccess.hght) {
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
  if (lengthCopy!=35) {
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

// Arnav Sanghi, adding a keyPressed method (23/03/24)

void keyPressed()
{
  if (screen3)
  {
    
 // projectFile.keyPressed();
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
  else
  {
    if (fromTextInput.mousePressed(mouseX, mouseY))
    {
      boxToChoose = 1;
      startType = true;
      endType = false;
      myText = "";
    }
     else if(toTextInput.mousePressed(mouseX, mouseY))
      {
        boxToChoose = 2;
        startType = true; // need to create mousePressed() method that checks if mousePressed INSIDE search box dimensions
        endType = false;
        myText = "";
      }
      else if(fromAirportInput.mousePressed(mouseX, mouseY))
      {
        boxToChoose = 3;
        startType = true; // need to create mousePressed() method that checks if mousePressed INSIDE search box dimensions
        endType = false;
        myText = "";
      }
      else if(toAirportInput.mousePressed(mouseX, mouseY))
      {
        boxToChoose = 4;
        startType = true; // need to create mousePressed() method that checks if mousePressed INSIDE search box dimensions
        endType = false;
        myText = "";
      }
      
      if(!endType && startType)
      {
        if(keyCode == BACKSPACE)
        {
          if(myText.length() > 0)
          {
            myText = myText.substring(0, myText.length()-1);
          }
        }
        else if (keyCode == DELETE)
        {
          myText = "";
        }
        else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT)
        {
          if (keyCode == ENTER)
          {
            endType = true;
            userInput[boxToChoose] = myText;
          }
          else
          {
            myText = myText + key;
            userInput[boxToChoose] = myText;
          }
        }
      }
      
  }
}

// Arnav Sanghi, adding a keyReleased method (23/03/24)

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
