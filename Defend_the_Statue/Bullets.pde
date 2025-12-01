
class Bullets {
  float ratio;
  //PVector pos = new PVector(CenterPos.x+400, CenterPos.y+400);
  //PVector centerpos = new PVector(CenterPos.x+400, CenterPos.y+400);
  PVector pos = new PVector(400,400);
  PVector centerpos = new PVector(400,400);
  
  PVector mouse = new PVector (mouseX + random(-20,20), mouseY + random(-20,20));

  Bullets() {
    ratio = 50/sqrt(pow(mouse.x- pos.x, 2) + pow(mouse.y- pos.y, 2));
  }

  void display() {
    //print(" pooop");



    pos.x += ( mouse.x -centerpos.x ) *ratio;
    pos.y += (mouse.y -centerpos.y )*ratio;

    stroke(20);
    strokeWeight(10);

    line(pos.x, pos.y, pos.x + ((mouse.x - centerpos.x)*ratio)*2, pos.y + ((mouse.y - centerpos.y)*ratio)*2);

    fill(0, 0, 0, 50);
    //rect (400,400+pos.x, 20,20);
  }
  void mousePressed() {
    print(pos+"pooop");
  }
}
