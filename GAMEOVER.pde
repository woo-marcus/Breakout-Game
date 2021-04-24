void gameover(){
  background(0);
  
  if(score == n){//if the player wins/breaks all the bricks
    gameWin.play();
    //win GIF
    image(winGif[winF], width/2, height/2, 1100, 800);
    winF = winF + 1;
    if (winF == winFrames) {
      winF = 0;
    }
    //text
    fill(255);
    textFont(aldo);
    textSize(110);
    text("YOU WIN!", width/2, height/2);
    textSize(50);
    text("Click to restart / Press Q to quit", width/2, 500);
  } else {//if the players loses/runs out of lives
    gameLoss.play();//Sorry, I ran into some problems with this file. For some reason, it sometimes plays twice, and other cases, it doesn't play at all.
    //lose GIF
    image(loseGif[loseF], width/2, height/2, 1100, 800);
    loseF = loseF + 1;
    if (loseF == loseFrames) {
      loseF = 0;
    }
    //text
    fill(0);
    textFont(aldo);
    textSize(130);
    text("YOU LOSE!", width/2, height/2);
    textSize(50);
    text("Click to restart / Press Q to quit", width/2, 500);
  }
}

void gameoverClicks(){
  introTheme.rewind();
  optionsTheme.rewind();
  gameWin.rewind();
  gameLoss.rewind();
  mode = INTRO;
  reset();
}
