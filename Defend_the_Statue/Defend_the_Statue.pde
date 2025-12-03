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

Start_menu_buttons[] buttons = new Start_menu_buttons[3];
Borders[] borders = new Borders[4];
Foliage[] foliage = new Foliage[60];

ArrayList <Bullets> bullets = new  ArrayList<Bullets>();
ArrayList <Zombie> zombie = new ArrayList<Zombie>();
ArrayList <Parti> parti = new ArrayList<Parti>();


//important variables
int damage = 1;
int points = 0;
int statueHP = 100;
int wave = 1;
int money =0;

int zombieCount = 100;
Rectangle StatueHitbox;
Rectangle PlayerHitbox;

void setup() {
  size(800, 800);
  rectMode(CENTER);
  noCursor();
  for  (int i = 0; i < buttons.length; i+=1) {
    buttons[i] = new Start_menu_buttons(i*250);
  }
  for  (int i = 0; i < borders.length; i+=1) {
    borders[i] = new Borders(i);
  }
  for  (int i = 0; i < foliage.length; i+=1) {
    foliage[i] = new Foliage();
  }
}


//ArrayList <float>  Size = new ArrayList<>();
int delay;
int zombieDelay;
int zombieSetDelay = 30;

int brightness = 0;

float recoil = 0;

PVector textPos = new PVector (50, 20);

