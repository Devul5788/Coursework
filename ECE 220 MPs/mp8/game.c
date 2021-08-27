/*
*	ECE 220 MP8 - 2048
*
*	In this MP, we have implemented the game of 2048 in c. We did this modifying
*	the file game.c, and implemented several functions in the process. 
*	make_game initializes the game settings by giving vaulues for number of rows,
*	columns etc. remake_game does the same thing, with minor changes.
*	destroy_game frees memory taken up by the previous game.
*	get_cell returns the pointer of a cell whose row and column index is known
*	move_w, move_s, move_a and move_d are functions that move the 2048 board
*	according to the rules of the game. They return 1 if the move is valid.
*	legal_move_check sees whether the game has ended by checking that the 
*	board is full and there are no tiles with the same number adjacent to 
*	one another.
*
*	partners: ambala2, danahar2	
*
*/

#include "game.h"


game * make_game(int rows, int cols)
/*! Create an instance of a game structure with the given number of rows
    and columns, initializing elements to -1 and return a pointer
    to it. (See game.h for the specification for the game data structure) 
    The needed memory should be dynamically allocated with the malloc family
    of functions.
*/
{
    //Dynamically allocate memory for game and cells (DO NOT modify this)
    game * mygame = malloc(sizeof(game));
    mygame->cells = malloc(rows*cols*sizeof(cell));

    //YOUR CODE STARTS HERE:  Initialize all other variables in game struct
    mygame->score = 0;
    mygame->cols = cols;
    mygame->rows = rows;

	//initialize the game board
    for(int k = 0; k < rows * cols; k++){
        mygame->cells[k] = -1;
    }


    return mygame;
}

void remake_game(game ** _cur_game_ptr,int new_rows,int new_cols)
/*! Given a game structure that is passed by reference, change the
	game structure to have the given number of rows and columns. Initialize
	the score and all elements in the cells to -1. Make sure that any 
	memory previously allocated is not lost in this function.	
*/
{
	/*Frees dynamically allocated memory used by cells in previous game,
	 then dynamically allocates memory for cells in new game.  DO NOT MODIFY.*/
	free((*_cur_game_ptr)->cells);
	(*_cur_game_ptr)->cells = malloc(new_rows*new_cols*sizeof(cell));

	(*_cur_game_ptr)->score = 0;
    (*_cur_game_ptr)->cols = new_cols;
    (*_cur_game_ptr)->rows = new_rows;

    for(int k = 0; k < new_rows * new_cols; k++){
        (*_cur_game_ptr)->cells[k] = -1;
    }

	return;	
}

void destroy_game(game * cur_game)
/*! Deallocate any memory acquired with malloc associated with the given game instance.
    This includes any substructures the game data structure contains. Do not modify this function.*/
{
    free(cur_game->cells);
    free(cur_game);
    cur_game = NULL;
    return;
}

cell * get_cell(game * cur_game, int row, int col)
/*! Given a game, a row, and a column, return a pointer to the corresponding
    cell on the game. (See game.h for game data structure specification)
    This function should be handy for accessing game cells. Return NULL
	if the row and col coordinates do not exist.
*/
{
    if(row >= 0 && row < cur_game->rows && col >= 0 && col < cur_game->cols){
        return &(cur_game->cells[row*cur_game->cols + col]);
    }

    return NULL;
}

int move_w(game * cur_game)
/*!Slides all of the tiles in cur_game upwards. If a tile matches with the 
   one above it, the tiles are merged by adding their values together. When
   tiles merge, increase the score by the value of the new tile. A tile can 
   not merge twice in one turn. If sliding the tiles up does not cause any 
   cell to change value, w is an invalid move and return 0. Otherwise, return 1. 
*/
{
	//create a 1D flag array to check whether a  tile has already been merged
    int flagArray [cur_game->rows];

	//initialize flag array to all 0s
    for(int i = 0; i < cur_game->rows; i++){
        flagArray[i] = 0;
    }

	//initialize return and temporary variables
    int ret = 0;
    int temp = 0;

	//increment through coloumns first
    for(int i = 0; i < cur_game->cols; i++){
		//increment through rows
        for(int j = 1; j < cur_game->rows; j++){
			//set temp to the index value of the tile to be moved
            temp = j;
            int curVal = *(get_cell(cur_game, j, i));
            if(curVal != -1){
				//increment through the tiles behind j
                for(int k = j-1; k >= 0; k--){
                    int checkVal = *(get_cell(cur_game, k, i));
					//do nothing if the tile above is different and not empty
                    if(checkVal != -1 && checkVal != curVal){
                        break;
                    }
					//move the tile if the tile adjacent is empty
                    if (checkVal == -1){
                        *(get_cell(cur_game, k, i)) = curVal;
                        *(get_cell(cur_game, temp, i)) = -1;
						//decrement temp in case the next tile is empty too
                        temp--;
                        ret = 1;
                    } else if(checkVal == curVal && flagArray[k] != 1){
                        *(get_cell(cur_game, k, i)) *= 2;
						//increment score pointer
						cur_game->score += *(get_cell(cur_game, k, i));
                        *(get_cell(cur_game, temp, i)) = -1;
                        temp--;
                        flagArray[k] = 1;
                        ret = 1;
                    } 
                }
                
            }
        }
    }

    return ret;
};

