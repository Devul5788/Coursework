/**
 * @file graph.cpp
 * Main file the runs the program
 */

#include <iostream>
#include <fstream>
#include <string>
#include <sstream> 
#include <iomanip> 
#include <vector>
#include <typeinfo>

#include "Parser.cpp"
#include "graph.cpp"
#include "BFS.cpp"
#include "dijkstras.cpp"
#include "betweenness.cpp"

using namespace std;

int main() {
    Graph graph(0);

    Parser nodes("tests/testnodes.txt", "|");
    Parser edges("tests/testedges.txt", " "); 

    nodes.addVertices(graph);

    cout << "\n";
    cout << "\n";

    edges.addEdges(graph);

    cout << "\n";
    cout << "\n";

    BFS trav;
    trav.printBFS(34, 45, graph);

    cout << "\n";
    cout << "\n";
    
    Dijkstras d;
    vector<long int> shortestPath = d.dijkstra(1, 5, graph);

    for(int i = 0; i < shortestPath.size(); i++){
        cout<<shortestPath[i]<<endl;
    }

    // cout << "\n";
    // cout << "\n";

    Betweenness b;
    vector<pair<float, long int>> betw = b.mapBetweenness(graph);

    sort(betw.begin(), betw.end());

    cout<<"Top 10 most visited Nodes"<<endl;

    for(int m = betw.size() - 1; m >= betw.size() - 11; m--){
        string title = graph.adjList.at(betw[m].second).at(-1).getParent().getTitle();
        cout<<title<< " / Centrality: " << (betw[m].first)*100 << " %" << endl;
    }

    cout << "\n";
    cout << "\n";

    cout<<"WORKS\n";

    return 0;
}