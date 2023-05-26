// Setting up the Canvas Enviroment
void setup()
{
  // Set Size to 300 * 500 Pixels
  size(300, 500);
  // Prsent the Menue to beginn
  menue();
}

// Definie Class of Lines
class Line{
  // Declare Class Variables for Coordinate of Line
  int x1, x2;
  int y1, y2;
  
  // Initialize the Line
  void intilize()
  {
    // Specify one Point of Line
    x1 = int(random(width));
    y1 = int(random(width));
    
    // Specific other Point of Line
    x2 = int(random(width));
    y2 = int(random(width));
  }
  
  // Paint the Line
  void paint( int xd, int yd)
  {
    line(x1+xd, y1+yd, x2+xd, y2+yd);
  }
  
  // Method to draw the Lines
  void paintMultiple()
  {
     // Estimate the Number of Lines
     int z = int(random(6));
     // Iterate about the Number of Lines
     for( int n = 0; n <= z; n++)
    {
      // Chosse a Position to draw the actual Line
      int xd1 = int(random(width)-(width/2));
      int yd2 = int(random(height)-(height/2));
      // Draw the actual Line
      paint(xd1, yd2);
    }
  }
     
}

// Drawer Methode
void drawer()
{
  // Clear the Background to whithe.
  background(255);
  // Create a Line Type
  Line rected = new Line();
  rected.intilize();
  // Paint all of the Lines
  rected.paintMultiple();
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
