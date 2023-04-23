Image inputImage, encryptedImage;
PVector imageDimensions;
PVector bounding = new PVector( 0.45f, 0.9f ); // Each image's size compared to the ( width, height )

void setup() {
  fullScreen();
  noStroke();
  background( 100 );
  imageMode( CENTER );
  rectMode( CENTER );
 
  inputImage = new Image( loadImage("image.png") );
  encryptedImage = new Image( loadImage("image.png") );
  
  // Encryption
  encryptedImage.pixelKeys = generateKeyArray(inputImage.image.height * inputImage.image.width);
  encryptedImage.rowKeys = generateIndexShuffle(encryptedImage.image.height);
  encryptedImage.columnKeys = generateIndexShuffle(encryptedImage.image.width);
  
  //encryptedImage.otherEncrypt();
  encryptedImage.xor();
  //encryptedImage.shuffleEncrypt();
  
  float widthScale = width * bounding.x / inputImage.image.width;
  float heightScale = height * bounding.y / inputImage.image.height;
  float imageScale;
 
  if ( widthScale < heightScale ) imageScale = widthScale;
  else imageScale = heightScale;
  
  imageDimensions = new PVector( inputImage.image.width * imageScale, inputImage.image.height * imageScale );
}

void draw() {
  background( 100 );
  fill( 200 );
  //rect( width / 4f, height / 2f, bounding.x * width, bounding.y * height );
  //rect( width * 0.75f, height / 2f, bounding.x * width, bounding.y * height );
  image( inputImage.image, width / 4f, height / 2f, imageDimensions.x, imageDimensions.y );
  image( encryptedImage.image, width * 0.75f, height / 2f, imageDimensions.x, imageDimensions.y );
} 

void keyPressed() {
  if (keyCode == 69) encryptedImage.encrypt();
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
