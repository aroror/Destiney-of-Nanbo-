  //タイトル　コード:茂岡
class Title
{
  PVector frame_pos=new PVector(600,560), frame_sz=new PVector(400,100);
  PImage nambo;
  int limit_millis=2000,set_millis=-1;
  //シーンマネージャのChangeSceneから呼び出される
  void Start()
  {
    background(#FAF1D1);
    textSize(100);
    //中央揃えにする
    textAlign(CENTER,CENTER);
    fill(0);
    text("Destiny of Nambo",800,300);
    textSize(60);
    text("Click to Start",800,600);
    nambo=loadImage("./data/nambo.png");
    // "click to startの枠線
    noFill();
    stroke(0);
    rect(frame_pos.x,frame_pos.y,frame_sz.x, frame_sz.y);
  }
  
  //シーンマネージャのdrawから呼び出される
  void Update()
  {
    if(mousePressed){
      //クリックされたら運命選択へ
      if(is_frame_in(mouseX,mouseY)){
        set_millis=millis();
      }else {
        image(nambo,mouseX-50,mouseY-50,100,100);
      }
    }
    if(millis()-set_millis>limit_millis && set_millis!=-1){
      ChangeScene(1);
    }
    
    if(set_millis!=-1){
      fill(255,255,255,map(millis()-set_millis,0,8000,0,150));
      println(map(millis()-set_millis,0,8000,0,150));
      stroke(255);
      rect(0,0,width,height);
    }
  }
  
  boolean is_frame_in(int mx, int my){
     return (frame_pos.x<=mx && mx<=frame_pos.x+frame_sz.x && frame_pos.y<=my && my<=frame_pos.y+frame_sz.y);
  }
  
  
}