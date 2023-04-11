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
  encryptedImage = new Image( loadImage("encrypted.png") );
  
  float widthScale = width * bounding.x / inputImage.image.width;
  float heightScale = height * bounding.y / inputImage.image.height;
  float imageScale;
  
  
  int number = 1789036;
  println( number & 0xFF );
  println( (number >> 8) & 0xFF);
  println( (number >> 16) & 0xFF);
  println( (number >> 24) & 0xFF);
  
  if ( widthScale < heightScale ) {
    imageScale = widthScale;
  } 
  
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
