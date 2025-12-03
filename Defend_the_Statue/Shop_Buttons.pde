
import java.awt.Rectangle;

class shopButtons {
  //declaring variables
  Rectangle buttonz;
  boolean purchased = false;
  int type;

  shopButtons(int i) {
    type = i;
    //sets the perameters of the shop button
    buttonz = new Rectangle( i * 150 + 65, 650, 75, 75);
  }

  void display() {
    //stats for all of the different shop buttons
    if (type == 0 ) {
      if (buttonz.contains(mouseX, mouseY)&& mousePressed) {
        if (purchased == false) {
          if (money >=0) {
            money -= 0;
            purchased = true ;
            weaponType = 0;
          }
        } else {
          weaponType = 0;
        }
      }
    }
    if (type == 1 ) {
      if (buttonz.contains(mouseX, mouseY)&& mousePressed) {
        if (purchased == false) {
          if (money >=2000) {
            money -= 2000;
            purchased = true ;
            weaponType = 1;
          }
        } else {
          weaponType = 1;
        }
      }
    }
    if (type == 2 ) {
      if (buttonz.contains(mouseX, mouseY)&& mousePressed) {
        if (purchased == false) {
          if (money >=5000) {
            money -= 5000;
            purchased = true ;
            weaponType = 2;
          }
        } else {
          weaponType = 2;
        }
      }
    }
    if (type == 3 ) {
      if (buttonz.contains(mouseX, mouseY)&& mousePressed) {
        if (purchased == false) {
          if (money >=12500) {
            money -= 12500;
            purchased = true ;
            weaponType = 3;
          }
        } else {
          weaponType = 3;
        }
      }
    }
    if (type == 4 ) {
      if (buttonz.contains(mouseX, mouseY)&& mousePressed) {
        if (purchased == false) {
          if (money >=50000) {
            money -= 50000;
            purchased = true ;
            weaponType = 4;
          }
        } else {
          weaponType = 4;
        }
      }
    }

    //changes the outline depending on what you are selecting
    if (weaponType == type ) {
      strokeWeight(5);
      stroke(255, 255, 255);
    } else {
      stroke(255, 255, 255);
      strokeWeight(1);
    }
    //draws the UI
    fill (0, 0, 0, 100);
    rectMode(CORNER);
    rect(int(buttonz.x), int(buttonz.y), int(buttonz.width), int(buttonz.height));
    rectMode(CENTER);
    noStroke();
  }
}
