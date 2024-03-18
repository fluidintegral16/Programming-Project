final int widthHeight = 20;

Table table;
DataPoint DataPoints[];

void setup(){
  background(255);
  size(1200, 700);
  table = loadTable("flights_full.csv", "header");
  DataPoints = new DataPoint[563737];   //last value is in 563736  
  init_flights(table, DataPoints); 
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
