/**
 * @file BFS.h
 */

#pragma once

#include <iterator>
#include <cmath>
#include <list>
#include <queue>

#include "../cs225/PNG.h"
#include "../Point.h"

#include "ImageTraversal.h"

using namespace cs225;
using namespace std;
/**
 * A breadth-first ImageTraversal.
 * Derived from base class ImageTraversal
 */
class BFS : public ImageTraversal {
public:
  BFS(const PNG & png, const Point & start, double tolerance);

  ImageTraversal::Iterator begin();
  ImageTraversal::Iterator end();

  void add(const Point & point);
  Point pop();
  Point peek() const;
  bool empty() const;

  bool getVisited(int x, int y);
  void setVisitTrue(int x, int y);

  PNG * getPNG();
  double getTolerance();
  ~BFS();
  int size();


private:
  PNG png_;
  Point start_;
  double tolerance_;
  queue<Point> traversal_;
  vector<vector<bool>> visited_;
};