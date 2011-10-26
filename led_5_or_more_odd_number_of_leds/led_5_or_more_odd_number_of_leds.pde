int led[] = { 2, 3, 4, 10, 11, 12, 13 };
int noOfLeds = 7;

void setup()
{
  for(int i = 0; i < noOfLeds; i++){
    pinMode(led[i], OUTPUT);
  }
}

void loop()
{
  int x = random(1,15);
  for(int i = 0; i < x; i++)
  {
    filler();
    unfiller();
    clear_all();
  }
  for(int i = 0; i < x; i++)
  {
    blink();
  }
  for(int i = 0; i < x; i++)
  {
    passingWorm();
  }
  for(int i = 0; i < x; i++)
  {
    knightRider();
  }
}

void filler(){
  int x = random (30, 200);
  for(int i = 0 ; i < noOfLeds/2; i++){
    digitalWrite(led[i], HIGH);
    digitalWrite(led[noOfLeds-1-i], HIGH);
    delay(x);
  }
  digitalWrite(led[(noOfLeds/2)], HIGH);
  delay(x*2);

}
void unfiller(){
  int x = random (30, 200);
  digitalWrite(led[(noOfLeds/2)], LOW);
  for(int i = noOfLeds/2 ; i >=0 ; i--){
    delay(x);
    digitalWrite(led[i], LOW);
    digitalWrite(led[noOfLeds-1-i], LOW);
  }
  delay(x*2);
}

void blink(){
 int x = random(30, 200);
 fill_all();
 delay(x);
 clear_all();
 delay(x); 
}

void clear_all(){
  for(int i = 0; i < noOfLeds; i++)
  {
    digitalWrite(led[i], LOW);
  }
}

void fill_all(){
  for(int i = 0; i < noOfLeds; i++)
  {
    digitalWrite(led[i], HIGH);
  }
}

void passingWorm()
{
  int x = random (30, 200);
  for(int i = 0; i < noOfLeds; i++){
    digitalWrite(led[i], HIGH);
    delay(x);
  }
  for(int i = 0; i < noOfLeds; i++){
    digitalWrite(led[i], LOW);
    delay(x);
  }
}

void knightRider()
{
  int x = random (30, 200);
  for(int i = 0; i < noOfLeds; i++){
    digitalWrite(led[i], HIGH);
    digitalWrite(led[(i-1)%noOfLeds], LOW);
    delay(x);
  }
  for(int i = noOfLeds-1; 0 <= i ; i--){
    digitalWrite(led[i], HIGH);
    digitalWrite(led[(i+1)%noOfLeds], LOW);
    delay(x);
  }
}

