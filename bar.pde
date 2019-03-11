color c = color(0);
PVector location;  // Location of shape
PVector velocity;  // Velocity of shape
PVector loc; // Location of each block
boolean show = true, notBroken = true;
int a = 10, b = 8;
//ArrayList<Block>[]blocks = new ArrayList [a];
int rows = 4, cols = 5;
Block[] blocks = new Block[rows * cols];


class Block{
  
  float h = 10;
  float w = 40;  
  int xpos = 5;
  int ypos = 5;
  int x; //brick x
  int y; //brick y
  boolean hit;
  
  Block (int x0, int y0) {
    x = x0;
    y = y0;
  }
  void displayBlock(){
  if(notBroken){
    rect(xpos, ypos, h, w);
  }
}
  
}

void setup(){
  size(600, 600);
  smooth();
  location = new PVector(mouseX + 55, 4*height/5);
  velocity = new PVector(1.5, -3.1);
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      blocks[i*rows + j] = new Block((i + 1) * width/(rows + 2), (j + 1) *50); 
    }
  }
}

void draw(){
  background(255);
  location.add(velocity);
  
  //bounce of edges
  if ((location.x > width) || (location.x < 0)){
    velocity.x = velocity.x * -1;
  }
  if(location.y < 0){
    velocity.y = velocity.y * -1;
  }
  
  //bounce of the bar
  if ((location.x >= mouseX) && (location.x <= (mouseX + 55)) && (location.y >= (4*height/5 + 10))){
    velocity.y = velocity.y * -1;
    if ((location.x >= mouseX) && (location.x <= (mouseX + 27.5)) && (velocity.x > 0)) {
      velocity.x = (velocity.x * -1);
    }
     if ((location.x >= mouseX + 27.5) && (location.x <= (mouseX + 55)) && (velocity.x < 0)) {
      velocity.x = (velocity.x * -1);
    }
  }
  
  //going down
  if(location.y >= (4*height/5 + 40)){
    show = false;
    velocity.x = 0;
    velocity.y = 0;
  }
  
  //restart if clicked
  if((show == false) && mousePressed){
      show = true;
      location.x = mouseX + 27.5;
      location.y = 4*height/5;
      velocity.x = 1.5;
      velocity.y = -3.1;
    }
  
  
  display();
  displayball();
  if(notBroken){
   // Block.displayBlock();
  }
}

void display() {
  fill(c);
  rect(mouseX, 4*height/5, 55, 10);
}
void displayball(){
  if(show){
    stroke(255);
    strokeWeight(2);
    fill(127);
    ellipse(location.x, location.y, 15, 15);
  }
}
