int rgbLed[] = {6, 3, 5};

int red[] = {255, 0, 0};
int green[] = {0, 255, 0};
int blue[] = {0, 0, 255};
int yellow[] = {255, 255, 0};
int pink[] = {255, 50, 100};
int white[] = {255, 255, 255};
int purple[] = {255, 0, 255};
int cyan[] = {0, 255, 255};
int grey[] = {100, 100, 100};
int magenta[] = {255, 0, 255};
int olive[] = {128, 128, 0};


void setup(){
  
}

void loop(){
  fadeLoop();
}

void fadeLoop(){
   int sleepTime = random(1,15);
  fade(white, purple, sleepTime);
  fade(purple, magenta, sleepTime);
  fade(magenta, cyan, sleepTime);
  fade(cyan, green, sleepTime);
  fade(green, grey, sleepTime);
  fade(grey, olive, sleepTime);
  fade(olive, yellow, sleepTime); 
  fade(yellow, blue, sleepTime);
  fade(blue, white, sleepTime);
}

void fade(int from[], int to[], int sleepTime){
  int maxDiff = getMaxDiff(from, to);
  for(int i = 0 ; i < maxDiff ; i++){
    step(from, to);
    writeRGB(from);
    delay(sleepTime);
  }
}

void step(int from[], int to[]){
  for(int i = 0; i < 3; i++){
    if(from[i] < to[i]){
      from[i] = from[i]+1;
    }
    else if(from[i] > to[i]){
      from[i] = from[i]-1;
    }
  }
}
int getMaxDiff(int from[], int to[]){
  int maxDiff = getDiff(from[0], to[0]);
  for(int i = 1; i <3; i++){ //gotta have some love
    int tmpDiff = getDiff(from[i], to[i]);
    if(maxDiff < tmpDiff){
      maxDiff = tmpDiff;
    }
  }
  return maxDiff;
}

int getDiff(int x, int y){
 if(x > y){
  return x-y;
 }
return y-x; 
}

void arraySimple(){
  int sleepTime=500;
  writeRGB(red);
  delay(sleepTime);
  writeRGB(green);
  delay(sleepTime);
  writeRGB(blue);
  delay(sleepTime);
  writeRGB(yellow);
  delay(sleepTime);
  writeRGB(pink);
  delay(sleepTime);
  writeRGB(white);
  delay(sleepTime);
  writeRGB(purple);
  delay(sleepTime);
}

void writeRGB(int color[]){
  analogWrite(rgbLed[0],color[0]);
  analogWrite(rgbLed[1],color[1]);
  analogWrite(rgbLed[2],color[2]);  
}


