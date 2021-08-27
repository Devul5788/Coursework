#include <stdio.h>
#include <stdlib.h>
#include "maze.h"


/*
 * createMaze -- Creates and fills a maze structure from the given file
 * INPUTS:       fileName - character array containing the name of the maze file
 * OUTPUTS:      None 
 * RETURN:       A filled maze structure that represents the contents of the input file
 * SIDE EFFECTS: None
 */

 //in this MP we used parsed a maze file and recursively found soultion from the
 //start to the end point in the maze. This was done using 4 functions. The createmaze
 //function initilized the maze by parsing the file and dynamically allocating enough
 //space for all the elements for the maze structure. The destroy maze made sure that
 //any space allocated by the maze is destroyed. The printmaze function properly printed
 //the maze in the correct format. Finally, the solveMazeDFS used recursive backtracking
 //in order to solve the maze.
 //netid: danahar2, sg49


maze_t * createMaze(char * fileName)
{
    //create a file input stream
    FILE *in_file = fopen(fileName, "r");
    
    //dynamically allocate memory for maze 
    maze_t *maze = malloc(sizeof(maze_t));

    //takes the first 2 elements of maze and sets it the maze qidth and height
    fscanf(in_file, "%d %d", &maze->width, &maze->height);

    //dynamically allocates space for 1D array of array pointers
    maze->cells = (char**) malloc(maze->height * sizeof(*maze->cells));

    int i, j;

    //for loop is set up dynamically allocating enough space for all the cells
    for (i = 0; i < maze->height; i++) {
        maze->cells[i] = (char*) malloc(maze->width * sizeof(maze->cells));
    }

    i = 0;

    //double for loop for parsing the file and setting up the cell elements the maze
    for(i = 0; i < maze->height; i++){
        for(j = 0; j < maze->width; j++){
            char c;
            //do while loop to make sure that the new line char is skipped.
            do{
                fscanf(in_file, "%c", &c);
            } while (c == '\n');

            //sets up all the relevant parts of the maze.

            maze->cells[i][j] = c;

            if (maze->cells[i][j] == 'S') {
                maze->startRow = i;
                maze->startColumn = j;
            }
            if (maze->cells[i][j] == 'E') {
                maze->endRow = i;
                maze->endColumn = j;
            }
        }
    }

    //closes file input stream
    fclose(in_file);

    return maze;
}

/*
 * destroyMaze -- Frees all memory associated with the maze structure, including the structure itself
 * INPUTS:        maze -- pointer to maze structure that contains all necessary information 
 * OUTPUTS:       None
 * RETURN:        None
 * SIDE EFFECTS:  All memory that has been allocated for the maze is freed
 */
void destroyMaze(maze_t * maze)
{
    //frees the memory that was dynamically allocated for maze and cells.
    int i;

    for(i = 0; i < maze->height; i++){
        free(maze->cells[i]);
    }

    free(maze->cells);
    free(maze);
    maze = NULL;
    return;
}

/*
 * printMaze --  Prints out the maze in a human readable format (should look like examples)
 * INPUTS:       maze -- pointer to maze structure that contains all necessary information 
 *               width -- width of the maze
 *               height -- height of the maze
 * OUTPUTS:      None
 * RETURN:       None
 * SIDE EFFECTS: Prints the maze to the console
 */
void printMaze(maze_t * maze)
{
    //prints the (i, j) element of the cell and formats it properly
    int i, j;
    for(i = 0; i < maze->height; i++) {
        for (j = 0; j < maze->width; j++) {
            char c = maze->cells[i][j];
            printf("%c", c);
        }
        printf("\n");
    }
}

/*
 * solveMazeManhattanDFS -- recursively solves the maze using depth first search,
 * INPUTS:               maze -- pointer to maze structure with all necessary maze information
 *                       col -- the column of the cell currently beinging visited within the maze
 *                       row -- the row of the cell currently being visited within the maze
 * OUTPUTS:              None
 * RETURNS:              0 if the maze is unsolvable, 1 if it is solved
 * SIDE EFFECTS:         Marks maze cells as visited or part of the solution path
 */ 
int solveMazeDFS(maze_t * maze, int col, int row)
{
    //makes sure that the row and col are in bounds
    if(row >= maze->height || col >= maze->width || row < 0 || col < 0) {
        return 0;
    }

    char c = maze->cells[row][col];

    //returns 1 if c is 'E' and 0 if c is 'S' or else sets if it is empty it sets it as a solution

    if(c != ' ') {
        if(c == 'E'){
            return 1;
        }
        if(c != 'S'){
            return 0;
        }
        if(c == '*' || c == '~'){
            return 0;
        }
    } else{
        maze->cells[row][col] = '*';
    }

    //makes sure that there are solutions to down, right, up, and left of the cell.

    if(solveMazeDFS(maze, col, row + 1)){
        return 1;
    } else if(solveMazeDFS(maze, col + 1, row)){
        return 1;
    } else if(solveMazeDFS(maze, col, row - 1)){
        return 1;
    } else if(solveMazeDFS(maze, col - 1, row)){
        return 1;
    } else {
        maze->cells[row][col] = '~';
    }


    //Left col - 1, row
    //Right col + 1, row
    //Up    col, row - 1
    //Down col, row + 1
    return 0;
}
