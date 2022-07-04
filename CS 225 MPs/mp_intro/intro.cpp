#include "cs225/PNG.h"
#include "cs225/HSLAPixel.h"

#include <string>

using namespace std;
using cs225::HSLAPixel;
using cs225::PNG;

void rotate(string inputFile, string outputFile) {
  PNG image;
  image.readFromFile(inputFile);
  PNG image2(image.width(), image.height());

  for (unsigned x = 0; x < image.width(); x++) {
    for (unsigned y = 0; y < image.height(); y++) {
      HSLAPixel & pixel = image.getPixel(x, y);
      HSLAPixel & pixel2 = image2.getPixel(image.width() -1 - x, image.height()-1 - y);
      pixel2 = pixel;
    }
  }
  image2.writeToFile(outputFile);
}

cs225::PNG myArt(unsigned int width, unsigned int height) {
  PNG png(width, height);

  for (unsigned x = 0; x < width; x++) {
    for (unsigned y = 0; y < height; y++) {
      HSLAPixel & pixel = png.getPixel(x, y);
      pixel.s = (rand() % 100)/50;
      pixel.l = 0.5;
      pixel.a = 0.2;
      pixel.h = x/2;
    }
  }
  return png;
}