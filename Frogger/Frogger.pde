int hopDistance;
int frogXPosition=200;
int frogYPosition=350;
int frogXStartingPoint=frogXPosition;
int frogYStartingPoint=frogYPosition;
int radius=10;
Car car1=new Car(0, 100, 40, 2);
Car car2=new Car(400, 200, 20, 3);
Car car3=new Car(0, 300, 60, 1);
void setup() {
  size(400, 400);
}
void draw() {
  background(200, 0, 0);
  fill (0, 0, 0);
  ellipse(frogXPosition, frogYPosition, 20, 20);
  frogInCanvas();
  car1.moveCarRight();
  car1.display();
  car2.moveCarLeft();
  car2.display();
  car3.moveCarRight();
  car3.display();
  if (intersects(car1) || intersects(car2) || intersects(car3)) {
    frogXPosition=frogXStartingPoint;
    frogYPosition=frogYStartingPoint;
  } 
}
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      //Frog Y position goes up
      println("up");
      frogYPosition=frogYPosition-10;
    } else if (keyCode == DOWN) {
      //Frog Y position goes down 
      println("down");
      frogYPosition=frogYPosition+10;
    } else if (keyCode == RIGHT) {
      //Frog X position goes right
      println("right");
      frogXPosition=frogXPosition+10;
    } else if (keyCode == LEFT) {
      //Frog X position goes left
      println("left");
      frogXPosition=frogXPosition-10;
    }
  }
}
void frogInCanvas() {
  if (frogXPosition<radius) {
    frogXPosition=radius;
  } else if (frogXPosition>width-radius) {
    frogXPosition=width-radius;
  } else if (frogYPosition>height-radius) {
    frogYPosition=height-radius;
  } else if (frogYPosition<radius) {
    text("YOU WIN!!!", 150, 200);
  }
}
boolean intersects (Car car) {
    if ((frogYPosition > car.getCarYPosition() && frogYPosition < car.getCarYPosition()+car.getCarSize()) 
    && (frogXPosition > car.getCarXPosition() && frogXPosition < car.getCarXPosition()+car.getCarSize())){
    //if ((frogYPosition+radius > car.getCarYPosition() && frogYPosition-radius > car.getCarYPosition() && frogYPosition < car.getCarYPosition()+car.getCarSize()) 
    //&& (frogXPosition > car.getCarXPosition() && frogXPosition < car.getCarXPosition()+car.getCarSize())){
      return true;
    } else {
      return false;
    }
  }
class Car {
  int carXPosition;
  int carYPosition;
  int carSize;
  int carSpeed;
  Car (int carXPosition, int carYPosition, int carSize, int carSpeed) {
    this.carXPosition=carXPosition;
    this.carYPosition=carYPosition;
    this.carSize=carSize;
    this.carSpeed=carSpeed;
  }
  void display() {
    fill(0, 255, 0);
    rect(carXPosition, carYPosition, carSize, 15);
  }
  void moveCarRight() {
    carXPosition=carXPosition+carSpeed;
    if (carXPosition>width-carSize) {
      carXPosition=width-carSize;
      //carSpeed=carSpeed*-1;
    }
  }
  void moveCarLeft() {
    carXPosition=carXPosition-carSpeed;
    if (carXPosition<0) {
      carXPosition=0;
      //carSpeed=carSpeed*-1;
    }
  }
  int getCarXPosition() {
    return carXPosition;
  }
  int getCarYPosition() {
    return carYPosition;
  }
  int getCarSize() {
    return carSize;
  }
}