void game(){
  background(209,208,215);
  timer = timer - 1;
  
  //audio
  introTheme.pause();
  
  //"playing field"
  noStroke();
  fill(255,230,1);
  rect(30, 80, 20, 750);
  rect(30, 80, 792.5, 20);
  rect(802.5, 80, 20, 750);
  
  //"hazard tape" (please see my comments in the intro mode for an explanation)
  int s = 1500;//s for "stripes"
  while(s > 50){
    strokeCap(PROJECT);
    strokeWeight(15);
    stroke(0);
    line (30, s, 850, s - 700);
    s = s - 50;
  }
  
  //"invisible" rectangles to cover up stripes
  noStroke();
  fill(209,208,215);
  rect(52.5, 100, 750, 730);
  rect(0, 0, 1100, 75);
  rect(825, 0, 50, 800);
  
  //light grey border of "playing field"
  strokeWeight(10);
  stroke(237,237,244);
  line(25, 75, 25, height);
  line(25, 75, 825, 75);
  line(825, 75, 825, height);
  
  //light grey rectangles connecting scoreboard to "playing field"
  fill(237,237,244);
  rect(825, 181.25, 50, 100);
  rect(825, 543.75, 50, 100);
  
  //scoreboard
  line(875, 75, 875, height);
  line(875, 75, width, 75);
  noStroke();
  fill(105,96,82);
  rect(880, 80, 250, height);
  
  //scoreboard text
  textFont(aldo);
  fill(244,243,40);
  textSize(65);
  text("SCORE", 990, 280);
  text("LIVES", 990, 575);
  
  //scoreboard variable counters
  textSize(60);
  fill(0);
  text(score, 990, 375);
  text(lives, 990, 650);
  
  //bricks
  fill(255);
  int i = 0;
  while(i < n){
    if(alive[i] == true){
      manageBrick(i);
    }
    i = i + 1;
  }
  if(score == n){
    mode = GAMEOVER;
  }
    
  //paddle
  strokeWeight(7.5);
  stroke(0);
  fill(selectedColour);
  circle(paddleX, paddleY, paddleD);
  //movement
  if(rightKey == true) paddleX = paddleX + 8;   
  if(leftKey == true) paddleX = paddleX - 8;   
  //preventing the paddle from moving outside the "playing field"
  if(paddleX > 730) paddleX = 730;
  if(paddleX < 125) paddleX = 125;
  //ball detection/bouncing
  if(dist(paddleX, paddleY, ballX, ballY) <= paddleD/2 + ballD/2){
    bounce.play();
    bounce.rewind();
    ballVX = (ballX - paddleX)/9;
    ballVY = (ballY - paddleY)/9;
  }
  
  //ball
  fill(105,96,82);
  circle(ballX, ballY, ballD);
  //movement
  if(timer < 0){
    ballX = ballX + ballVX;
    ballY = ballY + ballVY;
  }
  //wall detection/bouncing
  if(ballY < 115){
    bounce.play();
    bounce.rewind();
    ballVY = ballVY * -1;
  }
  if(ballY > height){
    timer = 50;
    lives = lives - 1;
    ballX = 416.25;
    ballY = height - 175;
    ballVX = 0;
    ballVY = 5;
    if(lives > 0){
      lifeLoss.play();
      lifeLoss.rewind();
    }
    if(lives == 0){
      mode = GAMEOVER;
    }
  }
  if(ballX < 65 || ballX > 785){
    bounce.play();
    bounce.rewind();
    ballVX = ballVX * -1;
  }
  //preventing the ball from being "squished" into the walls
  if(ballX < 65){
    ballX = 65;
  }
  if(ballX > 785){
    ballX = 785;
  }
  if(ballY < 115){
    ballY = 115;
  }
  //gameover detection
  if(lives == 0){
    mode = GAMEOVER;
  }  
}

void manageBrick(int i){
    strokeWeight(5);
    stroke(0);
    if(y[i] == 190) fill(190,127,114);
    if(y[i] == 285) fill(176,66,51);
    if(y[i] == 380) fill(216,113,92);
    if(y[i] == 475) fill(236,98,71);
    circle(x[i], y[i], brickD);
    if(dist(x[i], y[i], ballX, ballY) <= brickD/2 + ballD/2){
      brickBreak.play();//Sorry, I wasn't able to figure out how to play this sound whenever one of the bricks is broken
      brickBreak.rewind();
      ballVX = (ballX - x[i])/3.5;
      ballVY = (ballY - y[i])/3.5;
      alive[i] = false;
      score = score + 1;
    }
}

void gameClicks(){
  mode = PAUSE;
}
