
//declare variables
PImage HPImg;
PImage enemyImg;
PImage fighterImg;
PImage treasureImg;
PImage bg1Img,bg2Img;
PImage start1Img,start2Img;
PImage end1Img,end2Img;

int x=floor(random(150)) ;
int treasurex=floor(random(610));
int treasurey=floor(random(450));

int a=4;
int b=-640;

boolean isPlaying=false;

int fighterX=600;
int fighterY=320;

int enemyX=1;
int enemyY=floor(random(480));


void setup()
{
  
  size(640,480);
//load image
  HPImg=loadImage("img/hp.png");
  enemyImg=loadImage("img/enemy.png");
  fighterImg=loadImage("img/fighter.png");
  treasureImg=loadImage("img/treasure.png");
  bg1Img=loadImage("img/bg1.png");
  bg2Img=loadImage("img/bg2.png");
  start1Img=loadImage("img/start1.png");
  start2Img=loadImage("img/start2.png");
  end1Img=loadImage("img/end1.png");
  end2Img=loadImage("img/end2.png");
  

 }

void draw()

{
//GAME SITUATION  
 if (isPlaying==false)
 {
   
  image(start2Img,0,0);
  if(mouseX<500&&mouseX>200||mouseY<380&&mouseY>400)
  {
  image(start1Img,0,0);
  image(start2Img,-1000,0);
  }
  
}


  
  
else
{

//bg1 position
  image(bg1Img,a,0);
//bg2 position
  image(bg2Img,b,0);
  
  
//blood bar
  rectMode(CORNERS);
  rect(15,13,15+x,20);
  noStroke();
  colorMode(RGB);
  fill(255,0,0,190);
  
  image(HPImg,0,0);   
  
  

//background img bg1 positon variable
if (a<638){
 a+=2;
 a%=width;}
 else
 {
   a=-640;
 }
 
//background img bg2 position variable
if (b<638){
b+=2;
b%=width;
}
else
{
  b=-640;
}

//enemy's position's variable
  enemyX+=2 ;
  enemyX%=640; 
 
 enemyY=80;
 
//position of img    
  image(enemyImg,enemyX,enemyY);
  image(treasureImg,treasurex,treasurey);
  image(fighterImg,fighterX,fighterY);

//  image(fighterImg,fighterX,mouseY);
  
//fighter touches the enemy and causes GAME OVER
if (enemyX==fighterX-2||enemyY==fighterY)
{
//isPlaying=false;
  image(end1Img,0,0);
  if(320<= mouseX&&mouseX <=420 || 350<=mouseY&&mouseY<=360)
  {
    image(end2Img,0,0);
    image(end1Img,-640,0);
  }

  }
 }
}

void mousePressed(){
  //GAME START
  isPlaying=true;
}


void keyPressed(){
if (key==CODED)
{if(keyCode==UP){
  fighterY-=5;}
if(key==CODED){
if(keyCode==DOWN){
  fighterY+=5;}
}
}
if(key==CODED)
{if(keyCode==LEFT)
{fighterX-=5;}}
if(key==CODED)
{if(keyCode==RIGHT)
{fighterX+=5;}
}
}

//void keyReleased(){
