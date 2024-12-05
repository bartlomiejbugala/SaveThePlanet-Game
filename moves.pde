//Setting up float values for moves and stuff

float slash;
float slice;
float blunt;
float stab;

float fire;
float frost;

float enMove1;
float enMove2;
float enMove3;

//Enemy Move, chooses which move to use
void enMove() 
{
  rng();
  
  switch(move)
  {
    case 1:
      enMove1 = 75;
      currenthp = currenthp - enMove1;
      break;
      
    case 2:
      enMove2 = 150;
      currenthp = currenthp - enMove2;
      break;
      
    case 3:
      enMove3 = 35;
      currenthp = currenthp - enMove3;
      break;
  }
}



//Player moves

void userMove1()
{
  slash = 325;
  if(currentEnemy == 1) //enemy is resitant to the move so the damage is decreased
  {
    slash = slash/2;
    currentEnemyHp -= slash;
  }
  else
  {
    currentEnemyHp -= slash;
  }
  println(slash);
  println(currentEnemyHp);
}

void userMove2()
{
  stab = 500;
  if(currentEnemy == 1)
  {
    stab = stab/4;
    currentEnemyHp -= stab;
  }
  else
  {
    currentEnemyHp -= stab;
  }
}

void userMove3()
{
  blunt = 300;
  currentEnemyHp -= blunt;
}

void userMove4()
{
  slice = 250;
  currentEnemyHp -= slice;
}

//Player spells
void fire()
{
  if(currentmp >= 300)
  {
    fire = 300;
    currentEnemyHp -= fire;
    currentmp = currentmp - 300;
  }
}

void frost()
{
  if(currentmp >= 300)
  {
    frost = 300;
    currentEnemyHp -= frost;
    currentmp-= 300;
  }
}

void shield()
{
  if(currentmp >= 150) //checks MP amount
  {
    currenthp += 150;
    currentmp -= 150;
  }
}

//Player items
void mpPotion()
{
  if(currentmp <= 400) //checks MP amount
  {
    currentmp += 100;
  }
  else
  {
    currentmp = 500;
  }
}

void hpPotion()
{
  if(currenthp < 1100) //checks HP amount
  {
    currenthp += 150;
  }
  else
  {
    currenthp = 1250;
  }
}
