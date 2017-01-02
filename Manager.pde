class GameManager{
  int    isFinished  =  0;
  int    isStarted  =  0;
  int    isPause    =  0;
  String code = "";
  int level = 0;
  GameManager(){
  }//{}
  
  void gmMouseClicked()
{
      if(mouseX<width/2+30 && mouseX>width/2-30 && mouseY>height/2-30 && mouseY<height/2+30 &&(gm.isFinished==1 || bricksLeft<1) ){
      gm.isFinished = 0;
      gm.isStarted  =  0;
      gm.isPause    =  0;
      b1.xSpeed    =  b1.iSpeed;
      b1.ySpeed    =  b1.iSpeed;
      b1.circleX=mouseX;
      b1.circleY=height-r1.rectHeight-b1.circleR-3;
      b1.pcircleX = b1.circleX;
      b1.pcircleY = b1.circleY;
      r1.rectSize = width/4;
      if(gm.level == 0){
         numOfBricks = lev.levelRandom();
      }
      else {
        numOfBricks = lev.level1();
       }
      for(int k=0;k<numOfBricks;k++){
          br[k].active=1;
          bricksLeft = numOfBricks;
      }
      }
      if(mouseX>width-20 && mouseY < 20 && gm.isPause ==0){
        gm.isPause = 1;
       // println("pause");
        
      }
      else if(mouseX>width-20 && mouseY < 20 && gm.isPause ==1){
        gm.isPause = 0;
       // println("resume");
      }
      gm.isStarted = 1;
    }
  
 void checkIfFailed(){
    if((b1.circleX+b1.circleR<r1.mouseX1-r1.rectSize/2 || b1.circleX-b1.circleR>r1.mouseX1+r1.rectSize/2) && b1.circleY>height-b1.circleR-r1.rectHeight){
      //println("Failed");
      gm.isFinished = 1;
    }
  }

  
  
  void checkIfTouched(){
    if(b1.circleX+b1.circleR>r1.mouseX1-r1.rectSize/2 && b1.circleX-b1.circleR<r1.mouseX1+r1.rectSize/2 && b1.circleY>height-b1.circleR-r1.rectHeight){
      if((b1.circleX>b1.pcircleX && mouseX>pmouseX)){
        b1.xSpeed = b1.xSpeed - b1.incSpeed;
        //println("1");
      }
      else if((b1.pcircleX>b1.circleX && pmouseX>mouseX)){
        b1.xSpeed = b1.xSpeed + b1.incSpeed;
        //println("2");
      }
      else if(b1.pcircleX==b1.circleX){
        if(pmouseX>mouseX){
          b1.xSpeed = b1.xSpeed + b1.incSpeed;
          //println("3");
        }
        else if(mouseX>pmouseX){
          b1.xSpeed = b1.xSpeed - b1.incSpeed;
          //println("4");
        }
        //println("5");
      }//{}
      else if(b1.circleX<b1.pcircleX && mouseX>pmouseX){
        b1.xSpeed = b1.xSpeed - b1.incSpeed;
      }
      else if(b1.circleX>b1.pcircleX && mouseX<pmouseX){
        b1.xSpeed = b1.xSpeed + b1.incSpeed;
      }
      
     // println("Touched");
    }
  }
  
  void checker(){
  if(isFinished==0 ){
      background(127);
      println("l");
    }
    //println(bricksLeft);
    if(bricksLeft<1){
      print("m");
      background(0,127,0);
      stroke(127);
      strokeWeight(5);
      fill(0);
      triangle(width/2-30,height/2-30,width/2-30,height/2+30,width/2+30,height/2);
      gm.level++;

    }
    if(isPause==1){
      triangle(width-20,1,width-20,20,width,10);
    }
    if(isFinished==1){
      background(255,0,0);
      stroke(127);
      strokeWeight(5);
      triangle(width/2-30,height/2-30,width/2-30,height/2+30,width/2+30,height/2);
    }
  }
  void checkBrickTouched(Brick br){
  for(int k=0;k<numOfBricks;k++){
if((b1.circleX-b1.circleR<br.bXloc+br.bLen && b1.circleX+b1.circleR>br.bXloc+br.bLen -10 && b1.circleY+b1.circleR >br.bYloc && b1.circleY+b1.circleR <br.bYloc+br.bHei)||(b1.circleX+b1.circleR>br.bXloc && b1.circleX+b1.circleR<br.bXloc+10 && b1.circleY+b1.circleR >br.bYloc && b1.circleY+b1.circleR <br.bYloc+br.bHei)){
    b1.xSpeed = b1.xSpeed * -1;
    br.active=0;
    bricksLeft--;
    if(br.bType==1){
      r1.rectSize= r1.rectSize * 2;
      }
      else if(br.bType==2){
      r1.rectSize= r1.rectSize * 0.5;
      }
    break;
  }
  if((b1.circleY-b1.circleR<br.bYloc+br.bHei && b1.circleY+b1.circleR>br.bYloc+br.bHei-10 && b1.circleX+b1.circleR >br.bXloc && b1.circleX+b1.circleR <br.bXloc+br.bLen)||(b1.circleY+b1.circleR>br.bYloc && b1.circleY+b1.circleR<br.bYloc+10 && b1.circleX+b1.circleR >br.bXloc && b1.circleX+b1.circleR <br.bXloc+br.bLen)){
    b1.ySpeed = b1.ySpeed * -1;
    br.active=0;
    bricksLeft--;
    if(br.bType==1){
      r1.rectSize= r1.rectSize * 2;
      }
      else if(br.bType==2){
      r1.rectSize= r1.rectSize * 0.5;
      }
    break;
  }  }
 
}
  
}