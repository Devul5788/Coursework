
# search.py
# ---------------
# Licensing Information:  You are free to use or extend this projects for
# educational purposes provided that (1) you do not distribute or publish
# solutions, (2) you retain this notice, and (3) you provide clear
# attribution to the University of Illinois at Urbana-Champaign
#
# Created by Kelvin Ma (kelvinm2@illinois.edu) on 01/24/2021

"""
This is the main entry point for MP3. You should only modify code
within this file -- the unrevised staff files will be used for all other
files and classes when code is run, so be careful to not modify anything else.
"""
# Search should return the path.
# The path should be a list of tuples in the form (row, col) that correspond
# to the positions of the path taken by your search algorithm.
# maze is a Maze object based on the maze from the file specified by input filename
# searchMethod is the search method specified by --method flag (bfs,dfs,astar,astar_multi,fast)

import queue as q
import heapq
import math
from collections import defaultdict

# Feel free to use the code below as you wish
# Initialize it with a list/tuple of objectives
# Call compute_mst_weight to get the weight of the MST with those objectives
# TODO: hint, you probably want to cache the MST value for sets of objectives you've already computed...
# Note that if you want to test one of your search methods, please make sure to return a blank list
#  for the other search methods otherwise the grader will not crash.
class MST:
    def __init__(self, objectives):
        self.elements = {key: None for key in objectives}

        # TODO: implement some distance between two objectives
        # ... either compute the shortest path between them, or just use the manhattan distance between the objectives
        self.distances   = {
                (i, j): man_dist(i, j)
                for i, j in self.cross(objectives)
            }

    # Prim's algorithm adds edges to the MST in sorted order as long as they don't create a cycle
    def compute_mst_weight(self):
        weight      = 0
        for distance, i, j in sorted((self.distances[(i, j)], i, j) for (i, j) in self.distances):
            if self.unify(i, j):
                weight += distance
        return weight

    # helper checks the root of a node, in the process flatten the path to the root
    def resolve(self, key):
        path = []
        root = key
        while self.elements[root] is not None:
            path.append(root)
            root = self.elements[root]
        for key in path:
            self.elements[key] = root
        return root

    # helper checks if the two elements have the same root they are part of the same tree
    # otherwise set the root of one to the other, connecting the trees
    def unify(self, a, b):
        ra = self.resolve(a)
        rb = self.resolve(b)
        if ra == rb:
            return False
        else:
            self.elements[rb] = ra
            return True

    # helper that gets all pairs i,j for a list of keys
    def cross(self, keys):
        return (x for y in (((i, j) for j in keys if i < j) for i in keys) for x in y)

def bfs(maze):
    """
    Runs BFS for part 1 of the assignment.

    @param maze: The maze to execute the search on.

    @return path: a list of tuples containing the coordinates of each state in the computed path
    """
    return_path = []

    queue = []
    queue.append(maze.start)

    visited = set()
    visited.add(maze.start)

    # a map to keep track of the previous aka parent node
    parent = {}

    while queue:
        cell = queue.pop(0)

        if maze.__getitem__(cell) == maze.legend.waypoint:
            return_path.append(cell)
            for path_cell in return_path:
                if (path_cell != maze.start):
                    return_path.append(parent[return_path[-1]])
            return_path.reverse()
            return return_path
        
        neighbors = maze.neighbors(cell[0], cell[1])
        
        for neighbor in neighbors:
            if neighbor not in visited:
                parent[neighbor] = cell
                queue.append(neighbor)
                visited.add(neighbor)

def astar_single(maze):
    """
    Runs A star for part 2 of the assignment.

    @param maze: The maze to execute the search on.

    @return path: a list of tuples containing the coordinates of each state in the computed path
    """
    endPoint = maze.waypoints[0]
    
    return_path = [] 

    pq = []
    heapq.heappush(pq, (man_dist(maze.start, endPoint), maze.start))

    visited = set()
    visited.add(maze.start)    

    g = {}
    g[maze.start] = 0

    parent = {}

    while pq:
        cell = heapq.heappop(pq)[1]

        if maze.__getitem__(cell) == maze.legend.waypoint:
            return_path.append(cell)
            for path_cell in return_path:   
                if (path_cell != maze.start):
                    return_path.append(parent[return_path[-1]])
            return_path.reverse()
            return return_path
        
        neighbors = maze.neighbors(cell[0], cell[1])
        g[cell] = g.get(cell, math.inf)
        
        for neighbor in neighbors:
            g[neighbor] = g.get(neighbor, math.inf)
            tempG = g[cell] + man_dist(cell, neighbor)
            if (tempG < g[neighbor]):
                parent[neighbor] = cell
                g[neighbor] = tempG
                heapq.heappush(pq, (tempG + man_dist(neighbor, endPoint), neighbor))
    
    return []

