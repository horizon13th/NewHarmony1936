float WidthHeightRatio = 1.5;
int bound = 300;
int sqWidth = 60;
int sqHeight = 75;
int width = sqWidth * 6;
int height = sqHeight * 7+30;
color[] cArray = new color[12];  
color[][] colorMap = new color[6][7];


void setup(){
    size(width,height);
  frameRate(1);
  noLoop();
    colorMode(HSB,360,100,100);
    iniColor();
    //iniColorRandom();
    mapColor();  
}

void draw(){
  //background(255);
  //noLoop(); 
  noStroke();
  
  for(int b=0;b<7;b++){
    for(int a=0;a<6;a++){
      //fill(colorMap[a][b]);
     //rect(a*sqWidth,b*sqHeight,sqWidth,sqHeight);
     twistRect(a*sqWidth,b*sqHeight,sqWidth,sqHeight,3,colorMap[a][b]);
     multiRectHSB(a*sqWidth,b*sqHeight,sqWidth,sqHeight,2,5,10,colorMap[a][b]);
    }     
  } 
  colorPicker(cArray);
}

  
void mousePressed() {
  loop();  // Holding down the mouse activates looping
  saveFrame("newHarmony1936-######.png");
}

void mouseReleased() {
  noLoop();  // Releasing the mouse stops looping draw()
}

void twistRect(float x1, float y1,float trWidth,float trHeight, float seg, color baseColor){
  fill(baseColor);
  quad(random(x1-seg,x1+seg),random(y1-seg,y1+seg),random(x1+trWidth-seg,x1+trWidth+seg),random(y1-seg,y1+seg),random(x1+trWidth-seg,x1+trWidth+seg),random(y1+trHeight-seg,y1+trHeight+seg),random(x1-seg,x1+seg), random(y1+trHeight-seg, y1+trHeight+seg));
}

void twistQuad(float x1,float y1,float x2,float y2,float x3,float y3,float x4,float y4,float seg){
  quad(random(x1-seg,x1+seg),random(y1-seg,y1+seg),random(x2-seg,x2+seg),random(y2-seg,y2+seg),random(x3-seg,x3+seg),random(y3-seg,y3+seg),random(x4-seg,x4+seg), random(y4-seg, y4+seg));
}

void multiRectHSB(float x1, float y1,float mWidth,float mHeight, float colorSeg, float smallSeg, float gapSeg, color iniColor){
  float h,s,b,h1,s1,b1;
  h=hue(iniColor);
  s=saturation(iniColor);
  b=brightness(iniColor);
  //print("\n r"+r+"g"+g+"b"+b);
  float tx1,ty1,tx2,ty2,tx3,ty3,tx4,ty4; 
  for(int j=int(smallSeg*2); j<int(mHeight-smallSeg*2);j=j+int(gapSeg)){
    for(int i=int(smallSeg*2); i<int(mWidth-smallSeg*2);i=i+int(gapSeg)){
    h1=int(random(h-colorSeg,h+colorSeg));
    s1=int(random(s-colorSeg,s+colorSeg));
    b1=int(random(b-colorSeg,b+colorSeg));
    tx1 =random(x1+i-smallSeg,x1+i+smallSeg);
    ty1 =random(y1+j-smallSeg,y1+j+smallSeg);
    tx2 =random(x1+gapSeg+i-smallSeg,x1+gapSeg+i+smallSeg);
    ty2 =random(y1+j-smallSeg,y1+j+smallSeg);
    tx3 =random(x1+gapSeg+i-smallSeg,x1+gapSeg+i+smallSeg);
    ty3 =random(y1+gapSeg+j-smallSeg,y1+gapSeg+j+smallSeg);
    tx4 =random(x1+i-smallSeg,x1+i+smallSeg);
    ty4 =random(y1+gapSeg+j-smallSeg, y1+gapSeg+j+smallSeg);
    //print("r1"+r1+"g1"+g1+"b1"+b1);
    //print("i:"+i+"j:"+j+"\n");
    color newColor=color(h1,s1,b1); 
    fill(newColor);
    quad(tx1,ty1,tx2,ty2,tx3,ty3,tx4,ty4);
    } 
  }
}

void iniColor(){
  cArray[0] = color(240,10,20);
  cArray[1] = color(35,55,25);
  cArray[2] = color(20,70,35);
  cArray[3] = color(40,70,40);
  cArray[4] = color(40,50,20);
  cArray[5] = color(100,50,30);                                                                              
  cArray[6] = color(0,85,85);
  cArray[7] = color(40,90,80);
  cArray[8] = color(30,15,50);
  cArray[9] = color(10,80,65);
  cArray[10] = color(0,0,30);
  cArray[11] = color(350,95,70);
}

void iniColorRandom(){
  for(int i=0;i<12;i++){
    cArray[i] = colorChangeHSB(cArray[i],360,0,0);
}}

void mapColor(){
  for(int i=0; i<5; i++){
    colorMap[i][0] =cArray[i];
    colorMap[5-i][6]=cArray[i];
    if(i<3){
      colorMap[5][i]=cArray[i];
      colorMap[0][6-i]=cArray[i];
    }
  }
  colorMap[5][3]=cArray[5];
  colorMap[5][4]=cArray[3];
  colorMap[5][5]=cArray[4];
  colorMap[0][1]=cArray[4];
  colorMap[0][2]=cArray[3];
  colorMap[0][3]=cArray[5];
  colorMap[1][1]=cArray[2];
  colorMap[2][1]=cArray[6];
  colorMap[3][1]=cArray[5];
  colorMap[4][5]=cArray[2];
  colorMap[3][5]=cArray[6];
  colorMap[2][5]=cArray[5];
  colorMap[4][1]=cArray[2];
  colorMap[4][2]=cArray[7];
  colorMap[4][3]=cArray[8];
  colorMap[4][4]=cArray[9];
  colorMap[1][5]=cArray[2];
  colorMap[1][4]=cArray[7];
  colorMap[1][3]=cArray[8];
  colorMap[1][2]=cArray[9];
  colorMap[2][2]=cArray[10];
  colorMap[3][2]=cArray[11];
  colorMap[3][4]=cArray[10];
  colorMap[2][4]=cArray[11];
  colorMap[2][3]=cArray[1];
  colorMap[3][3]=cArray[2];  
}
    
color colorChangeHSB(color iniColor,float segH,float segS,float segB){
  float h,s,b,h1,s1,b1;
  h=hue(iniColor);
  s=saturation(iniColor);
  b=brightness(iniColor);
  h1=int(random(h-segH,h+segH));
  s1=int(random(s-segS,s+segS));
  b1=int(random(b-segB,b+segB));
  //print("r1"+r1+"g1"+g1+"b1"+b1);
  return color(h1,s1,b1);  
}

void colorPicker(color[] colorArray){
  for(int i=0;i<colorArray.length;i++){
    fill(colorArray[i]);
    rect(i*30,height-30,30,30);
  }
}
