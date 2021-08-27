#include "sudoku.h"

//Introductory para
/*In this MP I use backtracking recursive algorthim in
  order to solve the suduko puzzle. I do this using 4 functions.
  the is_val_in_row method checks if a particular row has the value.
  Similarly the is_val_in_col and is_val_in_3x3_zone checks if value
  is tehre in the column and 3x3 subgrid respectively. We then use 
  these 3 functions, to see if a particular value is valid. Finally,
  the solve_sudoku function uses the helper function find_empty to solve 
  the suduko recursively. */

  //netid: danahar2

//declaring the function definition for find_empty
int* find_empty(int sudoku[9][9]);

//-------------------------------------------------------------------------------------------------
// Start here to work on your MP7
//-------------------------------------------------------------------------------------------------

// You are free to declare any private functions if needed.

// Function: is_val_in_row
// Return true if "val" already existed in ith row of array sudoku.

int is_val_in_row(const int val, const int i, const int sudoku[9][9]) {

  assert(i>=0 && i<9);

  //uses a single for loop to check each column of the row
  for(int k = 0; k < 9; k++){
    if(sudoku[i][k] == val){
      //returns 1 if the value has been found in the row
      return 1;
    }
  }
  
  //otherwise return 0
  return 0;
}

// Function: is_val_in_col
// Return true if "val" already existed in jth column of array sudoku.
int is_val_in_col(const int val, const int j, const int sudoku[9][9]) {

  assert(j>=0 && j<9);

  //uses a single for loop to check each row of the column
  for(int k = 0; k < 9; k++){
    if(sudoku[k][j] == val){
      //returns 1 if the value has been found in the column
      return 1;
    }
  }
  
  //otherwise return 0
  return 0;
  // END TODO
}

// Function: is_val_in_3x3_zone
// Return true if val already existed in the 3x3 zone corresponding to (i, j)
int is_val_in_3x3_zone(const int val, const int i, const int j, const int sudoku[9][9]) {
   
  assert(i>=0 && i<9 && j>=0 && j<9);

  //the reason 'a' starts from (1/3)*3 is to get the leftmost element of
  //the concerned subgrid overwhich we are looping.
  //the first for loop loops for 3 elements, and thus it is 2+(1/3)*3 inclusively.
  for(int a = (i/3)*3; a <= 2+(i/3)*3; a++){
    //similar reasoning can be applied here
    for(int b = (j/3)*3; b <= 2+(j/3)*3; b++){
      if(sudoku[a][b] == val){
        return 1;
      }
    }
  }
  
  return 0;
}

// Function: is_val_valid
// Return true if the val is can be filled in the given entry.
int is_val_valid(const int val, const int i, const int j, const int sudoku[9][9]) {

  assert(i>=0 && i<9 && j>=0 && j<9);

  //since the 3 functions being called returns 1 if the  value is found. I have negated the statement calling all 3 
  //functions so that this function returns 1 if no value is found in row, col, or 3x3 submatrix. 
  return !(is_val_in_3x3_zone(val, i, j, sudoku) || is_val_in_col(val, j, sudoku) || is_val_in_row(val, i, sudoku));
}

// Procedure: solve_sudoku
// Solve the given sudoku instance.
int solve_sudoku(int sudoku[9][9]) {
  //uses the find_empty helper function in order to find i and j values of an empty element. 
  int *arr = find_empty(sudoku);
  int i, j;

  //if the i or j values are -1, then no empty element has been found and thus the
  //function returns 1. Otherwise, set the variables i and j to the first and the second
  //element of the array. 
  if(arr[0] == -1 || arr[1] ==-1){
    return 1;
  } else {
    i = arr[0];
    j = arr[1];
  }

  //find a number from 1 to 9
  for (int num = 1; num <= 9; num++) {   
    //see if that number is valid in the suduko
    if (is_val_valid(num, i, j, sudoku)) {
      //if it is then set the (i, j)th element of the
      //suduko to that num
      sudoku[i][j] = num;
      //now check if the suduko is completely valid recursively
      if (solve_sudoku(sudoku) == 1) {
        return 1;
      }

      //if not then backtrack
      sudoku[i][j] = 0; 
    }
  }
  return 0;
  // END TODO.
}

int* find_empty(int sudoku[9][9]){
  //create a return pointer
  int *ret;

  //initially the array is set to -1, -1 indicatting null
  int arr[2] = {-1, -1};

  //set the return pointer to the array
  ret = arr;

  //double for loop to check whate i and j elements are 0
  for(int i = 0; i < 9; i++){
    for(int j = 0; j < 9; j++){
      if(sudoku[i][j] == 0){
        arr[0] = i;
        arr[1] = j;

        //return the ret pointer pointing towards the array
        return ret;
      }
    }
  }

  //return the ret pointer pointing towards the array
  return ret;
}

// Procedure: print_sudoku
void print_sudoku(int sudoku[9][9]){
  int i, j;
  for(i=0; i<9; i++) {
    for(j=0; j<9; j++) {
      printf("%2d", sudoku[i][j]);
    }
    printf("\n");
  }
}

// Procedure: parse_sudoku
void parse_sudoku(const char fpath[], int sudoku[9][9]) {
  FILE *reader = fopen(fpath, "r");
  assert(reader != NULL);
  int i, j;
  for(i=0; i<9; i++) {
    for(j=0; j<9; j++) {
      fscanf(reader, "%d", &sudoku[i][j]);
    }
  }
  fclose(reader);
}