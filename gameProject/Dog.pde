class Dog extends Npc {
  PImage dog_down;
  PImage dog_up;
  PImage dog_left;
  PImage dog_right;

  int speed;

  Dog(float _x, float _y, float _w, float _h, int _s) {
    super(_x, _y, _w, _h);

    dog_down = loadImage("assets/gDogUp.png");
    dog_up = loadImage("assets/gDogDown.png");
    dog_left = loadImage("assets/gDogRight.png");
    dog_right = loadImage("assets/gDogLeft.png");

    dog_down.resize(80, 80);
    dog_up.resize(80, 80);
    dog_left.resize(80, 80);
    dog_right.resize(80, 80);

    speed = _s;
  }

  void Display() {
    if (player.x > dog.x) {
      image(dog_left, x, y);
    } else if (player.x < dog.x) {
      image(dog_right, x, y);
    } else if (player.y > dog.y) {
      image(dog_up, x, y);
    } else if (player.y < dog.y) {
      image (dog_down, x, y);
    }
  }

  void Move() {
    if (player.x > x) {
      x += speed;
    }
    if (player.x < x) {
      x -= speed;
    }
    if (player.y > y) {
      y += speed;
    }
    if (player.y < y) {
      y -= speed;
    }
  }

  void checkEdges() {
    if (dog.x >= width-80) {
      dog.x = width - 80;
    } else if (dog.x <= width-1800) {
      dog.x = width - 1800;
    } else if (dog.y >= height-80) {
      dog.y = height - 80;
    } else if (dog.y <= height-900) {
      dog.y = height - 900;
    }
  }

  boolean inter() {
    if (player.x >= this.x-25 && player.x <= this.x && player.y <= this.y+25 && player.y >= this.y||
      player.x >= this.x-25 && player.x <= this.x && player.y >= this.y-25 && player.y <= this.y ||
      player.x <= this.x+25 && player.x >= this.x && player.y <= this.y+25 && player.y >= this.y ||
      player.x <= this.x+25 && player.x >= this.x && player.y >= this.y-25 && player.y <= this.y) {
      return true;
    }
    return false;
  }
}
