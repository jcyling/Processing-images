PImage monet;

void setup() {
   frameRate(10000);
   size(500,500);
   background(0);
   
   //Image loading
   monet = loadImage("monet.jpg");
   image(monet,0,0,500,500);
   

}

void draw() {
  
  //Set interval
  int time = millis();
  int interval = 3000;
    
  //Load current pixels
  loadPixels();
    
  //Select random pixel
  int i = int(random(pixels.length));
    
  //Record current values
  float r = red(pixels[i]);
  float g = green(pixels[i]);
  float b = blue(pixels[i]);
    
  //Altercation of rgb axis based on range
  int j = int(random(255));
  if (j < 85) {   
    r = red(pixels[j]);
  }
  else if (85 <= j && j < 170) {   
    g = green(pixels[j]);
  }    
  else {   
    b = blue(pixels[j]);
  }   
    
  //Draw pixel towards 255
  pixels[i] = color(random(r,255), random(g,255), random(b,255));

  //Save frame as jpg in inteval
  //if (time % interval == 0) {
  //  saveFrame("frame-######.jpg");
  //}
  
  updatePixels();

}