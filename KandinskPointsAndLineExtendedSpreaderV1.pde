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

// Method to draw a Circle Set
void drawCircles()
{
  // Chossing the Size of the Circle Set
  int dd = int(random(min(width, height)/6));
  // Choose the X Position of the Circle Set
  int x = int(random(width));
  // Chose the Y Position of the Circle Set
  int y = int(random(height));
  // Choose the Color of the outer Circle
  fill(random(255), random(255), random(255), random(255));
  // makes no Strokes
  noStroke();
  // draws the outer Circle
  circle(x, y, dd);
  // Choose the Color for the inner Circle
  fill(random(255), random(255), random(255), random(255));
  // draws the inner Circle and make it smaller then the outer
  circle(x, y, random(dd));
  // Enables Strokes Back
  stroke(4);
}

// Method to draw Table
void drawTable()
{
  // Calculation of the Boundaries for the Table
  // Calculation of the upper left Corner of the Table
  float x = float(width) * (2.0/3.0);
  float y = float(height) * (2.0/3.0);
  // Calculation of the Size of the Table
  float dx = (float(width) - x)  * (5.0/6.0);
  float dy = (float(height) - y)  * (5.0/6.0);
  
  // Choose Number of Column and Rows in Table
  int z1 = int(random(6));
  int z2 = int(random(6));
  
  // Declaration of Memory for Data Handling
  float xn1, yn1, xn2, yn2;
  // Outer Cycle through Table
  for(int n1 = 0; n1 < z1; n1++)
  {
    // Inner Cycle throuh Table
    for(int n2 = 0; n2 < z2; n2++)
    {
      // Choose Color for Cell in Table
      fill(random(255), random(255), random(255));
      // Calculation of the upper left Corner of Cell
      xn1 = x + (dx*n1/z1);
      yn1 = y + (dy*n2/z2);
      // Calculation of Size for the Cell
      xn2 = dx/z1;
      yn2 = dy/z2;
      // draw Cell 
      rect(xn1, yn1, xn2, yn2);
    }
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
  // Estimate the NUmber of to drawing Circle Sets
  z = int(random(6));
  // Iterate about each to draw Circle Sets
  for(int i = 0; i < z; i++)
  {
    // Call Method to draw the Circle Set
    drawCircles();
  }
  // Call Method to draw the Table
  drawTable();
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
