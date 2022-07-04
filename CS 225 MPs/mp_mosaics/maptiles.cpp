/**
 * @file maptiles.cpp
 * Code for the maptiles function.
 */

#include <iostream>
#include <map>
#include "maptiles.h"
//#include "cs225/RGB_HSL.h"

using namespace std;


Point<3> convertToXYZ(LUVAPixel pixel) {
    return Point<3>( pixel.l, pixel.u, pixel.v );
}

MosaicCanvas* mapTiles(SourceImage const& theSource, vector<TileImage>& theTiles){
    MosaicCanvas * canvas = new MosaicCanvas(theSource.getRows(), theSource.getColumns());
    vector<Point<3>> averageLUV;
    map<Point<3>, unsigned long> map;

    for(unsigned long i = 0; i < theTiles.size(); i++){
        Point <3> p = convertToXYZ(theTiles[i].getAverageColor());
        averageLUV.push_back(p);
        map[p] = i;
    }

    KDTree<3> tree (averageLUV); 

    for(int i = 0; i < theSource.getRows(); i++){
        for(int j = 0; j < theSource.getColumns(); j++){
            canvas->setTile(i, j, &theTiles[map[tree.findNearestNeighbor(convertToXYZ(theSource.getRegionColor(i, j)))]]);
        }
    }

    return canvas;
}

