
class Bullets {
  //setting up varaibles
  float ratio;
  PVector pos = new PVector(400, 400);
  PVector centerpos = new PVector(400, 400);

  PVector mouse = new PVector (mouseX + random(-recoil*2, recoil*2), mouseY + random(-recoil*2, recoil*2));
  int delay = 0;
  
  Bullets() {
    //set up ratio
    ratio = 30/sqrt(pow(mouse.x- centerpos.x, 2) + pow(mouse.y- centerpos.y, 2));
  }

  void display() {


//changes the postion determined by the ratio
    pos.x += ( mouse.x -centerpos.x ) *ratio;
    pos.y += (mouse.y -centerpos.y )*ratio;

    pos.x -= PlayerVol.x;
    pos.y -= PlayerVol.y;

    stroke(253, 230, 99);
    strokeWeight(5);
    
//draws the bullet
    if (delay >=1) {
      line(pos.x, pos.y, pos.x - ((mouse.x - centerpos.x)*ratio)*2, pos.y - ((mouse.y - centerpos.y)*ratio)*2);
    }
    if (delay<2) {
      if (!(weaponType == 3)) {
        noStroke();
        fill(253, 230, 99, 30);
        //muzzle flash for a standard single shooting bullet
        for (int i = 0; i < 10; i +=1) {
          ellipse(centerpos.x+ ((mouse.x - centerpos.x)*ratio)/1, centerpos.y+ ((mouse.y - centerpos.y)*ratio)/1, i*random(15, 20), i*random(15, 20));
        }
      } else {
        //muzzle flash for the shotgun
        noStroke();
        fill(253, 230, 99, 30);
        ellipse(centerpos.x+ ((mouse.x - centerpos.x)*ratio)/1, centerpos.y+ ((mouse.y - centerpos.y)*ratio)/1, random(15, 20), random(15, 20));
      }
    }

    delay += 1;
  }
  
}
