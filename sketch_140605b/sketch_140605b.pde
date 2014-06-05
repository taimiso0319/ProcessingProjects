import processing.opengl.*;
import processing.serial.*;

int circleValue = 18;
int sphereValue = 8;

Spheres[] spheres = new Spheres[circleValue];

Serial myPort;

float[] inByte = new float[6];

float defRadius = 60;
float Radius = 0;
float mRadius = 30;
float count = 0;
float speed = 0f;
float zspeed = 50f;
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
  speed = (inByte[4] - 128)/6400;
  zspeed = inByte[5]/8;
  translate(width/2, height/2, 0);
  for (int i = 0; i < circleValue; i++) {
    spheres[i].write(sin(zC)*zspeed);
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
  String inString = port.readStringUntil('\n');
  if(inString != null){
   inString = trim(inString);
   String[] value = split(inString,',');
   println(inString);
   
   if(value.length > 2){
     inByte[0] = Integer.valueOf(value[0]).intValue();
     inByte[1] = Integer.valueOf(value[1]).intValue();
     inByte[2] = Integer.valueOf(value[2]).intValue();
     inByte[3] = Integer.valueOf(value[3]).intValue();
     inByte[4] = Integer.valueOf(value[4]).intValue();
     inByte[5] = Integer.valueOf(value[5]).intValue();
   }
  }
}

void keyPressed(){
  if(keyCode == UP){
    speed += 0.001f;
  }else if(keyCode == DOWN){
    speed -= 0.001f;
  }
}

