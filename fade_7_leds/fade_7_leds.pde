int led[] = { 2, 3, 4, 10, 11, 12, 13 };
void setup()
{
  analogReference(INTERNAL);
}

void loop(){
  for(int i = 0; i < 256 ; i++){
    for(int x = 0; x < 7; x++)
    {
    analogWrite(led[x], i);
    }
    delay(10);
  }
  for(int i = 0; i < 256 ; i++){
    for(int x = 0; x < 7; x++)
    {
    analogWrite(led[x], 256-i);
    }
    delay(10);
  }
}
