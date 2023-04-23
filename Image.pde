class Image {
  PImage image;
  int[] pixelKeys;
  int[] columnKeys;
  int[] rowKeys;
  
  Image(PImage image) {
    this.image = image;
    this.pixelKeys = new int[0];
  }
  
  void encrypt() {
    image.loadPixels();
    for (int i = 0; i < image.pixels.length; i++) {
      image.pixels[i] = powerFunction( image.pixels[i] );
    }
    image.updatePixels();
  }
  
  void otherEncrypt() {
    image.loadPixels();
    for (int i = 0; i < image.pixels.length; i++) {
      image.pixels[i] = image.pixels[i] + pixelKeys[i % pixelKeys.length];
    }
    image.updatePixels();
  }
  
  void shuffleEncrypt() {
    image.loadPixels();
    
    // Shuffling rows
    
    for (int y = 0; y < image.height; y++) {
      for (int x = 0; x < image.width; x++) {
        int currentIndex = toIndex(x, y, image);
        int shuffleIndex = toIndex(x, rowKeys[y], image);
        color pixelBackup = image.pixels[currentIndex];
        
        image.pixels[currentIndex] = image.pixels[shuffleIndex];
        image.pixels[shuffleIndex] = pixelBackup;
      }
    }
    
    // Shuffling columns
    for (int x = 0; x < image.width; x++) {
      for (int y = 0; y < image.height; y++) {
        int currentIndex = toIndex(x, y, image);
        int shuffleIndex = toIndex(columnKeys[x], y, image);
        color pixelBackup = image.pixels[currentIndex];
        
        image.pixels[currentIndex] = image.pixels[shuffleIndex];
        image.pixels[shuffleIndex] = pixelBackup;
      }
    }
    
    image.updatePixels();
  }
  
  void xor() {
    image.loadPixels();
    for (int i = 0; i < image.pixels.length; i++) {
      image.pixels[i] = image.pixels[i] ^ pixelKeys[i % pixelKeys.length];
    }
    image.updatePixels();
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

int toIndex(int x, int y, PImage image) {
  return y * image.width + x;
}
