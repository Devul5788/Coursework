#include <iterator>
#include <cmath>

#include <list>
#include <queue>
#include <stack>
#include <vector>

#include "../cs225/PNG.h"
#include "../Point.h"

#include "ImageTraversal.h"
#include "BFS.h"

using namespace cs225;
using namespace std;
/**
 * Initializes a breadth-first ImageTraversal on a given `png` image,
 * starting at `start`, and with a given `tolerance`.
 * @param png The image this BFS is going to traverse
 * @param start The start point of this BFS
 * @param tolerance If the current point is too different (difference larger than tolerance) with the start point,
 * it will not be included in this BFS
 */

/** @todo [Part 1] */
BFS::BFS(const PNG & png, const Point & start, double tolerance) :
png_(png), start_(start), tolerance_(tolerance) {
  visited_.resize(png_.width());
  for(unsigned int i = 0; i < png.width(); i++){
    visited_[i].resize(png_.height());
    for(unsigned int j = 0; j < png.height(); j++){
      visited_[i][j] = false;
    }
  }
  traversal_.push(start);
  visited_[start.x][start.y] = true;
}

BFS::~BFS(){}

/**
 * Returns an iterator for the traversal starting at the first point.
 */
ImageTraversal::Iterator BFS::begin() {
  /** @todo [Part 1] */
  BFS * bfs = new BFS(png_, start_, tolerance_);
  return ImageTraversal::Iterator(*bfs, start_);
}

/**
 * Returns an iterator for the traversal one past the end of the traversal.
 */
ImageTraversal::Iterator BFS::end() {
  /** @todo [Part 1] */
  return ImageTraversal::Iterator();
}

/**
 * Adds a Point for the traversal to visit at some point in the future.
 */
void BFS::add(const Point & point) {
  traversal_.push(point);
}

/**
 * Removes and returns the current Point in the traversal.
 */
Point BFS::pop() {
  Point p = traversal_.front();
  traversal_.pop();
  return p;
}

/**
 * Returns the current Point in the traversal.
 */
Point BFS::peek() const {
  /** @todo [Part 1] */
  return traversal_.front();
}

/**
 * Returns true if the traversal is empty.
 */
bool BFS::empty() const {
  /** @todo [Part 1] */
  return traversal_.empty();
}

bool BFS::getVisited(int x, int y){
  return visited_[x][y];
}

void BFS::setVisitTrue(int x, int y){
  visited_[x][y] = true;
}

PNG * BFS::getPNG(){
  return &png_;
}

double BFS::getTolerance(){
  return tolerance_;
}

int BFS::size(){
  return traversal_.size();
}