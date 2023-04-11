class Image {
  PImage image;
  ArrayList<Integer> keys;
  
  Image(PImage image) {
    this.image = image;
    this.keys = new ArrayList<Integer>();
  }
  
  void encrypt() {
    image.loadPixels();
    for (int i = 0; i < image.pixels.length; i++) {
      image.pixels[i] = powerFunction( image.pixels[i] );
    }
    image.updatePixels();
  }
  
  void fillkeys(int amount) {
    for (int i = 0; i < amount; i++) {
      keys.set( i, int(random(0, 0xFFFFFFFF)) );
    }
  }
  
  int extractByte(int number, int byteAmount) {
    return ( number >> ( 8 * (byteAmount-1) ) ) & 0xFF;
  }
  
  // Functions
  color powerFunction(color number) {
    int alpha = extractByte(number, 1);
    int red =   extractByte(number, 2);
    int green = extractByte(number, 3);
    int blue =  extractByte(number, 4);
    
    
    return color(red, green, blue, alpha);
  }
}
