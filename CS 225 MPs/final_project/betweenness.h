/**
 * @file betweenness.h
 * Definitions of the betweenness data structure functions.
 *
 * @author Advaith and Devul
 */
#pragma once

#include <iostream>
#include <queue>
#include <map>
#include <unordered_map>
#include <string>
#include <algorithm>

#include "dijkstras.h"
#include "graph.h"

using namespace std;

class Betweenness: public Dijkstras{
    public:
        /**
        * Computes the betweeness centralities of a given graph
        * @param graph the graph object to be traversed
        * @return a map of vertex indexes to centrality values
        */
        vector<pair<float, long int>> mapBetweenness(Graph graph);
        map<long int, int> vertIncluded;
        map<long int, int> vertExcluded; 
};
