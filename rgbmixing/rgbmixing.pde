int greenLed=3;
int blueLed=5;
int redLed=6;

int rgbLed[] = {6, 3, 5};

int red[] = {255, 0, 0};
int green[] = {0, 255, 0};
int blue[] = {0, 0, 255};
int yellow[] = {255, 255, 0};
int pink[] = {255, 50, 100};
int white[] = {255, 255, 255};
int purple[] = {255, 0, 255};
int unknown[] = {0, 255, 255};


void setup(){
  
}

void loop(){
  fade(white, purple, 4);
  fade(purple, unknown, 4);
  fade(unknown, green, 4);
  
  fade(green, yellow, 4);
  fade(yellow, blue, 4);
  fade(blue, white, 4);
}

void fade(int from[], int to[], int sleepTime){
  int redStart=from[0];
  int redEnd=to[0];
  int greenStart=from[1];
  int greenEnd=to[1];
  int blueStart=from[2];
  int blueEnd=to[2];
  int maxDiff = getDiff(redStart, redEnd);
  int tmpDiff = getDiff(greenStart, greenEnd);
  if(maxDiff < tmpDiff){
    maxDiff = tmpDiff;
  }
  tmpDiff = getDiff(blueStart, blueEnd);
  if(maxDiff < tmpDiff){
    maxDiff = tmpDiff;
  }
  int r = redStart;
  int g = greenStart;
  int b = blueStart;
  int tmp[] = {r,g,b};
  for(int i = 0 ; i < maxDiff ; i++){
    r = step(r, redEnd);
    g = step(g, greenEnd);
    b = step(b, blueEnd);
    tmp = {r,g,b};
    writeRGB(tmp);
    delay(sleepTime);
  } 
  
  
  
}
int step(int currentValue, int targetValue){
  if(currentValue == targetValue){
    return currentValue;
  }
  if(currentValue < targetValue){
    return currentValue+1;
  }
  return currentValue-1;
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


