// Declares global Data Memory
Figures figs;

// Declare Saving Status
boolean saving;

// Setups the Canvas
void setup()
{
  // Defines Size of Canvas
  size(500, 300);
  // Generates Figures Object
  figs = new Figures();
  
  // Sets Saving to no
  saving = false;
  Menue();
}

// Class for Handling the Points
class Point
{
  // Declare X and Y Position of Point
  int x, y;
  
  // Method to initialize Point Position
  void initialize()
  {
    // Random X and Y Position from Canvas Size
    x = int(random(width));
    y = int(random(height));
  }
  
  // Method to make brownien Motion
  void brownien()
  {
    // Brownien Motion from Random
    x = x + int(random(12)-6);
    y = y + int(random(12)-6);
    
    // Correct Position to be in Canvas
    // Right and Upper Edge Correction
    x = min(x, width);
    y = min(y, height);
    // Left and down Edge Correction 
    x = max(x, 0);
    y = max(y, 0);
  }
}

// Class for Handling Figure
class Figure
{
  // Declare Memory for the needed 4 Points
  Point[] points = new Point[4];
  // Declare Memory for the Color of the Figure
  color col;
  
  // Intialzing a Figure
  void initialize()
  {
    // Go through the needed Points
    for(int n = 0; n < 4; n++)
    {
      // Declare actual Point
      points[n] = new Point();
      // Initialize the actual Point
      points[n].initialize();
    }
    // Define Color of the Figure
    col = color(random(255), random(255), random(255), random(255));
  }
  
  // Method to Handling Brownien Motion for the Figure
  void brownien()
  {
    // Go through the Points of the Figure
    for(int n = 0; n < 4; n++)
    {
      //Call Brownien Motion for the actual Point 
      points[n].brownien();
    }
  }
  
  // Method to Handling Drawing of the Figure
  void drawing()
  {
    // Set actual Color to Figure Color
    fill(col);
    // Draws the Figure as Bezier-Curve with the given Points
    bezier(points[0].x, points[0].y, points[1].x, points[1].y,
           points[2].x, points[2].y, points[3].x, points[3].y);
  }
}

// Class to handling all Figures
class Figures
{
  // Declare Memory for the Figures
  Figure[] figs = new Figure[6];
  
  // Constructor Method to Consruct all Figures
  Figures()
  {
    // Iterate through all neded Figures
    for(int n = 0; n < 6; n++)
    {
      // Define actual Figzure and initalize them
      figs[n] = new Figure();
      figs[n].initialize();
    }
  }
  
  // Method to draw all Figures
  void drawing()
  {
    // Set Background to whithe
    background(255);
    // Iterate through all needed Figures
    for(int n = 0; n < 6; n++)
    {
      // Call Brownien Motion for actual Figure
      figs[n].brownien();
      // Makes drawing for actual Figure
      figs[n].drawing();
    }
  }
}

// Method to Record the Dancing Figures
void saveImage()
{
  saveFrame("Figurees-######.png");
}

// Draw Routine
void draw()
{
  // Draws Figure
  figs.drawing();
  if(saving){ saveImage();};
}

// Method to Handling key Pressed Events
void keyPressed()
{
  // Switch for the presed key
  switch(key)
  {
    // Handling Saving Start Events
    case 's': saving = true; break;
    // Handling Saving End Events
    case 'a': saving = false; break;
  }
}

// Prsent a little Menue
void Menue()
{
  println("Welcome to the Kandinsky Curves Dancer");
  println("See the Curves Dancing");
  println("With the s key you can start to record");
  println("And with the a key you can stop recording");
}
