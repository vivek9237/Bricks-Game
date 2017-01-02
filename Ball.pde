class Ball{
  float circleX;
  float circleY;
  float pcircleX;
  float pcircleY;
  float iSpeed = 7;
  float incSpeed = 1;
  float xSpeed = iSpeed;
  float ySpeed = iSpeed;
  float circleR = 5;
  
  
  Ball(GameManager gm,Rect r1){
  }//{}
  
  void circleAll(){
    if(gm.isFinished==0 && gm.isStarted == 1){
      displayBall();
      moveBall();
      checkBallEdges();
    }
    if(gm.isFinished==0 && gm.isStarted == 0){
      pcircleX=circleX;
      pcircleY=circleY;
      circleX=mouseX;
      circleY=height-r1.rectHeight-circleR-3;
      ellipse(circleX,circleY,circleR+10,circleR+10);
    }
    if(gm.isFinished==1 && gm.isStarted == 1){
      ellipse(circleX,circleY,circleR+10,circleR+10);
    }
    
  }
  void displayBall(){
    stroke(0);
    fill(0);
    ellipse(circleX,circleY,circleR+10,circleR+10);
  }
  void moveBall(){
    pcircleX = circleX;
    pcircleY = circleY;
    circleX=circleX + xSpeed;
    circleY=circleY + ySpeed;
  }

  void checkBallEdges(){
    if(circleX>width-circleR || circleX<0+circleR){
      xSpeed = xSpeed *(-1);
    }
    if(circleY>height-circleR-r1.rectHeight || circleY<0+circleR){
      ySpeed = ySpeed *(-1);
    }
  }
}