def man_dist(start, end):
    return abs(start[0] - end[0]) + abs(start[1] - end[1])

def astar_multiple(maze):
    # """
    # Runs A star for part 3 of the assignment in the case where there are
    # multiple objectives.

    # @param maze: The maze to execute the search on.

    # @return path: a list of tuples containing the coordinates of each state in the computed path
    # """
    remaining_waypoints = list(maze.waypoints)
    start_pos = maze.start
    pq = []
    heapq.heappush(pq, (multi_heuristic(remaining_waypoints, start_pos), start_pos, tuple(remaining_waypoints)))
    g = defaultdict(lambda: math.inf)
    g[(start_pos, tuple(remaining_waypoints))] = 0
    parent = {}

    while pq:
        f, cell, remaining_waypoints = heapq.heappop(pq)
        remaining_waypoints = list(remaining_waypoints)
        prev_remaining_waypoints = remaining_waypoints.copy()

        if cell in remaining_waypoints:
            remaining_waypoints.remove(cell)

            if (len(remaining_waypoints) == 0):
                return_path = []
                final_path = []
                return_path.append((cell, tuple(prev_remaining_waypoints)))
                final_path.append(cell)
                for data in return_path: 
                    if data != (start_pos, maze.waypoints):
                        p = parent[return_path[-1]]
                        return_path.append(p)
                        final_path.append(p[0])

                final_path.reverse()
                return final_path

        neighbors = maze.neighbors(cell[0], cell[1])
        
        for neighbor in neighbors:
            h = multi_heuristic(remaining_waypoints, neighbor)
            tent_g = g[(cell, tuple(prev_remaining_waypoints))] + man_dist(cell, neighbor)

            if (tent_g < g[(neighbor, tuple(remaining_waypoints))]):
                parent[(neighbor, tuple(remaining_waypoints))] = (cell, tuple(prev_remaining_waypoints))
                g[(neighbor, tuple(remaining_waypoints))] = tent_g
                heapq.heappush(pq, (tent_g + h, neighbor, tuple(remaining_waypoints)))

    return []

def remove_adj(path):
    final_path = path
    n = len(final_path) 
    i = 0
    while i < n:
        if final_path[i] == final_path[i-1]:
            final_path.remove(final_path[i])
            n -= 1
        else:
            i += 1
    return final_path

def multi_heuristic(waypoints, cell):
    min_dist = 0

    for point in waypoints:
        if min_dist > man_dist(point, cell):
            min_dist = man_dist(point, cell)

    return MST(waypoints).compute_mst_weight() + min_dist


def fast(maze):
    # """
    # Runs A star for part 3 of the assignment in the case where there are
    # multiple objectives.

    # @param maze: The maze to execute the search on.

    # @return path: a list of tuples containing the coordinates of each state in the computed path
    # """
    remaining_waypoints = list(maze.waypoints)
    start_pos = maze.start
    pq = []
    heapq.heappush(pq, (multi_heuristic(remaining_waypoints, start_pos), start_pos, tuple(remaining_waypoints)))
    g = defaultdict(lambda: math.inf)
    g[(start_pos, tuple(remaining_waypoints))] = 0
    parent = {}

    while pq:
        f, cell, remaining_waypoints = heapq.heappop(pq)
        remaining_waypoints = list(remaining_waypoints)
        prev_remaining_waypoints = remaining_waypoints.copy()

        if cell in remaining_waypoints:
            remaining_waypoints.remove(cell)

            if (len(remaining_waypoints) == 0):
                return_path = []
                final_path = []
                return_path.append((cell, tuple(prev_remaining_waypoints)))
                final_path.append(cell)
                for data in return_path: 
                    if data != (start_pos, maze.waypoints):
                        p = parent[return_path[-1]]
                        return_path.append(p)
                        final_path.append(p[0])

                final_path.reverse()
                return final_path

        neighbors = maze.neighbors(cell[0], cell[1])
        
        for neighbor in neighbors:
            h = multi_heuristic(remaining_waypoints, neighbor)
            tent_g = g[(cell, tuple(prev_remaining_waypoints))] + man_dist(cell, neighbor)

            if (tent_g < g[(neighbor, tuple(remaining_waypoints))]):
                parent[(neighbor, tuple(remaining_waypoints))] = (cell, tuple(prev_remaining_waypoints))
                g[(neighbor, tuple(remaining_waypoints))] = tent_g
                heapq.heappush(pq, (tent_g + 10 * h, neighbor, tuple(remaining_waypoints)))

    return []