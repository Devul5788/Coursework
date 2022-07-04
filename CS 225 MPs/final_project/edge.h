/**
 * @file edge.h
 * Definitions of the Edge class functions.
 *
 * @author Shubham Gupta, Devul Nahar
 */

#pragma once

#include <iostream>
#include <string>
#include <unordered_map>

#include "vertex.h"

using namespace std;

class Edge {
    private:
        double weight;
        Vertex parent;

    public:
        /**
        * Default Constructor.
        */
        Edge();

        /**
        * Default Constructor to set vertex and weight.
        * @param v The vertex
        */
        Edge(Vertex v):parent(v), weight(-1) {}

        /**
        * Default Constructor to set weight and vertex.
        * @param weight The weight
        * @param v The vertex object
        */
        Edge(double weight, Vertex v): weight(weight), parent(v){}

        /**
        * Compare the weights.
        * @param other The edge
        * @return Bool
        */
        bool operator<(const Edge& other) const{ return weight < other.weight;}

        /**
        * Get weight.
        * @return The weight
        */
        double getWeight() const {return weight;}

        /**
        * Return parent vertex
        * @return The parent
        */
        Vertex getParent() const {return parent;}

        /**
        * Comparing two edges
        * @param other The other edge
        * @return Bool
        */
        bool operator==(Edge & other) const{
            return parent == other.parent && weight == other.weight;
        }
};
