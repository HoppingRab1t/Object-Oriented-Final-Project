class Foliage {
  PVector pos = new PVector (random(-2000, 2000), (random(-2000, 2000)));
  PImage img = loadImage("Bush_1.png");
  float ran = random(5,10)
;

  Foliage() {
    if (int(random(1, 6))== 1) {
      img = loadImage("Bush_1.png");
    }
    if (int(random(1, 6))== 2) {
      img = loadImage("Bush_2.png");
    }
    if (int(random(1, 6))== 3) {
      img = loadImage("Bush_3.png");
    }
    if (int(random(1, 6))== 4) {
      img = loadImage("Rock_1.png");
    }
    if (int(random(1, 6))== 5) {
      img = loadImage("Rock_2.png");
    }
  }

  void display() {
    //pos.sub(PlayerVol.x,PlayerVol.y);
    image (img,CenterPos.x+pos.x,CenterPos.y+pos.y,width/(ran),height/(ran));
  }
}
