import processing.opengl.*;
import processing.serial.*;

int circleValue = 18;
int sphereValue = 8;

Spheres[] spheres = new Spheres[circleValue];

Serial myPort;

float inByte = 0;

float defRadius = 60;
float Radius = 0;
float mRadius = 30;
float count = 0;
float speed = 0f;
float zC = 0;
void setup() {
  size(800, 800, OPENGL);
  noStroke();
  Radius = defRadius;
  for (int i = 0; i < circleValue; i++) {
    spheres[i] = new Spheres(sphereValue, Radius);  
    Radius += mRadius;
  }
  colorMode(HSB,circleValue,100,100);
  String portName = Serial.list()[5];
  myPort = new Serial(this,portName,9600);
}

void draw() {
  background(0);
  //println(speed);
  //stroke(255);
  speed = (inByte - 128)/6400;
  translate(width/2, height/2, 0);
  for (int i = 0; i < circleValue; i++) {
    spheres[i].write(sin(zC)*50*0);
    stroke(i,100,100);
    pushMatrix();
    if (i>0) {
      for (int j = 0; j < sphereValue; j++) {
        line(spheres[0].xPos[0], spheres[0].yPos[0], spheres[i].xPos[j], spheres[i].yPos[j]);
      }
    }
    popMatrix();
    rotate(count);
  }
  count += speed;
  zC+=0.1;
  //println(speed);
}

void serialEvent(Serial port){
   inByte = port.read();
}

void keyPressed(){
  if(keyCode == UP){
    speed += 0.001f;
  }else if(keyCode == DOWN){
    speed -= 0.001f;
  }
}

