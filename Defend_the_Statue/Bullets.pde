
class Bullets {
  float ratio;
  //PVector pos = new PVector(CenterPos.x+400, CenterPos.y+400);
  //PVector centerpos = new PVector(CenterPos.x+400, CenterPos.y+400);
  PVector pos = new PVector(400, 400);
  PVector centerpos = new PVector(400, 400);

  PVector mouse = new PVector (mouseX + random(-recoil*2, recoil*2), mouseY + random(-recoil*2, recoil*2));


  int delay = 0;
  Bullets() {
    ratio = 30/sqrt(pow(mouse.x- centerpos.x, 2) + pow(mouse.y- centerpos.y, 2));
  }

  void display() {
    //print(" poopoiouoop");



    pos.x += ( mouse.x -centerpos.x ) *ratio;
    pos.y += (mouse.y -centerpos.y )*ratio;

    pos.x -= PlayerVol.x;
    pos.y -= PlayerVol.y;

    stroke(253, 230, 99);
    strokeWeight(5);

    if (delay >=1) {
      line(pos.x, pos.y, pos.x - ((mouse.x - centerpos.x)*ratio)*2, pos.y - ((mouse.y - centerpos.y)*ratio)*2);
    }
    if (delay <4) {
      noStroke();
      fill(253, 230, 99, 20);
      for (int i = 0; i < 10; i +=1) {
        ellipse(centerpos.x+ ((mouse.x - centerpos.x)*ratio)/1, centerpos.y+ ((mouse.y - centerpos.y)*ratio)/1, i*random(15,20), i*random(15,20));
      }
    }
    delay += 1;
    //rect (400,400+pos.x, 20,20);
  }
  void mousePressed() {
    //print(pos+"pooop");
  }
}
