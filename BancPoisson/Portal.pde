class Portal{
 
  PVector location;
  color  PortalColor;
  Boolean Active;
  float radius;
  float diametre;
  Portal(){
  }
  Portal(int r, int g , int b){
    Active = true;
    location = new PVector(random(20,width - 20),random(20, height - 20));
    setRadius(radius);    
    PortalColor = color(r, g, b, 100);
  }
  void setRadius(float radius) {
    this.radius = radius;
    diametre = 2 * radius;
  }
  
  float getRadius() {
    return radius;
  }  
  
  boolean check_Colision(Boid boid){
    float diameter = sqrt(sq(boid.position.x - this.location.x) + sq(boid.position.y - this.location.y));
    if(Active){
       if(diameter <= 25)
         return true;
        else
          return false;   
       
    }
      return false;
      
      
  }

  
   boolean check_Colision(Portal portal){
    float diameter = sqrt(sq(portal.location.x - this.location.x) + sq(portal.location.y - this.location.y));
       print(diameter + "\n");
       if(diameter > 200)
         return true;
        else{
          print("Colliding \n");
          return false;   
        }
  }
  
  
  void ChangeLocation(Portal portal){
do{
     location = new PVector(random(20,width - 20),random(20, height - 20)); 
     print("Changing location \n");
   }
    while(!check_Colision(portal));    
    print("exit warp \n");
  }
  
 PVector GetLocation(){
   return location; 
  }
  
  
  void draw(){
    stroke (0);
    fill (PortalColor);
    
    ellipse (location.x, location.y, 32 , 32); // Dimension à l'échelle de la masse
 
    
  }
  
}
