class ShapeOne
{
  //points - skeletons
  //lines - bones
  //shapes - skins
  
  //length -- 长度 x
  //width -- 宽度 y
  //leanDegree -- 倾斜度 θ
  //chaosness -- 混乱度，从左到右的上下侧宽度的变化(混乱度越高，变化越明显) 
  //sharpness -- 尖锐度，左侧右侧上下偏移的变化（尖锐度越高，差值越大）
  PVector pos;
  private float led;
  private float wid;
  private float leanDegree;
  private float chaos;
  private float sharp;
  private color col;
  
  float targetLed;
  float targetWid;
  float targetLeanDegree;
  float targetChaos;
  float targetSharp;
  PVector targetPos;
  color targetCol;
  
  ShapeOne(PVector pos,float led, float wid, float leanDegree, float chaos, float sharp, color col)
  {
    this.targetPos = this.pos = pos;
    this.targetLed = this.led = led;
    this.targetWid = this.wid = wid;
    this.targetLeanDegree = this.leanDegree = leanDegree;
    this.targetChaos = this.chaos = chaos;
    this.targetSharp = this.sharp = sharp;
    this.targetCol = this.col = col;
  }
  
  void RenderWithLerp()
  {
    //float noiseValue1 = noise(pos.x + millis()/float(2000),pos.y + millis()/float(2000));
    //float degree = noiseValue1 * PI;
    DoLerpOnce(0.1f);
    //this.targetLeanDegree = degree;
    //this.leanDegree = degree;
    Render();
  }
  
  void RenderWithLerp(float t )
  {
    //float noiseValue1 = noise(pos.x + millis()/float(2000),pos.y + millis()/float(2000));
    //float degree = noiseValue1 * PI;
    DoLerpOnce(0.1f * t);
    //this.targetLeanDegree = degree;
    //this.leanDegree = degree;
    Render();
  }
  
  void Render()
  {
    pushStyle();
    pushMatrix();
    
    translate(pos.x,pos.y,pos.z);
    rotateZ(leanDegree);
    
    //four points in object space.
    //topLeft
    PVector topLeft = new PVector(0,0);
    topLeft.x -= led/2;
    topLeft.y += wid/2;
    //topRight
    PVector topRight = new PVector(0,0);
    topRight.x += led/2;
    topRight.y += wid/2;
    //bottomLeft
    PVector bottomLeft = new PVector(0,0);
    bottomLeft.x -= led/2;
    bottomLeft.y -= wid/2;
    //bottomRight
    PVector bottomRight = new PVector(0,0);
    bottomRight.x += led/2;
    bottomRight.y -= wid/2;
    
    if (chaos > 0.5) {
      topLeft.y += chaos/2;
      bottomRight.y += chaos/2;
    }
    else {
      bottomLeft.y += chaos/2;
      topRight.y += chaos/2;
    }

    if (sharp > 0.5) {
      topLeft.x += sharp/2;
      bottomRight.x += sharp/2;
    }
    else {
      bottomLeft.x += sharp/2;
      topRight.x += sharp/2;
    }

    noStroke();
    fill(col);
    
    beginShape();
    
    vertex(topLeft.x,topLeft.y);
    vertex(topRight.x,topRight.y);
    vertex(bottomRight.x,bottomRight.y);
    vertex(bottomLeft.x,bottomLeft.y);
    
    endShape();
    
    
    popMatrix();
    popStyle();
  }
  
  
  
  void DoLerpOnce(float t)
  {
    this.pos = PVector.lerp(this.pos,this.targetPos,t);
    this.led = lerp(this.led,this.targetLed,t);
    this.wid = lerp(this.wid,this.targetWid,t);
    this.leanDegree = lerp(this.leanDegree,this.targetLeanDegree,t);
    this.chaos = lerp(this.chaos,this.targetChaos,t);
    this.sharp = lerp(this.sharp,this.targetSharp,t);
    this.col = round(lerp(float(this.col),float(this.targetCol),t));
  }
  
  
  
  
}
