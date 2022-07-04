#include <iostream>
#include <fstream>
#include <string>
#include <sstream>  
#include <vector>
#include <typeinfo>

#include "../Parser.cpp"
#include "../graph.cpp"
#include "../BFS.cpp"
#include "../dijkstras.cpp"
#include "../betweenness.cpp"

using namespace std;

TEST_CASE("Parsing 1: Split function basic", "[weight=10][valgrind]") {

    Graph graph(0);

    Parser nodes("test-split.txt", "|");
    nodes.addVertices(graph);

    vector<string> test = nodes.split("1|name", "|");

    REQUIRE(test[0].compare("1") == 0);
    REQUIRE(test[1].compare("name") == 0);
}

TEST_CASE("Parsing 2: Split function double delimeter", "[weight=10][valgrind]") {

    Graph graph(0);

    Parser nodes("test-split.txt", "|");
    nodes.addVertices(graph);

    vector<string> test = nodes.split("1||name", "|");

    REQUIRE(test[0].compare("1") == 0);
    REQUIRE(test[1].compare("|name") == 0);
}

TEST_CASE("Parsing 3: Split function empty string after", "[weight=10][valgrind]") {

    Graph graph(0);

    Parser nodes("test-split.txt", "|");
    nodes.addVertices(graph);

    vector<string> test = nodes.split("1|", "|");

    REQUIRE(test[0].compare("1") == 0);
    REQUIRE(test[1].compare("") == 0);
}

TEST_CASE("Parsing 4: Split function empty string before", "[weight=10][valgrind]") {

    Graph graph(0);

    Parser nodes("test-split.txt", "|");
    nodes.addVertices(graph);

    vector<string> test = nodes.split("|title", "|");

    REQUIRE(test[0].compare("") == 0);
    REQUIRE(test[1].compare("title") == 0);
}

TEST_CASE("Parsing 5: Split function empty string", "[weight=10][valgrind]") {

    Graph graph(0);

    Parser nodes("test-split.txt", "|");
    nodes.addVertices(graph);

    vector<string> test = nodes.split("|", "|");

    REQUIRE(test[0].compare("") == 0);
    REQUIRE(test[1].compare("") == 0);
}

TEST_CASE("Parsing 6: Graph entry basic number count", "[weight=10][valgrind]") {

    Graph graph(0);

    Parser nodes("tests/test-split.txt", "|");
    nodes.addVertices(graph);

    REQUIRE(graph.numVertices == 2);
}

TEST_CASE("Parsing 7: Graph entry advanced", "[weight=10][valgrind]") {

    Graph graph(0);

    Parser nodes("tests/test-split.txt", "|");
    nodes.addVertices(graph);

    string test1 = graph.getVertex(1).getTitle();
    string test2 = graph.getVertex(2).getTitle();

    cout<<test1<<" "<<test2;

    REQUIRE(test1.compare("one") == 0);
    REQUIRE(test2.compare("two") == 0);
}