import ddf.minim.*;

Minim minim;
AudioPlayer player;



//シーンマネージャー　コード:茂岡


//現在のシーンを表す
//0:タイトル　1:運命　2:バトル　3:ゲームオーバー＆リザルト
int currentScene=0;


int enemyLevel=0;//現在の敵の強さ　生成される敵が強くなる

Title _title=new Title();
Fate _fate= new Fate();
Battle _battle=new Battle();
Result _result=new Result();
Message _message= new Message();

//主人公のデータ
CharaBase Nanbo=new CharaBase();

String[] ItemNameList={"鋼の剣", "狂気の首飾り", "鋼の鎧", "精霊の羽衣", "勇気の証","毒蛇の呪剣","ねばねばする皮","早送りの金時計","巻き戻しの銀時計","奇跡的な剣"};

String[] ItemEffectList={"攻撃ダメージが増加する","敵味方ともに受けるダメージが増加する","受けるダメージが減少する。","受けるダメージを減少させ、減少分を回復する。","5回攻撃すると次に受ける攻撃ダメージを0にする。","攻撃時、敵のHPの1%のダメージを追加で与える。"
                        ,"攻撃を受けたとき敵の攻撃速度を僅かに減少させる。","攻撃を受けたとき攻撃ゲージを増加させる。","攻撃ダメージを与えたとき敵の攻撃ゲージを減少させる。","与える攻撃ダメージの一部を回復する。"};

void setup()
{
  _title=new Title();
  _fate= new Fate();
  _battle=new Battle();
  _result=new Result();
  _message= new Message();
  
  enemyLevel = 0;
  Nanbo = new CharaBase();
  size(1600, 900);

  PFont font = createFont("MS Gothic",48,true);//文字の作成
  textFont (font); // 選択したフォントを指定する
 
  //ここをいじって動作を確認したいシーンへひとっとび
  ChangeScene(0);
  
  //BGM関係
  minim=new Minim(this);
  player=minim.loadFile("game_maoudamashii_2_boss06.mp3");
}

//ifでシーンによってdraw処理を分ける
void draw()
{
  if (currentScene==0)
  {
    _title.Update();
  } else if (currentScene==1)
  {
    _fate.Update();
  } else if (currentScene==2)
  {
    _battle.Update();
  } else if (currentScene==3)
  {
    _result.Update();
  }
  if(player.isPlaying()==false)
  {
    player.play(0);
  }
}

//シーンを変更する場合はStartを呼ばないといけないのでこの関数を通す
void ChangeScene(int num)
{
  currentScene=num;
  if (num==0)
  {
    _title.Start();
  } else if (num==1)
  { 
    _fate.Start();
  } else if (num==2)
  {
    _battle.Start();
  } else if (num==3)
  {
    _result.Start();
  }
}
