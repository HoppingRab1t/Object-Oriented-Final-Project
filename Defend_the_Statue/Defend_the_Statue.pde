// \n


boolean gamePlay = false;
int difficultyMode = 0;


Start_menu_buttons[] buttons = new Start_menu_buttons[3];
void setup() {
  size(800, 800);
  rectMode(CENTER);

  for  (int i = 0; i < buttons.length; i+=1) {
    buttons[i] = new Start_menu_buttons(i*250);
  }
}


//ArrayList <float>  Size = new ArrayList<>();

int brightness = 0;
void draw() {

  noStroke();
  background(255);
  textSize(29);
  for  (int i = 0; i < buttons.length; i+=1) {
    buttons[i].display();
    difficultyMode = buttons[i].difficulty;
    //print(difficultyMode);

    if  (!(difficultyMode == 0)) {
      gamePlay = true;
    }
  }
  if  (gamePlay == true) {
    brightness += 10 ;
    fill(0,0,0,brightness);
    rect(400, 400, 800, 800);
  }
}

void mousePressed() {
  println("X: "+mouseX, "| Y: "+mouseY);
}
void keyPressed() {
  if (key == ' ') {
  }
}
