 int xBirdPosition=100;
 int yBirdPosition=450;
 int yBirdVelocity=40;
 int gravity=1;
 int pipeGap=200;
 int xPipePosition;
 int upperPipeHeight=(int) random(100, 400);
 int lowerPipeHeight;
 int score=0;
 int radius=50;
 boolean updateScore=true;
 
void setup(){
  size(700, 700);
  xPipePosition=width;
  lowerPipeHeight=height-upperPipeHeight-pipeGap;
  teleportPipes();
}

void draw(){
  background(100, 100, 100); 
  fill(0, 10, 100);
  stroke(10, 10, 10);
  ellipse(xBirdPosition, yBirdPosition+=gravity, 100, 100);
  //upper -->
  fill(10, 10, 10);
  rect(xPipePosition--, 0, 75, upperPipeHeight);
  //lower -->
  fill(10, 10, 10);
  rect(xPipePosition--, height-lowerPipeHeight, 75, lowerPipeHeight);
  if (intersectsPipes()){
    System.exit(0);
  }
  teleportPipes();
  rect(0, height-30, width, 30);
  if (intersectsGround()){
    System.exit(0);
  }
  text("Score: "+score, 20, 20);
}

void mousePressed(){
  ellipse(xBirdPosition, yBirdPosition-=yBirdVelocity, 100, 100);
}

void teleportPipes(){
  if (xPipePosition<=0){
    xPipePosition=width;
    upperPipeHeight=(int) random(100, 400);
    lowerPipeHeight=height-upperPipeHeight-pipeGap;
    updateScore=true;
  }
}
 
boolean intersectsPipes() { 
     if (yBirdPosition+radius < upperPipeHeight && xBirdPosition+radius > xPipePosition && xBirdPosition+radius < (xPipePosition+75)){
       print("#1: "+yBirdPosition+", "+upperPipeHeight+", "+xBirdPosition+", "+xPipePosition);
       return true; 
     }
     else if (yBirdPosition+radius > height-lowerPipeHeight && xBirdPosition+radius > xPipePosition && xBirdPosition+radius < (xPipePosition+75)) {
       print("#2: "+yBirdPosition+", "+lowerPipeHeight+", "+xBirdPosition+", "+xPipePosition);
       return true; 
     }
     else {
       if (yBirdPosition+radius > upperPipeHeight && yBirdPosition+radius < height-lowerPipeHeight && xBirdPosition+radius > xPipePosition && xBirdPosition+radius < (xPipePosition+75)){
         if (updateScore){
         score++;
         updateScore=false;
         }
       }
          return false;
     }
}

boolean intersectsGround() {
  if (yBirdPosition+radius > height-30){
    return true;
  }
  else{
    return false;
  }
}