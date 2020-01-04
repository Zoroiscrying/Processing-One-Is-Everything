ChangingOne stageOne;
ShapeOne shape;

float timePassed;
float nextCheckTime;
float lastCheckTime;
float timeLapse = 250;

void setup()
{
  stageOne = new ChangingOne();
  shape = new ShapeOne(new PVector(width/2,height/2),100,100,PI/9,0,0,color(255,255,255,255));
  size(1600,900,P3D);
  smooth(8);

  timePassed = 0;
  lastCheckTime = 0;
  nextCheckTime = lastCheckTime + timeLapse;
}

void draw()
{
  timePassed = millis() - lastCheckTime;
  
  noStroke();
  fill(0,120);
  rect(0,0,width,height);
  stageOne.Update();
  
  //if(timePassed > nextCheckTime)
  //{
  //  println("Check!");
  //   shape.targetLeanDegree = random(-PI/4,PI/4);
  //   shape.targetPos = new PVector(random(0,width),random(0,height));
  //   shape.targetChaos = random(0,4);
  //   shape.targetSharp = random(0,4);
  //   lastCheckTime = millis();
  //   nextCheckTime = lastCheckTime + timeLapse;
  //}
  
  //shape.RenderWithLerp();
}

void mouseClicked()
{
     shape.targetLeanDegree = random(-PI/9,PI/9);
     shape.targetPos = new PVector(random(0,width),random(0,height));
     shape.targetChaos = random(-10,10);
     shape.targetSharp = random(-10,10);
}

void keyPressed()
{
  if(key == TAB)
  {
    saveFrame("screenShot.png");
  }
}
