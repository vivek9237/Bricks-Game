class Level{
int levelRandom(){
  numOfBricks = 15;
  int k;
  for(k=0;k<numOfBricks;k++){
    if(k==numOfBricks/2){
    br[k] = new Brick((width/14)*Math.round(random(1,12)),(height/32)*Math.round(random(2,20)),1);
    }
    else if(k==numOfBricks/4){
    br[k] = new Brick((width/14)*Math.round(random(1,12)),(height/32)*Math.round(random(2,20)),2);
    }
    else{
    br[k] = new Brick((width/14)*Math.round(random(1,12)),(height/32)*Math.round(random(2,20)),0);
    } 
}
return k;
  }
  
int level1(){
  numOfBricks = 12*3;
  int k;
  for(k=0;k<numOfBricks;k++){
     if(k<12){
    br[k] = new Brick((width/14)*k+(width/14),100,0);
    }
   else if(k<(12*2)){
    br[k] = new Brick((width/14)*(k-12)+(width/14),100+height/32,0);
    }
    else br[k] = new Brick((width/14)*(k-(12*2))+(width/14),100+((height/32)*2),0); 
}
  return k;
 
}
}//{}  if(){}