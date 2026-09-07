class Npc extends GameObject {

  Npc(float _x, float _y, float _w, float _h) {
    super(_x, _y, _w, _h);
  }
}

class Tree extends Npc {
  PImage tree3;

  Tree(float _x, float _y, float _w, float _h) {
    super(_x, _y, _w, _h);
    tree3 = loadImage("assets/tree3.png");
    tree3.resize(150, 150);
  }

  void Display() {
    image(tree3, x, y);
  }
}
