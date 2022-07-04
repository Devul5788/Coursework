/**
 * @file Parser.h
 * Definitions of the Parser class functions.
 *
 * @author Shubham Gupta
 */

#pragma once

#include <iostream>
#include <fstream>
#include <string>
#include <sstream>  
#include <vector>

#include "graph.cpp"

using namespace std;

class Parser {
    
    string path_;
    string delimiter_;

    public:
        /**
        * Splits the string based on delimiter.
        * @param path The file to be opened
        * @param delimeter The delimeter as a string
        * @return The vector containing the two strings
        */
        vector<string> split(string line, string delimiter);

        /**
        * Starts loading vertices to the Graph
        * @param graph The graph object
        */
        void addVertices(Graph& graph);

        /**
        * Starts loading edges to the Graph
        * @param graph The graph object
        */
        void addEdges(Graph& graph);

        /**
        * Gives the edges data within a limit (long int).
        * @param limit The upper limit including itself
        */
        void preProcessEdges(long int limit);

        /**
        * Gives the Nodes data within a limit (long int).
        * @param limit The upper limit including itself
        */
        void preProcessNodes(long int limit);
        Parser(string path, string delimiter);
};