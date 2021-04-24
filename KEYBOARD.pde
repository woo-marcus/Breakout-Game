void keyPressed(){
  if(keyCode == RIGHT) rightKey = true;
  if(keyCode == LEFT) leftKey = true;
} 

void keyReleased(){
  if(keyCode == RIGHT) rightKey = false;
  if(keyCode == LEFT) leftKey = false;
  
  if(mode == GAMEOVER){
    if(key == 'Q' || key == 'q'){//pressing the Q/q key when in the gameover mode will exit the program
      exit();
    }
  }
}
