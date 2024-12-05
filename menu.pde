PImage trash;
PImage warrior;
PImage planet;
PImage polluted;
PImage gameover;

int page;
int menu;
int fightMove;
int spellMove;
int itemMove;
int currentEnemy;
float currentEnemyHp;
float enemyHp;

void setup()
{
  page = 1;
  menu = 1;
  fightMove = 1;
  spellMove = 1;
  itemMove = 1;
  currentEnemy = 1;
  size(900,650);
  trash = loadImage("trash.png");
  warrior = loadImage("warrior.png");
  gameover = loadImage("game over.png");
  planet = loadImage("planet.png");
  polluted = loadImage("polluted.png");
  
  if(currentEnemy == 1)
  {
    enemyHp = bosshp;
    currentEnemyHp = bosshpcurrent;
  }
}
  

void draw()
{
  background(0);
  
  if(currentEnemyHp <= 0)
  {
    bosshp = 0;
  }
  
  if(bosshp == 0)
  {
    page = 10;
  }
  
  if(currenthp <= 0)
  {
    hp = 0;
  }
  
  if(hp == 0)
  {
    page = 11;
  }

  
  //Game start page
  if(page == 1)
  {
    info();
    text("Press 'x' to return, and 'z' to select while in-game.", 0, 645);
    textSize(75);
    text("Save the planet", 200,100);
    textSize(75);
    //Switch to actual game
    
    
    //Chooses which enemy to use
  }
  
  //Begins the game 
  if(page == 2)
  {
    begin();
    enHp();
    
    //Interacting with the menu
    
    //Fight
    if(menu == 1)  
    {
      if(keyPressed == true)
      {
        if(key == 'z')
        {
          {
            page = 3;
          }
        }
      }
    }
    
    //Spell
    else if(menu == 2)
    {
    if(keyPressed == true)
      {
        if(key == 'z')
        {
          {
            page = 4;
          }
        }
      }
    }
    
    //Item
    else if(menu == 3)
    {
    if(keyPressed == true)
      {
        if(key == 'z')
        {
          {
            page = 5;
          }
        }
      }
    }
  }
  
  //Load the fight menu
  if(page == 3)
  {
    game();
    userMovesList();
    back();
    slashHighlight();
    stabHighlight();
    bluntHighlight();
    sliceHighlight();
    moveExplain();
    enHp();
  }
  
  //Load spell menu
  if(page == 4)
  {
    game();
    back();
    lines();
    fireMove();
    frostMove();
    shieldMove();
    currentStat();
    enHp();
  }
  
  //Load item menu
  if(page == 5)
  {
    game();
    back();
    manaPot();
    healthPot();
    itemInfo();
    itemLine();
    enHp();
  }
  
  if(page == 6)
  {
    game();
    mpText();
    back();
    returnTxt();
    enHp();
    if(key == 'x')
    {
      enMove();
    }
  }
  
  if(page == 7)
  {
    game();
    back();
    hpText();
    returnTxt();
    enHp();
    if(key =='x')
    {
      enMove();
    }
  }
  
  if(page == 8)
  {
    game();
    back();
    returnTxt();
    enHp();
    dmgtxt();
  }
  
  if(page == 9)
  {
    back();
    game();
    returnTxt1();
  }
  
  if(page == 10)
  {
    cutend();
    cong();
  }
  
  if(page == 11)
  {
    gameOver();
    gameOver1();
  }
  
  if(page == 12)
  {
    game();
  }
  
  if(page == 13)
  {
    cutstart();
    back();
  }
}

//To return back to the menu page
void back()
{
  if(keyPressed == true)
  {
    if(key == 'x')
    {
      page = 2;
    }
  }
}

