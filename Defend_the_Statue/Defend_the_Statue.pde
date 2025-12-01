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


ArrayList <Bullets> bullets = new  ArrayList<Bullets>();
ArrayList <Zombie> zombie = new ArrayList<Zombie>();

int damage = 1;
int points = 0;


void setup() {
  size(800, 800);
  rectMode(CENTER);

  for  (int i = 0; i < buttons.length; i+=1) {
    buttons[i] = new Start_menu_buttons(i*250);
  }
}


//ArrayList <float>  Size = new ArrayList<>();
int delay;
int zombieDelay;
int zombieSetDelay = 30;

int brightness = 0;

float recoil = 0;

PVector textPos = new PVector (10,0);
void draw() {

  noStroke();
  background(68, 114, 45);
  textSize(29);
  fill(0);
  //proof of concept
  text("22220 \r eedwd" + recoil, 200, 200, 100, 100);

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

    if (!(keyPressed) || keySpace == true) {
      PlayerVol.add((0-PlayerVol.x)/20, 0);
      PlayerVol.add(0, (0-PlayerVol.y)/20);
    }



    pushMatrix();
    translate(-1*ShakeOffset.x, -1*ShakeOffset.y);

    delay += 1;
    zombieDelay += 1;

    if (zombieDelay >= zombieSetDelay) {
      zombieDelay = 0;
      zombie.add(new Zombie());
      //

      //println("poop");
    }

    if (keySpace == true || mousePressed) {
      if (delay >= 5) {
        bullets.add(new Bullets());
        recoil += 5;
        delay = 0;
      }
      if (delay <= 5) {
        cameraShake = int(recoil/2);
        ShakeOffset.x = (random(-1*cameraShake, cameraShake));
        ShakeOffset.y = (random(-1*cameraShake, cameraShake));
      }
    } else {
      ShakeOffset.x = 0;
      ShakeOffset.y = 0;
    }


    //draw instances





    for (int i = bullets.size()-1; i >= 0; i -=1) {
      Bullets b = bullets.get(i);
      b.display();
      if ( b.delay >5000 ){
        bullets.remove(i);
      }
    }
    for (int d = zombie.size()-1; d >= 0; d-=1) {
      Zombie z = zombie.get(d);
      z.display();
    }
    for (int i = bullets.size()-1; i >= 0; i -=1) {
      Bullets b = bullets.get(i);

      for (int d = zombie.size()-1; d >= 0; d-=1) {
        Zombie z = zombie.get(d);
        if (z.hitbox.contains(b.pos.x, b.pos.y)) {
          bullets.remove(i);
          z.hit(damage);
          stroke(0);
          strokeWeight(2);
          line (mouseX-10, mouseY-10, mouseX-20, mouseY-20);
          line (mouseX+10, mouseY-10, mouseX+20, mouseY-20);
          line (mouseX-10, mouseY+10, mouseX-20, mouseY+20);
          line (mouseX+10, mouseY+10, mouseX+20, mouseY+20);
          if (z.HP <= 0) {
            println("dead");
            zombie.remove(d);
          }
          break;
        }
      }
    }

    //print(bullets.size());
    CenterPos.sub(PlayerVol);
    translate(ShakeOffset.x, ShakeOffset.y);
    //draw player
    noStroke();
    fill(0);
    ellipse(400+PlayerVol.x, 400+PlayerVol.y, 50, 50);
    rect(400 + CenterPos.x, 400+ CenterPos.y, 100, 100);

    popMatrix();
    fill(0);

    if (!(recoil<=0)) {
      recoil += (0-recoil)/10;
    } else {
      recoil = 0;
    }

    ellipse(mouseX, mouseY, 5, 5);
    rect(mouseX +10 + recoil*3, mouseY, 2, 10);
    rect(mouseX +15 + recoil*3, mouseY, 30, 2);

    rect(mouseX -10 - recoil*3, mouseY, 2, 10);
    rect(mouseX -15 - recoil*3, mouseY, 30, 2);

    rect(mouseX, mouseY -15 - recoil*3, 2, 30);
    rect(mouseX, mouseY -10 - recoil*3, 10, 2);

    rect(mouseX, mouseY +15 + recoil*3, 2, 30);
    rect(mouseX, mouseY +10 + recoil*3, 10, 2);
  }
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
