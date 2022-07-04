#include <iostream>
#include <fstream>
#include <string>
#include <sstream>  
#include <vector>
#include <typeinfo>

TEST_CASE("Test 2", "[weight=10][valgrind]") {
    Graph graph(0);

    Parser nodes("testnodes.txt", "|");
    Parser edges("testedges.txt", " "); 

    nodes.addVertices(graph);
    edges.addEdges(graph);

    BFS b;
    vector<long int> a = b.mapBFS(1, 1, 2);

    REQUIRE( a.front() == 1 );
}