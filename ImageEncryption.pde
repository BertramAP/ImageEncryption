Image inputImage, encryptedImage;
StartScreen startScreen;
InfoScreen infoScreen;
PVector imageDimensions;
PVector bounding = new PVector( 0.45f, 0.9f ); // Each image's size compared to the ( width, height )
Button shuffle, xor, vigenere;
boolean doShuffle, doXor, doVigenere;

color defaultColor = #aaaaaa;
color activeColor = #00ff00;
String imagePath = "image.png";

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
  shuffle = new Button(int(width * 0.33f * 0.2f), height - 100, int(width / 3 * 0.6f), 80, "Shuffle");
  xor = new Button(int(width * 0.33f + width * 0.33f * 0.2f), height - 100, int(width / 3 * 0.6f), 80, "XOR");
  vigenere = new Button(int(width * 0.66f + width * 0.33f * 0.2f), height - 100, int(width / 3 * 0.6f), 80, "Vigenere");
  
  inputImage = new Image(loadImage(imagePath));
  encryptedImage = new Image(loadImage(imagePath));
  
  // Encryption
  generateKeys();
  
  // For drawing the image
  generateImageDimensions();
}

void draw() {
  infoScreen.show();
  startScreen.show();
  
  if (doShuffle) shuffle.btnColor = activeColor;
  else shuffle.btnColor = defaultColor;
  if (doXor) xor.btnColor = activeColor;
  else xor.btnColor = defaultColor;
  if (doVigenere) vigenere.btnColor = activeColor;
  else vigenere.btnColor = defaultColor;
  
  if (!startScreen.active && !infoScreen.active) {
    encryptedImage.image = loadImage(imagePath);
    
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

void keyPressed() {
  if (keyCode == 79) selectInput("Selected Image:", "imageSelected");
  else if (keyCode == 83) encryptedImage.image.save("savedEncrypted.png");
}

void imageSelected(File selection) {
  if (selection != null) {
    imagePath = selection.getAbsolutePath();
    inputImage.image = loadImage(imagePath);
    encryptedImage.image = loadImage(imagePath);
    generateImageDimensions();
    generateKeys();
  }
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

void generateImageDimensions() {
  float widthScale = width * bounding.x / inputImage.image.width;
  float heightScale = height * bounding.y / inputImage.image.height;
  float imageScale;
  if ( widthScale < heightScale ) imageScale = widthScale;
  else imageScale = heightScale;
  imageDimensions = new PVector( inputImage.image.width * imageScale, inputImage.image.height * imageScale );
}

void generateKeys() {
  encryptedImage.pixelKeys = generateKeyArray(inputImage.image.height * inputImage.image.width);
  encryptedImage.rowKeys = generateIndexShuffle(encryptedImage.image.height);
  encryptedImage.columnKeys = generateIndexShuffle(encryptedImage.image.width);
}
