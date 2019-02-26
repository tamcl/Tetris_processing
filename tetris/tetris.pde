int size;
int changeLoop = 10;
int loopC = 0, time = 0;
int x = 0, y=0;
boolean pause = false;
boolean map[][] = new boolean[10][21];

void setup(){
 size(300,600);
 background(255);
 setLine();
 loop();
 setMap();
}

void draw(){
  Gameplay();
}

void Gameplay(){
  clear();
  background(255);
  setLine();
  fill(0);
  checkLine();
  checkstop();
  drawMap();
  shadow();
  rect(x*size,y,size,size);
  if(time%changeLoop==0&&time!=0){loopC++;}
  if(pause == false){time++;}
  else{pausetext();}
  y=size*loopC;
}

void checkstop(){
  int xPos = x;
  int yPos = y/size;
  if(endBlock(xPos,yPos)==yPos+1||yPos==19){
    map[xPos][yPos]=true;
    loopC=0;
    x=5;
    if(changeLoop>5){changeLoop--;}
  }
}

void shadow(){
 int xPos=x;
 int yPos= y/size;
 yPos = endBlock(xPos,yPos)-1;
 fill(200);
 //if(yPos == 19){yPos=18;}
 rect(xPos*size,yPos*size,size,size);
 fill(0);
}

int endBlock(int xP,int yP){
  int end=19;
  for(int i=0;i<20;i++){
    if(map[xP][i]==true){
     end=i;
     break;
    }
  }
  return end;
}

void pausetext(){
  textSize(32);
  fill(0);
  text("game pause", width/4-18,height/2);
}

void setLine(){
  size = width/10;
  for(int i=1;i<10;i++)
  line(size*i,0,size*i,height-size);
  
  for(int i=1;i<20;i++)
  line(0,size*i,width,size*i);
}

void checkLine(){
 for(int i=19;i>0;i--){
   boolean clear = true;
     for(int k=0;k<10;k++){
      if(map[k][i]==false){
        clear = false;
        break; 
      }
     }
    if(clear==true){
     clearLine(i); 
    }
 }
}

void clearLine(int line){
  for(int i=0;i<10;i++){
   map[i][line]=false; 
  }
  for(int i=0;i<10;i++){
   for(int k=line;k>0;k--){
    map[i][k] = map[i][k-1]; 
   }
  }
}

void setMap(){
   for(int i=0;i<10;i++){
  for(int k=0; k<20;k++){
   map[i][k]=false; 
  }
  map[i][20]=true;
 }
}

void drawMap(){
  for(int i=0;i<10;i++){
  for(int k=0; k<20;k++){
   if(map[i][k]==true){
    rect(i*size,k*size,size,size); 
   }
  }
 }
}

void keyReleased(){
   if(keyCode == 'A'||keyCode=='A'){
    x--; 
   }else if(keyCode=='D'||keyCode == 'd'){
    x++; 
   }else if((keyCode=='W'||keyCode == 'w')){
     
   }else if(keyCode=='P'||keyCode == 'p'){
    if(pause==false){pause=true;}else if(pause==true){pause=false;} 
   }
   if(x<0){x=0;}
   if(x>9){x=9;}
}
