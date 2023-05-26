// Setting up the Canvas Enviroment
void setup()
{
  // Set Size to 300 * 500 Pixels
  size(300, 500);
  // Prsent the Menue to beginn
  menue();
}

// Define Class for Lines
class Line{
  // Declare Class Variables for the Points
  // of the Line
  int x1, x2;
  int y1, y2;
  // Declare Class Variables for derivated
  // Location Vectors
  float dx3, dx4;
  float dy3, dy4;
  
  // Initalize the Line
  void intilize()
  {
    // Choose Position for first Point of Line
    x1 = int(random(width))-(width/2);
    y1 = int(random(height))-(height/2);
    
    // Choose Position for second Point of Line 
    x2 = int(random(width)-(width/2));
    y2 = int(random(width)-(height/2));
  }
  
  // Method to draw a Line
  void paint( int xd, int yd)
  {
    line(x1+xd, y1+yd, x2+xd, y2+yd);
  }
  
  // Method to derivative a Line from another
  void derivateFromLine( Line line)
  {
    // Calculation of Delta of Line to Coordinates from given Line
  float dd = (float(line.y2) - float(line.y1))/(float(line.x2) - float(line.x1));
  // Calculation of the alpha Arc from Delta
  float alpha = atan(dd);
  // Rotation about a quarter Arc
  float alpa = alpha + HALF_PI;
  // Recsizing of the new Arc
  alpa = alpa % PI;
  
  // Chose a new lenght for the Subline
  float r = random(pow(pow((line.x2 - line.x1),2)+pow((line.y2 - line.y1), 2), 0.5));
  
  // Calculation of the delta Lenghts
  // Calculation of dx3 
  dx3 = - cos(alpa) * r/2;
  // Calculation of dy3
  dy3 = - sin(alpa) * r/2;
  // Calculation of x4
  dx4 = cos(alpa) * r/2;
  // Calculation of y4
  dy4 = sin(alpa) * r/2;
 }
  
  // Choose new Position for this Subline along a given Master Line
  void recCalibrate(Line line)
  {
     // Calculation of the Point of the Line
    // which cross the Master and Sub Lines
    // Chose the relativ Position of the Crossing
    float fac = random(1);
    // Calculation of the Coordinates
    // X Coordinate of Crossing
    float xz = ((line.x1*fac)+(line.x2*(1-fac)));
    // Y Coordinate of Crossing
    float yz = ((line.y1*fac)+(line.y2*(1-fac)));
    
    // Calculation of the Absolute Coordinates
    // for the Sub Line
    // Calculation of Absolute X3
    x1 = int(dx3 + xz);
    // Calculation of Absolute Y3
    y1 = int(dy3 + yz);
    // Calculation of Absolute X4
    x2 = int(dx4 + xz);
    // Calculation of Absolute Y4
    y2 = int(dy4 + yz);
  }
     
}

// Method to draw the Line Sets
void drawer()
{
  // Clear the Background to whithe
  background(255);
  // Generate a Type of Master Lines
  Line lined = new Line();
  lined.intilize();
  
  // Choose a Nuber of equal Master Lines
  int z = int(random(6));
  // Iterates about the Master Lines
  for( int n = 0; n < z; n++)
  {
    // Choose Position of actual Master Line
    int dx = int(random(width));
    int dy = int(random(height));
    // Paint the actual Master Line
    lined.paint(dx, dy);
    // Derivate a Subline from the actual Master Line
    Line subline = new Line();
    subline.derivateFromLine( lined);
 
    // Choose Number of SubLines
    int zz = int(random(6));
    // Iterrate about Numbers of SubLines
    for( int nn = 0; nn < zz; nn++)
    {
      // Choose a new Position along the Master Line
      subline.recCalibrate(lined);
      // Paint the actual SubLine
      subline.paint(dx, dy);
    }
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
