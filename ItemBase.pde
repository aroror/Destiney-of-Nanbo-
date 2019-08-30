//アイテムベース　コード:茂岡
//このクラスをスーパークラスとしてアイテムごとにクラスをたくさん作る手もあったがpdeファイルがどんどん増えるのも嫌だったのでアイテムの効果をswitchで切り替える仕様にした
class ItemBase 
{
  ItemBase(int ID,CharaBase Chara)
  {
    ItemID=ID;
    Owner=Chara;
  }
  
  //アイテム取得時にアイテムの持ち主が格納される
  CharaBase Owner;
  //アイテム取得にアイテムIDが格納される
  int ItemID;
  
  //アイテムの効果で数字を数える必要があるならここで記憶する
  int NumA;
  int NumB;
  int NumC;
  
   //攻撃するキャラクターと攻撃されるキャラクターを格納
  int Attack(int Damage,CharaBase Attacker,CharaBase Defenser)
  {
   switch(ItemID)
   {
     //アイテムID　0　鋼の剣　攻撃ダメージを増加させる
     case 0:
     //発動条件
     //このアイテムの持ち主がアタッカーである場合のみ
     //ちなみにこのif文が抜けた場合相手から攻撃を受ける場合にもダメージ増加が発生してしまうので注意
     if(Owner==Attacker)
     {
       println("Owner");
       Damage += 25;
     }
  
     break;
     
     case 1://アイテムID　1 狂気の首飾り　敵味方問わず攻撃ダメージを1.5倍に増加させる
     if(Owner==Attacker||Owner==Defenser)
    {
     Damage*=1.5f;
    }
     break;
     
     case 4://アイテムID　4 勇気の証　5回攻撃したら次に受ける攻撃ダメージを0にする　
     //NumAを攻撃カウント NumBは無効化カウント
     //NumA,NumB...はアイテムによって自由に使える変数
     //攻撃ごとにNumAを加算し3に達したならNumAをリセットし、NumBを加算する。
     //NumBの処理はAttackDamageに書くこと
     if(Owner==Attacker)
     {     
       if(NumA<=5)
       {
         NumA++;
       }
       
     }
     break;
     
     case 5://アイテムID　5 毒蛇の呪剣　敵のHPの1%のダメージを追加で与える。
      if(Owner==Attacker)
     {     
      Defenser.HP-=Defenser.HP*0.01f;
       
     }
     break;
      case 9://アイテムID　9 奇跡的な剣　与えるダメージの一部を回復する。
      if(Owner==Attacker)
     {     
      Attacker.HP+=Damage*0.1f;
       
     }
     break;
   }
   
   //最後にダメージの値を返す
   return Damage;
  } 
  
   int AttackDamage(int Damage,CharaBase Attacker,CharaBase Defenser)
  {
      switch(ItemID)
   {
     //アイテムID　2　鋼の鎧　攻撃ダメージを減少させる
     case 2:
     Damage-=25;
     break;
     
     //アイテムID　3 精霊の羽衣　攻撃ダメージを大きく減少させたうえで少し回復する
     case 3:
     //アイテムの持ち主がダメージを受けるとき
     if(Owner==Defenser)
     {
     //半減させる
      Damage*=0.9f;
     
     Defenser.HP+=Damage*0.1f;
     //効果はdamageの数値を変えるだけでなく(キャラクターベースの方の)関数を呼び出してもよい。ただし効果によっては無限ループになってしまう可能性があることを考慮してプログラムすること
     //対策としては関数Aから関数Aを呼び出したり関数A→関数B→関数Aにならないようにする、またはNumAなどで効果発動回数をカウントして制限をかけるなどある

     }
    break;
    
    case 4://アイテムID　4 勇気の証　５回攻撃したら次に受ける攻撃ダメージを0にする　
    //ここではNumBが1以上なら攻撃ダメージを0にする
    if(Owner==Defenser)
    {
      if(NumA>=5)
      {
        NumA=0;
        Damage=0;
      }    
    }    
    break;
    
     case 6://アイテムID　6 ねばねばする皮　攻撃を受けたとき敵の攻撃速度を減少させる。
    if(Owner==Defenser)
    {
      Defenser.AttackSpeed*=0.98f;
    }    
    break;
    
    case 7://アイテムID　7 早送りの金時計 攻撃を受けたとき攻撃ゲージを増加させる。
    if(Owner==Defenser)
    {
      Defenser.AttackNow+=Defenser.AttackSpeed*5;
    }
    
     case 8://アイテムID　8 巻き戻しの銀時計 攻撃ダメージを与えたとき敵の攻撃ゲージを減少させる。
    if(Owner==Attacker)
    {
      Defenser.AttackNow-=Defenser.AttackSpeed*5;
    }
    
    
   }
      
   return Damage; 
  } 

}
