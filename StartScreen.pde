class StartScreen {
  String startText = "Kryptering af billeder";
  Button button1 = new Button(width*1/3, height*2/5, width/3, 80, "Start program");
  Button button2 = new Button(width*1/3, height*3/5, width/3, 80, "Hvad er kryptering?");
  boolean active = true;
  
  void show() {
    if (active) {
      background(255, 255, 255);
      textSize(48);
      textAlign(CENTER, CENTER);
      fill(0, 0, 0);
      text(startText, width/2, height*2/10);
      button1.show();
      button2.show();
    }
  }
  
  void update() {
    
    // First button
    if (active && button1.checkInput()) active = false;
    
    // Second button
    else if (active && button2.checkInput()) {
      infoScreen.active = true;
      active = false; 
    }
  }
}
