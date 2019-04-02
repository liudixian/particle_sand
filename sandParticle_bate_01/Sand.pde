boolean mouseSeek =false;
float sepSize = 5;
float r =2;
float maxMouseSpeed =10.0;
float maxMouseForce =1.0;

class Sand
{
  PVector loc;
  PVector vel;
  PVector acc;
  float maxspeed;
  float maxforce;
  color targetC;
  PVector origin;
  int brushSize;
  float c;      //摩擦力常熟
  float mass;      //质量  质量越大正向力越大
  float life;
  
  Sand(float x, float y, color tc) {
    c = 0.03;
    targetC = tc;
    mass = 1.0;
    origin = new PVector(x, y);
    loc = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    maxforce = 0.02;
    maxspeed = 3;
    brushSize = 60;
  }

  void run(ArrayList<Sand> ds) {
    behavior();
    update();
        firction();

    if(life==0 ){
      loc = origin;
    }
    //display();
  }

  void behavior() {

    if (mouseSeek) {
      //applyForce(firction(0.5));
      applyForce(mouseAttactor());
    }
  }

  void firction() {

    PVector f  = vel.get();
    f.mult(-1);
    f.normalize();
    f.mult(c*mass);

    applyForce(f);
    //return f;
  }

  PVector firction(float c_) {

    PVector f  = vel.get();
    f.mult(-1);
    f.normalize();
    f.mult(c_*mass);

    //applyForce(f);
    return f;
  }

  void display() {
     int x = round(loc.x);
     int y = round(loc.y);
     
    for( int i=0; i< r; i++){
      for(int j =0; j<r; j++){
            set(x+i,y+j,targetC);
      }
    }
  }

  void applyForce(PVector f) {
    acc.add(f);
  }

  void update() {

    vel.add(acc);
    vel.limit(maxspeed);
    loc.add(vel);

    //firction();

    acc.mult(0);
    

  }

  PVector mouseAttactor() {
    PVector mouse = new PVector(mouseX, mouseY);
    float vx = mouseX-pmouseX;
    float vy = mouseY- pmouseY;

    PVector mvel = new PVector(vx, vy);

    float d = PVector.dist(loc, mouse);
    
    if (d <brushSize) {

      PVector steer = PVector.sub(mvel,vel);
      steer.mult((1-d/brushSize)*0.5);
      
      life = vel.mag();
      return steer;
    }
    return new PVector();
  }
}
