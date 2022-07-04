/**
 * @file vertex.h
 * Definitions of the Vertex class functions.
 *
 * @author Shubham Gupta, Devul Nahar
 */

#pragma once

#include <iostream>
#include <string>

using namespace std;

class Vertex {
    public:
        /**
        * Default Constructor to set id and title.
        * @param id The stream
        * @param title The vertex object
        */
        Vertex():id(-1), title(""){}

        /**
        * Custom Constructor to set id and title.
        * @param id The stream
        * @param title The vertex object
        */
        Vertex(long int id, string title): id(id), title(title) { }

        /**
        * Get the title.
        * @return The title.
        */
        string getTitle() const{return title;}
    
        /**
        * Get the ID.
        * @return The ID.
        */
        long int getID() const{return id;}

        /**
        * Check equality.
        * @return Bool.
        */
        bool operator==(Vertex & other) const{
            return id == other.id;
        }

    private:
        long int id;
        string title;
};

/**
* Prints a vertex.
* @param os The stream
* @param source The vertex object
*/
ostream& operator<<(ostream& os, Vertex const & source) {
    os << "ID: " << source.getID() << ", Name: " << source.getTitle(); 
    return os;
}