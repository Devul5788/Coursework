/**
 * @file BFS.cpp
 * Definitions of the BFS data structure functions.
 *
 * @author Advaith
 */
#include "BFS.h"

 
void BFS::printBFS(long int startVert, long int endVert, Graph graph){
    
    map<int, bool> hasVisited;
    queue<long int> q;

    q.push(startVert);
    hasVisited[startVert] = true;
    long int curVert = startVert;

    int count = 1;

    while(!q.empty() && curVert != endVert){
        curVert = q.front();
        q.pop();

        string title = graph.getVertex(curVert).getTitle();
        cout << "Visited ID: " << curVert << " / Title: " << title << " / in iteration #" << count<< endl;
        count++;
        
        unordered_map<long int, Edge> curNeighbors = graph.adjList[curVert];
        for(auto it : curNeighbors){
            if(it.first != -1 && !hasVisited[it.first]){
                hasVisited[it.first] = true;
                q.push(it.first);
            }
        }
    }

}