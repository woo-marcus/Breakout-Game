void options() {
  background(209,208,215);
  
  //audio
  optionsTheme.play();
  introTheme.pause();
  
  //back button
  strokeWeight(7.5);
  fill(190,127,114);
  tactileStrokeRect(15, 15, 100, 100, 0, 0, 0, 236, 98, 71);
  rect(15, 15, 100, 100, 25);
  image(backButton, 60, 65, 65, 65);
  
  //title
  strokeWeight(7.5);
  stroke(0);
  fill(216,113,92);
  rect(380, 25, 332.5, 105, 25);
  fill(0);
  textFont(aldo);
  textSize(80);
  text("SETTINGS", width/2, 105);
  
  //lives selection title
  fill(167,136,133);
  rect(110, 210, 325, 550, 50);
  fill(0);
  textSize(60);
  text("LIVES", 270, 285);
  
  //lives selection buttons
  strokeWeight(7.5);
  fill(255);
    //one life button
  if(oneOn == true){
    lives = 1;
    stroke(236, 98, 71);
  } else {
    tactileStrokeRect(225, 330, 85, 85, 0, 0, 0, 209, 208, 215);
  }
  rect(225, 330, 85, 85, 25);
    //three lives button
  if(threeOn == true){
    lives = 3;
    stroke(236, 98, 71);
  } else {
    tactileStrokeRect(225, 435, 85, 85, 0, 0, 0, 209, 208, 215);
  }
  rect(225, 435, 85, 85, 25);
    //five lives button
  if(fiveOn == true){
    lives = 5;
    stroke(236, 98, 71);
  } else {
    tactileStrokeRect(225, 540, 85, 85, 0, 0, 0, 209, 208, 215);
  }
  rect(225, 540, 85, 85, 25);
    //ten lives button
  if(tenOn == true){
    lives = 10;
    stroke(236, 98, 71);
  } else {
    tactileStrokeRect(225, 645, 85, 85, 0, 0, 0, 209, 208, 215);
  }
  rect(225, 645, 85, 85, 25);
  
  //numbers (for lives selection buttons)
  fill(0);
  textFont(aldo);
  textSize(50);
  text("1", 265, 387.5);
  text("3", 267.5, 492.5);
  text("5", 267.5, 600);
  text("10", 267.5, 705);
  
  
  //colour selection title
  stroke(0);
  fill(167,136,133);
  rect(555, 210, 450, 550, 50);
  fill(0);
  text("PADDLE COLOUR", 780, 285);
  
  //colour selection buttons
  strokeWeight(7.5);
    //black button
  fill(black);
  if(blackOn == true){
    selectedColour = black;
    stroke(236, 98, 71);
  } else {
    tactileStrokeRect(610, 340, 150, 125, 0, 0, 0, 209, 208, 215);
  }
  rect(610, 340, 150, 125, 25);
    //blue button
  fill(blue);
  if(blueOn == true){
    selectedColour = blue;
    stroke(236, 98, 71);
  } else {
    tactileStrokeRect(800, 340, 150, 125, 0, 0, 0, 209, 208, 215);
  }
  rect(800, 340, 150, 125, 25);
    //green button
  fill(green);
  if(greenOn == true){
    selectedColour = green;
    stroke(236, 98, 71);
  } else {
    tactileStrokeRect(610, 500, 150, 125, 0, 0, 0, 209, 208, 215);
  }
  rect(610, 500, 150, 125, 25);
    //red button
  fill(red);
  if(redOn == true){
    selectedColour = red;
    stroke(236, 98, 71);
  } else {
    tactileStrokeRect(800, 500, 150, 125, 0, 0, 0, 209, 208, 215);
  }
  rect(800, 500, 150, 125, 25);
  
  //colour indicator
  stroke(0);
  fill(selectedColour);
  circle(780, 775, 200);
  //"invisible" rectangle + "border" to cover up lower half of circle
  noStroke();
  fill(209,208,215);
  rect(675, 760, 210, 100);
  strokeWeight(7.5);
  stroke(0);
  line(675, 760, 885, 760);
}

void optionsClicks(){
  //back button
  if(mouseX > 15 && mouseX < 115 && mouseY > 15 && mouseY < 115){
    click.play();
    click.rewind();
    mode = INTRO;
  }
  
  //lives selection
    //one life button
  if(mouseX > 225 && mouseX < 310 && mouseY > 330 && mouseY < 415){
    click.play();
    click.rewind();
    oneOn = true;
    threeOn = false;
    fiveOn = false;
    tenOn = false;
  }
    //three lives button
  if(mouseX > 225 && mouseX < 310 && mouseY > 435 && mouseY < 520){
    click.play();
    click.rewind();
    oneOn = false;
    threeOn = true;
    fiveOn = false;
    tenOn = false;
  }
    //five lives button
  if(mouseX > 225 && mouseX < 310 && mouseY > 540 && mouseY < 625){
    click.play();
    click.rewind();
    oneOn = false;
    threeOn = false;
    fiveOn = true;
    tenOn = false;
  }
    //ten lives button
  if(mouseX > 225 && mouseX < 310 && mouseY > 645 && mouseY < 730){
    click.play();
    click.rewind();
    oneOn = false;
    threeOn = false;
    fiveOn = false;
    tenOn = true;
  }
  
  
  //colour selection
    //black button
  if(mouseX > 610 && mouseX < 760 && mouseY > 340 && mouseY < 465){
    click.play();
    click.rewind();
    blackOn = true;
    blueOn = false;
    greenOn = false;
    redOn = false;
  }
    //blue button
  if(mouseX > 800 && mouseX < 950 && mouseY > 340 && mouseY < 465){
    click.play();
    click.rewind();
    blackOn = false;
    blueOn = true;
    greenOn = false;
    redOn = false;
  }
    //green button
  if(mouseX > 610 && mouseX < 760 && mouseY > 500 && mouseY < 625){
    click.play();
    click.rewind();
    blackOn = false;
    blueOn = false;
    greenOn = true;
    redOn = false;
  }
    //red button
  if(mouseX > 800 && mouseX < 950 && mouseY > 500 && mouseY < 625){
    click.play();
    click.rewind();
    blackOn = false;
    blueOn = false;
    greenOn = false;
    redOn = true;
  }
}
