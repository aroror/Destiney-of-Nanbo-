//made by やきとり
class Fate
{
  int cardNum =4;
  card [] cards = new card[cardNum]; 
  boolean Clicked;

  card ClickedCard;
  String[] stringList=new String[100];//表示するメッセージ
  int StringLength=0;//表示するメッセージの量
  int StringNow=0;
  int ClickDelay=15;
  int ClickTimer=0;
  
  //背景用
  int ball_N=20;
  PVector ball_pos[]=new PVector[ball_N],ball_speed[]=new PVector[ball_N];
  float ball_r[]=new float[ball_N];
  

  //シーンマネージャのChangeSceneから呼び出される
  void Start()
  {   
    for (int i = 0; i <  cards.length; i++)
    {
      cards[i] = new card();
      cards[i].EventID=int (random(7));      //korede 4mainoka-doni 6pata-nnnounnmeiga warihurareta
    }
    
    for(int i=0;i<ball_N;i++){
      ball_pos[i]=new PVector(random(50,width-50),random(50,height-50));
      ball_speed[i]=new PVector(random(-5.0f,5.0f),random(-0.5f,5.0f));
      ball_r[i]=random(30,50);
    }
  }



  //シーンマネージャのdrawから呼び出される
  void Update()
  {
    Background();
   
     ClickTimer++;
    if (Clicked==false)
    {
    
    textAlign(RIGHT);
    textSize(40);
    fill(0);
    text("Money "+Nanbo.Money +" yen",1500,100);

      
    textAlign(CENTER);
    textSize(80);
    fill(0);
    text("Choose your Destiny!",800,450);

      for (int i = 0; i < cards.length; i++)
      {
        cards[i].Run(i);             
      }

    }
    else
    {
     rectMode(CORNER);
     fill(255);
     rect(0,600,1600,300);
     fill(0);
     rect(10,610,1580,280);
     textAlign(LEFT);
     fill(255);
     textSize(55);
     text(stringList[StringNow],50,700);
     ClickedCard.Run(4);
     if(mousePressed==true&&ClickDelay<=ClickTimer)
     {
       
       StringNow++;
       ClickTimer=0;
       if(StringLength<=StringNow)
       {
         StringLength=0;
         StringNow=0;
         ChangeScene(2);
         Clicked=false;
       }
     }
      
    }
    
  }
  
  void Background(){
    background(#FAF1D1);
    noFill();
    stroke(0,50);
    for(int i=0;i<ball_N;i++){
     ellipse(ball_pos[i].x,ball_pos[i].y,ball_r[i],ball_r[i]);
     ball_pos[i].x+=ball_speed[i].x;
     ball_pos[i].y+=ball_speed[i].y;
     if(ball_pos[i].x+ball_r[i]/2 >width || ball_pos[i].x-ball_r[i]/2<0) ball_speed[i].x*=-1;
     if(ball_pos[i].y+ball_r[i]/2 >height || ball_pos[i].y-ball_r[i]/2<0) ball_speed[i].y*=-1;
    }
    
    for(int i=0;i<ball_N;i++){
     for(int j=0;j<ball_N;j++){
      if(ball_pos[i].dist(ball_pos[j])<=300){
        line(ball_pos[i].x,ball_pos[i].y,ball_pos[j].x,ball_pos[j].y);
      }
     }
    }
  }
  
  
  
}
