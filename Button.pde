class Button { 
  int x, y, w, h;
  String text;
  
  Button(int x, int y, int w, int h, String text) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.text = text;
  }
  
  void show() {
    rectMode( CORNER );
    fill(66, 105, 245);
    rect(x, y, w, h, 15);
    fill(0, 0, 0);
    textAlign(CENTER, CENTER);
    text(text, x + w/2, y + h/2);
  }
  
  boolean checkInput() {
    if( (x <= mouseX && mouseX <= x+w) && (y <= mouseY && mouseY <= y+h) ) return true;
    else return false;
  }
}