int move_s(game * cur_game){ //slide down

	//create a 1D flag array to check whether a  tile has already been merged
    int flagArray [cur_game->rows];
	
	//initialize flag array to all 0s
    for(int i = 0; i < cur_game->rows; i++){
        flagArray[i] = 0;
    }

	//initialize return and temporary variables
    int ret = 0;
    int temp = 0;

	//increment through coloumns first
    for(int i = 0; i < cur_game->cols; i++){
		//increment through rows
        for(int j = cur_game->rows-2; j >= 0; j--){
			//set temp to the index value of the tile to be moved
            temp = j;
            int curVal = *(get_cell(cur_game, j, i));
            if(curVal != -1){
				//increment through the tiles ahead of j
                for(int k = j+1; k < cur_game->rows; k++){
                    int checkVal = *(get_cell(cur_game, k, i));
					//do nothing if the tile above is different and not empty
                    if(checkVal != -1 && checkVal != curVal){
                        break;
                    }
					//move the tile if the tile adjacent is empty
                    if (checkVal == -1){
                        *(get_cell(cur_game, k, i)) = curVal;
                        *(get_cell(cur_game, temp, i)) = -1;
						//increment temp in case the next tile is empty too
                        temp++;
                        ret = 1;
					//merge the tiles if the adjacent tile is equal
                    } else if(checkVal == curVal && flagArray[k] != 1){
                        *(get_cell(cur_game, k, i)) *= 2;
						//increment score pointer
						cur_game->score += *(get_cell(cur_game, k, i));
                        *(get_cell(cur_game, temp, i)) = -1;
						//increment temp in case next tile is empty too
                        temp++;
						//set flag as 1 to  indicate that the tile has already been merged once
                        flagArray[k] = 1;
                        ret = 1;
                    } 
                }
            }
        }
    }

    return ret;
};

int move_a(game * cur_game) //slide left
{
	//create a 1D flag array to check whether a  tile has already been merged
    int flagArray [cur_game->rows];

	//initialize flag array to all 0s
    for(int i = 0; i < cur_game->rows; i++){
        flagArray[i] = 0;
    }

	//initialize return and temporary variables
    int ret = 0;
    int temp = 0;

	//increment through rows first
    for(int i = 0; i < cur_game->rows; i++){
		//increment through columns
        for(int j = 1; j < cur_game->cols; j++){
			//set temp to the index value of the tile to be moved
            temp = j;
            int curVal = *(get_cell(cur_game, i, j));
            if(curVal != -1){
				//increment through the tiles behind j
                for(int k = j-1; k >= 0; k--){
                    int checkVal = *(get_cell(cur_game, i, k));
					//move the tile if the tile adjacent is empty
                    if(checkVal != -1 && checkVal != curVal){
                        break;
                    }
					//do nothing if the tile above is different and not empty
                    if (checkVal == -1){
                        *(get_cell(cur_game, i, k)) = curVal;
                        *(get_cell(cur_game, i, temp)) = -1;
						//decrement temp in case the next tile is empty too
                        temp--;
                        ret = 1;
                    } else if(checkVal == curVal && flagArray[k] != 1){
                        *(get_cell(cur_game, i, k)) *= 2;
						//increment score pointer
						cur_game->score += *(get_cell(cur_game, i, k));
                        *(get_cell(cur_game, i, temp)) = -1;
						//decrement temp in case the next tile is empty too
                        temp--;
                        flagArray[k] = 1;
                        ret = 1;
                    } 
                }
            }
        }
    }
    
    return ret;
};

