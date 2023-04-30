class InfoScreen {
  String startText = "Info om kryptering";
  Button button1 = new Button(width*1/3, height*2/5, width/3, 80, "Tilbage til start");
  boolean active = false;
  
  void show() {
    if (active) {
      background(255, 255, 255);
      textSize(48);
      textAlign(CENTER, CENTER);
      fill(0, 0, 0);
      text(startText, width/2, height*2/10);
      button1.show();
    }
  }
  
  void update() {
    if (active && button1.checkInput()) {
      startScreen.active = true;
      active = false;
    }
  }
}
