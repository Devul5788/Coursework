# Goals


### Group members:

* sg49

* ambala2

* danahar2

 

## 1. Dataset

 

Our dataset is that of Wikipedia hyperlinks from 2013. They are from the stanford snap database.

 

[HERE](https://snap.stanford.edu/data/enwiki-2013.html) is the link to our dataset.

 

### Respresetation/Format

* **Nodes**: Articles

* **Edges**: Directed link from source article to destination article

 

### Parsing

 

The ```Parser``` class converts the data from a .txt file into a member in the class

 

## 2. Algorithms

 

**BFS:** We find the route by making sure that no other route reaches from node A to node B in fewer edges. Therefore, BFS finds shortest paths from a given source vertex to all other vertices, in terms of the number of edges in the paths. For example, the "six degrees of Kevin Bacon" game. Here, players try to connect movie actors and actresses to Kevin Bacon according to a chain of who appeared with whom in a movie. The shorter the chain, the better, and it's astounding how many actors and actresses can get to Kevin Bacon in a chain of six or fewer. As an example, take Kate Bell, an Australian actress. She was in MacBeth with Nash Edgerton in 2006; Edgerton was in The Matrix Reloaded with Laurence Fishburne in 2003; and Fishburne was in Mystic River with Kevin Bacon in 2003. Therefore, Kate Bell's "Kevin Bacon number" is 3. In fact, there are several ways to find that Kate Bell's Kevin Bacon number is 3.

 

<img src="https://codewithshubham.in/cs225/2.png" height="200px" style="padding-top: 10px; padding-bottom: 10px"/>

 

**Dijkstra's Algorithm**: We are going to use Dijkstra's shortest path algorithm on a directed, weighted graph. The following is our rationale for the implementation:

 

* Directed: Since articles are hyperlinked to each other in a single direction, we will have a directed graph.

 

* Input: Our algorithm takes in two articles (nodes), the starting article and the destination article.

 

* Output: The result gives the shortest path of hyperlinks between two articles (We could store this as a vector of nodes).

 

* Weight: In order to find the link between two articles we could have used a simple **BFS** algorithm, but we are going to use an important feature of the dataset in order to assign a weight to optimize the algoritm. We will measure the *popularity* of an article as the number of other articles that it is linked to. To get the weight of an edge in one direction, we will take the inverse of the popularity of the succeeding vertex. Hence, the algorithm incentivizes going to more popular articles first as they are more likely to be linked to the destination article. The image below shows how the weights are assigned for each edge.

 

<img src="https://codewithshubham.in/cs225/1.jpg" height="200px" style="padding-top: 10px; padding-bottom: 10px"/>

 

We expect a worst case runtime of **O(n<sup>2</sup>)**, which will be optimized using a priority queue giving a runtime of O(V + E log(V)), where V is the number of vertices and E is the number of edges.

 

Betweenness Centrality Algorithm: We are going to use Betweenness Centrality to find out the edges between the search queries. We can also visualize this dataset using layered graph drawing since it is a directed graph. It is a way of detecting the amount of influence a node has over the flow of information in a graph. It is often used to find nodes that serve as a bridge from one part of a graph to another. The following is our rationale for the implementation:

 

Directed: Since articles are hyperlinked to each other in a single direction, we will have a directed graph.

 

Input: Our algorithm takes in two articles (nodes), the starting article and the destination article.

 

Output: The result gives the shortest path of hyperlinks between two articles (We could respresent it graphically).

 

Weight: The GDS implementation is based on Brandes' approximate algorithm for unweighted graphs. The implementation requires O(n + m) space and runs in O(n * m) time, where n is the number of nodes and m the number of relationships in the graph.

 

## 3. Deliverables

 

1. **Parser Algorithm:** Converts .txt file to Parser object, which can be passed to graph constructor.

2. **Graph Implementation:** We decided to use an adjacency list in order to implement graph

3. **BFS:** Two functions that printBFS and mapBFS to a vector

4. **Dijkstra:** Function that returns a vector containing shortest path

5. **Betweenness:** Function that returns a map that assigns each key to its centrality value.

 

## 4. Timeline and Time Commitment

 

Wed, Nov 10, 2021: Data Acquisition

 

  

1. Wed, Nov 17, 2021: Data Processing and setting it up as a graph according to the relations specified by the hyperlinks

 

  

2. Sat, Nov 20, 2021: Research what shortest path finding algorithm to use as well as any other graphing algorithm we may require

 

   

3. Sun, Dec 5, 2021: Complete each individual algorithm

 

     

4. Thu, Dec 9, 2021: Write function that traverses the graph and prints the list of node hyperlinks that connects two different topics

 

    

5. Sun, Dec 12, 2021: Final Project Deliverables

 

 