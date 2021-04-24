//Marcus Woo
//1-4B
//April 23, 2021

//Breakout Game

//Hi, Mr. Pelletier. Many thanks for teaching me this quarter! These are the resources I used for this project:
  //I based the design of the game mode off of the old Blackberry Brick Breaker game. Here is the image that I referenced: www.reddit.com/r/nostalgia/comments/aj7wmc/that_super_addicting_blackberry_game_brick_breaker/
  //Fonts:
    //"Aldo the Apache" font: www.dafont.com/aldo-the-apache.font
  //GIF's:
    //Breaking rows of bricks GIF (pause mode): imgur.com/sQ0M7lR
    //Successfully breaking bricks GIF (gameover mode): gfycat.com/barebaggyliger-jeanclaude-van-damme-martial-arts-bloodsport
    //Unsuccessfully breaking bricks GIF (gameover mode): gfycat.com/wholethornyfairybluebird
  //Images:
    //Play button icon (intro mode): www.flaticon.com/free-icon/play-button-arrowhead_27223?term=play&page=1&position=2&page=1&position=2&related_id=27223&origin=search
    //Options button icon (intro mode): www.flaticon.com/free-icon/settings_507206?term=settings&page=2&position=15&page=2&position=15&related_id=507206&origin=search
    //Back button icon (options mode): www.flaticon.com/free-icon/left-arrow_318423?term=back&page=2&position=48&page=2&position=48&related_id=318423&origin=search
  //Music:
    //Ultralounge by Kevin MacLeod:
      //Link: https://incompetech.filmmusic.io/song/5010-ultralounge
      //License: https://filmmusic.io/standard-license
    //Mega Hyper Ultrastorm by Kevin MacLeod
      //Link: https://incompetech.filmmusic.io/song/4033-mega-hyper-ultrastorm
      //License: https://filmmusic.io/standard-license
  //Sounds:
    //"startGame" sound (intro mode): freesound.org/people/GameAudio/sounds/220203/
    //"click" sound (intro/options mode): freesound.org/people/heavenly-roads/sounds/510215/
    //"bounce" sound (game mode): freesound.org/people/OwlStorm/sounds/404769/
    //"brickBreak" sound (game mode): freesound.org/people/JohanDeecke/sounds/368337/
    //"lifeLoss" sound (game mode): freesound.org/people/MATRIXXX_/sounds/495541/
    //"gameWin" sound (gameover mode): freesound.org/people/metrostock99/sounds/345086/
    //"gameLoss" sound (gameover mode): freesound.org/people/harrietniamh/sounds/415079/
 
//-------------------------------------------------------------------------------------- 
 
//minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
 
int mode;
final int INTRO = 1;
final int OPTIONS = 2;
final int GAME = 3;
final int PAUSE = 4;
final int GAMEOVER = 5;

//font variables
PFont aldo;

//image variables
PImage playButton;
PImage optionsButton;
PImage backButton;

//audio variables
Minim minim;
AudioPlayer introTheme, optionsTheme;//music
AudioPlayer startGame, click, bounce, brickBreak, lifeLoss, gameWin, gameLoss;//sounds

//counter variables
int lives;
boolean oneOn, threeOn, fiveOn, tenOn;
int score;
int timer;

//intro title movement variables
float titleBrickY;
float titleBrickVY;
float brickY;
float brickVY;
float breakerY;
float breakerVY;

//game entity variables
float paddleX;
int paddleY;
int paddleD;

float ballX;
float ballY;
float ballD;
float ballVX;
float ballVY;

//brick variables
int[] x;//*array/book of x coordinates ("{}" signifies an array variable)
int[] y;//*array/book of y coordinates
int n;//*the number of "pages" in my "book"
int brickD;
int tempX, tempY;//*kind of like the template for all the other bricks to follow
boolean[] alive;

//keyboard variables
boolean rightKey, leftKey;

//GIF variables
PImage[] pauseGif;//GIF used for pause mode
int pauseFrames;
int pauseF;

PImage[] winGif;//GIF used for gameover mode (if player wins)
int winFrames;
int winF = 0;

PImage[] loseGif;//GIF used for gameover mode (if player loses)
int loseFrames;
int loseF = 0;

//colour variables
color black = #000000;
color blue = #0000FF;
color green = #11644D;
color red = #FF0000;
color selectedColour;
boolean blackOn, blueOn, greenOn, redOn;

//--------------------------------------

void setup(){
  size(1100, 800);
  mode = INTRO;
  textAlign(CENTER);
  imageMode(CENTER);
  
  reset();//please see the definition of this function in the utilities page
  
  //font variables
  aldo = createFont("AldotheApache.ttf", 50);
  
  //pause GIF
  pauseFrames = 12;
  pauseGif = new PImage[pauseFrames];
  int p = 0;
  while(p < pauseFrames){
    pauseGif[p] = loadImage("frame_" + p + "_delay-0.09s.gif");
    p = p + 1;
  }
  
  //win GIF
  winFrames = 56;
  winGif = new PImage[winFrames];
  int w = 0;
  while (w < winFrames) {
    winGif[w] = loadImage("frame_" + w + "_delay-0.07s.gif");
    w = w + 1;
  }
  
  //lose GIF 
  loseFrames = 36;
  loseGif = new PImage[loseFrames];
  int l = 0;
  while(l < loseFrames){
    loseGif[l] = loadImage("frame_" + l + "_delay-0.08s.gif");
    l = l + 1;
  }
  
  //image variables
  playButton = loadImage("play-button-arrowhead.png");
  optionsButton = loadImage("settings.png");
  backButton = loadImage("left-arrow.png");
  
  //audio variables
  minim = new Minim(this);
  introTheme = minim.loadFile("megahyperultrastorm.mp3");
  optionsTheme = minim.loadFile("ultralounge.mp3");
  startGame = minim.loadFile("startup.wav");
  click = minim.loadFile("click.wav");
  bounce = minim.loadFile("bounce.wav");
  brickBreak = minim.loadFile("brickbreak.wav");
  lifeLoss = minim.loadFile("lifeloss.wav");
  gameWin = minim.loadFile("win.wav");
  gameLoss = minim.loadFile("death.wav");
  
  //lives variables
  oneOn = false;
  threeOn = true;//by default, the three lives option is chosen
  fiveOn = false;
  tenOn = false;
  
  //colour variables
  selectedColour = blue;//by default, the colour of the paddle is blue
  blackOn = false;
  blueOn = true;//by default, the colour blue is chosen
  greenOn = false;
  redOn = false;
}

void draw(){
  if(mode == INTRO){
    intro();
  } else if (mode == OPTIONS){
    options();
  } else if (mode == GAME){
    game();
  } else if (mode == PAUSE){
    pause();
  } else if (mode == GAMEOVER){
    gameover();
  } else {
    println("Mode error: " + mode);
  }
}
