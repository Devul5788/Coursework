#include "sparsemat.h"

#include <stdio.h>
#include <stdlib.h>

//In this mp we take a text file of a sparse array, parse through it
//and put into an ordered linked list. We do this using the
//load_tuples method. The gv_tuples method simply returns the
//value of a certain node. The set_tuples method correctly orders
//the nodes in the liked list and deletes certain nodes if necessary.
//the save tuples method simply saves the output in a text file. The 
//add_tuples method adds 2 tupes of same size and outputs another linked
//list. Finally the destroy_tuples method frees all the memory allocated
//for the tuples.

//netid:danahar2, sri4



sp_tuples * load_tuples(char* input_file){
    //reads file
    FILE *in = fopen(input_file, "r");

    //creates space for linked list
    sp_tuples *tuples_list = malloc(sizeof(sp_tuples));
    
    //sets the head of the linked list to NULL
    tuples_list->tuples_head = NULL;

    //sets the relevant properties of the tupes list after parsing the file
    fscanf(in, "%d %d\n", &tuples_list->m, &tuples_list->n);

    //parses the file line by line
    while(!feof(in)){
        int row, col;
        double value;

        //sets the row, col, and value 
        fscanf(in, "%d %d %lf\n", &row, &col, &value);

        //sets the tuples head node
        if(tuples_list->tuples_head == NULL && value != 0){
            sp_tuples_node *node = malloc(sizeof(sp_tuples_node));
            node->row = row;
            node->col = col;
            node->value = value;
            node->next = NULL;
            tuples_list->tuples_head = node;
            tuples_list->nz++;
            continue;
        }

        //if head is present then add the node into the list
        set_tuples(tuples_list, row, col, value);
    }

    //closes file
    fclose(in);

    return tuples_list;
}



double gv_tuples(sp_tuples * mat_t,int row,int col)

{
    double ret = 0;

    //runs a for loop to find the node with equal row and col and returns the node's val
    for(sp_tuples_node *i = mat_t->tuples_head; i != NULL; i = i->next){
        if(i->row == row && i->col == col){
            ret = i->value;
            break;
        }
    }

    return ret;
}



void set_tuples(sp_tuples * mat_t, int row, int col, double value)
{
    //set previous node to NULL
    sp_tuples_node *prev = NULL;

    //for loop for paring through the linked list
    for(sp_tuples_node *i = mat_t->tuples_head; i != NULL; i = i->next){
        if(i->row == row && i->col == col) {
            //delete node if the value = 0
            if(value == 0){
                //set new head
                if(mat_t->tuples_head == i) {
                    mat_t->tuples_head = i->next;
                    free(i);
                    break;
                } else {
                    //deletes node in the middle
                    prev->next = i->next;
                    free(i);
                    break;
                }
            } else {
                //replaces value if the row and col is same
                i->value =  value;
                break;
            }
        } else {
            if(value == 0){
                //ignores if val = 0
                prev = i;
                continue;
            }

            //inserts into linked list in an ordered list
            if (row < i->row || (row == i->row && col < i->col)) {
                sp_tuples_node *node = malloc(sizeof(sp_tuples_node));
                node->value = value;
                node->col = col;
                node->row = row;
                node->next = NULL;

                //sets new head
                if (mat_t->tuples_head == i) {
                    mat_t->tuples_head = node;
                    node->next = i;
                } else {
                    //switch the order
                    node->next = i;
                    prev->next = node;
                }
                break;
            } else if (i->next == NULL) {
                //add node at the end
                sp_tuples_node *node = malloc(sizeof(sp_tuples_node));
                node->value = value;
                node->col = col;
                node->row = row;
                node->next = NULL;
                i->next = node;
                break;
            }

            //set previous node
            prev = i;
        }
    }

    //sets the nz of mat_t to the number of nodes in the linked list
    mat_t->nz = 0;
    for(sp_tuples_node *i = mat_t->tuples_head; i != NULL; i = i->next){
        mat_t->nz++;
    }
}



void save_tuples(char * file_name, sp_tuples * mat_t){
    //open file stream to write
    FILE *in = fopen(file_name, "w");

    //print the m and n of the matrix
    fprintf(in, "%d %d\n", mat_t->m, mat_t->n);

    //print the row, the col, and the value into file
    for(sp_tuples_node *i = mat_t->tuples_head; i != NULL; i = i->next){
        fprintf(in, "%d %d %lf\n", i->row, i->col, i->value);
    }

    //close file
    fclose(in);
}



sp_tuples * add_tuples(sp_tuples * matA, sp_tuples * matB){
    //creates a new linked list matC and sets its properties.
	sp_tuples *matC = malloc(sizeof(sp_tuples));
    matC->n = matA->n;
    matC->m = matA->m;
    matC->nz = 0;
    matC->tuples_head = NULL;

    for(sp_tuples_node *i = matA->tuples_head; i != NULL; i = i->next){
        if(matC->tuples_head == NULL){
            //set the head of the list if it doesnt exist.
            sp_tuples_node *node = malloc(sizeof(sp_tuples_node));
            node->next = NULL;
            node->col = i->col;
            node->row = i->row;
            node->value = i->value;
            matC->tuples_head = node;
        } else {
            //else add the node onto the list
            set_tuples(matC, i->row, i->col, i->value);
        }
    }

    for(sp_tuples_node *i = matB->tuples_head; i != NULL; i = i->next){
        if(matC->tuples_head == NULL){
            //set the head of the list if it doesnt exist.
            sp_tuples_node *node = malloc(sizeof(sp_tuples_node));
            node->next = NULL;
            node->col = i->col;
            node->row = i->row;
            node->value = i->value;
            matC->tuples_head = node;
        } else {
            //works like a flag so the value is not overwritten
            int sameFound = 0;

            //adds the value of the matB to matC if the same coordinates exist.
            for(sp_tuples_node *j = matC->tuples_head; j != NULL; j = j->next){
                if (j->row == i->row && j->col == i->col) {
                    set_tuples(matC, i->row, i->col, i->value + j->value);
                    sameFound = 1;
                    break;
                }
            }

            //if the same coordinates do not exist add it to the linked list
            if(sameFound == 0){
                set_tuples(matC, i->row, i->col, i->value);
            }
        }
    }

    return matC;
}


//not doing this optional method
sp_tuples * mult_tuples(sp_tuples * matA, sp_tuples * matB){ 
    return NULL;

}



void destroy_tuples(sp_tuples * mat_t){
    sp_tuples_node * node = mat_t->tuples_head;

    //frees all the memory allocated for the nodes in the linked list
    while(node != NULL){
        sp_tuples_node * next = node->next;
        free(node);
        node = next;
    }

    //frees the memory allocated for the linked list
    free(mat_t);

    return;
}  
