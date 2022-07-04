/* Your code here! */
#pragma once

#include "cs225/PNG.h"
#include "cs225/HSLAPixel.h"
#include "dsets.h"
#include <vector>
#include <utility>

using namespace std;
using namespace cs225;

class SquareMaze {
    public:
        SquareMaze();
        ~SquareMaze();
        void deleteHelp();
        void makeMaze(int height, int width);
        bool canTravel(int x, int y, int dir) const;
        void setWall(int x, int y, int dir, bool exists);
        vector<int> solveMaze();
        PNG * drawMaze() const;
        PNG * drawMazeWithSolution();
    private:
        struct Node{
            // bool stores values in 1 bit as instructed by the mp instructions.
            bool right_;
            bool down_;

            // Node constructor
            Node(bool right, bool down): right_(right), down_(down){}
        };

        vector<Node> * maze_;
        DisjointSets * djset_;
        int width_;
        int height_;
};