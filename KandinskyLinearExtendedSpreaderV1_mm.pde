// Setting up the Canvas Enviroment
void setup()
{
  // Set Size to 300 * 500 Pixels
  size(300, 500);
  // Prsent the Menue to beginn
  menue();
}

// Method to draw the SubLine
void drawSubLine(float x1, float y1, float x2, float y2, float thickness, float rr)
{
  // Calculation of Delta of Line to Coordinates
  float dd = (y2 - y1)/(x2 - x1);
  // Calculation of the alpha Arc from Delta
  float alpha = atan(dd);
  // Rotation about a quarter Arc
  float alpa = alpha + HALF_PI;
  // Recsizing of the new Arc
  alpa = alpa % PI;
  
  // Chose a new lenght for the Subline
  float r = random(rr);
  
  // Calculation of the delta Lenghts
  // Calculation of dx3 
  float dx3 = - cos(alpa) * r/2;
  // Calculation of dy3
  float dy3 = - sin(alpa) * r/2;
  // Calculation of x4
  float dx4 = cos(alpa) * r/2;
  // Calculation of y4
  float dy4 = sin(alpa) * r/2;
  
  // Calculation of the Point of the Line
  // which cross the Master and Sub Lines
  // Chose the relativ Position of the Crossing
  float fac = random(1);
  // Calculation of the Coordinates
  // X Coordinate of Crossing
  float xz = ((x1*fac)+(x2*(1-fac)));
  // Y Coordinate of Crossing
  float yz = ((y1*fac)+(y2*(1-fac)));
  
  // Calculation of the Absolute Coordinates
  // for the Sub Line
  // Calculation of Absolute X3
  float x3 = dx3 + xz;
  // Calculation of Absolute Y3
  float y3 = dy3 + yz;
  // Calculation of Absolute X4
  float x4 = dx4 + xz;
  // Calculation of Absolute Y4
  float y4 = dy4 + yz;
  
  // Seting and Calculation of the Weight of the Sub Line
  strokeWeight(random(thickness)/3);
  // Drawing the Sub Line
  line(x3, y3, x4, y4);
}

// Mehod to draw the Line Set
void drawLineSet()
{
  // Set Random weigth of Stroke for the Master Line
  float dd = random(height/36);
  strokeWeight(dd);
  // Callculation of the Absolute Valuees for the Master Line
  // Calculation of x1
  float x1 = random(width);
  // Calculation of y1
  float y1 = random(height);
  // Calculation of x2
  float x2 = random(width);
  // Calculation of y2
  float y2 = random(height);
  
  // Draws the Master Line
  line(x1, y1, x2, y2);
  
  // Chosing number of Sub Lines
  int z = int(random(6));
  // Iterrate about the neededd Sub-Lines
  for( int n = 0; n < z; n++)
  {
    // Calling the Method to draw the Sub Line
    // And Calculate the Lenght of the Master Line
    drawSubLine(x1, y1, x2, y2, dd, pow((pow((x2-x1), 2)+pow((y2-y1), 2)), 0.5));
  }
}

// Drawer Methode
void drawer()
{
  // Set Background Back to White
  background(255);
  // Estimate the NUmber of to drawing Line-Sets
  int z = int(random(6));
  // Iterate about each to draw Line
  for(int i = 0; i < z; i++)
  {
   // Call Method to draw the Line Set
   drawLineSet(); 
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
