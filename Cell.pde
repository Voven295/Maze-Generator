class Cell
{
  int i, j, x, y;
  boolean visited = false;
  boolean[] walls = {true, true};//top, bottom, right, left 

  public Cell(int i, int j)
  {
    this.i = i;
    this.j = j;
  }

  void GuideCell()
{
   fill(255,222,173);
   noStroke();
   rect(x,y,w,w);
}

  void Show()
  {
    pushStyle();
    x = i * w;
    y = j * w;
    stroke(255);
    if (this.walls[0])
      line(x, y, x+w, y);   
    if (this.walls[1])
      line(x+w, y, x+w, y+w);   
    popStyle();
    if (this.visited)
    {
      fill(100,149,237, 100);
      rect(x, y, w, w);
    }
  }
}
