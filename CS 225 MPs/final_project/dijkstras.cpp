/**
 * @file dijkstras.cpp
 * Definitions of the dijkstras algorithm.
 *
 * @author Devul
 */
#include "dijkstras.h"

/**
* Finds the shortest path between two nodes using Dijkstras.
* @param src This is the source node in the path. 
* @param dest This is the destination node in the path.
* @return a vector of vector ids along the shortest path the src node to the dest node.
*/
vector<long int> Dijkstras::dijkstra(long int src, long int dest, Graph g) {
    vector<long int> distFromStart(g.numVertices + 1, INT_MAX);
    vector<long int> prev(g.numVertices + 1);
    vector<bool> hasVisited(g.numVertices + 1, false);
    priority_queue<p, vector<p>, greater<p>> pq;

    for(auto it: g.adjList){
        if(it.first != src) pq.push(make_pair(distFromStart[it.first], it.first));
    }

    prev[0] = -1;
    distFromStart[src] = 0;
    pq.push(make_pair(distFromStart[src], src));
    
    for(int i = 0; i < g.numVertices; i++){
        long int u = pq.top().second;
        pq.pop();
        hasVisited[u] = true;

        for (auto it: g.adjList[u]){
            long int v = it.first;
            long int weight = it.second.getWeight();
            if (v != -1 && !hasVisited[v] && distFromStart[v] > distFromStart[u] + weight){
                distFromStart[v] = distFromStart[u] + weight;
                pq.push(make_pair(distFromStart[v], v));
                prev[v] = u;
            }
        }
    }

    vector<long int> ShortestPath;
    getShortestPath(prev, dest, ShortestPath);

    if(ShortestPath.size() == 1) ShortestPath.pop_back();

    return ShortestPath;
}

/**
* Recursively finds the path of two connected vertices. 
* @param prev This is a vector that stores the parent nodes in its corresponding indices.
* @param parent This is the parent node. The function recurses till the parent node is found. 
* @return a vector of vector ids along the shortest path the src node to the dest node.
*/
void Dijkstras::getShortestPath(vector<long int> prev, long int parent, vector<long int> & path){
    if (prev[parent] == - 1) return;
    getShortestPath(prev, prev[parent], path);
    path.push_back(parent);
}