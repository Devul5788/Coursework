/**
 * @file BFS.cpp
 * Definitions of the dijkstras algorithm.
 *
 * @author Devul
 */

#pragma once

#include <iostream>
#include <stdlib.h>
#include <limits.h> 
#include <vector>
#include <queue>
#include <unordered_map>

#include "graph.h"

using namespace std;

class Dijkstras{
    private:
        typedef pair<int, int> p;
    public:
         /**
        * Finds the shortest path between two nodes using Dijkstras.
        * @param src This is the source node in the path. 
        * @param dest This is the destination node in the path.
        * @return a vector of vector ids along the shortest path the src node to the dest node.
        */
        vector<long int>  dijkstra(long int src, long int dest, Graph g);

        /**
        * Recursively finds the path of two connected vertices. 
        * @param prev This is a vector that stores the parent nodes in its corresponding indices.
        * @param parent This is the parent node. The function recurses till the parent node is found. 
        * @return a vector of vector ids along the shortest path the src node to the dest node.
        */
        void getShortestPath(vector<long int> prev, long int j, vector<long int> & path);
};