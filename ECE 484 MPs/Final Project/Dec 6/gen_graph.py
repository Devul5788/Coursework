import matplotlib.pyplot as plt
import numpy as np

dataArray = np.genfromtxt('csv_file.csv', delimiter=',', names=True)

plt.figure()
for col_name in dataArray.dtype.names:
    if(col_name == dataArray.dtype.names[1]):
        continue
    plt.plot(dataArray[col_name], label=col_name)
plt.legend()
plt.show()