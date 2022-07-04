/**
 * @file Parser.cpp
 * Definitions of the Parser class functions.
 *
 * @author Shubham Gupta
 */

#include "Parser.h"
#include <fstream>

using namespace std;

/**
* Constructor that sets file path and delimiter.
* @param path The file to be opened
* @param delimeter The delimeter as a string
*/
Parser::Parser(string path, string delimiter) {
    path_ = path;
    delimiter_ = delimiter;
}

/**
* Splits the string based on delimiter.
* @param path The file to be opened
* @param delimeter The delimeter as a string
* @return The vector containing the two strings
*/
vector<string> Parser::split(string line, string delimiter) {
    vector<string> res;
    string token1 = line.substr(0, line.find(delimiter));
    string token2 = line.substr(token1.length() + delimiter.length(), line.length() - token1.length() - delimiter.length());
    res.push_back(token1);
    res.push_back(token2);
    return res;
}

/**
* Starts loading vertices to the Graph
* @param graph The graph object
*/
void Parser::addVertices(Graph& graph) {
    fstream myFile;
    myFile.open(path_.c_str(), ios::in);
    string temp, line, word;

    while(getline(myFile, line)) {
        vector<string> dataArr = split(line, delimiter_);
        long int id = stol(dataArr[0]);
        string title = dataArr[1];
        Vertex vertex(id, title);
        graph.insertVertex(vertex);
        cout<<"Inserted node with ID: "<<dataArr[0]<<" and title: "<<dataArr[1]<<"\n";
    }
    
    myFile.close();
}

/**
* Starts loading edges to the Graph
* @param graph The graph object
*/
void Parser::addEdges(Graph& graph) {
    fstream myFile;
    myFile.open(path_.c_str(), ios::in);
    string temp, line, word;

    while(getline(myFile, line)) {
        vector<string> dataArr = split(line, delimiter_);
        long int v1 = stol(dataArr[0]);
        long int v2 = stol(dataArr[1]);
        graph.insertEdge(v1, v2, 1);
        cout<<"Inserted edge "<<dataArr[0]<<" ---> "<<dataArr[1]<<" into the graph...\n";
    }
    
    myFile.close();
}

/**
* Gives the edges data within a limit (long int).
* @param limit The upper limit including itself
*/
void Parser::preProcessEdges(long int limit) {
    fstream myFile;
    myFile.open(path_.c_str(), ios::in);
    string temp, line, word;

    while(getline(myFile, line)) {
        vector<string> dataArr = split(line, delimiter_);
        long int v1 = stol(dataArr[0]);
        long int v2 = stol(dataArr[1]);
        if(v1 <= limit && v2 <= limit) {
            cout<<dataArr[0]<<"|"<<dataArr[1]<<"\n";
        }
    }
    
    myFile.close();
}

/**
* Gives the Nodes data within a limit (long int).
* @param limit The upper limit including itself
*/
void Parser::preProcessNodes(long int limit) {
    fstream myFile;
    myFile.open(path_.c_str(), ios::in);
    string temp, line, word;

    while(getline(myFile, line)) {
        vector<string> dataArr = split(line, delimiter_);
        long int id = stol(dataArr[0]);
        string title = dataArr[1];
        if(id <= limit) {
            cout<<dataArr[0]<<"|"<<dataArr[1]<<"\n";
        }
    }
    
    myFile.close();
}