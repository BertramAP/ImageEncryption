class Image {
  PImage image;
  int[] pixelKeys;
  int[] columnKeys;
  int[] rowKeys;
  
  Image(PImage image) {
    this.image = image;
    this.pixelKeys = new int[0];
  }
  
  void vigenereEncrypt() {
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
}

int toIndex(int x, int y, PImage image) {
  return y * image.width + x;
}
