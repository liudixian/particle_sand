import codeanticode.syphon.*;

PGraphics canvas;
SyphonServer server;

float vx, vy;
ArrayList<Sand> s;
PVector mForce = new PVector();
PVector mvel ;

PImage img;
String imgName = "painting.jpg";
float rotio = 0.5;
int w=0;
int h = 0;

public void settings() {
  img = loadImage(imgName);
  w = ceil(img.width*rotio);
  h = ceil(img.height*rotio);
  img.resize(w, h);
  size(w, h, P2D);

}

void setup() {
  //loadPixels();
  s = new ArrayList<Sand>();
  canvas = createGraphics(w, h, P2D);
  server = new SyphonServer(this, "particles_test");

  for (int i=0; i <width; i +=2) {
    for (int j=0; j <height; j +=2) {
      //color c = img.get(i, j);
      color c = img.pixels[j*width + i];
      s.add(new Sand(i, j, color(c)));
    }
  }

  //updatePixels();
  smooth();
  colorMode(HSB, 360, 100, 100);
}

void draw( ) {
  surface.setTitle("rate: "+frameRate);
  canvas.beginDraw();

  canvas.background(255);
  canvas.fill(255, 100, 10);
  canvas.ellipse(mouseX, mouseY, 10, 10);

  for (Sand d : s) {
    d.display();
  }

  for (Sand ss : s) {
    if (hue(ss.targetC)>100 && hue(ss.targetC) <150 ) {
      //ss.loc.add(random(-1,1),random(-1,1));
      ss.run(s);
      ss.display();
    }
    //ss.display();
    //ss.run(s);
  }

  canvas.updatePixels();
  canvas.endDraw();
  image(canvas, 0, 0);
  //server.sendImage(canvas);
}


void mouseDragged() {
  mouseSeek = true;
}


void mouseReleased() {
  mouseSeek = false;
}

void keyPressed() {
  mouseSeek = false;
}
