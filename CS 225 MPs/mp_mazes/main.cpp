#include <iostream>
#include "dsets.h"
#include "maze.h"
#include "cs225/PNG.h"

using namespace std;

int main()
{
    SquareMaze maze;
    maze.makeMaze(2, 2);
    //cs225::PNG * png = maze.drawMazeWithSolution();
    //png->writeToFile("my_maze.png");
    return 0;
}
