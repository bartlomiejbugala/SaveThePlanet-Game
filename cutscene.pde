void cutend()
{
  fill(255);
  textSize(27);
  text("You have beaten Trynash, you have saved the planet from overcoming pollution.", 0, 560);
}

void cong()
{
  fill(255);
  textSize(75);
  text("Congratulations", 200, 76);
  image(planet,250,70);
}

void cutstart()
{
  image(polluted,250,50);
  fill(255);
  textSize(27);
  text("You must defeat Trynash to save the planet, ", 150, 510);
  text("he has means of pollution of the whole entire planet.", 150, 540);
  text("He has to stopped at all costs.", 150, 570);
  text("Press 'x' to continue", 10, 630);
}
