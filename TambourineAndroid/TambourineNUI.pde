Maxim maxim;
AudioPlayer player;
AudioPlayer player2;
PImage img;

AccelerometerManager accel;
float ax, ay, az;

void setup()
{
  size(400, 400);
  background(255);
  maxim = new Maxim(this);
  player = maxim.loadFile("sound1.wav");
  player2 = maxim.loadFile("sound2.wav");
  player.setLooping(true);
  player2.setLooping(true);
  img = loadImage("tambourine.jpg"); 
  
  accel = new AccelerometerManager(this);
  orientation(PORTRAIT);
  noLoop();
}

void draw()
{
  image(img, 50, 50, img.width, img.height);
  
  if(ay>0){
    player.play();
    player2.stop();
  } else {
    player.stop();
    player2.play();
  }
  
}


void mouseDragged()
{  
  if(dist(mouseX, mouseY, width/2, width/2) < 130){
    
    player.stop();
    player2.play();
    
  } else {
    player.play();
    player2.stop();
  }
  
}

void mouseReleased()
{
  player.stop();
  player2.stop(); 
}

public void resume() {
  if (accel != null) {
    accel.resume();
  }
}

public void pause() {
  if (accel != null) {
    accel.pause();
  }
}

public void shakeEvent(float force) {
  println("shake : " + force);
}

public void accelerationEvent(float x, float y, float z) {
//  println("acceleration: " + x + ", " + y + ", " + z);
  ax = x;
  ay = y;
  az = z;
  redraw();
}
