float baseH = 20;

float arm1W = 20;
float arm1D = 10;
float arm1L = 20;

float arm2W = 10;
float arm2D = 10;
float arm2L = 30;

float arm3W = 5;
float arm3D = 5;
float arm3L = 30;


float armW1 = 10;
float armW2 = 10;
float armW3 = 5;

float angle0 = 0;
float angle2 = 0;
float angle3 = 0;

float l3 = 0;
float l4 = 0;
float l5 = 0;
float i5 = 1;

float dif = 1.0;


void setup(){
  size(1200, 800, P3D);
  //background(255);
  
  camera(120, 100, 150, 0, 0, 0, 0, 0, -1);
  
  noStroke();  
}

void draw(){
  
  background(255);
  
  if(keyPressed){
    if(key == 'o'){
      angle0 += dif;
    }
    if(key == 'O'){
      angle0 -= dif;
    }
    if(key == 'b'){
      angle2 += dif;
    }
    if(key == 'B'){
      angle2 -= dif;
    }
    if(key == 'g'){
      angle3 += dif;
    }
    if(key == 'G'){
      angle3 -= dif;
    }
    if(key == 'R'){
      angle0 = 0;
      angle2 = 0;
      angle3 = 0;
      l3 = 0;
      l4 = 0;
      l5 = 0;
    }
     if(key == 'h'){
      l3 = + 4.0;
      l4 = - 8.0;
      l5 -= i5 ;
    }
    if(key == 'H'){
      l3 =  0;
      l4 =  0;
    }

}
  

  //base
  rotateZ(radians(angle0));
  xyzAxis(20); //xyzAxis @ base
  translate(0,0,baseH/2);
  fill(150);
  box(10,10,baseH);
  

  
  //1st link
  
  translate(0,0,baseH/2+arm1L/2);
  fill(125);
  box(arm1W,arm1D,arm1L);
  
  //2nd link
  //go to 2nd joint
  translate(0,0,0);
  rotateX(radians(angle2));  
  //go to center of 2nd joint
  translate(0,0,arm2L/2);
  fill(175);
  box(arm2W,arm2D,arm2L);
  
  //3rd link
  // go to 3rd joint
  translate(0, 0, arm2L/2);
  rotateX(radians(angle3));
  // go to center of 3rd joint
  translate(0, 0, arm3L/2);
  fill(200);
  box(arm3W,arm3D,arm3L);
  
  //手のひら
  // go to center of palm
  translate(0, 0, arm3L/2 + arm3L/12);
 fill(200);
  box(arm3W/2,arm3D*4,arm3L/6);
  translate(0,0,arm3L/4);
  pushMatrix();
   //手１
  translate(0, 5 + l3, 0);
  fill(200);
  box(arm3W,arm3D,arm3L/2);
  //手２
  translate(0, -10 + l4,0);
  fill(200);
  box(arm3W,arm3D,arm3L/2);
  popMatrix();
  //ボール
  rotateX(radians(-angle3-angle2));
  rotateZ(radians(-angle0));
  translate(0,0,0 + l5);
  fill(100,100,100);
  sphere(3);
}

void xyzAxis(float len){
  // x axis
  fill(255,0,0);
  pushMatrix();
  translate(len/2,0,0);
  box(len,1,1);
  popMatrix();
  
  // y axis
  fill(0,255,0);
  pushMatrix();
  translate(0,len/2,0);
  box(1,len,1);
  popMatrix();
  
  // z axis
  fill(0,0,255);
  pushMatrix();
  translate(0,0,len/2);
  box(1,1,len);
  popMatrix();
  
}
