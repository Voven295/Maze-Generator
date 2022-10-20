int w = 30;
int cols;
int rows;
Cell[][] grid;
Cell current, next;
ArrayList<Cell> Path = new ArrayList<Cell>();
boolean solved = false;
void setup()
{ 
  fullScreen();
  frameRate(40);  
  //size(1000, 1000); 
  background(0);
  noStroke();
  cols = width/w;
  rows = height/w;
  grid = new Cell[cols][rows];  

  for (int i= 0; i < cols; i++)  
  {
    for (int j = 0; j < rows; j++)
    {  
      Cell cell = new Cell(i, j);
      grid[i][j] = cell;
    }
  }
  current = grid[0][0];
  Path.add(current);
}

void draw()
{ 
  if (solved)
    return;
    
  current.visited = true;
  current.GuideCell();
  next = CheckNeightbours(current);
  
  if (next != null)
  {
    int xdif = next.i - current.i;
    int ydif = next.j - current.j;
    if(xdif == 1) current.walls[1] = false;  
    if(xdif == -1) next.walls[1] = false;
    if(ydif == 1) next.walls[0] = false; 
    if(ydif == -1) current.walls[0] = false;
    Path.add(current);
    current = next;
  } else 
  {
    Path.remove(current);
    if (Path.size() == 0)
      solved = true;
    else
      current = Path.get(Path.size() - 1);
  }
   for (int i= 0; i < cols; i++)  
  {
    for (int j = 0; j < rows; j++)
    {  
      grid[i][j].Show();       
    }
  }

}

Cell CheckNeightbours(Cell current)
{
  ArrayList<Cell> leisureNeightbours = new ArrayList<Cell>();
  int i = current.i;
  int j = current.j;
  Cell topNeightbour, bottomNeightbour, rightNeightbour, leftNeightbour;

  if (i > 0)
  {
    topNeightbour = grid[i - 1][j];
    if (!topNeightbour.visited)
    {
      leisureNeightbours.add(topNeightbour);
    }
  }

  if (i < cols - 1)
  {
    bottomNeightbour = grid[i + 1][j];
    if (!bottomNeightbour.visited)
    {
      leisureNeightbours.add(bottomNeightbour);
    }
  }

  if (j < rows - 1)
  {
    rightNeightbour = grid[i][j + 1];
    if (!rightNeightbour.visited)
    {
      leisureNeightbours.add(rightNeightbour);
    }
  }

  if (j > 0)
  {
    leftNeightbour = grid[i][j - 1];
    if (!leftNeightbour.visited)
    {
      leisureNeightbours.add(leftNeightbour);
    }
  }  

  if (leisureNeightbours.size() > 0)
  {
    int r = floor(random(0, leisureNeightbours.size()));   
    return leisureNeightbours.get(r);
  } else return null;
}
