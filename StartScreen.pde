class StartScreen {
  String startText = "Kryptering af billeder";
  Button button1 = new Button(width*1/3, height*2/5, width/3, 80, "Start program");
  Button button2 = new Button(width*1/3, height*3/5, width/3, 80, "Hvad er kryptering?");
  boolean active = false;
  
  void show() {
    active = true;
    background(255, 255, 255);
    textSize(48);
    textAlign(CENTER, CENTER);
    fill(0, 0, 0);
    text(startText, width/2, height*2/10);
    button1.show();
    button2.show();
  }
  
  void update() {
    if (active && button1.checkInput()) active = false;
    else if (active && button2.checkInput()) active = false; 
  }
}
