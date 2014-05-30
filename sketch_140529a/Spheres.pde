//import processing.opengl.*;
class Spheres{
  float[] xPos;
  float[] yPos;
  float rad;
  float radian = 0;
  Spheres(int num , float radius){
    xPos = new float[num];
    yPos = new float[num];
    rad = radius;
  }
  void write(float z){
  pushMatrix();
    for(int i = 0; i < xPos.length ; i++){
      xPos[i] = sin(radians(radian))*rad;
      yPos[i] = cos(radians(radian))*rad;
      translate(xPos[i],yPos[i],z);
      sphere(5);
      translate(-xPos[i],-yPos[i],z);
      radian += 360/xPos.length;
    }
  popMatrix();
  radian = 0;
  }
}
