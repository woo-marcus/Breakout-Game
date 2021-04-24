void pause(){
  //GIF
  image(pauseGif[pauseF], width/2, height/2, 1100, 800);
    pauseF = pauseF + 1;
    if (pauseF == pauseFrames) {
      pauseF = 0;
    }
    
  //title
  fill(255);
  textFont(aldo);
  textSize(125);
  text("PAUSED!", 825, 200);
  textSize(40);
  text("Click to unpause", 825, 275);
}

void pauseClicks(){
  mode = GAME;
}
