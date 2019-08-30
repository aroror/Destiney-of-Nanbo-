class Message
{
 
  void EventMessage(int EventID)
  {
    //トレーニングルーム
    if(EventID==0)
    {
      AddText("Training Event!");
      int rnd=(int)random(5);
      int num=0;
      switch(rnd)
      {
        case 0:
        AddText("Succeeded!");
        num=(int)random(Nanbo.MaxHP*0.1f)+(int)random(10);
        Nanbo.MaxHP+=num;
        Nanbo.HP+=num;
        AddText("MaxHP "+num+" UP");
        break;
        
        case 1:
        AddText("Succeeded!");
        num=(int)random(Nanbo.Attack*0.1f)+(int)random(10);
        Nanbo.Attack+=num;
        AddText("Attack "+num+" UP");
        break;
        
        case 2:
        AddText("Succeeded!");
        num=(int)random(Nanbo.AttackSpeed*0.05f)+(int)random(10);
        Nanbo.AttackSpeed+=num;
        AddText("AttackSpeed "+num+" UP");
        
        break;
        
        case 3:
        AddText("Failed...");
        num=(int)random(Nanbo.Defense*0.03f)+(int)random(10);
        Nanbo.Defense-=num;
        AddText("Defense "+num+" DOWN");
        break;
        
        case 4:
        AddText("Failed...");
        num=(int)random(Nanbo.MaxHP*0.3f)+(int)random(10);
        Nanbo.HP-=num;
        AddText("HP "+num+" DAMAGE");
        break;      
      }
    }
    else if(EventID==1)
    {
       AddText("Lecture Event!");
      int rnd=(int)random(3);
      int num=0;
      switch(rnd)
      {
        case 0:
        AddText("Succeeded!");
        num=(int)random(ItemNameList.length);
        Nanbo.GetItem(num);
        AddText("Item "+ItemNameList[num]+" Get\n"+ItemEffectList[num]);
        break;
        
        case 1:
        AddText("Failed...");
        num=(int)random(Nanbo.MaxHP*0.1f)+(int)random(10);
        Nanbo.HP-=num;
        AddText("HP "+num+" DAMAGE");
        break;
        
        case 2:
        AddText("Failed...");
        num=(int)random(3000,10000);
        Nanbo.Money-=num;
        AddText("Money "+num+" Lost");       
        break;
      }
    }
    else if(EventID==2)
    {
       AddText("Volunteer Event!");
      int rnd=(int)random(5);
      int num=0;
      switch(rnd)
      {
        case 0:
        AddText("Succeeded!");
        num=(int)random(ItemNameList.length);
        Nanbo.GetItem(num);
        AddText("Item "+ItemNameList[num]+" Get\n"+ItemEffectList[num]);
        break; 
        
        case 1:
        AddText("Succeeded!");
        num=(int)random(Nanbo.Defense*0.1f)+(int)random(10);
        Nanbo.Defense+=num;
        AddText("Defense "+num+" UP");
        break; 
        
        case 2:
        AddText("Failed...");
        num=(int)random(Nanbo.Defense*0.03f)+(int)random(10);
        Nanbo.Defense-=num;
        AddText("Defense "+num+" DOWN");
        break; 
        
         case 3:
        AddText("Failed...");
        num=(int)random(Nanbo.MaxHP*0.3f)+(int)random(10);
        Nanbo.HP-=num;
        AddText("HP "+num+" Damage");
        break; 
        
        case 4:
        AddText("Succeeded!");
        num=(int)random(Nanbo.AttackSpeed*0.15f)+(int)random(10);
        Nanbo.AttackSpeed+=num;
        AddText("AttackSpeed "+num+" UP");
        break; 
    }
      
    }
     else if(EventID==3)
    {
       AddText("Lunch Event!");
      int rnd=(int)random(1);
      int num=0;
      switch(rnd)
      {
         case 0:
        AddText("Succeeded!");
        num=(int)random(ItemNameList.length);
        Nanbo.GetItem(num);
        AddText("Item "+ItemNameList[num]+" Get\n"+ItemEffectList[num]);
        break; 
        
        case 1:
        AddText("Failed...");
        num=(int)random(Nanbo.MaxHP*0.1f)+(int)random(10);
        Nanbo.HP-=num;
        AddText("HP "+num+" Damage");
        break;
        
        case 2:
        AddText("Succeeded!");
        num=(int)random(Nanbo.MaxHP*0.3f)+(int)random(10);
        Nanbo.HP+=num;
        AddText("HP "+num+" Heal");
        break;
        
        case 3:
        AddText("Failed...");
        num=(int)random(500,1000);
        Nanbo.Money-=num;
        AddText("Money "+num+" Lost");
        break;
      }  
  }
  else if(EventID==4)
  {
     AddText("Nap Event!");
     int num=(int)random(Nanbo.MaxHP*0.4f,Nanbo.MaxHP)+(int)random(10);
     Nanbo.HP+=num;
     AddText("HP "+num+" Heal");
    
  }
  else if(EventID==5)
  {
    AddText("PartTime Job Event!");
       int rnd=(int)random(1);
      int num=0;
      switch(rnd)
      {
         case 0:
        AddText("Succeeded!");
        num=(int)random(1000,10000);
        Nanbo.Money+=num;
        AddText("Money "+num+" Get");
        break; 
      }
  }
  else if(EventID==6)
  {
     AddText("Shopping Event!");
       int rnd=(int)random(1);
      int num=0;
      switch(rnd)
      {
         case 0:
        AddText("Succeeded!");
        num=int(enemyLevel* 500 * random(0.7f,1.3f));
        Nanbo.Money-=num;
        AddText("Money "+num+" Lost");
        num=(int)random(ItemNameList.length);
        Nanbo.GetItem(num);
        AddText("Item "+ItemNameList[num]+" Get\n"+ItemEffectList[num]);
        break; 
      }
  }
    
  }
  
  void AddText(String text)
  {
     _fate.stringList[_fate.StringLength]=text;
     _fate.StringLength++;

  }
  
  
}
