import gifAnimation.*;
Player player;
PImage background;
Dog dog;
Timer startTimer;
Leaf leaf;
Leaves leafs;
PVector wind = new PVector(0.000095, 0);
ArrayList<Mouse> mouse;
int sec;
PImage leafImage;
PImage winner;
PImage looser;

Tree[] trees;

void playerTreeCollision(Player r1, Tree r2) {
  float distX = ((r1.x+r1.w/2)-(r2.x+r2.w/2));
  float distY = ((r1.y+r1.h/2)-(r2.y+r2.h/2));
  float combinedHalfWidths = r1.w/2+r2.w/2;
  float combinedHalfHeights = r1.h/2+r2.h/2;

  if (abs(distX) < combinedHalfWidths) {
    if (abs(distY) < combinedHalfHeights) {

      float overlapX = combinedHalfWidths - abs(distX);
      float overlapY = combinedHalfHeights - abs(distY);
      if (overlapX >= overlapY) {
        if (distY > 0) {
          r1.y += overlapY;
        }else{
          r1.y -= overlapY;
        }
      } else {
        if(distX > 0){
          r1.x += overlapX;
        }else{
          r1.x -= overlapX;
        }
      }
    }
  }
}

void setup() {
  size(1800, 900);
  startTimer = new Timer(0);

  background = loadImage("assets/backgroundd.png");
  background.resize(width, height);

  winner = loadImage("assets/youWin.png");
  looser = loadImage("assets/gameOver1.jpg");

  player = new Player(500, 200, 50, 50, 5);
  dog = new Dog(400, 200, 50, 50, 1);

  mouse = new ArrayList<Mouse>();

  for (int i = 0; i < 10; i++) {
    mouse.add(new Mouse(random(30, width-30), random(30, height-30), 20, 20, 10));
  }
  for (Mouse m : mouse) {
    m.isVisible = true;
  }

  leaf = new Leaf();
  leafs = new Leaves();
  leafImage = loadImage("assets/leaf.png");

  leafImage.resize(20, 20);

  trees = new Tree[8];

  trees[0] = new Tree(0, 0, 150, 150);
  trees[1] = new Tree(1650, 0, 150, 150);
  trees[2] = new Tree(1650, 750, 150, 150);
  trees[3] = new Tree(0, 750, 150, 150);
  trees[4] = new Tree(0, 250, 150, 150);
  trees[5] = new Tree(0, 500, 150, 150);
  trees[6] = new Tree(400, 400, 150, 150);
  trees[7] = new Tree(800, 500, 150, 150);
}

void draw() {
  image(background, 0, 0);

  startTimer.countUp();
  fill(0);
  text(startTimer.getTime(), 880, 20);
  text("your points: " +  player.score, 880, 50);

  for (int i = 0; i < trees.length; i++) {
    trees[i].Display();
    
    playerTreeCollision(player, trees[i]);
  }

  player.Display();
  dog.Display();
  dog.Move();
  player.checkEdges();

  dog.checkEdges();

  for (Mouse m : mouse) {
    m.checkEdges();

    m.inter();
    m.Move();
  }

  leaf.display();
  leafs.run();

  if (dog.inter()) {
    noLoop();
    for (Mouse m : mouse) {
      m.isVisible = false;
    }
    image(looser, 0, 0, 1800, 900);
  }

  if (player.isWinner()) {
    noLoop();
    image(winner, 0, 0, 1800, 900);
    println(player.score);
  }
}
