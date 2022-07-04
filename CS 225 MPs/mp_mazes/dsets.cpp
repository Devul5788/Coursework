/* Your code here! */
#include "dsets.h"
#include <iostream>

using namespace std;

void DisjointSets::addelements(int num) {
    for (int i = 0; i < num; i++)
		elems.push_back(-1);
}

int DisjointSets::find(int elem) {
    // if representative element found, then return
    if(elems[elem] < 0) return elem;
    
    //path compression
    elems[elem] = find(elems[elem]); 

    //recurse to higher node in the uptree
    return find(elems[elem]);
} 

//union by size
void DisjointSets::setunion(int a, int b) {
    // elems[find(a)] returns the representative element of a particular value in the uptree. 
    // same thing with find(b). We add the sizes of the two uptrees
    int newSize = elems[find(a)] + elems[find(b)];

    // If root a has higher height (more negative) we union the smaller set, b, with a. Otherwise do the opposite
    if (elems[find(a)] < elems[find(b)]){
        // sets the representitive element of smaller uptree b to a. Completing the union. 
        elems[find(b)] = find(a); 

        // sets the size of the larger uptree a to the total size of the union of uptrees a and b
        elems[find(a)] = newSize;
    } else {
        elems[find(a)] = find(b); 
        elems[find(b)] = newSize;
    } 
}

int DisjointSets::size(int elem) {
    return -1 * elems[find(elem)];
}