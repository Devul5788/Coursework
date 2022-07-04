#include "List.h"

#include <iostream>
#include <algorithm>
#include <iostream>
#include <string>
#include <vector>
#include <random>

#include "cs225/PNG.h"
#include "cs225/HSLAPixel.h"

#include "List.h"

using namespace cs225;

int main() {

  // List<int> list;
  // list.insertBack(1);
  // list.insertBack(3);
  // list.insertBack(4);
  // list.insertBack(6);

  // List<int> list2;
  // list2.insertBack(2);
  // list2.insertBack(5);
  // list2.insertBack(7);

  // list.mergeWith(list2);

  PNG im1;       im1.readFromFile("tests/merge1.png");
  PNG im2;       im2.readFromFile("tests/merge2.png");
  PNG expected;  expected.readFromFile("tests/expected-merge.png");

  PNG out(600, 400);

  vector<HSLAPixel> v1;
  for (unsigned i = 0; i < im1.width(); i++)
      for (unsigned j = 0; j < im1.height(); j++)
          v1.push_back(im1.getPixel(i, j));
  vector<HSLAPixel> v2;
  for (unsigned i = 0; i < im2.width(); i++)
      for (unsigned j = 0; j < im2.height(); j++)
          v2.push_back(im2.getPixel(i, j));
  List<HSLAPixel> l1(v1.begin(), v1.end());
  List<HSLAPixel> l2(v2.begin(), v2.end());
  l1.mergeWith(l2);
}
