PImage inputImage, encryptedImage;
PVector imageDimensions;
PVector bounding = new PVector( 0.45f, 0.9f ); // Each image's size compared to the ( width, height )

void setup() {
  fullScreen();
  noStroke();
  background( 100 );
  imageMode( CENTER );
  rectMode( CENTER );
  
  inputImage = loadImage("image.png");
  encryptedImage = loadImage("encrypted.png");
  
  float widthScale = width * bounding.x / inputImage.width;
  float heightScale = height * bounding.y / inputImage.height;
  float imageScale;
  
  if ( widthScale < heightScale ) {
    imageScale = widthScale;
  } 
  
  else imageScale = heightScale;
  
  imageDimensions = new PVector( inputImage.width * imageScale, inputImage.height * imageScale );
}

void draw() {
  background( 100 );
  fill( 200 );
  //rect( width / 4f, height / 2f, bounding.x * width, bounding.y * height );
  //rect( width * 0.75f, height / 2f, bounding.x * width, bounding.y * height );
  image( inputImage, width / 4f, height / 2f, imageDimensions.x, imageDimensions.y );
  image( encryptedImage, width * 0.75f, height / 2f, imageDimensions.x, imageDimensions.y );
} 
