/**
 * @file lphashtable.cpp
 * Implementation of the LPHashTable class.
 */
#include "lphashtable.h"

using hashes::hash;
using std::pair;

template <class K, class V>
LPHashTable<K, V>::LPHashTable(size_t tsize)
{
    if (tsize <= 0)
        tsize = 17;
    size = findPrime(tsize);
    table = new std::pair<K, V>*[size];
    should_probe = new bool[size];
    for (size_t i = 0; i < size; i++) {
        table[i] = NULL;
        should_probe[i] = false;
    }
    elems = 0;
}

template <class K, class V>
LPHashTable<K, V>::~LPHashTable()
{
    for (size_t i = 0; i < size; i++)
        delete table[i];
    delete[] table;
    delete[] should_probe;
}

template <class K, class V>
LPHashTable<K, V> const& LPHashTable<K, V>::operator=(LPHashTable const& rhs)
{
    if (this != &rhs) {
        for (size_t i = 0; i < size; i++)
            delete table[i];
        delete[] table;
        delete[] should_probe;

        table = new std::pair<K, V>*[rhs.size];
        should_probe = new bool[rhs.size];
        for (size_t i = 0; i < rhs.size; i++) {
            should_probe[i] = rhs.should_probe[i];
            if (rhs.table[i] == NULL)
                table[i] = NULL;
            else
                table[i] = new std::pair<K, V>(*(rhs.table[i]));
        }
        size = rhs.size;
        elems = rhs.elems;
    }
    return *this;
}

template <class K, class V>
LPHashTable<K, V>::LPHashTable(LPHashTable<K, V> const& other)
{
    table = new std::pair<K, V>*[other.size];
    should_probe = new bool[other.size];
    for (size_t i = 0; i < other.size; i++) {
        should_probe[i] = other.should_probe[i];
        if (other.table[i] == NULL)
            table[i] = NULL;
        else
            table[i] = new std::pair<K, V>(*(other.table[i]));
    }
    size = other.size;
    elems = other.elems;
}

template <class K, class V>
void LPHashTable<K, V>::insert(K const& key, V const& value)
{

    /**
     * @todo Implement this function.
     *
     * @note Remember to resize the table when necessary (load factor >= 0.7).
     * **Do this check *after* increasing elems (but before inserting)!!**
     * Also, don't forget to mark the cell for probing with should_probe!
     */

    //get index
    unsigned int myIndex = hash(key, size);

    //update index
    while (table[myIndex] != NULL) myIndex = (myIndex + 1) % size;

    //make new entry
    table[myIndex] = new pair<K, V>(key, value);

    should_probe[myIndex] = true;

    //increase counter
    elems++;

    //resize
    if (shouldResize()) {
        resizeTable();
    }

}

template <class K, class V>
void LPHashTable<K, V>::remove(K const& key)
{
    /**
     * @todo: implement this function
     */
    
    //get index
    unsigned int myIndex = hash(key, size);

    //find index to remove
    while (table[myIndex] != NULL && table[myIndex]->first != key) myIndex = (myIndex + 1) % size;
    
    //if not found return null
    if (table[myIndex] == NULL) return;

    //else delete the pair
    else if (table[myIndex]->first == key) {
        delete table[myIndex];
        table[myIndex] = NULL;
        elems--;
    }
}

template <class K, class V>
int LPHashTable<K, V>::findIndex(const K& key) const
{
    
    /**
     * @todo Implement this function
     *
     * Be careful in determining when the key is not in the table!
     */

    //get the index
    unsigned int myIndex = hash(key, size);

    //find the index for the element
    while (should_probe[myIndex]) {

        //check for null
        if (table[myIndex] != NULL)

            //return if found
            if (table[myIndex]->first == key) return myIndex;

        //update index
        myIndex = (myIndex + 1) % size;
    }

    //if not found return -1
    return -1;
}

template <class K, class V>
V LPHashTable<K, V>::find(K const& key) const
{
    int idx = findIndex(key);
    if (idx != -1)
        return table[idx]->second;
    return V();
}

template <class K, class V>
V& LPHashTable<K, V>::operator[](K const& key)
{
    // First, attempt to find the key and return its value by reference
    int idx = findIndex(key);
    if (idx == -1) {
        // otherwise, insert the default value and return it
        insert(key, V());
        idx = findIndex(key);
    }
    return table[idx]->second;
}

template <class K, class V>
bool LPHashTable<K, V>::keyExists(K const& key) const
{
    return findIndex(key) != -1;
}

template <class K, class V>
void LPHashTable<K, V>::clear()
{
    for (size_t i = 0; i < size; i++)
        delete table[i];
    delete[] table;
    delete[] should_probe;
    table = new std::pair<K, V>*[17];
    should_probe = new bool[17];
    for (size_t i = 0; i < 17; i++)
        should_probe[i] = false;
    size = 17;
    elems = 0;
}

template <class K, class V>
void LPHashTable<K, V>::resizeTable()
{

    /**
     * @todo Implement this function
     *
     * The size of the table should be the closest prime to size * 2.
     *
     * @hint Use findPrime()!
     */
    
    //get new size
    size_t mySize = findPrime(size * 2);

    //create new table
    pair<K, V>** myTable = new pair<K, V>*[mySize];

    delete[] should_probe;
    should_probe = new bool[mySize];

    //update table
    for (size_t i = 0; i < mySize; i++) {
        myTable[i] = NULL;
        should_probe[i] = false;
    }

    for (size_t slot = 0; slot < size; slot++) {
        if (table[slot] != NULL) {

            //temp index
            unsigned int myIndex = hash(table[slot]->first, mySize);

            //get the index
            while (myTable[myIndex] != NULL) myIndex = (myIndex + 1) % mySize;

            //update
            myTable[myIndex] = table[slot];
            should_probe[myIndex] = true;
        }
    }

    //prevent memory leak
    delete[] table;

    //update dimensions
    table = myTable;
    size = mySize;
}