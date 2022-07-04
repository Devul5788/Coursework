/**
 * @file graph.cpp
 * Definitions of the graph data structure functions.
 *
 * @author Shubham Gupta, Devul Nahar
 */

#pragma once

#include "graph.h"

/**
* Inserts a Vertex object in the Graph.
* @param v The vertex to be inserted
*/
void Graph::insertVertex(Vertex v){
    Edge parent(v);
    unordered_map<long int, Edge> map;
    map.insert({-1, parent});
    adjList.insert({v.getID(), map});
    numVertices++;
}

/**
* Inserts an Edge object in the Graph.
* @param v1 The Vertex ID the Edge is directed FROM
* @param v2 The Vertex ID the Edge is directed TO
* @param weight The weight of the Edge
*/
void Graph::insertEdge(long int v1, long int v2, double weight){
    Vertex temp(-1, "EMPTY");
    Edge neigbour(weight, temp);
    if(adjList.find(v1) == adjList.end()) return;
    adjList[v1].insert({v2, neigbour});
}

/**
* Finds the Vertex in the Graph by ID and returns it (definately exsists).
* @param v The Vertex ID to find
* @return The Vertex object
*/
Vertex Graph::getVertex(long int v) {
    return adjList[v].find(-1)->second.getParent();
}

/**
* Finds and returns the weight of the edge between 2 node (definately exsists).
* @param v1 The Vertex ID the Edge is directed FROM
* @param v2 The Vertex ID the Edge is directed TO
* @return The weight of the Edge.
*/
double Graph::getEdgeWeight(long int v1, long int v2) {
    return adjList[v1].find(v2)->second.getWeight();
}

/**
* Prints the entire Graph to the console.
*/
void Graph::print() {
    cout<<"\nMap Keys: \n";
    for(auto i : adjList) {
        cout<<i.first<<":\n";
        for(auto j : i.second) {
            cout<<"   "<<j.first<<":\n";
            cout<<"      "<<"weight: "<<j.second.getWeight()<<"\n";
            if(j.first == -1) {
                cout<<"      "<<"Title: "<<j.second.getParent().getTitle()<<"\n";
                cout<<"      "<<"ID: "<<j.second.getParent().getID()<<"\n";
            }
        }
    }
}