class Mouse extends Npc {
  PImage mouse_down;
  PImage mouse_up;
  PImage mouse_left;
  PImage mouse_right;

  int speed;
  boolean isVisible;


  Mouse(float _x, float _y, float _w, float _h, int _s) {
    super(_x, _y, _w, _h);
    speed = _s;

    mouse_down = loadImage("assets/mouseDown.png");
    mouse_up = loadImage("assets/mouseUp.png");
    mouse_left = loadImage("assets/mouseLeft.png");
    mouse_right = loadImage("assets/mouseRight.png");
  }

  boolean inter() {
    if (player.x >= this.x-25 && player.x <= this.x && player.y <= this.y+25 && player.y >= this.y||
      player.x >= this.x-25 && player.x <= this.x && player.y >= this.y-25 && player.y <= this.y ||
      player.x <= this.x+25 && player.x >= this.x && player.y <= this.y+25 && player.y >= this.y ||
      player.x <= this.x+25 && player.x >= this.x && player.y >= this.y-25 && player.y <= this.y) {


      if (isVisible) {
        player.score += 1;
      }
      isVisible = false;
      return isVisible;
    }
    return isVisible;
  }

  void Move() {
    if (inter()) {

      int r = (int)random(1, 5);
      //println(r);
      switch(r) {
      case 1:
        x += speed;
        image(mouse_right, x, y);
        break;
      case 2:
        y += speed;
        image(mouse_down, x, y);
        break;
      case 3:
        x -= speed;
        image(mouse_left, x, y);
        break;
      case 4:
        y -= speed;
        image(mouse_up, x, y);
        break;
      }
    } else {
      noFill();
    }
  }

  void checkEdges() {
    if (x >= width-50) {
      x = width - 50;
    } else if (x <= width-1800) {
      x = width - 1800;
    } else if (y >= height-50) {
      y = height - 50;
    } else if (y <= height-900) {
      y = height - 900;
    }
  }
}
