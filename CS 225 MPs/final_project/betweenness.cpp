/**
 * @file betweenness.cpp
 * Definitions of the betweenness data structure functions.
 *
 * @author Advaith and Devul
 */
#include "betweenness.h"

/**
* Computes the betweeness centralities of a given graph
* @param graph the graph object to be traversed
* @return a map of vertex indexes to centrality values
*/
vector<pair<float, long int>> Betweenness::mapBetweenness(Graph graph){
    vector<pair<float, long int>> result;  

    for(auto it: graph.adjList){
        vertIncluded[it.first] = 0;
        vertExcluded[it.first] = 0;
    } 

    long int mapSize = graph.adjList.size();

    for(auto it1 : graph.adjList){
        unordered_map<long int, Edge> curNeighbors = it1.second;
        for(auto it2 : graph.adjList){
            if(it1.first != it2.first && it2.first != -1){
                vector<long int> dijkResult = dijkstra(it1.first, it2.first, graph);
                for(auto it3 : graph.adjList){    
                    for(int vertIdx = 0; vertIdx < dijkResult.size(); vertIdx ++){
                        int j = dijkResult[vertIdx];
                        if(it3.first == j) vertIncluded[it3.first]++;
                        else vertExcluded[it3.first]++;
                    }
                }
            }
        }
    }

    for(auto it: graph.adjList){
        long int i = it.first;
        pair<float, long int> pair = make_pair(((float)vertIncluded[i]) / ((float)vertIncluded[i] + (float)vertExcluded[i]), it.first);
        result.push_back(pair);
    }

    return result;
}