// The Flock (a list of Boid objects)

class Flock {
  ArrayList<Boid> boids; // An Array List for all the boids
  Portal portals[];
  boolean ActivePortal;
  Flock() {
    ActivePortal = true;
    portals = new Portal[2];
    portals[0] = new Portal(252, 73, 3);
    portals[1] = new Portal(3, 144, 252);
    portals[0].ChangeLocation(portals[1]); 
    portals[1].ChangeLocation(portals[0]);
    
    boids = new ArrayList<Boid>(); // Initialize the ArrayList
    
      for (int i = 0; i < 150; i++) {
        addBoid(new Boid(width/2,height/2,portals[0],portals[1]));
      }
  }

  void run() {
    
    if(ActivePortal){
    for(int i = 0; i < 2; i++){
      portals[i].Active = true;
      portals[i].draw();
    }
    }
    else{
       for(int i = 0; i < 2; i++)
          portals[i].Active = false;
    }
    
    
    for (Boid b : boids) {
      b.run(boids);  // Passing the entire list of boids to each boid individually
    }


  }

  void addBoid(Boid b) {
    boids.add(b);
  }
    void addBoid(int x ,int y) {
    boids.add(new Boid(x,y,portals[0],portals[1]));
  }

}
