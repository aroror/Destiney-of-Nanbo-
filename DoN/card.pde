class card
{    

  int[] posX={800, 200, 800, 1400,800};
  int[] posY={200, 450, 700, 450,350};

  int EventID;
  
  //0.　go to gim :確率で骨折、ステータスダウン
  //1.　講義　アイテム入手
  //２．ボランティア　アイテムget
  //３．昼飯　　：ステータスうｐ
  //４．昼寝：　ｈｐ回復
  //５．バイト　：金がたまる。金はゲームクリア時のscoreに影響
 

  boolean  clicked=false;

  //cardの描画
  void Display(int num)
  {
    noStroke();
    if ((posX[num]-200/2<mouseX&&posX[num]+200/2>mouseX&&posY[num]-290/2<mouseY&&posY[num]+290/2>mouseY)||clicked==true)
    {
      fill(#FF3131);

    } 
    else
    {
      fill(#036DFF);
    }
    rectMode(CENTER);
    rect(posX[num], posY[num], 200, 290);

    fill(255);
    rect(posX[num],posY[num],180,180);
    
    PImage img=null;//カード画像
     switch(EventID)
  {
    case 0:
   img=loadImage("gym_aerobike_people.png");
    break;
    case 1:
   img=loadImage("school_class.png");
    break;
    case 2:
   img=loadImage("kusamushiri_group_people.png");
    break;
    case 3:
   img=loadImage("friends_obentou_shifuku.png");
    break;
    case 4:
   img=loadImage("hammock.png");
    break;
    case 5:
   img=loadImage("shopping_reji_man.png");
    break;
    case 6:
    img=loadImage("shopping_cart_woman.png");
  }
    image(img,posX[num]-100,posY[num]-100,200,200);
  
  
  }

  void Run(int num)
  {
    Display(num);
    //クリックした時

    if ((posX[num]-200/2<mouseX&&posX[num]+200/2>mouseX&&posY[num]-290/2<mouseY&&posY[num]+290/2>mouseY)&&mousePressed==true&&_fate.ClickDelay<=_fate.ClickTimer&&_fate.Clicked==false)
    {
      print("clicked");
      clicked=true;
      _fate.ClickedCard=this;
      _fate.Clicked=true;
      _fate.ClickTimer=0;
      _message.EventMessage(EventID); 

    }
  }
}
