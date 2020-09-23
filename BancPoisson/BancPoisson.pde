//Base Project From https://processing.org/examples/flocking.html

Flock flock;

void setup() {
  size(640, 360);
  flock = new Flock();
  // Add an initial set of boids into the system

}

void keyPressed() {

    if (key == 'r' || key == 'R') {
     print("Reset \n"); 
     setup();
  } 
  
    if(key == ' '){
      if(flock.ActivePortal){
        flock.ActivePortal = false;
          }
      else{
        flock.ActivePortal = true;        
        flock.portals[0].ChangeLocation(flock.portals[1]);  
        flock.portals[1].ChangeLocation(flock.portals[0]);     } 
  }
  
  
}

void draw() {
  background(50);
  flock.run();

}

// Add a new boid into the System
void mousePressed() {
  flock.addBoid(mouseX,mouseY);
}
