//バトルマネージャ　コード:茂岡
class Battle
{
  
 CharaBase Enemy=new CharaBase();
  
 CharaBase[] CharaList;
 boolean isBattle=false;//バトル中か否か
 int BattleEndTimer;//バトル終了後時間をはかるのに使用
 
 int gra_limit=20;
 PVector line_pos[]=new PVector[gra_limit];
 float line_leng[]=new float[gra_limit];
 color line_col[]={#ff0000, #00ff00, #0000ff};
 int line_col_idx;
 
//シーンマネージャのChangeSceneから呼び出される
void Start()
{
  CharaList=new CharaBase[2];
  CharaList[0]=Nanbo;
  CharaList[0].img=loadImage("nambo.png");
  CharaList[1]=CreateChara(enemyLevel);
  BattleEndTimer=0;
  isBattle=true;
  enemyLevel+=1+(enemyLevel*0.1f);
  print(enemyLevel);
  
  for(int i=0;i<gra_limit;i++){
    line_pos[i]=new PVector(random(0,width),random(0,height));
    line_leng[i]=random(10,100);
  }
  line_col_idx=int(random(0,3));
}

//シーンマネージャのdrawから呼び出される
void Update()
{
   Background();
   CharaDisp();
  if(isBattle==true)
  {
  CharaUpdate();
  
  }
  else
  {
    BattleEndTimer++;
    //主人公が生存か死亡かで処理をわける
      if(CharaList[0].HP>0)
      {
      fill(0);
      textAlign(CENTER);
      text("You Win! Money "+enemyLevel*300+" yen Get!",800,450);
      
      }
    if(BattleEndTimer>=100)
    {
      
      //主人公が生存か死亡かで処理をわける
      if(CharaList[0].HP>0)
      {
        Nanbo.Money+=enemyLevel*(300);
        
        //生存時は運命選択へ
        ChangeScene(1);
      }
      else
      {
        //死亡時はResult画面に
        ChangeScene(3);
      }
  }
    
  }
}
//Character周りの描画　ダメージもここで
void CharaDisp()
{
  int count=0;
  for(CharaBase Chara:CharaList)
  {
    //キャラクター画像はここへ　サイズは400,400がうれしい
      rectMode(CORNER); 
      fill(255);
      image(Chara.img,200+800*count,200,400,400);
      fill(0);
      rect(200+800*count,650,400,20);
      fill(0,255,0);
      if(Chara.HP<0)
      {
        Chara.HP=0;
      }
      rect(200+800*count,650,400*Chara.HP/Chara.MaxHP,20);
      fill(0);
      rect(200+800*count,700,400,20);
      fill(0,255,255);
      rect(200+800*count,700,400*Chara.AttackNow/Chara.AttackMax,20);
      
      textAlign(CENTER);
      fill(Chara.DamageColor-color(0,0,0,Chara.DamageTimer*5));
      textSize(100);
      text(Chara.DispDamage,200+800*count+150,400-Chara.DamageTimer*5);
      Chara.DamageTimer++;
      count++;
  }
}

void CharaUpdate()
{
  int num=0;
  for(CharaBase Chara:CharaList)
  {
     Chara.AttackNow+=Chara.AttackSpeed;
     //攻撃ゲージMaxで攻撃
     if(Chara.AttackNow>=Chara.AttackMax)
     {
       Chara.AttackNow-=Chara.AttackMax;
       //攻撃対象を分けないといけないので少し強引にやってます
       if(num==0)
       {
          Chara.Attack(Chara,CharaList[1]);
       }
       else
       {
          Chara.Attack(Chara,CharaList[0]);
       }     
   }
   if(Chara.HP<=0)
   {
       isBattle=false;
   }   
   if(Chara.MaxHP<Chara.HP)
   {
       Chara.HP=Chara.MaxHP;
   }
   num++;
  }  
}

//敵キャラクターをレベルに応じて設定する
CharaBase CreateChara(int level)
{
  
   CharaBase Chara=new CharaBase();
  
  //敵の画像を設定
  int charaNum=(int)random(17);
  switch(charaNum)
  {
    case 0:
    Chara.img=loadImage("character_program_happy.png");
    break;
     case 1:
    Chara.img=loadImage("character_sports_baseball.png");
    break;
      case 2:
    Chara.img=loadImage("character_sports_soccer.png");
    break;
      case 3:
    Chara.img=loadImage("company_character_black.png");
    break;
      case 4:
    Chara.img=loadImage("figure_rpg_characters.png");
    break;
      case 5:
    Chara.img=loadImage("game_wabiishi.png");
    break;
      case 6:
    Chara.img=loadImage("halloween_chara3_miira.png");
    break;
      case 7:
    Chara.img=loadImage("halloween_chara4_ookamiotoko.png");
    break;
    case 8:
    Chara.img=loadImage("halloween_chara7_obake.png");
    break;
    case 9:
    Chara.img=loadImage("kafun_tobu_character.png");
    break;
    case 10:
    Chara.img=loadImage("war_america_uncle_sam.png");
    break;
    case 11:
    Chara.img=loadImage("yumekawa_boy.png");
    break;
    case 12:
    Chara.img=loadImage("yumekawa_girl.png");
    break;
    case 13:
    Chara.img=loadImage("yumekawa_tanabata_hikoboshi.png");
    break;
    case 14:
    Chara.img=loadImage("yumekawa_tanabata_orihime.png");
    break;   
    case 15:
    Chara.img=loadImage("hirao1.png");
    level+=3;
    break;
    case 16:
    Chara.img=loadImage("hirao2.png");
    level+=5;
    break;   
  }
  Chara.MaxHP=(int)((800+level*50)*random(0.7f,1.3f));//最大体力
  Chara.HP=Chara.MaxHP;         //体力
  Chara.Attack=(int)((80+level*10)*random(0.7f,1.3f));//攻撃力
  Chara.AttackMax=(int)((100000)*random(0.9f,1.1f));//攻撃が行われるタイミング
  Chara.AttackSpeed=(int)((800+level*10)*random(0.7f,1.3f));//攻撃の進行が貯まるスピード
  Chara.Defense=(int)((level*1)*random(0.7f,1.3f));//防御
  
  
  for(int i=1;i<1+level/5f;i++)
  {
   Chara.GetItem((int)random(ItemNameList.length)); 
  }
  
  return Chara;
}

void Background()
{
  background(#FAF1D1); 
  strokeWeight(5);
  stroke(line_col[line_col_idx]);
  for(int i=0;i<gra_limit;i++){
    line(line_pos[i].x,line_pos[i].y,line_pos[i].x+line_leng[i],line_pos[i].y);
    line_pos[i].x+=20;
    if(line_pos[i].x>width){
      line_pos[i].x=-line_leng[i];
      line_pos[i].y=random(0,height);
    }
  }
  stroke(#FAF1D1);
  strokeWeight(1);
  
}

}
