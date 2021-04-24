void intro(){
  background(209,208,215);
  timer = timer - 1;
  
  //audio
  introTheme.play();
  optionsTheme.pause();
  
  //"hazard tape" lining the edges of the screen
  noStroke();
  fill(255,230,1);
  rect(0, 0, 25, height);//this yellow rectangle and the three others below are supposed to be like the "tape" (without the stripe pattern)
  rect(0, 0, width, 25);
  rect(1075, 0, 25, height);
  rect(0, 775, width, 25);
  
  //I tried to use a while loop to automatically generate the stripes for the "hazard tape"
  int s = 1600;//s for "stripes"
  while(s > -50){
    strokeCap(PROJECT);//I used this function to make the corners of the lines sharper
    strokeWeight(15);
    stroke(0);
    line (0, s, width, s - 800);//I used s-800 for the value of the second point's y-coordinate, because I wanted the lines to have a little bit of a slant
    s = s - 50;
  }
  
  //invisible rectangle to cover stripes (the stripes reached far beyond the tape, so I needed to cover them up)
  strokeWeight(5);
  fill(209,208,215);
  rect(25, 25, 1050, 750);
  
  //title
  strokeWeight(10);
  stroke(0);
  fill(216,113,92);
  rect(80, titleBrickY, 500, 300, 50);
  fill(0);
  textFont(aldo);
  textSize(150);
  text("BRICK", 330, brickY);
  textSize(105);
  text("BREAKER", 330, breakerY);
  if(timer < 0){//accounts for the movement of the rectangle surrounding the title
    titleBrickY = titleBrickY + titleBrickVY;
    brickY = brickY + brickVY;
    breakerY = breakerY + breakerVY;
  }
  if(titleBrickY > 470 || titleBrickY < 35){//accounts for the movement of the actual title text
    titleBrickVY = titleBrickVY * -1;
    brickVY = brickVY * -1;
    breakerVY = breakerVY * -1;
  }
  
  //play button
  fill(190,127,114);
  tactileStrokeRect(700, 320, 125, 125, 0, 0, 0, 236, 98, 71);
  rect(700, 320, 125, 125, 25);
  image(playButton, 765, 380, 75, 75);
  
  //options button
  tactileStrokeRect(875, 320, 125, 125, 0, 0, 0, 236, 98, 71);
  rect(875, 320, 125, 125, 25);
  image(optionsButton, 940, 382.5, 75, 75);
}

void introClicks(){
  //play button
  if(mouseX > 700 && mouseX < 825 && mouseY > 320 && mouseY < 445){
    startGame.play();
    startGame.rewind();
    mode = GAME;
    timer = 50;
    
    //accounting for the amount of lives that the user has chosen
    if(oneOn == true){
      lives = 1;
    }
    if(threeOn == true){
      lives = 3;
    }
    if(fiveOn == true){
      lives = 5;
    }
    if(tenOn == true){
      lives = 10;
    }
  }
  
  //options button
  if(mouseX > 875 && mouseX < 1000 && mouseY > 320 && mouseY < 445){
    click.play();
    click.rewind();
    mode = OPTIONS; 
  }
}
