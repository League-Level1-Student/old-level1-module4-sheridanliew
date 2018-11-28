int hopDistance;
int frogXPosition=200;
int frogYPosition=350;
int radius=25;
Car car1=new Car(20, 100, 40, 30);
Car car2=new Car(20, 200, 20, 50);
Car car3=new Car(20, 300, 60, 20);
void setup(){
  size(400, 400);
}
void draw(){
  background(200, 0, 0);
  fill (0, 0, 0);
  ellipse(frogXPosition, frogYPosition, 50, 50);
  frogInCanvas();
  car1.display();
  car2.display();
  car3.display();
  car1.moveCar();
  car2.moveCar();
  car3.moveCar();
}
void keyPressed(){
  if(key == CODED){
    if(keyCode == UP){
         //Frog Y position goes up
         println("up");
         frogYPosition--;
    }
    else if(keyCode == DOWN){
         //Frog Y position goes down 
         println("down");
         frogYPosition++;
    }
    else if(keyCode == RIGHT){
         //Frog X position goes right
         println("right");
         frogXPosition++;
    }
    else if(keyCode == LEFT){
          //Frog X position goes left
          println("left");
          frogXPosition--;
    }
  }
}
void frogInCanvas(){
  if (frogXPosition<radius){
    frogXPosition=radius;
  }
  else if (frogXPosition>width-radius){
    frogXPosition=width-radius;
  }
  else if (frogYPosition>height-radius){
    frogYPosition=height-radius;
  }
  else if (frogYPosition<radius){
    text("YOU WIN!!!", 150, 200);
  }
}
class Car{
  int carXPosition;
  int carYPosition;
  int carSize;
  int carSpeed;
  Car (int carXPosition, int carYPosition, int carSize, int carSpeed){
    this.carXPosition=carXPosition;
    this.carYPosition=carYPosition;
    this.carSize=carSize;
    this.carSpeed=carSpeed;
  }
  void display (){
    fill(0,255,0);
    rect(carXPosition, carYPosition, carSize, 15);
  }
  void moveCar(){
    car1.carXPosition=carXPosition+30;
    car2.carXPosition=carXPosition+50;
    car3.carXPosition=carXPosition+20;
    if (carXPosition>width-carSize){
      carXPosition=width-carSize;
    }
  }
}