/**
 * @file graph.h
 * Definitions of the graph data structure functions.
 *
 * @author Shubham Gupta
 */

#pragma once

#include <unordered_map>
#include <typeinfo>

#include "vertex.h"
#include "edge.h"

using namespace std;

class Graph{
    public:
        /**
        * Parameterized constructor.
        * @param vertices Initial number of vertices
        */
        Graph(long int vertices): numVertices(vertices){}

        /**
        * Inserts a Vertex object in the Graph.
        * @param v The vertex to be inserted
        */
        void insertVertex(Vertex v);

        /**
        * Inserts an Edge object in the Graph.
        * @param v1 The Vertex ID the Edge is directed FROM
        * @param v2 The Vertex ID the Edge is directed TO
        * @param weight The weight of the Edge
        */
        void insertEdge(long int v1, long int v2, double weight);

        /**
        * Prints the entire Graph to the console.
        */
        void print();

        /**
        * Finds and returns the weight of the edge between 2 node (definately exsists).
        * @param v1 The Vertex ID the Edge is directed FROM
        * @param v2 The Vertex ID the Edge is directed TO
        * @return The weight of the Edge.
        */
        double getEdgeWeight(long int v1, long int v2);

        /**
        * Finds the Vertex in the Graph by ID and returns it (definately exsists).
        * @param v The Vertex ID to find
        * @return The Vertex object
        */
        Vertex getVertex(long int v);
        
        unordered_map<long int, unordered_map<long int, Edge> > adjList;
        long int numVertices;
};