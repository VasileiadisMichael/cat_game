class Player extends GameObject {
  char direction;
  PImage[] image_left = new PImage[12];
  PImage[] image_right = new PImage[12];
  PImage[] image_up = new PImage[12];
  PImage[] image_down = new PImage[12];
  int speed;
  
  int score = 0;

  Player(float _x, float _y, float _w, float _h, int _s) {
    super(_x, _y, _w, _h);
    image_left[0] = loadImage("assets/catleft1.gif");
    image_left[1] = loadImage("assets/catleft2.gif");
    image_left[2] = loadImage("assets/catleft3.gif");
    image_left[3] = loadImage("assets/catleft4.gif");
    image_left[4] = loadImage("assets/catleft5.gif");
    image_left[5] = loadImage("assets/catleft6.gif");
    image_left[6] = loadImage("assets/catleft7.gif");
    image_left[7] = loadImage("assets/catleft8.gif");
    image_left[8] = loadImage("assets/catleft9.gif");
    image_left[9] = loadImage("assets/catleft10.gif");
    image_left[10] = loadImage("assets/catleft11.gif");
    image_left[11] = loadImage("assets/catleft12.gif");

    image_left[0].resize(50, 50);
    image_left[1].resize(50, 50);
    image_left[2].resize(50, 50);
    image_left[3].resize(50, 50);
    image_left[4].resize(50, 50);
    image_left[5].resize(50, 50);
    image_left[6].resize(50, 50);
    image_left[7].resize(50, 50);
    image_left[8].resize(50, 50);
    image_left[9].resize(50, 50);
    image_left[10].resize(50, 50);
    image_left[11].resize(50, 50);

    image_right[0] = loadImage("assets/catright1.gif");
    image_right[1] = loadImage("assets/catright2.gif");
    image_right[2] = loadImage("assets/catright3.gif");
    image_right[3] = loadImage("assets/catright4.gif");
    image_right[4] = loadImage("assets/catright5.gif");
    image_right[5] = loadImage("assets/catright6.gif");
    image_right[6] = loadImage("assets/catright7.gif");
    image_right[7] = loadImage("assets/catright8.gif");
    image_right[8] = loadImage("assets/catright9.gif");
    image_right[9] = loadImage("assets/catright10.gif");
    image_right[10] = loadImage("assets/catright11.gif");
    image_right[11] = loadImage("assets/catright12.gif");

    image_right[0].resize(50, 50);
    image_right[1].resize(50, 50);
    image_right[2].resize(50, 50);
    image_right[3].resize(50, 50);
    image_right[4].resize(50, 50);
    image_right[5].resize(50, 50);
    image_right[6].resize(50, 50);
    image_right[7].resize(50, 50);
    image_right[8].resize(50, 50);
    image_right[9].resize(50, 50);
    image_right[10].resize(50, 50);
    image_right[11].resize(50, 50);

    image_up[0] = loadImage("assets/catup1.gif");
    image_up[1] = loadImage("assets/catup2.gif");
    image_up[2] = loadImage("assets/catup3.gif");
    image_up[3] = loadImage("assets/catup4.gif");
    image_up[4] = loadImage("assets/catup5.gif");
    image_up[5] = loadImage("assets/catup6.gif");
    image_up[6] = loadImage("assets/catup7.gif");
    image_up[7] = loadImage("assets/catup8.gif");
    image_up[8] = loadImage("assets/catup9.gif");
    image_up[9] = loadImage("assets/catup10.gif");
    image_up[10] = loadImage("assets/catup11.gif");
    image_up[11] = loadImage("assets/catup12.gif");

    image_up[0].resize(50, 50);
    image_up[1].resize(50, 50);
    image_up[2].resize(50, 50);
    image_up[3].resize(50, 50);
    image_up[4].resize(50, 50);
    image_up[5].resize(50, 50);
    image_up[6].resize(50, 50);
    image_up[7].resize(50, 50);
    image_up[8].resize(50, 50);
    image_up[9].resize(50, 50);
    image_up[10].resize(50, 50);
    image_up[11].resize(50, 50);

    image_down[0] = loadImage("assets/catdown1.gif");
    image_down[1] = loadImage("assets/catdown2.gif");
    image_down[2] = loadImage("assets/catdown3.gif");
    image_down[3] = loadImage("assets/catdown4.gif");
    image_down[4] = loadImage("assets/catdown5.gif");
    image_down[5] = loadImage("assets/catdown6.gif");
    image_down[6] = loadImage("assets/catdown7.gif");
    image_down[7] = loadImage("assets/catdown8.gif");
    image_down[8] = loadImage("assets/catdown9.gif");
    image_down[9] = loadImage("assets/catdown10.gif");
    image_down[10] = loadImage("assets/catdown11.gif");
    image_down[11] = loadImage("assets/catdown12.gif");

    image_down[0].resize(50, 50);
    image_down[1].resize(50, 50);
    image_down[2].resize(50, 50);
    image_down[3].resize(50, 50);
    image_down[4].resize(50, 50);
    image_down[5].resize(50, 50);
    image_down[6].resize(50, 50);
    image_down[7].resize(50, 50);
    image_down[8].resize(50, 50);
    image_down[9].resize(50, 50);
    image_down[10].resize(50, 50);
    image_down[11].resize(50, 50);
    
    speed = _s;
  }

  void Display() {
    if (direction == 'a') {
      image(image_left[frameCount%12], x, y);
    } else if (direction == 'd') {
      image(image_right[frameCount%12], x, y);
    } else if (direction == 'w') {
      image(image_up[frameCount%12], x, y);
    } else if (direction == 's') {
      image (image_down[frameCount%12], x, y);
    }
  }

  void Move(char code) {
    switch(code) {
    case 'a':
      player.x -= speed;
      direction = 'a';
      break;
    case 'd':
      player.x += speed;
      direction = 'd';
      break;
    case 'w':
      player.y -= speed;
      direction = 'w';
      break;
    case 's':
      player.y += speed;
      direction = 's';
      break;
    default:
      println("key pressed "+code);   // don't match the switch parameter
      break;
    }
  }

  void checkEdges() {
    if (player.x >= width-50) {
      player.x = width - 50;
    } else if (player.x <= width-1800) {
      player.x = width - 1800;
    } else if (player.y >= height-50) {
      player.y = height - 50;
    } else if (player.y <= height-900) {
      player.y = height - 900;
    }
  }
  
  boolean isWinner(){
    if (score >= 10){
      return true;
    }
    return false;
  }
}
