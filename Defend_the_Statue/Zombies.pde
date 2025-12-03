import java.awt.Rectangle;

class Zombie {
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





  Zombie(int vari) {

    variant = vari;

    if (difficultyMode == 1) {
      pos = new PVector (random(0, 800)+ CenterPos.x, -2000 + CenterPos.y);
    }
    if (difficultyMode == 2) {
      pos = new PVector (random(0, 800)+ CenterPos.x, -1000 + CenterPos.y);
    }
    if (difficultyMode == 3) {
      pos = new PVector (random(0, 800)+ CenterPos.x, -1000 + CenterPos.y);
    }

    //zombie stats
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
    }
    if (variant == 3 ) {
      HP = 4;
      zdamage = 1;
      pointAmount= 150;
      moneyAmount = 15;
      speed = 2;
      colour = new PVector(56, 180, 145);
    }
  }

  PVector Size =new PVector(40, 40);
  void display() {
    noStroke();
    ratio = speed/sqrt(pow(CenterPos.x + dif.x - pos.x, 2) + pow(CenterPos.y + dif.y - pos.y, 2));

    fill(colour.x, colour.y, colour.z);
    //accoutn hit box if its corner mode
    hitbox = new Rectangle(int(pos.x - Size.x/2), int(pos.y - Size.y/2), int(Size.x), int(Size.y));
    ellipse(pos.x, pos.y, Size.x, Size.y);
    pos.sub(PlayerVol.x, PlayerVol.y);





    if (sqrt(pow(CenterPos.x + dif.x - pos.x, 2) + pow(CenterPos.y + dif.y - pos.y, 2))<=10) {
    } else {
      pos.x += ( CenterPos.x + dif.x - pos.x ) *ratio;
      pos.y += (CenterPos.y + dif.y - pos.y)*ratio;
    }

    //ellipse  (random(0,299),random(0,299),20,20);
    //if (zombie.contains(bullets.x,bullets.y)){
    //  HP -= damage;
    //}
    zdelay += 1;
  }
  void hit(int damage) {
    HP -= damage;
    points += pointAmount;
    money += moneyAmount;
  }
  void statueAttack() {
    if (zdelay >= 20) {
      zdelay = 0;
      statueHP -= zdamage;
      print("attack");
    }
  }
}
