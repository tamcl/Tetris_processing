int size;
int changeLoop = 80;
int loopC = 0, time = 0;
int x = 0, y=0;
boolean pause = false;
boolean map[][] = new boolean[10][20];

void setup(){
 size(300,600);
 background(255);
 setLine();
 loop();
}

void draw(){
  Gameplay();
}

void Gameplay(){
  clear();
  background(255);
  setLine();
  fill(0);
  rect(x*size,y,size,size);
  if(time%100==0&&time!=0){loopC++;}
  if(pause == false){time++;}
  else{pausetext();}
  y=size*loopC;
}

void checkstop(){
  //if() 
}

void pausetext(){
  textSize(32);
  fill(0);
  text("game pause", width/4-18,height/2);
}

void setLine(){
  size = width/10;
  for(int i=1;i<10;i++)
  line(size*i,0,size*i,height);
  
  for(int i=1;i<20;i++)
  line(0,size*i,width,size*i);
}

void keyReleased(){
   if(keyCode == 'A'||keyCode=='A'){
    x--; 
   }else if(keyCode=='D'||keyCode == 'd'){
    x++; 
   }else if((keyCode=='W'||keyCode == 'w')){
     y=height-size;
     pause=true;
   }else if(keyCode=='P'||keyCode == 'p'){
    if(pause==false){pause=true;}else if(pause==true){pause=false;} 
   }
   if(x<0){x=0;}
   if(x>9){x=9;}
}
