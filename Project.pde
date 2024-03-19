TextInput fromTextInput;
TextInput toTextInput;
TextInput fromAirportInput;
TextInput toAirportInput;
Button searchButton;

PImage bg;
float opacity = 90;

void setup() {
  size(1200, 700);
  bg = loadImage("map.jpg");
  
  fromTextInput = new TextInput(600, 140);
  fromTextInput.setLabel("From Date:");
  fromTextInput.setLabelPosition(500, 150);

  toTextInput = new TextInput(600, 100);
  toTextInput.setLabel("To Date:");
  toTextInput.setLabelPosition(500, 200);

  fromAirportInput = new TextInput(600, 150);
  fromAirportInput.setLabel("From Airport:");
  fromAirportInput.setLabelPosition(500, 250);

  toAirportInput = new TextInput(600, 200);
  toAirportInput.setLabel("To Airport:");
  toAirportInput.setLabelPosition(500, 300);
  
  searchButton = new Button("Search", 200, 250, 80, 30);
}

void draw() {
  background(255);
  tint(255, opacity);
  image(bg, 0, 0, width, height);
  noTint();
  
  fromTextInput.display();
  toTextInput.display();
  fromAirportInput.display();
  toAirportInput.display();
  searchButton.display();
}
