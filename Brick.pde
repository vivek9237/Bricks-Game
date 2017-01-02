class Brick{
  float bLen=width/14;
  float bHei=height/32;
  float bXloc;
  float bYloc;
  float bColor;
  int active = 1;
  int bType = 0;
  Brick(float tempX,float tempY,int tempT){
    bXloc = tempX;
    bYloc = tempY;
    bType = tempT;
  }
  void displayBrick(){
    stroke(255);
    strokeWeight(5);
    fill(0);
    if(bType == 1){
    stroke(255);
    strokeWeight(5);
    fill(0,random(127,255),0);
    }
    if(bType == 2){
    stroke(255);
    strokeWeight(5);
    fill(random(127,255),0,0);
    }
    
    rect(bXloc,bYloc,bLen,bHei);
  }
  
  
}//{}