String text= "[   DEFEND THE STATUE   ]\n \n --How to play-- \n Survive as long as possible until \n all 10 waves are completed. \n \n --Controls-- \n  WASD to move \n  Space or mouse down to shoot \n Mouse pointer to aim ";
void draw() {

  noStroke();
  background(80, 159, 79);
  textSize(29);
  fill(0);
  //proof of concept

  //test where the hit box is at
  //fill(200,200,200,200);
  //rect(StatueHitbox.x,StatueHitbox.y,StatueHitbox.width,StatueHitbox.height);

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
    fill(10);
    rect(400, 530, 700, 5);

    for  (int i = 0; i < buttons.length; i+=1) {
      buttons[i].display();
      difficultyMode = buttons[i].difficulty;
      //print(difficultyMode);

      if  (!(difficultyMode == 0 || brightness >= 555)) {
        gamePlay = true;
        print("STOP");
        break;
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

    if (!(keyPressed) || keySpace == true) {
      PlayerVol.add((0-PlayerVol.x)/20, 0);
      PlayerVol.add(0, (0-PlayerVol.y)/20);
    }

    //remove later
    //if (keyD == true && keyA == true) {
    //  statueHP-=10;
    //}


    pushMatrix();
    translate(-1*ShakeOffset.x, -1*ShakeOffset.y);

    for  (int i = 0; i < foliage.length; i+=1) {
      foliage[i].display();
    }

    delay += 1;
    zombieDelay += 1;

    if (zombieCount >= 1) {
      if (wave == 1) {
        if (zombieDelay >= zombieSetDelay) {
          zombieDelay = 0;
          zombie.add(new Zombie(int(random(1, 3))));
        }
      }
      if (wave == 2) {
        if (zombieDelay >= zombieSetDelay) {
          zombieDelay = 0;
          zombie.add(new Zombie(int(random(1, 4))));
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
          zombie.add(new Zombie(int(random(1, 4))));
        }
      }
      if (wave == 5) {
        if (zombieDelay >= zombieSetDelay) {
          zombieDelay = 0;
          zombie.add(new Zombie(int(random(1, 4))));
        }
      }
      if (wave == 6) {
        if (zombieDelay >= zombieSetDelay) {
          zombieDelay = 0;
          zombie.add(new Zombie(int(random(1, 4))));
        }
      }
      if (wave == 7) {
        if (zombieDelay >= zombieSetDelay) {
          zombieDelay = 0;
          zombie.add(new Zombie(int(random(1, 4))));
        }
      }
      if (wave == 8) {
        if (zombieDelay >= zombieSetDelay) {
          zombieDelay = 0;
          zombie.add(new Zombie(int(random(1, 4))));
        }
      }
      if (wave == 9) {
        if (zombieDelay >= zombieSetDelay) {
          zombieDelay = 0;
          zombie.add(new Zombie(int(random(1, 4))));
        }
      }
      if (wave == 10) {
        if (zombieDelay >= zombieSetDelay) {
          zombieDelay = 0;
          zombie.add(new Zombie(int(random(1, 4))));
        }
      }
    }
    if (zombieCount <= 0) {
      wave += 1;
      zombieCount = 100 + wave*10;
    }
    
//this is where you shoot
    if (keySpace == true || mousePressed) {
      if (delay >= 5) {

        damage = 1;
        recoil += 5;
        bullets.add(new Bullets());

        //shot gun mode
        //bullets.add(new Bullets());
        //bullets.add(new Bullets());
        //bullets.add(new Bullets());

        delay = 0;
      }
      if (delay <= 5) {
        cameraShake = int(recoil/4);
      }
    } else {
      ShakeOffset.x = 0;
      ShakeOffset.y = 0;
    }


    //draw instances
    fill(200);
    StatueHitbox = new Rectangle(int(350+ CenterPos.x), int(200+ CenterPos.y), 100, 100);
    rectMode(CORNER);
    rect(StatueHitbox.x, StatueHitbox.y, StatueHitbox.width, StatueHitbox.height);

    PlayerHitbox = new Rectangle(int (400 + PlayerVol.x) - 25, int (400 + PlayerVol.y)- 25, 50, 50);
    if (StatueHitbox.intersects(PlayerHitbox)) {
      PlayerVol.sub(PlayerVol);
      print("pop");
    }
    rectMode(CENTER);
    for  (int i = 0; i < borders.length; i+=1) {
      //add stuff
      borders[i].display();

      if (borders[i].Borders.intersects(PlayerHitbox)) {
        PlayerVol.sub(PlayerVol);
      }
    }


    for (int i = bullets.size()-1; i >= 0; i -=1) {
      Bullets b = bullets.get(i);
      b.display();
      if ( b.delay >5000 ) {
        bullets.remove(i);
      }
    }


    for (int d = zombie.size()-1; d >= 0; d-=1) {
      Zombie z = zombie.get(d);
      z.display();
      if (StatueHitbox.contains(z.pos.x, z.pos.y)) {
        z.statueAttack();
        //println("why it not wortk");
      }
    }
    for (int i = bullets.size()-1; i >= 0; i -=1) {
      Bullets b = bullets.get(i);

      for (int d = zombie.size()-1; d >= 0; d-=1) {
        Zombie z = zombie.get(d);
        if (z.hitbox.contains(b.pos.x, b.pos.y)) {
          bullets.remove(i);
          z.hit(damage);
          points += 10;
          stroke(0);
          strokeWeight(2);

          //draw damaged indicated crosshair
          line (mouseX-10, mouseY-10, mouseX-20, mouseY-20);
          line (mouseX+10, mouseY-10, mouseX+20, mouseY-20);
          line (mouseX-10, mouseY+10, mouseX-20, mouseY+20);
          line (mouseX+10, mouseY+10, mouseX+20, mouseY+20);
          if (z.HP <= 0) {
            println("dead");
            zombieCount -= 1;
            cameraShake += 10;

            zombie.remove(d);
          }
          break;
        }
      }
    }
    if (delay <= 5) {
      ShakeOffset.x = (random(-1*cameraShake, cameraShake));
      ShakeOffset.y = (random(-1*cameraShake, cameraShake));
    }
    //print(bullets.size());
    CenterPos.sub(PlayerVol);
    translate(ShakeOffset.x, ShakeOffset.y);
    //draw player
    noStroke();
    fill(0);
    ellipse(400+PlayerVol.x, 400+PlayerVol.y, 50, 50);

    popMatrix();
    fill(0);

    if (!(recoil<=0)) {
      recoil += (0-recoil)/10;
    } else {
      recoil = 0;
    }

    rect(mouseX +10 + recoil*3, mouseY, 2, 10);
    rect(mouseX +15 + recoil*3, mouseY, 30, 2);

    rect(mouseX -10 - recoil*3, mouseY, 2, 10);
    rect(mouseX -15 - recoil*3, mouseY, 30, 2);

    rect(mouseX, mouseY -15 - recoil*3, 2, 30);
    rect(mouseX, mouseY -10 - recoil*3, 10, 2);

    rect(mouseX, mouseY +15 + recoil*3, 2, 30);
    rect(mouseX, mouseY +10 + recoil*3, 10, 2);




    if (statueHP <= 0) {

      //statueHP = 0;
      for (int i = bullets.size()-1; i >= 0; i -=1) {
        bullets.remove(i);
      }
      for (int d = zombie.size()-1; d >= 0; d-=1) {
        zombie.remove(d);
      }


      //reset stuff
      gamePlay = false;
      brightness = 0;
      //print(difficultyMode);
      statueHP =100;
      difficultyMode = 0;

      println("Game over man... GAME OVER");
    }
    if (statueHP <= 20 ) {
      textPos = new PVector(350, 200);
      text = "LOW HP";
    } else {
      textPos = new PVector(350, 200);
      text = "";
    }


    fill(0, 0, 0, 100);
    rect(400, 800, 1000, 100);

    textSize(15);
    fill(255);
    rectMode(CORNER);

    text ("Points: "+points+
      "               Money: "+money +
      "               Statue HP: " +statueHP+
      "               Wave: "+wave,
      100, 770, 600, 200);

    rectMode(CENTER);
  }

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

void mousePressed() {
  println("X: "+mouseX, "| Y: "+mouseY);
}

boolean keyA;
boolean keyD;
boolean keyW;
boolean keyS;
boolean keySpace;
void keyPressed() {
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
