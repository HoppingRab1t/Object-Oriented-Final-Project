
class Start_menu_buttons {
  int brightness1=0;
  int offset;
  int difficulty = 0;

  Start_menu_buttons (int i) {
    offset = i;
  }

  void display() {
    //off set should be 250
    if (gamePlay == false) {
      //draw the different difficulty selections
      if (brightness >= 0) {
        difficulty = 0;
      }
      if (50 +(offset) <= mouseX && mouseX <= 250 +(offset) && mouseY<=750 && mouseY >= 550) {
        if (mousePressed) {
          brightness1 = 200;
          difficulty = offset/250 +1;
          //print(difficulty);
          for  (int i = 0; i < borders.length; i+=1) {
            //add stuff
            borders[i].diff(difficulty);
          }
        }
        brightness1 += ((150 - brightness1)/5);
      } else {
        brightness1 += ((0 - brightness1)/5);
      }
    }
    fill(brightness1);
    rect(150 + offset, 650, 200, 200);
  }

  int difficulty() {
    return difficulty;
  }
}