void keyPressed()
{
  if(page == 1)
  {
    if(key == 'z')
    {
      page = 13;
    }
  }
  
  if(page == 2)
  {
    //For cycling through the menu
    if(key == CODED)
    {
      if(keyCode == RIGHT)
      {
        menu++;
      }
      else if(keyCode == LEFT)
      {
        menu--;
      }
      
      if(menu > 3)
      {
        menu = 1;
      }
      
      if(menu < 1)
      {
        menu = 3;
      }
    }
  }
  
  if(page == 3)
  {
    if(key == CODED)
    {
      if(keyCode == RIGHT)
      {
        fightMove++;
      }
      else if(keyCode == LEFT)
      {
        fightMove--;
      }
      
      if(fightMove > 4)
      {
        fightMove = 1;
      }
      
      if(fightMove < 1)
      {
        fightMove = 4;
      }
    }
     switch(fightMove)
      {
        case 1:
          if(key == 'z')
          {
            userMove1();
            enMove();
            page = 8;
          }
          break;
          
          case 2:
            if(key == 'z')
            {
              userMove2();
              enMove();
              page = 8;
            }
            break;
            
          case 3:
            if(key == 'z')
            {
              userMove3();
              enMove();
              page = 8;
            }
            break;
            
          case 4:
            if(key == 'z')
            {
              userMove4();
              enMove();
              page = 8;
            }
          break;
      }
  }
  
  if(page == 4)
  {
    if(key == CODED)
    {
      if(keyCode == RIGHT)
      {
        spellMove++;
      }
      else if(keyCode == LEFT)
      {
        spellMove--;
      }
      
      if(spellMove > 3)
      {
        spellMove = 1;
      }
      
      if(spellMove < 1)
      {
        spellMove = 3;
      }
    }
    
    //Chosing which spell to use
    switch(spellMove)
    {
      case 1:
        if(key == 'z')
        {
          fire();
          enMove();
          page = 9;
        }
      
      case 2:
        if(key == 'z')
        {
          frost();
          enMove();
          page = 9;
        }
      
      case 3:
        if(key == 'z')
        {
          shield();
          enMove();
          page = 9;
        }
    }
  }
  
  if(page == 5)
  {
    if(key == CODED)
    {
      if(keyCode == RIGHT)
      {
        itemMove++;
      }
      else if(keyCode == LEFT)
      {
        itemMove--;
      }
      
      if(itemMove > 2)
      {
        itemMove = 1;
      }
      
      if(itemMove < 1)
      {
        itemMove = 2;
      }
    }
     if(itemMove == 1)
     {
      if(key == 'z')
      {
        mpPotion();
        page = 6;
      }
    }
    
    if(itemMove == 2)
    {
      if(key == 'z')
      {
        hpPotion();
        page = 7;
      }
    }
  }
  
  if(page == 10)
  {
    if(keyPressed == true)
    {
      if(key == 'x')
      {
        page = 12;
      }
    }
  }
}

void info()
{
  text("Press 'z' to start",205,600);
  textSize(20);
}

//Loads basic game
void begin()
{
  background(0);
  game();
  stats();
  fightHighlight();
  magicHighlight();
  itemHighlight();
  lines();
}

//Basic GUI

void game()
{
  fill(200);
  rect(-5,450,910,200);
  image(trash,700,50);
  image(warrior,10,255);
}

//for the lines in page 2

void lines()
{
  fill(0);
  line(200,450,200,700);
  line(400,450,400,700);
  line(600,450,600,700);
}

//Explanations for moves in the Fight menu

void moveExplain()
{
  fill(0);
  textSize(25);
  text("Does 325 damage", 5, 600);
  text("Does 500 damage", 235, 600);
  text("Does 300 damage", 455, 600);
  text("Does 250 damage", 680, 600);
}

//function for stats

void stats()
{
  fill(0);
  textSize(30);
  text("HP: " + currenthp + "/" + hp, 650, 535);
  text("MP: " + currentmp + "/" + mp, 650, 595);
}

//these make the text yellow when are highlighted

void fightHighlight()
{
  fill(0);
  textSize(70);
  text("Fight", 25, 564);
  if(menu == 1)
  {
    fill(255,255,0);
    text("Fight", 25, 564);
  }
}

void magicHighlight()
{
  fill(0);
  textSize(70);
  text("Magic", 215, 564);
  if(menu == 2)
  {
    fill(255,255,0);
    text("Magic", 215, 564);
  }
}

void itemHighlight()
{
  fill(0);
  textSize(70);
  text("Item", 435, 564);
  if(menu == 3)
  {
    fill(255,255,0);
    text("Item", 435, 564);
  }
}

//for page 3, the "fight" page

