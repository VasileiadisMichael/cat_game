class Leaves{
    ArrayList<Leaf> leafs;
    
    Leaves() {
    leafs = new ArrayList<Leaf>();
  }
  
    void addLeaf() {
    leafs.add(new Leaf());
  }
  
    void run() {
    for (int i = leafs.size()-1; i >= 0; i--) {
      Leaf f = leafs.get(i);
      f.display();
      if (f.location.x > width) {
        leafs.remove(i);
        leafs.add(new Leaf());
      }
    }
  }
}

class Leaf {
  PVector location, velocity, acceleration;
  Float mass;

  Leaf() {
    location = new PVector(-20, random(height));
    velocity = new PVector(random(5), 0);
    acceleration = new PVector(0, 0);
    mass = random(1, 20);

  }
  
    void display() {

    image(leafImage, location.x, location.y);
    update();
  }
  
    void applyForce(PVector f) {
    PVector force = PVector.mult(f, mass);
    acceleration.add(force);
  }
  
    void update() {
    location.add(velocity);
    velocity.add(acceleration);
    
    applyForce(wind);


    location.add(new PVector(0, random(-1, 1)));
  }

}
