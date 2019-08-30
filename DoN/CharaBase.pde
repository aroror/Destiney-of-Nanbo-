//キャラクターベース　コード:茂岡
class CharaBase
{
  int MaxHP=1000;//最大体力
  int HP=MaxHP;         //体力
  int Attack=100;//攻撃力
  int AttackNow;//攻撃の進行
  int AttackMax=100000;//攻撃が行われるタイミング
  int AttackSpeed=2500;//攻撃の進行が貯まるスピード
  int Defense=0;//防御
  
  int Money;
  
  int DispDamage;//表示するダメージ
  int DamageTimer=100;//ダメージ表示時間を測るためのタイマー 初期値は適当に大きい数字にしておく
  color DamageColor;//表示するダメージの色
 
  PImage img;
  
  //アイテムの配列
  ItemBase[] ItemList=new ItemBase[10000];
  //アイテムの個数
  int ItemLength=0;

  
  //攻撃するキャラクターと攻撃されるキャラクターを格納
  void Attack(CharaBase Attacker,CharaBase Defenser)
  {
    println("Attack");
    int Damage=Attacker.Attack;//ダメージ式はこちらへ　攻撃者の攻撃力を考慮 敵の防御は考慮せず
    //アイテム効果を発動
    for(CharaBase Chara:_battle.CharaList)
    {
      for(int i=0;i<Chara.ItemLength;i++)
      {
        ItemBase Item=Chara.ItemList[i];
        //ダメージを更新し続ける
       Damage=Item.Attack(Damage,Attacker,Defenser);   
      }
    }
    
    //ダメージを発生させる
    AttackDamage(Damage,Attacker,Defenser);
    
  }
  
  void AttackDamage(int Damage,CharaBase Attacker,CharaBase Defenser)
  {
    Damage-=Defenser.Defense;//ダメージ式はこちらへ　防御力を考慮
     //アイテム効果を発動
    for(CharaBase Chara:_battle.CharaList)
    {
      for(int i=0;i<Chara.ItemLength;i++)
      {
         ItemBase Item=Chara.ItemList[i];
         //ダメージを更新し続ける
         Damage=Item.AttackDamage(Damage,Attacker,Defenser);   
      }
    }  
    //DefenserのHPを減らす（本効果）
    if(Damage<0)Damage=0;
    
    Defenser.HP-=Damage;
    Defenser.SetDamage(Damage,color(255,0,0)); 
    
  }
  
 
  
  //アイテムを獲得する際はこの関数にアイテムIDを渡す
  void GetItem(int ItemID)
  {
    ItemList[ItemLength]=new ItemBase(ItemID,this);
    ItemList[ItemLength].Owner=this;
    ItemLength++;
  }
  
  //ダメージを表示する際に呼びだす
  void SetDamage(int Damage,color Color)
  {
    DispDamage=Damage;
    DamageColor=Color;
    DamageTimer=0;
  }
}
