final int widthHeight = 20;

Table table;
DataPoint DataPoints[];
ArrayList widgetList;
PFont testFont;
UserInterface testWidget;
int event;


void setup(){
  background(255);
  size(1200, 700);
  table = loadTable("flights_full.csv", "header");
  DataPoints = new DataPoint[563737];   //last value is in 563736  
  event =0;
  testFont = loadFont("Arial-Black-20.vlw"); textFont(testFont);
  testWidget = new UserInterface(50, 50, widthHeight, widthHeight, "FlightDate", testFont, event++);
  widgetList = new ArrayList();
  widgetList.add(testWidget);
  
  init_flights(table, DataPoints);
}

void draw(){
  for (int i=0; i<widgetList.size(); i++){
    UserInterface aWidget = (UserInterface) widgetList.get(i);
    aWidget.mouseMoved(mouseX, mouseY);
    aWidget.draw();
  }
}

void mousePressed(){
  int event;
  for (int i=0; i<widgetList.size(); i++){
    UserInterface aWidget = (UserInterface) widgetList.get(i);
    event = aWidget.getEvent(mouseX, mouseY);
    if (event==aWidget.event){
      for (int y=0; y<DataPoints.length; y++)
        println(DataPoints[y].flightDict.get(aWidget.label));
        // this prints the value of every flight instance under this key
        // ie, in this example, the destination of every flight is printed,
        // will later be modified to just hold the value of these keys to 
        // further refine search - Habiba
    }
  }
  
}
  

void init_flights (Table table, DataPoint DataPoints[]){
 for(int i = 0; i < DataPoints.length; i++){ 
    DataPoints[i] = new DataPoint(table.getString(i,0), table.getString(i,1), table.getInt(i,2),    // i=0 changed to getString() to allow split at / - Habiba
                          table.getString(i,3), table.getString(i,4), table.getString(i,5), table.getInt(i,6),
                          table.getString(i,7), table.getString(i,8),table.getString(i,9),table.getInt(i,10),
                          table.getInt(i,11),table.getInt(i,12), table.getInt(i,13),table.getInt(i,14),table.getInt(i,15),
                          table.getInt(i,16), table.getInt(i,17));
  }
}
