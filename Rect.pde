class Rect{
  float  mouseX1;
  float  rectSize  =  width/4;
  float  rectHeight  =  10;
  
  Rect(GameManager gm){
  }//{}
  
  void displayRect(){
    stroke(0);
    fill(0);
    if((bricksLeft<1 || gm.code.contains("chini") || gm.code.contains("god"))&& !(gm.code.contains("vivek"))){
      mouseX1= mousePosXAuto();
    }
    else if((bricksLeft<1 || gm.code.contains("chini") )){
      mouseX1= mousePosXAuto();
    }
    else if(gm.isFinished==0){
      mouseX1= mousePosX();
    }
    rect(mouseX1-rectSize/2,height-rectHeight,rectSize,height);
  }
    float mousePosX(){
    if(mouseX>rectSize/2 && mouseX<width-rectSize/2){
      return mouseX;
    }
    else if(mouseX<rectSize/2){
      return rectSize/2;
    }
    else if(mouseX>width-rectSize/2){
      return width-rectSize/2;
    }
    return 0;
  }
  float mousePosXAuto(){
    if(b1.circleX>rectSize/2 && b1.circleX<width-rectSize/2){
      return b1.circleX;
    }
    else if(b1.circleX<rectSize/2){
      return rectSize/2;
    }
    else if(b1.circleX>width-rectSize/2){
      return width-rectSize/2;
    }
    return 0;
  }
}