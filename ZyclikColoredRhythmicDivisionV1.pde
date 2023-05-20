void setup()
{
  size(500, 500); // Quadratic Canvas
  menue(); // Prsent Menue
  colorMode(RGB, 255); // Set the right Color Mode
}

// define and declare global Propabilities
int no = 33; // for no Division
int du = 33; // for double Division
int tr = 33;  // for tripple Division

// Function to draw one Rectangle from x1 to x2
// and from Bottom to Hight
void drawRectangle( float x1, float x2, color c)
{
  // Set the Color for the Rectangle
  fill(c);
  // Sets Rectangle Mode to Corners
  // So true Coordinates can been used
  rectMode(CORNER);
  // Paint the Rectangle with this Coordinates
  // rect(x1, 0, x2, height);
  // Calculation of middle Canvas
  int x = width/2; // X Coordinate
  int dx = (width/6)*5; // X Boundary Space
  int y = height/2; // Y Coordinate
  int dy = (height/6)*5; // Y Boundary Space
  arc( x, y, dx, dy, x1, x2);
}

// Make the dualdivision
void dualdivision(float x1, float x2, int z)
{
  // Generate middle Point
  float xa;
  xa = (x1 + x2)/2;
  // Call division
  // left division
  division(x1, xa, z);
  // right division
  division(xa, x2, z);
}

// Make trippledivision
void trippledivision(float x1, float x2, int z)
{
  // Calculate Steps between Boundaries Points
  float xd;
  xd = (x2 - x1)/3;
  
  // Call division
  // make left Division
  // from left point to first middle Point
  division(x1, x1+xd, z);
  // make middle Division
  // from first middle Point to second middle Point
  division(x1+xd, x1+(xd*2), z);
  // make left Division
  // from sceond middle Point to right boundary Point
  division(x1+(xd*2), x2, z);
}

// Make finish Double Division
void deepdualdivision(float x1, float x2)
{
  // Estimate middle Point
  float xa;
  xa = (x1 + x2)/2;
  // Set Color for first Function = Tonika
  color c1 = color(0, 0, 255);
  // Draws Tonika Rectangle
  drawRectangle(x1, xa, c1);
  // Set Color for second Function = Dominante
  color c2 = color(255, 0, 0);
  // Draws Dominante Rectangle
  drawRectangle(xa, x2, c2);
}

// Make finish tripple Division
void deeptrippledivision(float  x1, float x2)
{
  // Estmate Step size between Rectangles
  float xd;
  xd = (x2 - x1)/3;
  // Set Color for first Function = Tonika
  color c1 = color(255, 0, 0);
  // Draws Toinka Rectangle
  drawRectangle(x1, (x1+xd) , c1);
  // Set Color for second Funktion = SubDominate
  color c2 = color(255, 255, 0);
  // Draws Rectangle for SubDominante
  drawRectangle(x1+xd, x1+(2*xd), c2);
  // Set Color for third Function = Dominante
  color c3 = color(0, 0, 255);
  // Draws Dominante Rectangle
  drawRectangle(x1+(2*xd), x2, c3);
}

// Make finish Division Choosing
void deepdivision( float x1, float x2)
{
    // Choose Division Type
    // Generate Random Choosing NUmber
    int zg = int(random( du + tr));
    // Chose double Division in lower Range
    if ( zg < du) { deepdualdivision( x1, x2); };
    // Chose tripple Division in higher Range
    if ( zg >= du ) { deeptrippledivision( x1, x2); };
}


// Main Function for Division
// Chose wich Division to Choose
void division( float x1, float x2, int z)
{
  // Test for not to much subdivisions
  z++;
  if ( z < 6 )
  {
    // Choose Division Type
    // Generate Random Choosing NUmber
    int zg = int(random(no + du + tr));
    // Generate Boundary for middle Choosing
    int z2 = no + du;
    // Choose no Division in first Range 
    if ( zg < no ) { deepdivision( x1, x2);};
    // Chose double Division in middle Range
    if ( (zg >= no ) && ( zg < z2 )) { dualdivision( x1, x2, z); };
    // Chose tripple Division in last Range
    if ( zg >= z2 ) { trippledivision( x1, x2, z); };
  }
  // if there to deep Subdivisions paint Rectangle
  else
  {
     deepdivision( x1, x2);
  }
}

// Dummy Method for Controll Loop
void draw()
{  
}

// Method to draw one Image
void drawing()
{
 // Draws Division
 division(0, TWO_PI, 0);
 // Set Color back to whithe
 fill(255, 255, 255);
 // make Hole in the middle of the Canvas
 circle((width/2), (height/2), (height/3));
}

// Method to draw the Menue
void menue()
{
  println( " Hello to the Easy Rhythmic Division Program");
  println( " You can generate a new Image press key n");
  println( " You can save the Image press key 1");
  println( " You can increase or decrease the probility for no Division keys q or w");
  println( " You can increase or decrease the probility for double Division keys a or s");
  println( " You can increase or decrease the probility for no Division keys y or x");
  println( " Just Probatility is " + no + " no " + du + " double " + tr + " Triple Divsion");
}

void recalibrateProbabilities()
{
  // Estimate actuall complete Probabilty
  int sum = no + du + tr;
  // Calculate recalibration Factor
  float fact = float(100)/sum;
  // Recalibrate the different Probabilties
  no = int( no * fact);
  du = int( du * fact);
  tr = int( tr * fact);
}

// Method to handle key Pressed Events
void keyPressed()
{
  // Switch to the selected Action
  switch(key){
    // Draw a new Image
    case 'n': drawing(); break;
    // Save the Image
    case '1': save("NewImage.jpg");
    // Decrease Increase Probabilty for no Division
    case 'q': no++; break;
    case 'w': no--; break;
    // Decrease Increase Probabilty for double Division
    case 'a': du++; break;
    case 's': du--; break;
    // Decrease Increase Probabilty for tripple Division
    case 'y': tr++; break;
    case 'x': tr--; break;
  }
  recalibrateProbabilities();
  menue(); 
}
