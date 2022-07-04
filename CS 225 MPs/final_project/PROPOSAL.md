<h1>Final Project Proposal (sg49-ambala2-danahar2)</h1>

<h3>Team Members</h3>
<li>Advaith Bala (ambala2)</li>
<li>Devul Nahar (danahar2)</li>
<li>Shubham Gupta (sg49)</li>

<ol>
<li>
<h3>Leading question</h3>

<ul>
  <li>
    <b>Motivating Question</b>: To what extent are two different topics connected to each other by hyperlinks on Wikipedia?
  </li>
  <li>
    <b>Target Goal</b>: To help find the shortest and most relevant connection between any two pages on Wikipedia.
  </li>
  <li>
    <b>Problem</b>: To see the interconnectedness of different topics, and how we can learn about a topic in more depth by acquiring knowledge about related topics.
  </li>
   <li>
    <b>Learning from Dataset</b>: Hyperlinks are going to be organized as different nodes in an unweighted, incomplete, and bidirectional graph. Each edge will indicate the connection between two different hyperlinks. 
  </li>
     <li>
    <b>What does success look like for us?</b>: The project is able to find the shortest path between two topics (given to the program as inputs) using graphs, hyperlinks, and path finding algorithms. After finding the shortest path, the program prints the list of hyperlinks that connect two different topics. 
  </li>
</ul>
</li>

<li>
<h3>Dataset Acquisition and Processing:</h3>

<ul>
  <li>
  We are looking at datasets similar to <a href="https://snap.stanford.edu/data/enwiki-2013.html">this</a>, i.e., datasets which contain a list of unique Wikipedia pages and provide how each Wiki page is connected to the other via hyperlinks.
  </li>
  <li>
  The dataset is a network of hyperlinks from a snapshot of English Wikipedia in 2013. <b>An edge from i to j indicates a hyperlink on page i to page j</b>. As part of this dataset, we also include the titles of the pages.
  </li>
  <li>
    The dataset contains two columns:
    <ul>
    <li>Title of the Wikipedia article.</li>
    <li>Serial number/page identifier.</li>
    </ul>
  </li>
   <li>
    Here are a few detailed statistics:
    <ul>
    <li>Number of nodes: 4203323</li>
    <li>Number of edges: 101311614</li>
    <li>Diameter (longest shortest path): 8</li>
    <li>90-percentile effective diameter: 3.8</li>
    </ul>
  </li>
     <li>
  Since the data is very large, we would need to pre-process the data to:
  <ul>
<li>Number of nodes: 4203323</li>
    <li>Remove any invalid ASCII characters from Wiki article titles.</li>
    <li>Check for any empty/invalid links between two nodes in the given text file.</li>
    </ul>
  </li>
</ul>
</li>

<li>
<h3>Graph Algorithms</h3>

<b>BFS: </b> We find the route by making sure that no other route reaches from node A to node B in fewer edges. Therefore, BFS finds shortest paths from a given source vertex to all other vertices, in terms of the number of edges in the paths. For example, the "six degrees of Kevin Bacon" game. Here, players try to connect movie actors and actresses to Kevin Bacon according to a chain of who appeared with whom in a movie. The shorter the chain, the better, and it's astounding how many actors and actresses can get to Kevin Bacon in a chain of six or fewer. As an example, take Kate Bell, an Australian actress. She was in MacBeth with Nash Edgerton in 2006; Edgerton was in The Matrix Reloaded with Laurence Fishburne in 2003; and Fishburne was in Mystic River with Kevin Bacon in 2003. Therefore, Kate Bell's "Kevin Bacon number" is 3. In fact, there are several ways to find that Kate Bell's Kevin Bacon number is 3.

<img src="https://codewithshubham.in/cs225/2.png" height="200px" style="padding-top: 10px; padding-bottom: 10px"/>

<b>Dijkstra's Algorithm</b>: We are going to use Dijkstra's shortest path algorithm on a directed, weighted graph. The following is our rationale for the implementation:

<ul>

<li>
<b>Directed</b>: Since articles are hyperlinked to each other in a single direction, we will have a <b>directed graph</b>.
</li>
<li>
<b>Input</b>: Our algorithm takes in two articles (nodes), the starting article and the destination article.
</li>
<li>
<b>Output</b>: The result gives the shortest path of hyperlinks between two articles (We could store this as a vector of nodes).
</li>
<li>
 <b>Weight</b>: In order to find the link between two articles we could have used a simple <b>BFS</b> algorithm, but we are going to use an important feature of the dataset in order to assign a weight to optimize the algoritm. We will measure the <i>popularity</i> of an article as the number of other articles that it is linked to. To get the weight of an edge in one direction, we will take the inverse of the popularity of the succeeding vertex. Hence, the algorithm incentivizes going to more popular articles first as they are more likely to be linked to the destination article. The image below shows how the weights are assigned for each edge.
</li>
<img src="https://codewithshubham.in/cs225/1.jpg" height="200px" style="padding-top: 10px; padding-bottom: 10px"/>
</ul>
We expect a worst case runtime of <b>O(n<sup>2</sup>)</b>, which will be optimized using a priority queue giving a runtime of <b>O(V + E log(V))</b>, where V is the number of vertices and E is the number of edges.
</li>

<br>

<b>Betweenness Centrality Algorithm</b>: We are going to use Betweenness Centrality to find out the edges between the search queries. We can also visualize this dataset using layered graph drawing since it is a directed graph. It is a way of detecting the amount of influence a node has over the flow of information in a graph. It is often used to find nodes that serve as a bridge from one part of a graph to another. The following is our rationale for the implementation:

<ul>

<li>
<b>Directed</b>: Since articles are hyperlinked to each other in a single direction, we will have a <b>directed graph</b>.
</li>
<li>
<b>Input</b>: Our algorithm takes in two articles (nodes), the starting article and the destination article.
</li>
<li>
<b>Output</b>: The result gives the shortest path of hyperlinks between two articles (We could respresent it graphically).
</li>
<li>
 <b>Weight</b>: The GDS implementation is based on Brandes' approximate algorithm for unweighted graphs. The implementation requires O(n + m) space and runs in O(n * m) time, where n is the number of nodes and m the number of relationships in the graph.
</li>

</ul>


<li>
<h3>Project Timeline:</h3>

<ol>
  <li>
    <b>Wed, Nov 10, 2021</b>: Data Acquisition
  </li>
  <li>
    <b>Wed, Nov 17, 2021</b>: Data Processing and setting it up as a graph according to the relations specified by the hyperlinks
  </li>
  <li>
    <b>Sat, Nov 20, 2021</b>: Research what shortest path finding algorithm to use as well as any other graphing algorithm we may require
  </li>
   <li>
    <b>Sun, Dec 5, 2021</b>: Complete each individual algorithm
  </li>
     <li>
    <b>Thu, Dec 9, 2021</b>: Write function that traverses the graph and prints the list of node hyperlinks that connects two different topics
  </li>
    <li>
    <b>Sun, Dec 12, 2021</b>: Final Project Deliverables
  </li>
</ol>

</li>

</ol>

