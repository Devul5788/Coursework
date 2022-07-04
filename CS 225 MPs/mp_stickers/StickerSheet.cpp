#include "StickerSheet.h"
#include "cs225/PNG.h"
#include <math.h>
#include "Image.h"
#include <iostream>

using namespace cs225;
using namespace std;

StickerSheet::StickerSheet(const Image &picture, unsigned max){
    max_ = max;
    base_ = new Image(picture);
    stickers_ = new Image*[max_];
    for(unsigned i = 0; i < max_; i++){
        stickers_[i] = NULL;
    }
    x_ = new unsigned [max_];
    y_ = new unsigned [max_];
}

void StickerSheet::delete_(){
    if(base_ != NULL) delete base_;
    if(x_ != NULL) delete[] x_;
    if(y_ != NULL) delete[] y_;

    //Free Each subarray
    if(stickers_ != NULL){
        for (unsigned i = 0; i < max_; i++){
            if(stickers_[i] != NULL){
                delete stickers_[i];
                stickers_[i] = NULL;
            } 
        }

        //Free the entire array
        delete[] stickers_;
    }
}

StickerSheet::~StickerSheet(){
    delete_();
}

//This is a deep copy
void StickerSheet::copy_ (const StickerSheet &other){
    max_ = other.max_;
    base_ = new Image(*(other.base_));
    stickers_ = new Image*[max_];
    x_ = new unsigned [max_];
    y_ = new unsigned [max_];

    for(unsigned i = 0; i < max_; i++){
        if(other.stickers_[i] != NULL){
            stickers_[i] = new Image(*other.stickers_[i]);
        } else{
            stickers_[i] = NULL;
        }
        
        x_[i] = other.x_[i];
        y_[i] = other.y_[i];
    }
}

StickerSheet::StickerSheet (const StickerSheet &other){
    copy_(other);
}

const StickerSheet & StickerSheet::operator= (const StickerSheet &other){
    //this is a pointer to an address of this particular instance of the object
    //other is a reference to another instance
    //&other gets the address of that other instance of the class. Now we can compare the
    //address this points and the address of other.
    if(this != &other){
        //we delete first so that we have cleared the space from heap. And then we
        //can use other space to make a copy.
        delete_();
        copy_(other);
    }

    return *this;
}

void StickerSheet::changeMaxStickers(unsigned max){
    if(max_ == max) return;

    Image ** newStickers = new Image*[max];
    for(unsigned i = 0; i < max; i++){
        newStickers[i] = NULL;
    }
    unsigned * x = new unsigned [max];
    unsigned * y = new unsigned [max];

    for(unsigned i = 0; i < max_; i++){
        if(i < max){
            newStickers[i] = stickers_[i];
            x[i] = x_[i];
            y[i] = y_[i];
        } else {
            if(stickers_[i] != NULL){
                delete stickers_[i];
                stickers_[i] = NULL;
            }
        }
    }

    //Free the entire array
    delete[] stickers_;

    // //delete x and y
    if(x_ != NULL) delete[] x_;
    if(y_ != NULL) delete[] y_;

    stickers_ = newStickers;
    x_ = x;
    y_ = y;

    max_ = max;
}

int StickerSheet::addSticker (Image &sticker, unsigned x, unsigned y){
    for (unsigned i = 0; i < max_; i ++) {
        if (stickers_[i] == NULL) {
            stickers_[i] = new Image(sticker);
            x_[i] = x;
            y_[i] = y;
            return i;
        }
    }
    return -1;
}

bool StickerSheet::translate (unsigned index, unsigned x, unsigned y){
    // index is valid and that the layer contains a sticker
    if(index < max_ && stickers_[index] != NULL){
        x_[index] = x;
        y_[index] = y;
        return true;
    }
    
    return false;
}

void StickerSheet::removeSticker (unsigned index){
    unsigned * x = new unsigned [max_ - 1];
    unsigned * y = new unsigned [max_ - 1];
    for (unsigned i = 0; i < max_; i ++) {
        if(stickers_[i] != NULL){
            if(i == index){
                delete stickers_[i];
                stickers_[i] = NULL;
            } else {
                x[i] = x_[i];
                y[i] = y_[i];
            }
        }
    }

    if(x_ != NULL) delete[] x_;
    if(y_ != NULL) delete[] y_;

    x_ = x;
    y_ = y;
    max_--;
}

Image* StickerSheet::getSticker (unsigned index){
    if(index < max_){
        return stickers_[index];
    }

    return NULL;
}

Image StickerSheet::render () const{
    // load base image
    Image img (*base_);

    //loop through every image in sticker
    for(unsigned i = 0; i < max_; i++){
        if(stickers_[i] != NULL){
            unsigned w = img.width();
            unsigned h = img.height();

            if(stickers_[i]->width() + x_[i] > w){
                img.resize(stickers_[i]->width() + x_[i], img.height());
            } 
            if(stickers_[i]->height() + y_[i] > h){
                img.resize(img.width(), stickers_[i]->height() + y_[i]);
            } 

            for(unsigned x = 0; x < stickers_[i]->width(); x++){
                for(unsigned y = 0; y < stickers_[i]->height(); y++){
                    HSLAPixel & pixel = stickers_[i]->getPixel(x, y);
                    HSLAPixel & pixel2 = img.getPixel(x_[i] + x, y_[i] + y);
                    
                    if(pixel.a != 0){
                        pixel2 = pixel;
                    }
                }
            }
        }
    }

    return img;
}

