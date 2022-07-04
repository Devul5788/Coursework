#include "Image.h"
#include "StickerSheet.h"

using namespace std;

int main() {
  Image img, img2, img3, base;
  img.readFromFile("arabic_tea.png");
  img2.readFromFile("dates.png");
  img3.readFromFile("clothing.png");
  base.readFromFile("dubai.png");

  StickerSheet ss(base, 3);
  
  ss.addSticker(img, 0, 0);
  ss.addSticker(img2, 1440,0);
  ss.addSticker(img3, 720, 1015);

  Image res = ss.render();

  res.writeToFile("myImage.png");

  return 0;
}