int move_d(game * cur_game){ //slide to the right
	
	//create a 1D flag array to check whether a  tile has already been merged
    int flagArray [cur_game->rows];

	//initialize flag array to all 0s
    for(int i = 0; i < cur_game->rows; i++){
        flagArray[i] = 0;
    }

	//initialize return and temporary variables
    int ret = 0;
    int temp = 0;

	//increment through rows first
    for(int i = 0; i < cur_game->rows; i++){
		//increment through columns 
        for(int j = cur_game->cols-2; j >= 0; j--){
			//set temp to the index value of the tile to be moved
            temp = j;
            int curVal = *(get_cell(cur_game, i, j));
            if(curVal != -1){
				//increment through the tiles ahead of j
                for(int k = j+1; k < cur_game->cols; k++){
                    int checkVal = *(get_cell(cur_game, i, k));
					//do nothing if the tile above is different and not empty
                    if(checkVal != -1 && checkVal != curVal){
                        break;
                    }
					//move the tile if the tile adjacent is empty
                    if (checkVal == -1){
                        *(get_cell(cur_game, i, k)) = curVal;
                        *(get_cell(cur_game, i, temp)) = -1;
						//increment temp in case next tile is empty too
                        temp++;
                        ret = 1;
                    } else if(checkVal == curVal && flagArray[k] != 1){
                        *(get_cell(cur_game, i, k)) *= 2;
						//increment score pointer
						cur_game->score += *(get_cell(cur_game, i, k));
                        *(get_cell(cur_game, i, temp)) = -1;
						//increment temp in case next tile is empty too
                        temp++;
                        flagArray[k] = 1;
                        ret = 1;
                    } 
                }
            }
        }
    }

    return ret;
};

int legal_move_check(game * cur_game)
/*! Given the current game check if there are any legal moves on the board. There are
    no legal moves if sliding in any direction will not cause the game to change.
	Return 1 if there are possible legal moves, 0 if there are none.
 */
{
	//check whether there are any empty cells
    for(int k = 0; k < cur_game->cols*cur_game->rows; k++){
        if(cur_game->cells[k] == -1){
			//return 1 if an empty cell is found
            return 1;
        }
    }

	//increment over rows
    for(int i = 0; i < cur_game->rows; i++){
		//increment over columns
        for(int j = 0; j < cur_game->cols; j++){
            int curVal = *(get_cell(cur_game, i, j));
				//return 1 if there is the same number above
           	 	if(i>0 && curVal == *(get_cell(cur_game, i-1, j)) ){
                return 1;
                }
				//return 1 if there is the same number below
                if(i+1 < cur_game->rows && curVal == *(get_cell(cur_game, i+1, j))){
                    return 1;
                }
				//return 1 if there is the same number on the left
                if(j>0 && curVal == *(get_cell(cur_game, i, j-1))){
                    return 1;
                }
				//return 1 if there is the same number on the right
                if(j+1<cur_game->cols && curVal == *(get_cell(cur_game, i, j+1))){
                    return 1;
                }
        }
    }

    return 0;
}


/*! code below is provided and should not be changed */

void rand_new_tile(game * cur_game)
/*! insert a new tile into a random empty cell. First call rand()%(rows*cols) to get a random value between 0 and (rows*cols)-1.
*/
{
	
	cell * cell_ptr;
    cell_ptr = 	cur_game->cells;
	
    if (cell_ptr == NULL){ 	
        printf("Bad Cell Pointer.\n");
        exit(0);
    }
	
	
	//check for an empty cell
	int emptycheck = 0;
	int i;
	
	for(i = 0; i < ((cur_game->rows)*(cur_game->cols)); i++){
		if ((*cell_ptr) == -1){
				emptycheck = 1;
				break;
		}		
        cell_ptr += 1;
	}
	if (emptycheck == 0){
		printf("Error: Trying to insert into no a board with no empty cell. The function rand_new_tile() should only be called after tiles have succesfully moved, meaning there should be at least 1 open spot.\n");
		exit(0);
	}
	
    int ind,row,col;
	int num;
    do{
		ind = rand()%((cur_game->rows)*(cur_game->cols));
		col = ind%(cur_game->cols);
		row = ind/cur_game->cols;
    } while ( *get_cell(cur_game, row, col) != -1);
        //*get_cell(cur_game, row, col) = 2;
	num = rand()%20;
	if(num <= 1){
		*get_cell(cur_game, row, col) = 4; // 1/10th chance
	}
	else{
		*get_cell(cur_game, row, col) = 2;// 9/10th chance
	}
}

