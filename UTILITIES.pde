void reset(){
  //counter variables
  score = 0;
  timer = 50;
  
  //intro title movement variables
  titleBrickY = 230;
  titleBrickVY = -2.5;
  brickY = 385;
  brickVY = -2.5;
  breakerY = 485;
  breakerVY = -2.5;
  
  //game entity variables
  paddleX = 416.25;
  paddleY = height;
  paddleD = 150;
  
  ballX = 416.25;
  ballY = height - 175;
  ballD = 25;
  ballVX = 0;
  ballVY = 3;
  
  //brick array setup
  brickD = 30;
  n = 32;
  x = new int[n];//*this function tells the arrays how many pages they should have (this setup is required for array variables)
  y = new int[n];
  alive = new boolean[n];
  tempX = 130; 
  tempY = 190;
  
  int i = 0;
  while(i < n){
    x[i] = tempX;
    y[i] = tempY;
    alive[i] = true;
    tempX = tempX + 85;
    i = i + 1;
    if(tempX > 735){
      tempY = tempY + 95;
      tempX = 130;
    }
  }
}

void tactileFillRect(int x, int y, int width, int height, int r1, int g1, int b1, int r2, int g2, int b2, int t){//if the mouse is hovering over this rectangle, it turns a different colour
  if(mouseX > x && mouseX < x+width && mouseY > y && mouseY < y+height){
    fill(r2, g2, b2, t);
  } else {
    fill(r1, g1, b1);
  }
}

void tactileStrokeRect(int x, int y, int width, int height, int r1, int g1, int b1, int r2, int g2, int b2){//if the mouse is hovering over this rectangle, its border turns a different colour
  if(mouseX > x && mouseX < x+width && mouseY > y && mouseY < y+height){
    stroke(r2, g2, b2);
  } else {
    stroke(r1, g1, b1);
  }
}
