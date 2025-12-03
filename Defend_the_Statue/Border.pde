class Borders {
  Rectangle Borders;

  //setting up stuff
  int type;
  int difficultyModes = 1;
  PVector pos = new PVector (0, 0);

  Borders(int types) {
    type = types + 1;

    //make sure it doesn't break while coding
    Borders = new Rectangle(1, 1, 1, 1);
  }
  void diff(int i) {
    //sets difficulty mode local variable
    difficultyModes = i;
  }
  void display() {



    pos.sub(PlayerVol.x, PlayerVol.y);
    //different values depending on the difficulty mode, changing its positon.
    if (type == 1) {
      if (difficultyModes == 1) {
        Borders = new Rectangle(int (0+ CenterPos.x), int (500+ CenterPos.y), 800, 100);
        //println("it works ");
      }
      if (difficultyModes == 2) {
        Borders = new Rectangle(int (-1800+ CenterPos.x), int (500+ CenterPos.y), 4000, 100);
      }
      if (difficultyModes == 3) {
        Borders = new Rectangle(int (-1800+ CenterPos.x), int (2000+ CenterPos.y), 4000, 100);
      }
    }
    if (type == 2) {
      if (difficultyModes == 1) {
        Borders = new Rectangle(int (-100+ CenterPos.x), int (-2000+ CenterPos.y), 100, 2600);
        //println("it works ");
      }
      if (difficultyModes == 2) {
        Borders = new Rectangle(int (-1800+ CenterPos.x), int (-1600+ CenterPos.y), 100, 2200);
      }
      if (difficultyModes == 3) {
        Borders = new Rectangle(int (-1800+ CenterPos.x), int (-1600+ CenterPos.y), 100, 3600);
      }
    }
    if (type == 3) {
      if (difficultyModes == 1) {
        Borders = new Rectangle(int (800+ CenterPos.x), int (-2000+ CenterPos.y), 100, 2600);
        //println("it works ");
      }
      if (difficultyModes == 2) {
        Borders = new Rectangle(int (1800+400+ CenterPos.x), int (-1600+ CenterPos.y), 100, 2200);
      }
      if (difficultyModes == 3) {
        Borders = new Rectangle(int (1800+400+ CenterPos.x), int (-1600+ CenterPos.y), 100, 3600);
      }
    }
    if (type == 4) {
      if (difficultyModes == 1) {
        Borders = new Rectangle(int (0+ CenterPos.x), int (-2000+ CenterPos.y), 800, 100);
        //println("it works ");
      }
      if (difficultyModes == 2) {
        Borders = new Rectangle(int (-1800+ CenterPos.x), int (-1600+ CenterPos.y), 4000, 100);
      }
      if (difficultyModes == 3) {
        Borders = new Rectangle(int (-1800+ CenterPos.x), int (-1600+ CenterPos.y), 4000, 100);
      }
    }

    //draws the border
    rectMode(CORNER);
    fill(100);
    if  (!(type  == 0)) {
      rect(Borders.x, Borders.y, Borders.width, Borders.height);
    }

    rectMode(CENTER);
  }
}
