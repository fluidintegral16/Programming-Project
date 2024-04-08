import java.util.Date;
Table table;
//DataPoint1 DataPoints[];
//testImage testss;
PImage testImag; 

PImage planeImag;
//planeTest planess;

//Project projectFile;
MapButton MapButtons;
Map maps;
PImage[] imagesForMap = new PImage[41];
PImage main;


void setup(){
  //size (1200,700);
   size (1400,800);
   // Arnav Sanghi, Loaded the table and initizlized the array, 7pm, 8/3/2024
   
  //table = loadTable("flights_full.csv", "header");
  //DataPoints = new DataPoint[563737];   //last value is in 563736
  //println(table.getRowCount());
  //init_flights(table, DataPoints);
  
  testImag = loadImage("main.png"); 
  //testss = new testImage (0,0,testImag[i]);
  
  //planeImag = loadImage("plane.png");
  //planess = new planeTest (planeImag);
  
  //projectFile = new Project(testImag);
  
  
  for (int i = 0; i < imagesForMap.length; i++) {
    imagesForMap[i] = loadImage("img" + i + ".png");
  }
  main = loadImage("main.png");
  
  maps = new Map(main, imagesForMap);
  
  //testss = new testImage (0,0, imagesForMap);
}

void draw(){
  background(255);
  fill(0);
 // testss.draw();

  //projectFile.draw();
 maps.draw();
 maps.mousePressed();
  
  
  
  //planess.draw();
}

// Arnav Sanghi, created a method, to take the data from table and create each flight as an object with its respective variables, 7pm, 8/3/2024

/*void init_flights (Table table, DataPoint1 DataPoints[]){
 for(int i = 0; i < DataPoints.length; i++){ 
    DataPoints[i] = new DataPoint(table.getString(i,0), table.getString(i,1), table.getInt(i,2),
                          table.getString(i,3), table.getString(i,4), table.getString(i,5), table.getInt(i,6),
                          table.getString(i,7), table.getString(i,8),table.getString(i,9),table.getInt(i,10),
                          table.getInt(i,11),table.getInt(i,12), table.getInt(i,13),table.getInt(i,14),table.getInt(i,15),
                          table.getInt(i,16), table.getInt(i,17));
  }
}*/


/*void keyPressed(){
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
    
  }*/
