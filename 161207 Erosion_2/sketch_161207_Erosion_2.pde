PImage degas;
PImage sect;

void setup() {
   frameRate(100);
   size(500,500);
   background(0);
   
   //Image loading
   degas = loadImage("degas.jpg");
   image(degas,0,0,500,500);
}


//Declare sample size
int size = 30;

void draw() {
            
    ////Load current pixels
    loadPixels();

    //X, Y of randomPixel
    int x = int(random(width - size));
    int y = int(random(height - size));
    
    PImage sect = get(x, y, size, size);
    
    color hue = getAverageColor(sect);


    //Fill square
    fill(hue);
    noStroke();
    rect(x, y, size, size);
    
    
    //Set inteval of jpg saves
    int interval = 250;
    
    //Save frames as jpg
    //if (frameCount % interval == 0) {
    //  saveFrame("30frame-######.jpg");
    //}     

}

  color getAverageColor(PImage sect) {
    
      sect.loadPixels();
      int r = 0, g = 0, b = 0;
      for (int i = 0; i < sect.pixels.length - 1; i++) {
          color c = sect.pixels[i];
          r += c>>16&0xFF;
          g += c>>8&0xFF;
          b += c&0xFF;
      }
      r /= sect.pixels.length;
      g /= sect.pixels.length;
      b /= sect.pixels.length;
      return color(r, g, b);
      
  }