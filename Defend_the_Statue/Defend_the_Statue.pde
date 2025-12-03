// \n
import java.awt.Rectangle;


boolean gamePlay = false;
int difficultyMode = 0;

//Player movments
float PlayerAcc = 10;
PVector PlayerVol = new PVector(0, 0);

//Map coords
PVector CenterPos = new PVector(0, 0);
//Camera
int cameraShake;
PVector ShakeOffset = new PVector(0, 0);

//setting up the classes with their respected arrays and arraylists
Start_menu_buttons[] buttons = new Start_menu_buttons[3];
Borders[] borders = new Borders[4];
Foliage[] foliage = new Foliage[60];
shopButtons[] shopButtons  = new shopButtons[5];

ArrayList <Bullets> bullets = new  ArrayList<Bullets>();
ArrayList <Zombie> zombie = new ArrayList<Zombie>();


//important variables
int damage = 1;
int points = 0;
int highscore = 0;
int statueHP = 100;
int wave = 1;
int money =0;
int zombieCount = 80;
int weaponType = 0;
float recoil = 0;

//setting up the hitboxes for the statue and player
Rectangle StatueHitbox;
Rectangle PlayerHitbox;

void setup() {
  size(800, 800);
  rectMode(CENTER);
  noCursor();

  //declaring the arrays
  for  (int i = 0; i < buttons.length; i+=1) {
    buttons[i] = new Start_menu_buttons(i*250);
  }
  for  (int i = 0; i < borders.length; i+=1) {
    borders[i] = new Borders(i);
  }
  for  (int i = 0; i < foliage.length; i+=1) {
    foliage[i] = new Foliage();
  }
  for  (int i = 0; i < shopButtons.length; i+=1) {
    shopButtons[i] = new shopButtons(i);
  }
}

//different delays
int delay;
int zombieDelay;
int zombieSetDelay = 30;

//for the UI
int brightness = 0;

// setting up the variables for the text
PVector textPos = new PVector (50, 20);
String text= "[   DEFEND THE STATUE   ]\n \n --How to play-- \n Survive as long as possible until \n all 10 waves are completed. \n \n --Controls-- \n  WASD to move \n  Space or mouse down to shoot \n Mouse pointer to aim \n\n\n\n EASY                 MEDIUM                  HARD";