void userMovesList()
{
  fill(0);
  textSize(70);
  text("Slash", 30, 564);
  text("Stab", 265, 564);
  text("Blunt", 480, 564);
  text("Slice", 705, 564);
  
  line(225,450,225,700);
  line(450,450,450,700);
  line(675,450,675,700);
}

//these highlight them in yellow

void slashHighlight()
{
  if(fightMove == 1)
  {
    fill(255,255,0);
    text("Slash", 30, 564);
  }
}

void stabHighlight()
{
  if(fightMove == 2)
  {
    fill(255,255,0);
    text("Stab", 265, 564);
  }
}

void bluntHighlight()
{
  if(fightMove == 3)
  {
    fill(255,255,0);
    text("Blunt", 480, 564);
  }
}

void sliceHighlight()
{
  if(fightMove == 4)
  {
    fill(255,255,0);
    text("Slice", 705, 564);
  }
}

void fireMove()
{
  fill(0);
  textSize(70);
  text("Fire", 45, 564);
  if(spellMove == 1)
  {
    fill(255,255,0);
    text("Fire", 45, 564);
  }
}

void frostMove()
{
  fill(0);
  textSize(70);
  text("Frost", 225, 564);
  if(spellMove == 2)
  {
    fill(255,255,0);
    text("Frost", 225, 564);
  }
}

void shieldMove()
{
  fill(0);
  textSize(70);
  text("Shield", 405, 564);
  if(spellMove == 3)
  {
    fill(255,255,0);
    text("Shield", 405, 564);
  }
}

//Information for Spell page

void currentStat()
{
  fill(0);
  textSize(30);
  text("MP: " + currentmp + "/" + mp, 630, 564);
  text("Costs: 450 MP", 15, 595);
  text("Costs: 450 MP", 215, 595);
  text("Costs: 150 MP", 415, 595);
  text("Around 310", 15, 620);
  text("Around 310", 215, 620);
  text("damage", 15, 642);
  text("damage", 215, 642);
  text("150hp shield", 415, 620);
}

//for the item menu

void itemLine()
{
  line(450,450,450,700);
}

void manaPot()
{
  fill(0);
  textSize(70);
  text("Mana Potion", 5, 564);
  if(itemMove == 1)
  {
    fill(255,255,0);
    text("Mana Potion", 5, 564);
  }
}

void healthPot()
{
  fill(0);
  textSize(70);
  text("Health Potion", 455, 564);
  if(itemMove == 2)
  {
    fill(255,255,0);
    text("Health Potion", 455, 564);
  }
}

void itemInfo()
{
  fill(0);
  textSize(30);
  text("Adds 100 MP", 10, 600);
  text("Adds 150 HP", 460, 600);
}

void mpText()
{
  fill(0);
  textSize(55);
  text("Your MP has been increased by 100.", 25, 564);
}

void hpText()
{
  fill(0);
  textSize(55);
  text("Your HP has been increased by 150.", 25, 564);
}

void returnTxt()
{
  fill(0);
  textSize(20);
  text("Press 'x' to return", 25, 640);
}

void returnTxt1()
{
  fill(0);
  textSize(70);
  text("Press 'x' to return", 160, 575);
}

//Enemy HP bar
void enHp()
{
  fill(255);
  textSize(45);
  text("Boss HP: " + currentEnemyHp + "/" + enemyHp, 0, 45);
}

void gameOver()
{
  fill(255);
  textSize(100);
  text("Game Over", 200, 80);
}

void gameOver1()
{
  fill(255);
  textSize(50);
  text("Your health reached '0'", 200, 600);
  image(gameover,250,100);
}

void dmgtxt()
{
  fill(0);
  float dmg = 0;
  switch(fightMove)
      {
        case 1:
          dmg = slash;
          text("You have dealt " + dmg + " damage, enemy is resistant.", 0, 564);
          break;
          
        case 2:
          dmg = stab;
          text("You have dealt " + dmg + " damage, enemy is resistant.", 0, 564);
          break;
            
        case 3:
          dmg = blunt;
          text("You have dealt " + dmg + " damage.", 0, 564);
          break;
            
        case 4:
          dmg = slice;
          text("You have dealt " + dmg + " damage.", 0, 564);
          break;
      }
}
