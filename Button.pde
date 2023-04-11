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
    rect(this.x, this.y, this.w, this.h, 15);
    fill(0, 0, 0);
    textAlign(CENTER, CENTER);
    text(this.text, this.x+this.w/2, this.y+this.h/2);
  }
  boolean checkInput() {
    if((this.x <= mouseX && mouseX <= this.x+this.w) && (this.y <= mouseY && mouseY <= this.y+this.h)) {
      return true;
    } else {
      return false;
    }
  }

}
