Position Pos;
int Angle = 0;
int sw = 0;
void setup() {
  size(800, 600);
  smooth();
  Pos = new Position();
  for (int i = 0; i < Pos.x.length; i++) {  
    if (i == 0) {
      Pos.x[i] = width/2;
      Pos.y[i] = height/2;
    }
    else {
      Pos.x[i] = random(0, width);
      Pos.y[i] = random(0, height);
    }
    Pos.z[i] = 6;
    Pos.xRad[i] = random(1, 3);
    Pos.yRad[i] = random(1, 3);
    Pos.zRad[i] = random(1, 3);
    Pos.angleSpeed[i] = random(0.5, 1);
    Pos.angleSize[i] = random(0.05, 0.1);
    Pos.colorx[i] = random(0,255);
    Pos.colory[i] = random(0,255);
    Pos.colorz[i] = random(0,255);
    Pos.anglez[i] = 0;
  }
}

void draw() {
  background(0);
  stroke(255);
  for (int i = 0; i < Pos.x.length;i++) {
      stroke(Pos.colorx[i], Pos.colory[i], Pos.colorz[i]);
      strokeWeight(1);
      strokeJoin(ROUND);
      fill(Pos.colorx[i], Pos.colory[i], Pos.colorz[i]);
    if (i%4 == 0) {
      if (sw == 0) {
        Pos.x[i] = Pos.x[i] + ( Pos.xRad[i] * -sin(radians(Pos.angle[i])) );
        Pos.z[i] = Pos.z[i] + ( Pos.angleSize[i] * -sin(radians(Pos.anglez[i])) );
        sw = 1;
      }
      else {
        Pos.x[i] = Pos.x[i] + ( Pos.xRad[i] * sin(radians(Pos.angle[i])) );
        Pos.z[i] = Pos.z[i] + ( Pos.angleSize[i] * sin(radians(Pos.anglez[i])) );
        sw = 0;
      }
      Pos.y[i] = Pos.y[i] + ( Pos.yRad[i] * -sin(radians(Pos.angle[i])) );
      if (i != 196)line(Pos.x[i], Pos.y[i], Pos.x[i+1], Pos.y[i+1]);
      else line(Pos.x[i], Pos.y[i], Pos.x[0], Pos.y[0]);
      ellipse(Pos.x[i], Pos.y[i], Pos.z[i], Pos.z[i]);
    }
    else if (i%4 == 1) {
      if (sw == 0) {
        Pos.x[i] = Pos.x[i] + ( Pos.xRad[i] * -sin(radians(Pos.angle[i])) );
        Pos.z[i] = Pos.z[i] + ( Pos.angleSize[i] * -cos(radians(Pos.anglez[i])) );
        sw = 1;
      }
      else {
        Pos.x[i] = Pos.x[i] + ( Pos.xRad[i] * sin(radians(Pos.angle[i])) );
        Pos.z[i] = Pos.z[i] + ( Pos.angleSize[i] * cos(radians(Pos.anglez[i])) );
        sw = 0;
      }
      Pos.y[i] = Pos.y[i] + ( Pos.yRad[i] * -cos(radians(Pos.angle[i])) );
      if (i != 197)line(Pos.x[i], Pos.y[i], Pos.x[i+2], Pos.y[i+2]);
      else line(Pos.x[i], Pos.y[i], Pos.x[1], Pos.y[1]);
      ellipse(Pos.x[i], Pos.y[i], Pos.z[i], Pos.z[i]);
    }
    else if (i%4 == 2) {
      if (sw == 0) {
        Pos.x[i] = Pos.x[i] + ( Pos.xRad[i] * -sin(radians(Pos.angle[i])) );
        Pos.z[i] = Pos.z[i] + ( Pos.angleSize[i] * -sin(radians(Pos.anglez[i])) );
        sw = 1;
      }
      else {
        Pos.x[i] = Pos.x[i] + ( Pos.xRad[i] * sin(radians(Pos.angle[i])) );
        Pos.z[i] = Pos.z[i] + ( Pos.angleSize[i] * sin(radians(Pos.anglez[i])) );
        sw = 0;
      }
      Pos.y[i] = Pos.y[i] + ( Pos.yRad[i] * cos(radians(Pos.angle[i])) );
      if (i != 198)line(Pos.x[i], Pos.y[i], Pos.x[i+3], Pos.y[i+3]);
      else line(Pos.x[i], Pos.y[i], Pos.x[2], Pos.y[2]);
      ellipse(Pos.x[i], Pos.y[i], Pos.z[i], Pos.z[i]);
    }
    else if (i%4 == 3) {
      if (sw == 0) {
        Pos.x[i] = Pos.x[i] + ( Pos.xRad[i] * -sin(radians(Pos.angle[i])) );
        Pos.z[i] = Pos.z[i] + ( Pos.angleSize[i] * -sin(radians(Pos.anglez[i])) );
        sw = 1;
      }
      else {
        Pos.x[i] = Pos.x[i] + ( Pos.xRad[i] * sin(radians(Pos.angle[i])) );
        Pos.z[i] = Pos.z[i] + ( Pos.angleSize[i] * sin(radians(Pos.anglez[i])) );
        sw = 0;
      }
      Pos.y[i] = Pos.y[i] + ( Pos.yRad[i] * sin(radians(Pos.angle[i])) );
      if (i != 199)line(Pos.x[i], Pos.y[i], Pos.x[i+4], Pos.y[i+4]);
      else line(Pos.x[i], Pos.y[i], Pos.x[3], Pos.y[3]);
      ellipse(Pos.x[i], Pos.y[i], Pos.z[i], Pos.z[i]);
    }
    //fill(Pos.z[i]*40,Pos.z[i]*40,Pos.z[i]*40);
    //   ellipse(Pos.x[i], Pos.y[i], Pos.z[i], Pos.z[i]);  
    Pos.angle[i] += Pos.angleSpeed[i];
    Pos.anglez[i] += 1.6;
  }
}

class Position {
  float[] x = new float[200];
  float[] y = new float[200];
  float[] z = new float[200];
  float[] xRad = new float[200];
  float[] yRad = new float[200];
  float[] zRad = new float[200];
  float[] angleSpeed = new float[200];
  float[] angle = new float[200];
  float[] anglez = new float[200];
  float[] angleSize = new float[200];
  float[] colorx = new float[200];
  float[] colory = new float[200];
  float[] colorz = new float[200];
}

