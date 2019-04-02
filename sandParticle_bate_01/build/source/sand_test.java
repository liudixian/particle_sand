import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sand_test extends PApplet {

public void setup(){
    
}

public void draw( ) {
    background(255);
    float vx = (mouseX-pmouseX);
    float vy = (mouseY-pmouseY);
    if(mousePressed)
    PVector m = new PVector(vx,vy);


    line(pmouseX,pmouseY, mouseX, mouseY);
    println(m);
}
class Sand
{
    Sand(){

    }

    public void behavior(){

    }

    // void display() {
    //   pushMatrix();
    //   pushStyle();
    //   translate(loc.x, loc.y);
    //   strokeWeight(r-vel.mag()*1.0);
    //   //strokeWeight(r);
    //   stroke(targetC);
    //   point(0, 0);
    //   popStyle();
    //   popMatrix();
    // }

    // void applyForce(PVector f) {
    //   acc.add(f);
    // }

    // PVector attactorSand(){
    //
    // }
}
  public void settings() {  size(1080,720); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sand_test" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
