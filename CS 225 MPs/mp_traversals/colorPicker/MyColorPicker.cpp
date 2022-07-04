#include "../cs225/HSLAPixel.h"
#include "../Point.h"

#include "ColorPicker.h"
#include "MyColorPicker.h"

using namespace cs225;

MyColorPicker::MyColorPicker(int height){
  height_ = height;
}

/**
 * Picks the color for pixel (x, y).
 * Using your own algorithm
 */
HSLAPixel MyColorPicker::getColor(unsigned x, unsigned y) {
  HSLAPixel ret;

  if(y >= 0 && y < (unsigned) height_/6){
    ret = HSLAPixel(105, 0.68, 0.5, 1);
  } else if (y >= (unsigned)height_/6 && y < (unsigned)2 * height_/6){
    ret = HSLAPixel(63, 0.79, 0.52, 1);
  } else if (y >= (unsigned)2 * height_/6 && y < (unsigned)3 * height_/6) {
    ret = HSLAPixel(39, 0.79, 0.52, 1);
  } else if (y >= (unsigned)3 * height_/6 && y < (unsigned)4 * height_/6){
    ret = HSLAPixel(8, 0.79, 0.52, 1);
  } else if (y >= (unsigned)4 * height_/6 && y <(unsigned) 5 * height_/6){
    ret = HSLAPixel(272, 0.79, 0.52, 1);
  } else if (y >= (unsigned)5 * height_/6 && y < (unsigned)6 * height_/6)
    ret = HSLAPixel(203, 0.79, 0.52, 1);
  return ret;
}
