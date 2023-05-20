// Setting up the Canvas Enviroment
void setup()
{
  // Set Size to 300 * 500 Pixels
  size(300, 500);
  // Prsent the Menue to beginn
  menue();
}

// Drawer Methode
void drawer()
{
  // Set Background Back to White
  background(255);
  // Estimate the NUmber of to drawing Lines
  int z = int(random(36));
  // Iterate about each to draw Line
  for(int i = 0; i < z; i++)
  {
    // Set Random weigth of Stroke
    strokeWeight(random(height/36));
    // Draws a random Line
    line(random(width), random(height), random(width), random(height));
  }
}

// Empty draw Method for Control Loop
void draw()
{
}

// Metod to handle Key Pressed Events 
void keyPressed()
{
  // switch to the actual called Method
  switch( key )
  {
    // Handling Draw Events
    case 'n' : drawer(); break;
    // Handling Save Events
    case 's' : save("ActualImage.png"); break;
  }  
  menue();
}

// Menue presenting Method
void menue()
{
  println(" You can genereat a new Image with KexPressed n");
  println(" You can save the actual Image with KeyPresed s");
}