int print_game(game * cur_game) 
{
    cell * cell_ptr;
    cell_ptr = 	cur_game->cells;

    int rows = cur_game->rows;
    int cols = cur_game->cols;
    int i,j;
	
	printf("\n\n\nscore:%d\n",cur_game->score); 
	
	
	printf("\u2554"); // topleft box char
	for(i = 0; i < cols*5;i++)
		printf("\u2550"); // top box char
	printf("\u2557\n"); //top right char 
	
	
    for(i = 0; i < rows; i++){
		printf("\u2551"); // side box char
        for(j = 0; j < cols; j++){
            if ((*cell_ptr) == -1 ) { //print asterisks
                printf(" **  "); 
            }
            else {
                switch( *cell_ptr ){ //print colored text
                    case 2:
                        printf("\x1b[1;31m%04d\x1b[0m ",(*cell_ptr));
                        break;
                    case 4:
                        printf("\x1b[1;32m%04d\x1b[0m ",(*cell_ptr));
                        break;
                    case 8:
                        printf("\x1b[1;33m%04d\x1b[0m ",(*cell_ptr));
                        break;
                    case 16:
                        printf("\x1b[1;34m%04d\x1b[0m ",(*cell_ptr));
                        break;
                    case 32:
                        printf("\x1b[1;35m%04d\x1b[0m ",(*cell_ptr));
                        break;
                    case 64:
                        printf("\x1b[1;36m%04d\x1b[0m ",(*cell_ptr));
                        break;
                    case 128:
                        printf("\x1b[31m%04d\x1b[0m ",(*cell_ptr));
                        break;
                    case 256:
                        printf("\x1b[32m%04d\x1b[0m ",(*cell_ptr));
                        break;
                    case 512:
                        printf("\x1b[33m%04d\x1b[0m ",(*cell_ptr));
                        break;
                    case 1024:
                        printf("\x1b[34m%04d\x1b[0m ",(*cell_ptr));
                        break;
                    case 2048:
                        printf("\x1b[35m%04d\x1b[0m ",(*cell_ptr));
                        break;
                    case 4096:
                        printf("\x1b[36m%04d\x1b[0m ",(*cell_ptr));
                        break;
                    case 8192:
                        printf("\x1b[31m%04d\x1b[0m ",(*cell_ptr));
                        break;
					default:
						printf("  X  ");

                }

            }
            cell_ptr++;
        }
	printf("\u2551\n"); //print right wall and newline
    }
	
	printf("\u255A"); // print bottom left char
	for(i = 0; i < cols*5;i++)
		printf("\u2550"); // bottom char
	printf("\u255D\n"); //bottom right char
	
    return 0;
}

int process_turn(const char input_char, game* cur_game) //returns 1 if legal move is possible after input is processed
{ 
	int rows,cols;
	char buf[200];
	char garbage[2];
    int move_success = 0;
	
    switch ( input_char ) {
    case 'w':
        move_success = move_w(cur_game);
        break;
    case 'a':
        move_success = move_a(cur_game);
        break;
    case 's':
        move_success = move_s(cur_game);
        break;
    case 'd':
        move_success = move_d(cur_game);
        break;
    case 'q':
        destroy_game(cur_game);
        printf("\nQuitting..\n");
        return 0;
        break;
	case 'n':
		//get row and col input for new game
		dim_prompt: printf("NEW GAME: Enter dimensions (rows columns):");
		while (NULL == fgets(buf,200,stdin)) {
			printf("\nProgram Terminated.\n");
			return 0;
		}
		
		if (2 != sscanf(buf,"%d%d%1s",&rows,&cols,garbage) ||
		rows < 0 || cols < 0){
			printf("Invalid dimensions.\n");
			goto dim_prompt;
		} 
		
		remake_game(&cur_game,rows,cols);
		
		move_success = 1;
		
    default: //any other input
        printf("Invalid Input. Valid inputs are: w, a, s, d, q, n.\n");
    }

	
	
	
    if(move_success == 1){ //if movement happened, insert new tile and print the game.
         rand_new_tile(cur_game); 
		 print_game(cur_game);
    } 

    if( legal_move_check(cur_game) == 0){  //check if the newly spawned tile results in game over.
        printf("Game Over!\n");
        return 0;
    }
    return 1;
}
