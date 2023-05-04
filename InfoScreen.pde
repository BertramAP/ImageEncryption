class InfoScreen {
  String startText = "Info om kryptering";
  String infoText = "Når du bruger internettet er det let for en person udfra at få fat i dataen du sender over internettet. Dette kun for eksmempel være billeder eller beskeder. Der er derfor brug for noget kaldet en krypteringsalgoritme, hvilket tager dataen du sender og gør så ingen andre kan bruge dataen til noget medmindre de har en bestemt nøgle.";
  Button button1 = new Button(width*1/3, height - 100, width/3, 80, "Tilbage til start");
  boolean active = false;
  
  void show() {
    if (active) {
      background(255, 255, 255);
      textSize(48);
      textAlign(CENTER, CENTER);
      fill(0, 0, 0);
      text(startText, width/2, height*2/10);
      button1.show();
      
      textSize(30);
      rectMode(CENTER);
      text(infoText, width / 2, height / 2, 500, 500);
    }
  }
  
  void update() {
    if (active && button1.checkInput()) {
      startScreen.active = true;
      active = false;
    }
  }
}
