class Result
{
  
//シーンマネージャのChangeSceneから呼び出される
void Start()
{

  background(0);
  textAlign(LEFT);
  fill(255);
  textSize(150);
  text("Result",200,300);
   textSize(100);
  text("Money "+Nanbo.Money+" yen",600,600);
}

//シーンマネージャのdrawから呼び出される
void Update()
{
  if(mousePressed==true)
  {
   player.close();
   setup();
  }
}

void printa(int text)
{
  print(text);
}

}
