 int xBirdPosition=100;
 int yBirdPosition=30;
 int yBirdVelocity=40;
 int gravity=1;
 int xPipePosition=width;
 int upperPipeHeight=(int) random(100, 400);
 int lowerPipeHeight=(int) random(100, 400);
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
  teleportPipes();
  fill(10, 10, 10);
  rect(xPipePosition--, height-lowerPipeHeight, 75, lowerPipeHeight);
}
void mousePressed(){
  ellipse(xBirdPosition, yBirdPosition-=yBirdVelocity, 100, 100);
}
void teleportPipes(){
  if (xPipePosition<=0){
    xPipePosition=width;
    upperPipeHeight=(int) random(100, 400);
    lowerPipeHeight=(int) random(100, 400);
  }
}