#include <iostream>
#include <fstream>
#include <string>
#include <sstream>  
#include <vector>
#include <typeinfo>
#include <string.h>
#include <stdio.h>

TEST_CASE("Dijkstras 1: 2 Adjacent Vertices", "[weight=10]") {
    Graph graph(0);

    Parser nodes("tests/testnodes.txt", "|");
    Parser edges("tests/testedges.txt", " "); 

    nodes.addVertices(graph);
    edges.addEdges(graph);

    Dijkstras d;
    vector<long int> shortestPath = d.dijkstra(1, 2, graph);
    
    REQUIRE(shortestPath[0] == 1);
    REQUIRE(shortestPath[1] == 2);
}

TEST_CASE("Dijkstras 2: Cycle Detection", "[weight=10]") {
    Graph graph(0);

    Parser nodes("tests/testnodes.txt", "|");
    Parser edges("tests/testedges.txt", " "); 

    nodes.addVertices(graph);
    edges.addEdges(graph);

    Dijkstras d;
    vector<long int> shortestPath = d.dijkstra(1, 2, graph);

    REQUIRE(shortestPath[0] == 1);
    REQUIRE(shortestPath[1] == 2);
}

TEST_CASE("Dijkstras 3: Cut Edge", "[weight=10]") {
    Graph graph(0);

    Parser nodes("tests/testnodes.txt", "|");
    Parser edges("tests/testedges.txt", " "); 

    nodes.addVertices(graph);
    edges.addEdges(graph);

    Dijkstras d;
    vector<long int> shortestPath = d.dijkstra(1, 7, graph);
    
    REQUIRE(shortestPath.size() == 0);
}

TEST_CASE("Dijkstras 4: Long Path", "[weight=10]") {
    Graph graph(0);

    Parser nodes("tests/testnodes.txt", "|");
    Parser edges("tests/testedges.txt", " "); 

    nodes.addVertices(graph);
    edges.addEdges(graph);

    Dijkstras d;
    vector<long int> shortestPath = d.dijkstra(1, 5, graph);

    REQUIRE(shortestPath[0] == 1);
    REQUIRE(shortestPath[1] == 2);
    REQUIRE(shortestPath[2] == 4);
    REQUIRE(shortestPath[3] == 5);
}

TEST_CASE("Dijkstras 5: Path through other cut edge", "[weight=10]") {
    Graph graph(0);

    Parser nodes("tests/testnodes.txt", "|");
    Parser edges("tests/testedges.txt", " "); 

    nodes.addVertices(graph);
    edges.addEdges(graph);

    Dijkstras d;
    vector<long int> shortestPath = d.dijkstra(8, 7, graph);

    REQUIRE(shortestPath[0] == 8);
    REQUIRE(shortestPath[1] == 7);
}