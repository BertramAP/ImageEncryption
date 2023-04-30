Image inputImage, encryptedImage;
StartScreen startScreen;
InfoScreen infoScreen;
PVector imageDimensions;
PVector bounding = new PVector( 0.45f, 0.9f ); // Each image's size compared to the ( width, height )
Button shuffle, xor, vigenere;
boolean doShuffle, doXor, doVigenere;

void setup() {
  fullScreen();
  noStroke();
  background( 100 );
  imageMode( CENTER );
  rectMode( CENTER );
  startScreen = new StartScreen();
  infoScreen = new InfoScreen();
  
  doShuffle = false;
  doXor = false;
  doVigenere = false;
  
  
  // Buttons
  shuffle = new Button(0, height - 100, width/3, 80, "Shuffle");
  xor = new Button(int(width*0.33), height - 100, width/3, 80, "XOR");
  vigenere = new Button(int(width*0.66), height - 100, width/3, 80, "Vigenere");
  
  inputImage = new Image(loadImage("image.png"));
  encryptedImage = new Image(loadImage("image.png"));
  
  // Encryption
  encryptedImage.pixelKeys = generateKeyArray(inputImage.image.height * inputImage.image.width);
  encryptedImage.rowKeys = generateIndexShuffle(encryptedImage.image.height);
  encryptedImage.columnKeys = generateIndexShuffle(encryptedImage.image.width);
  
  // For drawing the image
  float widthScale = width * bounding.x / inputImage.image.width;
  float heightScale = height * bounding.y / inputImage.image.height;
  float imageScale;
  if ( widthScale < heightScale ) imageScale = widthScale;
  else imageScale = heightScale;
  imageDimensions = new PVector( inputImage.image.width * imageScale, inputImage.image.height * imageScale );
}

void draw() {
  infoScreen.show();
  startScreen.show();
  
  if (!startScreen.active && !infoScreen.active) {
    encryptedImage.image = loadImage("image.png");
    
    if (doShuffle) encryptedImage.shuffleEncrypt();
    if (doXor) encryptedImage.xor();
    if (doVigenere) encryptedImage.vigenereEncrypt();
    
    
    background( 100 );
    fill( 200 );
    image(inputImage.image, width / 4f, height / 2f, imageDimensions.x, imageDimensions.y);
    image(encryptedImage.image, width * 0.75f, height / 2f, imageDimensions.x, imageDimensions.y);
    
    shuffle.show();
    xor.show();
    vigenere.show();
  }
} 

void mousePressed() {
  startScreen.update();
  infoScreen.update();
  
  if (shuffle.checkInput()) doShuffle = !doShuffle;
  else if (xor.checkInput()) doXor = !doXor;
  else if (vigenere.checkInput()) doVigenere = !doVigenere;
}

int[] generateKeyArray(int amount) {
  int[] array = new int[amount];
  for (int i = 0; i < amount; i++) array[i] = int(random(-2147483648, 2147483647));
  return array;
}

int[] generateIndexShuffle(int range) {
  int[] array = new int[range];
  for (int i = 0; i < range; i++) array[i] = int(random(range));
  return array;
}
