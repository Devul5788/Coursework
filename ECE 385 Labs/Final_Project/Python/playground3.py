import numpy as np
from PIL import Image

x = [
    0, 1, 0,
    0, 1, 0,
    0, 1, 0
]

w = 3
h = 3

x = np.reshape(x, (h, w))
data = np.zeros((h, w, 3), dtype=np.uint8)

for i in range (w):
    for j in range (h):
        if (x[i][j] == 1):
            data[i][j] = [255, 255, 255]
        else:
            data[i][j] = [0, 0, 0]

img = Image.fromarray(data, 'RGB')
img.save('my.png')
img.show()