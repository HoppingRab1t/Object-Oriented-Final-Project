import java.awt.Rectangle;

class Zombie {
  PVector pos;
  int HP = 8;
  PVector dif = new PVector(400 + random(-50,50),400 + random(-50,50));

  Rectangle hitbox;

  Zombie() {

    if (difficultyMode == 0) {
      pos = new PVector (random(0, 800), -1000);
    }
    if (difficultyMode == 1) {
      pos = new PVector (random(0, 800), -1000);
    }
    if (difficultyMode == 2) {
      pos = new PVector (random(0, 800), -1000);
    }
  }

  PVector Size =new PVector(40, 40);
  void display() {
    noStroke();
    fill(0);
    //accoutn hit box if its corner mode
    hitbox = new Rectangle(int(pos.x - Size.x/2), int(pos.y - Size.y/2), int(Size.x), int(Size.y));
    ellipse(pos.x, pos.y, Size.x, Size.y);
    pos.sub(PlayerVol.x, PlayerVol.y);

  float ratio = 2/sqrt(pow(CenterPos.x + dif.x - pos.x, 2) + pow(CenterPos.y + dif.y - pos.y, 2));

    pos.x += ( CenterPos.x + dif.x - pos.x ) *ratio;
    pos.y += (CenterPos.y + dif.y - pos.y)*ratio;
    //ellipse  (random(0,299),random(0,299),20,20);
    //if (zombie.contains(bullets.x,bullets.y)){
    //  HP -= damage;
    //}
  }
  void hit(int damage) {
    HP -= damage;
  }
}