//this is just for the gun to display
float ratios;
void draw() {

  noStroke();
  background(80, 159, 79);
  textSize(29);
  fill(0);

  //Main menu and displaying
  if  (gamePlay == true) {
    brightness += 10 ;
    if (brightness <=  555) {
      fill(0, 0, 0, brightness);
      rect(400, 400, 800, 800);
    } else

      fill(0, 0, 0, 255-(brightness-555));
    rect(400, 400, 800, 800);
  } else {
    fill(10);
    rect(400, 530, 700, 5);

    for  (int i = 0; i < buttons.length; i+=1) {
      buttons[i].display();
      difficultyMode = buttons[i].difficulty;

      //this is where the game would start
      if  (!(difficultyMode == 0 || brightness >= 555)) {
        gamePlay = true;
        print("STOP");
        break;
      }
    }
  }

  //this is where the main game is located
  if (gamePlay == true && brightness >= 555) {

    //Player movement
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
    //slowly reduces the velocity after no key is pressed
    if (!(keyPressed) || keySpace == true) {
      PlayerVol.add((0-PlayerVol.x)/20, 0);
      PlayerVol.add(0, (0-PlayerVol.y)/20);
    }


    //Camera shake
    pushMatrix();
    translate(-1*ShakeOffset.x, -1*ShakeOffset.y);
    //displays foliage
    for  (int i = 0; i < foliage.length; i+=1) {
      foliage[i].display();
    }
    //adds for the timer
    delay += 1;
    zombieDelay += 1;

    //zombie spawning determined by wave
    //this also includes what kind of zombie spanws per wave by using random.
    if (zombieCount >= 1) {
      if (wave == 1) {
        if (zombieDelay >= zombieSetDelay) {
          zombieDelay = 0;
          zombie.add(new Zombie(int(random(1, 2))));
        }
      }
      if (wave == 2) {
        if (zombieDelay >= zombieSetDelay) {
          zombieDelay = 0;
          zombie.add(new Zombie(int(random(1, 3))));
        }
      }
      if (wave == 3) {
        if (zombieDelay >= zombieSetDelay) {
          zombieDelay = 0;
          zombie.add(new Zombie(int(random(1, 4))));
        }
      }
      if (wave == 4) {
        if (zombieDelay >= zombieSetDelay) {
          zombieDelay = 0;
          zombie.add(new Zombie(int(random(2, 4))));
        }
      }
      if (wave == 5) {
        if (zombieDelay >= zombieSetDelay) {
          zombieDelay = 0;
          zombie.add(new Zombie(int(random(3, 4))));
        }
      }
      if (wave == 6) {
        if (zombieDelay >= zombieSetDelay) {
          zombieDelay = 0;
          zombie.add(new Zombie(int(random(1, 5))));
        }
      }
      if (wave == 7) {
        if (zombieDelay >= zombieSetDelay) {
          zombieDelay = 0;
          zombie.add(new Zombie(int(random(3, 5))));
        }
      }
      if (wave == 8) {
        if (zombieDelay >= zombieSetDelay) {
          zombieDelay = 0;
          zombie.add(new Zombie(int(random(1, 7))));
        }
      }
      if (wave == 9) {
        if (zombieDelay >= zombieSetDelay) {
          zombieDelay = 0;
          zombie.add(new Zombie(int(random(3, 7))));
        }
      }
      if (wave == 10) {
        if (zombieDelay >= zombieSetDelay) {
          zombieDelay = 0;
          zombie.add(new Zombie(int(random(4, 8))));
        }
      }
    }
    //if a certain amount of zombies die it would move to the next wave
    if (zombieCount <= 0) {
      wave += 1;
      statueHP += 20;
      zombieCount = 100 + wave*10;
      zombieSetDelay -= wave/10;
    }

    //this is where you shoot and the stats for each weapon type
    if (keySpace == true || mousePressed) {
      //start pistol
      if (weaponType == 0) {
        if (delay >= 10) {

          damage = 3;
          recoil += 6;
          bullets.add(new Bullets());
          delay = 0;
        }
      }
      //upgraded pistol
      if (weaponType == 1) {
        if (delay >= 8) {

          damage = 5;
          recoil += 4;
          bullets.add(new Bullets());
          delay = 0;
        }
      }
      //machine gun
      if (weaponType == 2) {
        if (delay >= 5) {

          damage = 7;
          recoil += 5;
          bullets.add(new Bullets());
          delay = 0;
        }
      }
      //shotgun
      if (weaponType == 3) {
        if (delay >= 20) {

          damage = 8;
          recoil += 15;

          bullets.add(new Bullets());
          bullets.add(new Bullets());
          bullets.add(new Bullets());
          bullets.add(new Bullets());
          bullets.add(new Bullets());
          delay = 0;
        }
      }
      //minigun
      if (weaponType == 4) {
        if (delay >= 2) {

          damage = 10;
          recoil += 6;
          bullets.add(new Bullets());
          delay = 0;
        }
      }
      if (delay <= 5) {
        cameraShake = int(recoil/4);
      }
    } else {
      ShakeOffset.x = 0;
      ShakeOffset.y = 0;
    }

    fill(200);
    StatueHitbox = new Rectangle(int(350+ CenterPos.x), int(200+ CenterPos.y), 100, 100);
    rectMode(CORNER);
    rect(StatueHitbox.x, StatueHitbox.y, StatueHitbox.width, StatueHitbox.height);

    //stops the player from going through the statue
    PlayerHitbox = new Rectangle(int (400 + PlayerVol.x) - 25, int (400 + PlayerVol.y)- 25, 50, 50);
    if (StatueHitbox.intersects(PlayerHitbox)) {
      PlayerVol.sub(PlayerVol);
      //print("pop");
    }
    rectMode(CENTER);

    //draws the gun
    stroke(20);
    ratios = 50/sqrt(pow(mouseX-(400+PlayerVol.x), 2)+pow(mouseY-(400+PlayerVol.y), 2));
    strokeWeight(10);
    line(400+PlayerVol.x, 400+PlayerVol.x, 400+(mouseX-(400+PlayerVol.x))*ratios, 400+(mouseY-(400+PlayerVol.y))*ratios);
    noStroke();


    //display borders
    for  (int i = 0; i < borders.length; i+=1) {

      borders[i].display();
      //stops the player from phasing through the border
      if (borders[i].Borders.intersects(PlayerHitbox)) {
        PlayerVol.sub(PlayerVol);
      }
    }

    //displays bullets
    for (int i = bullets.size()-1; i >= 0; i -=1) {
      Bullets b = bullets.get(i);
      b.display();
      //after a ceertain amount of time the bullet will despawn for optimisation
      if ( b.delay >5000 ) {
        bullets.remove(i);
      }
    }

    //displays zombie
    for (int d = zombie.size()-1; d >= 0; d-=1) {
      Zombie z = zombie.get(d);
      z.display();
      //if the zombie touches the statue the hp would decrease
      if (StatueHitbox.contains(z.pos.x, z.pos.y)) {
        z.statueAttack();
        //println("why it not wortk");
      }
    }
    //checks if the bullet hits the zombie
    for (int i = bullets.size()-1; i >= 0; i -=1) {
      Bullets b = bullets.get(i);

      for (int d = zombie.size()-1; d >= 0; d-=1) {
        Zombie z = zombie.get(d);
        //zombie hit
        if (z.hitbox.contains(b.pos.x, b.pos.y)) {
          bullets.remove(i);
          z.hit(damage);
          points += 10;
          stroke(0);
          strokeWeight(2);

          //zombie dies from damage
          if (z.HP <= 0) {
            println("dead");
            zombieCount -= 1;
            cameraShake += 10;

            zombie.remove(d);

            stroke(228, 76, 76);
            strokeWeight(4);
          }
          //draw damaged indicated crosshair

          line (mouseX-10, mouseY-10, mouseX-20, mouseY-20);
          line (mouseX+10, mouseY-10, mouseX+20, mouseY-20);
          line (mouseX-10, mouseY+10, mouseX-20, mouseY+20);
          line (mouseX+10, mouseY+10, mouseX+20, mouseY+20);
          break;
        }
      }
    }
    //shakes for a few frames
    if (delay <= 5) {
      ShakeOffset.x = (random(-1*cameraShake, cameraShake));
      ShakeOffset.y = (random(-1*cameraShake, cameraShake));
    }

    //changes the center positon for the different moving objects
    CenterPos.sub(PlayerVol);

    //shakes the screen
    translate(ShakeOffset.x, ShakeOffset.y);

    //draw player
    noStroke();
    fill(254, 242, 75);
    ellipse(400+PlayerVol.x, 400+PlayerVol.y, 50, 50);

    popMatrix();
    //end of camera shake
    fill(0);

    //recoil recovery system
    if (!(recoil<=0)) {
      recoil += (0-recoil)/10;
    } else {
      recoil = 0;
    }
    //crosshair
    rect(mouseX +10 + recoil*3, mouseY, 2, 10);
    rect(mouseX +15 + recoil*3, mouseY, 30, 2);

    rect(mouseX -10 - recoil*3, mouseY, 2, 10);
    rect(mouseX -15 - recoil*3, mouseY, 30, 2);

    rect(mouseX, mouseY -15 - recoil*3, 2, 30);
    rect(mouseX, mouseY -10 - recoil*3, 10, 2);

    rect(mouseX, mouseY +15 + recoil*3, 2, 30);
    rect(mouseX, mouseY +10 + recoil*3, 10, 2);

    //low hp indicator
    if (statueHP <= 20 ) {
      textPos = new PVector(350, 200);
      text = "LOW HP";
    } else {
      textPos = new PVector(350, 200);
      if (!(wave == 11)) {
        text = "";
      }
    }

    if (statueHP <= 0 || wave == 11) {

      //removes instances after the game is over
      for (int i = bullets.size()-1; i >= 0; i -=1) {
        bullets.remove(i);
      }
      for (int d = zombie.size()-1; d >= 0; d-=1) {
        zombie.remove(d);
      }


      //reset stats
      gamePlay = false;

      brightness = 0;
      statueHP =100;
      difficultyMode = 0;
      money = 0;
      points = 0;
      zombieCount = 0;
      textPos = new PVector (50, 20);

      CenterPos = new PVector (0, 0);
      if (wave == 11) {
        //textPos = new PVector (50, 20);
        if (highscore < points) {
          highscore = points;
        }
        textPos = new PVector (50, 200);
        //win screen
        text  = "!!! YOU WIN !!! \n YIPPEEEEE\nPoints: \n"+points +"Highscore: " + highscore;
      }
      wave = 0;
      //sets the text
      println("Game over man... GAME OVER");
      text= "[   DEFEND THE STATUE   ]\n \n --How to play-- \n Survive as long as possible until \n all 10 waves are completed. \n \n --Controls-- \n  WASD to move \n  Space or mouse down to shoot \n Mouse pointer to aim \n\n\n\n EASY                 MEDIUM                  HARD";
    }

    fill(0, 0, 0, 100);
    rect(400, 800, 1000, 100);
    //display shop buttons
    for  (int i = 0; i < shopButtons.length; i+=1) {
      shopButtons[i].display();
    }
    textSize(15);
    fill(255);
    rectMode(CORNER);

    //in game UI text
    text ("Pistol                                  Revolver                                Auto gun                               Shotgun                                 Minigun" +
      "\nFree                                        2,000                                    5,000                                         12,500                                   50,000"+
      "\n \n\n\n\nPoints: "+points+
      "               Money: "+money +
      "               Statue HP: " +statueHP+
      "               Wave: "+wave,
      90, 675, 800, 200);

    rectMode(CENTER);
  }

  //outside the running game
  rectMode(CORNER);
  fill(255, 255, 255, 255-brightness);
  textSize(40);
  textAlign(CENTER);

  text(text, textPos.x, textPos.y, 700, 900);
  textAlign(CORNER);
  rectMode(CENTER);
  fill(255);
  ellipse(mouseX, mouseY, 5, 5);
}
int varas = 0;
void mousePressed() {
  println("X: "+mouseX, "| Y: "+mouseY);
}

boolean keyA;
boolean keyD;
boolean keyW;
boolean keyS;
boolean keySpace;
void keyPressed() {
  // to make key pressing be smooth
  if (key == 'a' || key == 'A') {
    keyA = true;
  }
  if (key == 'd' || key == 'D') {
    keyD = true;
  }
  if (key == 'w' || key == 'W') {
    keyW = true;
  }
  if (key == 's'|| key == 'S') {
    keyS = true;
  }
  if (key == ' ') {
    keySpace = true;
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
  if (key == ' ') {
    keySpace = false;
  }
}
