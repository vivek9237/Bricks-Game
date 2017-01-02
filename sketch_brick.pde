Ball b1;
GameManager gm;
Rect r1;
int numOfBricks = 14*5;
int bricksLeft;;
Brick[] br = new Brick[numOfBricks];
Level lev;
PFont f;




int j=1;
void setup(){
  size(1250,650);//{}
  f = createFont("Arial",16,true);//Font
  lev = new Level();
  gm = new GameManager();
  if(gm.level == 0){
   numOfBricks = lev.levelRandom();
   bricksLeft = numOfBricks;
  }
  else {
  numOfBricks = lev.level1();
  bricksLeft = numOfBricks;
  }
 
  //numOfBricks = lev.level1();

  r1 = new Rect(gm);
  b1 = new Ball(gm,r1);
  
}

void draw(){

   
  gm.checker();
    for(int k=0;k<numOfBricks;k++){
      if(br[k].active==1){
    br[k].displayBrick();
    gm.checkBrickTouched(br[k]);
      
  }
  
  }
  fill(0);
  textFont(f,25);//font size
   text("Speed = "+((Math.abs(b1.xSpeed)+Math.abs(b1.ySpeed))/2),30,30);
   textFont(f,14);//font size
   text("Type + or - in Num Pad to increase or decrease speed",30,60);
   textFont(f,25);//font size
   text("Num of Bricks Left = "+bricksLeft,30,90);
  r1.displayRect();
  b1.circleAll();
  
  gm.checkIfTouched();
  gm.checkIfFailed();
}
void mouseClicked(){
  gm.gmMouseClicked();
}





void keyTyped() {
  //println("typed " + int(key) + (char)key);
  if(int(key) == 43){
    //println(b1.xSpeed+" + "+b1.ySpeed);
    if(b1.xSpeed<0){
    b1.xSpeed =b1.xSpeed-2;
    }
    else {
      b1.xSpeed =b1.xSpeed+2;
    }
    if(b1.ySpeed<0){
    b1.ySpeed =b1.ySpeed-2;
    }
    else {
      b1.ySpeed =b1.ySpeed+2;
    }
   // println(b1.xSpeed+" + "+b1.ySpeed);
  }
  else if(int(key) == 45){
   // println(b1.xSpeed+" + "+b1.ySpeed);
     if(b1.xSpeed<0){
    b1.xSpeed =b1.xSpeed+2;
    }
    else {
      b1.xSpeed =b1.xSpeed-2;
    }
    if(b1.ySpeed<0){
    b1.ySpeed =b1.ySpeed+2;
    }
    else {
      b1.ySpeed =b1.ySpeed-2;
    }
    //println(b1.xSpeed+" + "+b1.ySpeed);
  }
  gm.code = gm.code + (char)key;
  
}

 //<>//

 