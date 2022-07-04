/**
 * @file BFS.h
 * Definitions of the BFS data structure functions.
 *
 * @author Advaith
 */
#pragma once

#include <iostream>
#include <queue>
#include <map>
#include <unordered_map>
#include <string>

#include "graph.h"

using namespace std;

class BFS{
    private:
        vector<long int> path;
    public:
        /**
        * Conducts a Breadth First Traversal of the graph
        * @param startVert the key value of the starting vertex
        * @param endVert the key value of the ending vertex
        * @param graph the graph object to be traversed
        */
        void printBFS(long int startVert, long int endVert, Graph graph);

        /**
        * Converts Breadth First Traversal of the graph into vectpr
        * @param startVert the key value of the starting vertex
        * @param endVert the key value of the ending vertex
        * @param graph the graph object to be traversed
        * @return a vector of the bfs path
        */
        vector<long int> mapBFS(long int startVert, long int endVert, Graph graph);
};