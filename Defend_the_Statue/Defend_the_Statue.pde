// \n


boolean gamePlay = false;
int difficulty;
void setup() {
  size(800, 800);
  rectMode(CENTER);
}


//ArrayList <float>  Size = new ArrayList<>();


void draw() {
  background(255);
  fill(0);
  textSize(29);
  text("qwdqwdqwdqw \nqwdqwdqdw", 200, 200);


  if (gamePlay == false) {
    //draw the different difficulty selections

    if (mousePressed) {
      if (50 <= mouseX && mouseX <= 350) {
        
      } else {
        
      }
      rect(150, 650, 200, 200);

      if (300 <= mouseX && mouseX <= 500) {
        
      } else {
        
      }
      rect(400, 650, 200, 200);

      if (550 <= mouseX && mouseX <= 750) {
        
      } else {
        
      }
      rect(650, 650, 200, 200);



      rect(400, 450, 700, 5);
    }
  }
}

void mousePressed() {
  println("X: "+mouseX, "| Y: "+mouseY);
}
void keyPressed() {
  if (key == ' ') {
  }
}
