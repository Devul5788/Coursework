#include "Image.h"
#include "cs225/PNG.h"
#include <math.h>
#include <algorithm>

using namespace cs225;

void Image::lighten() {
	for (unsigned int x = 0; x < width(); x++) {
		for (unsigned int y = 0; y < height(); y++) {
			HSLAPixel & pixel = getPixel(x, y);
            pixel.l += 0.1;
            if(pixel.l > 1) pixel.l = 1;
            if(pixel.l < 0) pixel.l = 0;
		}
	}
}

void Image::lighten	(double amount){
    for (unsigned int x = 0; x < width(); x++) {
		for (unsigned int y = 0; y < height(); y++) {
			HSLAPixel & pixel = getPixel(x, y);
            pixel.l += amount;
            if(pixel.l > 1) pixel.l = 1;
            if(pixel.l < 0) pixel.l = 0;
		}
	}
}

void Image::darken(){
    for (unsigned int x = 0; x < width(); x++) {
		for (unsigned int y = 0; y < height(); y++) {
			HSLAPixel & pixel = getPixel(x, y);
            pixel.l -= 0.1;
            if(pixel.l > 1) pixel.l = 1;
            if(pixel.l < 0) pixel.l = 0;
		}
	}
}

void Image::darken(double amount){
    for (unsigned int x = 0; x < width(); x++) {
		for (unsigned int y = 0; y < height(); y++) {
			HSLAPixel & pixel = getPixel(x, y);
            pixel.l -= amount;
            if(pixel.l > 1) pixel.l = 1;
            if(pixel.l < 0) pixel.l = 0;
		}
	}
}

void Image::desaturate(){
    for (unsigned int x = 0; x < width(); x++) {
		for (unsigned int y = 0; y < height(); y++) {
			HSLAPixel & pixel = getPixel(x, y);
            pixel.s -= 0.1;
            if(pixel.s > 1) pixel.s = 1;
            if(pixel.s < 0) pixel.s = 0;
		}
	}
}

void Image::desaturate(double amount){
    for (unsigned int x = 0; x < width(); x++) {
		for (unsigned int y = 0; y < height(); y++) {
			HSLAPixel & pixel = getPixel(x, y);
            pixel.s -= amount;
            if(pixel.s > 1) pixel.s = 1;
            if(pixel.s < 0) pixel.s = 0;
		}
	}
}

void Image::grayscale(){
    for (unsigned x = 0; x < width(); x++) {
        for (unsigned y = 0; y < height(); y++) {
            HSLAPixel & pixel = getPixel(x, y);

            // `pixel` is a pointer to the memory stored inside of the PNG `image`,
            // which means you're changing the image directly.  No need to `set`
            // the pixel since you're directly changing the memory of the image.
            pixel.s = 0;
        }
    }
}

void Image::illinify(){
    for (unsigned x = 0; x < width(); x++) {
        for (unsigned y = 0; y < height(); y++) {
            HSLAPixel & pixel = getPixel(x, y);
            int o1 = abs(pixel.h - 11);
            int b1 = abs(pixel.h - 216);
            int o2 = abs(pixel.h-360 - 11);
            int b2 = abs(pixel.h-360 - 216);

            if(((b1 < o1) && (b1 < o2)) || ((b2 < o1) && (b2 < o2))){
                pixel.h = 216;
            } else if (((o1 < b1) && (o1 < b2)) || ((o2 < b1) && (o2 < b2))){
                pixel.h = 11;
            }
        }
    } 
}

void Image::rotateColor(double degrees){
    for (unsigned int x = 0; x < width(); x++) {
		for (unsigned int y = 0; y < height(); y++) {
			HSLAPixel & pixel = getPixel(x, y);
            int num = pixel.h + degrees;
            if(num >= 360){
                pixel.h = num - 360;
            } else if(num <= 0){
                pixel.h = 360 + num;
            } else {
                pixel.h = num;
            }
		}
	}
}

void Image::saturate(){
    for (unsigned int x = 0; x < width(); x++) {
		for (unsigned int y = 0; y < height(); y++) {
			HSLAPixel & pixel = getPixel(x, y);
            pixel.s += 0.1;
            if(pixel.s > 1) pixel.s = 1;
            if(pixel.s < 0) pixel.s = 0;
		}
	}
}

void Image::saturate(double amount){
    for (unsigned int x = 0; x < width(); x++) {
		for (unsigned int y = 0; y < height(); y++) {
			HSLAPixel & pixel = getPixel(x, y);
            pixel.s += amount;
            if(pixel.s > 1) pixel.s = 1;
            if(pixel.s < 0) pixel.s = 0;
		}
	}
}

void Image::scale(double factor){
    unsigned int h = height() * factor;
    unsigned int w = width() * factor;

    Image * newI = new Image();
    *newI = *this;
    newI->resize(w, h);

	for (unsigned int x = 0; x < w; x++) {
		for (unsigned int y = 0; y < h; y++) {
            HSLAPixel & newPixel = newI->getPixel(x, y);
			newPixel = getPixel(x/factor, y/factor);
		}
	}

    *this = *newI;

    delete newI;
}

void Image::scale(unsigned w, unsigned h){
    double f1 = (1.0 * w) / width();
    double f2 = (1.0 * h) / height();
    scale(std::min(f1, f2));
}