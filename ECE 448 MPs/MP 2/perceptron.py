# perceptron.py
# ---------------
# Licensing Information:  You are free to use or extend this projects for
# educational purposes provided that (1) you do not distribute or publish
# solutions, (2) you retain this notice, and (3) you provide clear
# attribution to the University of Illinois at Urbana-Champaign
#
# Created by Justin Lizama (jlizama2@illinois.edu) on 10/27/2018
# Extended by Daniel Gonzales (dsgonza2@illinois.edu) on 3/11/2020

"""
This is the main entry point for MP5. You should only modify code
within this file -- the unrevised staff files will be used for all other
files and classes when code is run, so be careful to not modify anything else.

train_set - A Numpy array of 32x32x3 images of shape [7500, 3072].
            This can be thought of as a list of 7500 vectors that are each
            3072 dimensional.  We have 3072 dimensions because there are
            each image is 32x32 and we have 3 color channels.
            So 32*32*3 = 3072. RGB values have been scaled to range 0-1.

train_labels - List of labels corresponding with images in train_set
example: Suppose I had two images [X1,X2] where X1 and X2 are 3072 dimensional vectors
         and X1 is a picture of a dog and X2 is a picture of an airplane.
         Then train_labels := [1,0] because X1 contains a picture of an animal
         and X2 contains no animals in the picture.

dev_set - A Numpy array of 32x32x3 images of shape [2500, 3072].
          It is the same format as train_set

return - a list containing predicted labels for dev_set
"""

import numpy as np

def trainPerceptron(train_set, train_labels, learning_rate, max_iter):    
    W = np.zeros(len(train_set[0]) + 1)
    y = 2 * (np.array(train_labels) - 0.5)

    for i in range(max_iter):        
        for correct_y, curImage in zip(y, train_set):
            f = np.sign(curImage @ W[1:] + W[0])

            if f != correct_y:
                W[1:] += learning_rate * correct_y * curImage
                W[0] += learning_rate * correct_y * 1

    b = W[0]
    W = np.delete(W, 0)
    
    return W, b

def classifyPerceptron(train_set, train_labels, dev_set, learning_rate, max_iter):
    W, b = trainPerceptron(train_set, train_labels, learning_rate, max_iter)
    return list((np.sign(dev_set @ W.T + b) + 1)/2)