import java.awt.Rectangle;

class Zombie {
  //declaring the variables.
  PVector pos;


  int variant;
  int HP = 8;
  int zdamage;
  int pointAmount;
  int moneyAmount;
  float speed;

  PVector colour = new PVector(0, 0, 0);

  PVector dif = new PVector(StatueHitbox.x - CenterPos.x +StatueHitbox.width/2+ random(-50, 50), StatueHitbox.y - CenterPos.y +StatueHitbox.height/2+ random(-50, 50));
  int vari = 1;
  float ratio = int (random(1, 3));

  int zdelay = 0;
  Rectangle hitbox;

  int rand = 0;

  //sets the size
  PVector Size =new PVector(40, 40);

  Zombie(int vari) {

    variant = vari;
    //different zombie spawning locations based on the difficulty level
    if (difficultyMode == 1) {
      pos = new PVector (random(0, 800)+ CenterPos.x, -2000 + CenterPos.y);
    }
    if (difficultyMode == 2) {
      rand = int(random(1, 4));
      if (rand  == 1) {
        pos = new PVector (random(-1000, 1000)+ CenterPos.x, -2500 + CenterPos.y);
      }
      if (rand  == 2) {
        pos = new PVector (2200 + CenterPos.x, random(-1800, 200) + CenterPos.y);
      }
      if (rand  == 3) {
        pos = new PVector (-1400 + CenterPos.x, random(-1800, 200) + CenterPos.y);
      }
    }
    if (difficultyMode == 3) {
      rand = int(random(1, 5));
      if (rand  == 1) {
        pos = new PVector (random(-1000, 1000)+ CenterPos.x, -2500 + CenterPos.y);
      }
      if (rand  == 4) {
        pos = new PVector (random(-1000, 1000)+ CenterPos.x, 2500 + CenterPos.y);
      }
      if (rand  == 2) {
        pos = new PVector (2200 + CenterPos.x, random(-1800, 200) + CenterPos.y);
      }
      if (rand  == 3) {
        pos = new PVector (-1400 + CenterPos.x, random(-1800, 200) + CenterPos.y);
      }
    }

    //zombie stats per variant
    if (variant == 1 ) {
      HP = 4;
      zdamage = 1;
      pointAmount= 100;
      moneyAmount = 10;
      speed = 1;
      colour = new PVector(135, 197, 69);
    }
    if (variant == 2 ) {
      HP = 10;
      zdamage = 2;
      pointAmount= 250;
      moneyAmount = 30;
      speed = 0.5;
      colour = new PVector(145, 180, 56);
      Size =new PVector(50, 50);
    }
    if (variant == 3 ) {
      HP = 4;
      zdamage = 1;
      pointAmount= 150;
      moneyAmount = 15;
      speed = 2;
      colour = new PVector(56, 180, 145);
    }
    if (variant == 4 ) {
      HP = 20;
      zdamage = 1;
      pointAmount= 200;
      moneyAmount = 20;
      speed = 0.2;
      colour = new PVector(25, 77, 28);
      Size =new PVector(60, 60);
    }
    if (variant == 5 ) {
      HP = 10;
      zdamage = 2;
      pointAmount= 150;
      moneyAmount = 15;
      speed = 3;
      colour = new PVector(39, 183, 128);
    }
    if (variant == 6 ) {
      HP = 2;
      zdamage = 1;
      pointAmount= 150;
      moneyAmount = 15;
      speed = 6;
      colour = new PVector(174, 39, 183);
    }
    if (variant == 7 ) {
      HP = 100;
      zdamage = 10;
      pointAmount= 550;
      moneyAmount = 50;
      speed = 0.05;
      colour = new PVector(0, 0, 0);
      Size =new PVector(80, 80);
    }
    //speed and HP increases the harder the difficulty to make things harder C:< not
    speed += difficultyMode/5;
    HP += wave;
  }


  void display() {
    noStroke();
    ratio = speed/sqrt(pow(CenterPos.x + dif.x - pos.x, 2) + pow(CenterPos.y + dif.y - pos.y, 2));

    fill(colour.x, colour.y, colour.z);
    //accoutn hit box if its corner mode
    
    //sets up the hitbox of the zombie
    hitbox = new Rectangle(int(pos.x - Size.x/2), int(pos.y - Size.y/2), int(Size.x), int(Size.y));
    ellipse(pos.x, pos.y, Size.x, Size.y);
    pos.sub(PlayerVol.x, PlayerVol.y);

//changes the position of the zombie and stops if it reaches to its destination
    if (sqrt(pow(CenterPos.x + dif.x - pos.x, 2) + pow(CenterPos.y + dif.y - pos.y, 2))<=10) {
    } else {
      pos.x += ( CenterPos.x + dif.x - pos.x ) *ratio;
      pos.y += (CenterPos.y + dif.y - pos.y)*ratio;
    }

    
    zdelay += 1;
  }
  void hit(int damage) {
    //if being hit the player would recive money and points
    HP -= damage;
    points += pointAmount;
    money += moneyAmount;
  }
  void statueAttack() {
    //attacks the statue after a certain amount of time
    if (zdelay >= 40) {
      zdelay = 0;
      statueHP -= zdamage;
      print("attack");
    }
  }
}
