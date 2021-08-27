/*  ECE 220 MP6 - GAME OF LIFE
* This MP is made to to simulate game of life. To do this we must follow
* a set of rules to determine if a particular cell must be alive or dead.
* We do this using 2 methods: countLiveNeighbor and updateBoard. The first
* method is designed to calculate how many live neighbors a certain cell in
* a matrix has. The update board method then uses this information to determine
* if the cell should remain alive or become dead. In addition to these 2 methods,
* we also use the aliveStable method in order to determine if the population 
* of cells in the matrix have become stable. If they have become stable, the 
* simulation will end, if not then the simulation will continue running
* until the population becomes stable.
*   partners: ambala2, danahar2, sg49;
*/

/*
 * countLiveNeighbor
 * Inputs:
 * board: 1-D array of the current game board. 1 represents a live cell.
 * 0 represents a dead cell
 * boardRowSize: the number of rows on the game board.
 * boardColSize: the number of cols on the game board.
 * row: the row of the cell that needs to count alive neighbors.
 * col: the col of the cell that needs to count alive neighbors.
 * Output:
 * return the number of alive neighbors. There are at most eight neighbors.
 * Pay attention for the edge and corner cells, they have less neighbors.
 */

 
int countLiveNeighbor(int* board, int boardRowSize, int boardColSize, int row, int col){
	//initialize count to 0
    int count = 0;

    //loop over rows
	for(int i = row-1; i <= row+1; i++){
        //check if row is within  bounds of the board
		if(i >= 0 && i < boardRowSize){
            //loop over columns
			for(int j = col-1; j <= col+1; j++){
                //check if columns is within the bounds of the board
				if( j >= 0 && j < boardColSize){
                    //check if the cell isn't at (row, col)
					if(i != row || j != col){
                        //check if the cell is alive
						if(board[i*boardColSize+j] == 1){
                            //increment count if true
							count++;
						}
					}
				}
			}
		}
	}
	return count;
}

/*
 * Update the game board to the next step.
 * Input: 
 * board: 1-D array of the current game board. 1 represents a live cell.
 * 0 represents a dead cell
 * boardRowSize: the number of rows on the game board.
 * boardColSize: the number of cols on the game board.
 * Output: board is updated with new values for next step.
 */

void updateBoard(int* board, int boardRowSize, int boardColSize) {
    //calculate size of board array
	int size = (boardColSize) * (boardRowSize);
    //create a copy array to save board values into of the same size as board
    int copy[size];
    
    //save current board into copy
    for(int k = 0; k < size; k++){
        copy[k] = board[k];
    }

    //create nested for loops to increment over rows and columns
    for(int i = 0; i < boardRowSize; i++){
        for(int j = 0; j < boardColSize; j++){
            //call countLiveNeighbor in order to find game conddition for the cell
            int liveN = countLiveNeighbor(copy, boardRowSize, boardColSize, i, j);
            if(copy[i*boardColSize + j] == 1){
                //set game condition for under-population
                if(liveN < 2){
                    board[i*boardColSize + j] = 0;
                //set game condition for over-population
                } else if (liveN > 3){
                    board[i*boardColSize + j] = 0;
                }
            //set game condition for reproduction
            } else if (liveN == 3){
                board[i*boardColSize + j] = 1;
            }
        }
    }
}

/*
 * aliveStable
 * Checks if the alive cells stay the same for next step
 * board: 1-D array of the current game board. 1 represents a live cell.
 * 0 represents a dead cell
 * boardRowSize: the number of rows on the game board.
 * boardColSize: the number of cols on the game board.
 * Output: return 1 if the alive cells for next step is exactly the same with 
 * current step or there is no alive cells at all.
 * return 0 if the alive cells change for the next step.
 */ 
int aliveStable(int* board, int boardRowSize, int boardColSize){
    //calculate size of board array
	int size = boardColSize * boardRowSize;
    //create two arrays for old and new board condition
    int old[size];
    int new[size];

    //create condition for whether all the array elements are 0
    int allZero = 0;
    //check all the array elements to test for null array
    for(int k = 0; k < size; k++){
        if(board[k] != 0){
            //allZero becomes one if any element is 0
            allZero = 1;
            break;
        }
    }
    //return 1 if there are no alive cells in the array
    if(allZero == 0){
        return 1;
    }

    //copy the game board into the old and new arrays
    for(int k = 0; k < size; k++){
        old[k] = board[k];
        new[k] = board[k];
    }

    //update new with the next state of the game of life
    updateBoard(new, boardRowSize, boardColSize);

    //create for loop to compare the old and new arrays
    for(int k = 0; k < size; k++){
        //return 0 if any element of old and new is different
        if(old[k] != new[k]){
            return 0;
        }
    }
    //return 1 if all the elements of old and new are the same
    return 1;
}