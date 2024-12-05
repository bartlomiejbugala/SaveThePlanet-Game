//Setting up basic info for the game

float hp = 1250;
float currenthp = 1250;

float mp = 500;
float currentmp = 500;

//RNG for when enemy is choosing a move
float move1;
int move;

void rng()
{
  move1 = random(0,3);
  move1 = round(move1);
  move = (int) move1;
}
