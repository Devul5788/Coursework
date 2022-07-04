# Final Project - Wikipedia Hyperlinks
 
### Group members:
* sg49
* ambala2
* danahar2
 
# The way our project works
 
The dataset we are using is  [Wikipedia article hyperlinks ](https://snap.stanford.edu/data/enwiki-2013.html) from 2013. We are creating a program that aims to find the shortest path in between two articles by just clicking on hyperlinks. Hence, our dataset is a directed graph.
 
We use **BFS** to traverse the entire dataset. We also use **Dijkstra'a shortest path alogritm** to return the shortest hyperlink path between any two given articles. Finally, we use **Betwennness Centrality** in order to find the articles in the dataset having the most "popularity" among hyperlinks.
 
# How to use the program
 
## Fetching code
Copy and paste this link in a linux terminal:
 
```
git clone https://github-dev.cs.illinois.edu/cs225-fa21/sg49-ambala2-danahar2
```
 
### Editing the code:
 
Our ```main.cpp``` file has a demonstration of the working of all the functionality of the alogritms in the final project. In order to edit the functionality of the code, you need to change the parameters of the functions inside ```main.cpp``` .
 
1. All article names are encoded as uniquely indexed ```long int``` keys. In order to change the article in program, go to:
```
data/nodes-1000.txt
```
in order to find out the desired aricle's ID. You can now replace the current ID with the new aricle's ID.
 
2. In order to change the graph being used, use the ```graph.h``` constructor to read in new values from a text file into the graph object.
 

## Building the program:
 
To build the program, enter the following in the terminal:
```
make
```
To run the program, enter:
```main
./main
```
 
To make and run test cases, enter the following two commands in the terminal:
```
make test
```
```test
./test
```
The results for all of these should display in the terminal
 
 