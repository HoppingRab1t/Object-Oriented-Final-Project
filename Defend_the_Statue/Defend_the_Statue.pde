// \n


boolean gamePlay = false;
int difficultyMode = 0;

//Player movments
float PlayerAcc = 10;
PVector PlayerVol = new PVector(0, 0);

//Map coords
PVector CenterPos = new PVector(0, 0);

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
  fill(0);
  //proof of concept
  text("22220 \r eedwd", 200, 200, 100, 100);

  //Main menu and displaying it
  if  (gamePlay == true) {
    brightness += 10 ;

    if (brightness <=  555) {
      fill(0, 0, 0, brightness);
      rect(400, 400, 800, 800);
    } else

      fill(0, 0, 0, 255-(brightness-555));
    rect(400, 400, 800, 800);
  } else {
    for  (int i = 0; i < buttons.length; i+=1) {
      buttons[i].display();
      difficultyMode = buttons[i].difficulty;
      //print(difficultyMode);

      if  (!(difficultyMode == 0)) {
        gamePlay = true;
      }
    }
  }

  //this is where the main game is located
  if (gamePlay == true && brightness >= 555) {
    //Player movemnt key press (REWORK THIS STUFF)
    if  (keyS == true) {
      PlayerVol.add(0, (PlayerAcc-PlayerVol.y)/5);
    } else {
      PlayerVol.add(0, (0-PlayerVol.y)/20);
    }


    if  (keyW == true) {
      PlayerVol.add(0, (-1*PlayerAcc-PlayerVol.y)/5);
    } else {
      PlayerVol.add(0, (0-PlayerVol.y)/20);
    }


    if  (keyA== true) {
      PlayerVol.add((-1*PlayerAcc-PlayerVol.x)/5, 0);
    } else {
      PlayerVol.add((0-PlayerVol.x)/20, 0);
    }


    if  (keyD== true) {
      PlayerVol.add((PlayerAcc-PlayerVol.x)/5, 0);
    } else {
      PlayerVol.add((0-PlayerVol.x)/20, 0);
    }
    
    if (!(keyPressed)) {
      PlayerVol.add((0-PlayerVol.x)/20, 0);
      PlayerVol.add(0,(0-PlayerVol.y)/20);
      
         
    } 
    
    
    
CenterPos.sub(PlayerVol);

    //draw player
    fill(0);
    ellipse(400+PlayerVol.x, 400+PlayerVol.y, 50, 50);
    rect(CenterPos.x +400 ,CenterPos.y + 400,100,100);
  }
}

void mousePressed() {
  println("X: "+mouseX, "| Y: "+mouseY);
}

boolean keyA;
boolean keyD;
boolean keyW;
boolean keyS;
void keyPressed() {
  if (key == 'a') {
    keyA = true;
  }
  if (key == 'd') {
    keyD = true;
  }
  if (key == 'w') {
    keyW = true;
  }
  if (key == 's') {
    keyS = true;
  }
}

void keyReleased() {
  if (key == 'a') {
    keyA = false;
  }
  if (key == 'd') {
    keyD = false;
  }
  if (key == 'w') {
    keyW = false;
  }
  if (key == 's') {
    keyS = false;
  }
}
