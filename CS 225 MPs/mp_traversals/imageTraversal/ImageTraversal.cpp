#include <cmath>
#include <iterator>
#include <iostream>

#include "../cs225/HSLAPixel.h"
#include "../cs225/PNG.h"
#include "../Point.h"

#include "ImageTraversal.h"

using namespace cs225;
using namespace std;

/**
 * Calculates a metric for the difference between two pixels, used to
 * calculate if a pixel is within a tolerance.
 *
 * @param p1 First pixel
 * @param p2 Second pixel
 * @return the difference between two HSLAPixels
 */
double ImageTraversal::calculateDelta(const HSLAPixel & p1, const HSLAPixel & p2) {
  double h = fabs(p1.h - p2.h);
  double s = p1.s - p2.s;
  double l = p1.l - p2.l;

  // Handle the case where we found the bigger angle between two hues:
  if (h > 180) { h = 360 - h; }
  h /= 360;

  return sqrt( (h*h) + (s*s) + (l*l) );
}

ImageTraversal::~ImageTraversal(){}

/**
 * Default iterator constructor.
 */
ImageTraversal::Iterator::Iterator() {
  /** @todo [Part 1] */
  traversal_ = NULL;
  start_ = Point(0,0);
  current_ = start_;
}

ImageTraversal::Iterator::Iterator(ImageTraversal & traversal, Point start) {
  /** @todo [Part 1] */
  traversal_ = &traversal;
  start_ = start;
  current_ = start_;
}

/**
 * Iterator increment opreator.
 *
 * Advances the traversal of the image.
 */
ImageTraversal::Iterator & ImageTraversal::Iterator::operator++() {
  /** @todo [Part 1] */
  Point pnt = traversal_->pop();
  unsigned int x = pnt.x;
  unsigned int y = pnt.y;
  traversal_->setVisitTrue(x, y);
  PNG * png = traversal_->getPNG();

  //Right case
  if(x + 1 < png->width()) traversal_->add(Point(x+1, y));
  //Down case
  if(y + 1 < png->height()) traversal_->add(Point(x, y + 1));
  //Left case
  if(x - 1 >= 0 && x - 1 < png->width()) traversal_->add(Point(x - 1, y));
  //Up Case
  if(y - 1 >= 0 && y - 1 < png->height()) traversal_->add(Point(x, y-1));

  Point point = traversal_->peek();
  while(!traversal_->empty() && (traversal_->getVisited(point.x, point.y) || calculateDelta(png->getPixel(start_.x, start_.y), png->getPixel(point.x, point.y)) > traversal_->getTolerance())){
    point = traversal_->peek();
    if((traversal_->getVisited(point.x, point.y) || calculateDelta(png->getPixel(start_.x, start_.y), png->getPixel(point.x, point.y)) > traversal_->getTolerance())) traversal_->pop();
  }

  current_ = point;
  return *this;
}

/**
 * Iterator accessor opreator.
 *
 * Accesses the current Point in the ImageTraversal.
 */
Point ImageTraversal::Iterator::operator*() {
  /** @todo [Part 1] */
  return current_;
}

ImageTraversal::Iterator::~Iterator(){
  if (traversal_ != NULL) delete traversal_;
	traversal_ = NULL;
}

/**
 * Iterator inequality operator.
 *
 * Determines if two iterators are not equal.
 */
bool ImageTraversal::Iterator::operator!=(const ImageTraversal::Iterator &other) {
  /** @todo [Part 1] */
  bool thisEmpty = traversal_ != nullptr ? traversal_ -> empty() : true;
	bool otherEmpty = other.traversal_ != nullptr ? other.traversal_ -> empty() : true;
	return !(thisEmpty && otherEmpty);
}