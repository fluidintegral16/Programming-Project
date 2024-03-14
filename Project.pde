TextInput fromTextInput;
TextInput toTextInput;
TextInput fromAirportInput;
TextInput toAirportInput;
Button searchButton;

void setup() {
  size(400, 400);
  background(255);
  
  fromTextInput = new TextInput(150, 50);
  toTextInput = new TextInput(150, 100);
  fromAirportInput = new TextInput(150, 150);
  toAirportInput = new TextInput(150, 200);
  
  fromTextInput.setLabel("From Date:");
  toTextInput.setLabel("To Date:");
  fromAirportInput.setLabel("From Airport:");
  toAirportInput.setLabel("To Airport:");
  
  searchButton = new Button("Search", 200, 250, 80, 30);
}

void draw() {
  background(255);
  
  textSize(16);
  fill(0);
  text("From Date:", 50, 50);
  text("To Date:", 50, 100);
  text("From Airport:", 50, 150);
  text("To Airport:", 50, 200);
  
  fromTextInput.display();
  toTextInput.display();
  fromAirportInput.display();
  toAirportInput.display();
  searchButton.display();
}
