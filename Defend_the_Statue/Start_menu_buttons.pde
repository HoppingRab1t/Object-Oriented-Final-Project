class Start_menu_buttons {
  int brightness=0;
  int offset;
  int difficulty = 0;
  
  Start_menu_buttons (int i) {
    offset = i;
  }
  
  void display() {
    //off set should be 250
    if (gamePlay == false) {
      //draw the different difficulty selections
      if (50 +(offset) <= mouseX && mouseX <= 250 +(offset) && mouseY<=750 && mouseY >= 550) {
        if (mousePressed) {
          brightness = 200;
          difficulty = offset/250 +1;

        }
        brightness += ((150 - brightness)/5);
      } else {
        brightness += ((0 - brightness)/5);
      }
    }
    fill(brightness);
    rect(150 + offset, 650, 200, 200);
  }
  
  int difficulty() {
  return difficulty;
 }
 
}
