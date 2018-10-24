 int xBirdPosition=100;
 int yBirdPosition=30;
 int yBirdVelocity=40;
 int gravity=1;
 int pipeGap=180;
 int xPipePosition=width;
 int upperPipeHeight=(int) random(100, 400);
 int lowerPipeHeight=height-upperPipeHeight-pipeGap;
void setup(){
  size(700, 700);
  teleportPipes();
}
void draw(){
  background(100, 100, 100); 
  fill(0, 10, 100);
  stroke(10, 10, 10);
  ellipse(xBirdPosition, yBirdPosition+=gravity, 100, 100);
  fill(10, 10, 10);
  rect(xPipePosition--, 0, 75, upperPipeHeight);
  rect(xPipePosition--, height-lowerPipeHeight, 75, lowerPipeHeight);
  if (intersectsPipes()){
    System.exit(0);
  }
  teleportPipes();
  rect(0, height-30, width, 30);
}
void mousePressed(){
  ellipse(xBirdPosition, yBirdPosition-=yBirdVelocity, 100, 100);
}
void teleportPipes(){
  if (xPipePosition<=0){
    xPipePosition=width;
    upperPipeHeight=(int) random(100, 400);
    lowerPipeHeight=height-upperPipeHeight-pipeGap;
  }
}
boolean intersectsPipes() { 
     if (yBirdPosition < upperPipeHeight && xBirdPosition > xPipePosition && xBirdPosition < (xPipePosition+75)){
          print(1);
          return true; 
        }
     else if (yBirdPosition > lowerPipeHeight && xBirdPosition > xPipePosition && xBirdPosition < (xPipePosition+75)) {
          print(2);
       return true; 
        }
     else { 
       return false; 
   }
}