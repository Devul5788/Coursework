# naive_bayes.py
# ---------------
# Licensing Information:  You are free to use or extend this projects for
# educational purposes provided that (1) you do not distribute or publish
# solutions, (2) you retain this notice, and (3) you provide clear
# attribution to the University of Illinois at Urbana-Champaign
#
# Created by Justin Lizama (jlizama2@illinois.edu) on 09/28/2018
from operator import neg
import numpy as np
import math
from tqdm import tqdm
from collections import Counter
import reader

"""
This is the main entry point for MP1. You should only modify code
within this file -- the unrevised staff files will be used for all other
files and classes when code is run, so be careful to not modify anything else.
"""




"""
  load_data calls the provided utility to load in the dataset.
  You can modify the default values for stemming and lowercase, to improve performance when
       we haven't passed in specific values for these parameters.
"""
 
def load_data(trainingdir, testdir, stemming=False, lowercase=False, silently=False):
    print(f"Stemming is {stemming}")
    print(f"Lowercase is {lowercase}")
    train_set, train_labels, dev_set, dev_labels = reader.load_dataset_main(trainingdir,testdir,stemming,lowercase,silently)
    return train_set, train_labels, dev_set, dev_labels


def create_word_maps_uni(X, y, max_size=None):
    """
    X: train sets
    y: train labels
    max_size: you can ignore this, we are not using it

    return two dictionaries: pos_vocab, neg_vocab
    pos_vocab:
        In data where labels are 1 
        keys: words 
        values: number of times the word appears
    neg_vocab:
        In data where labels are 0
        keys: words 
        values: number of times the word appears 
    """
    #print(len(X),'X')
    pos_vocab = count_words(X, y, 1)
    neg_vocab = count_words(X, y, 0)

    return dict(pos_vocab), dict(neg_vocab)


def count_words(X, y, flag):
    word_count_map = {}
    for idx in range(len(y)):
        if(y[idx] == flag):
            elements_count = Counter(X[idx])
            # value is word, key is count
            for value, key in elements_count.items():
                if word_count_map.__contains__(value):
                    word_count_map[value] = word_count_map[value] + key
                else:
                    word_count_map[value] = key
    
    return word_count_map


def create_word_maps_bi(X, y, max_size=None):
    """
    X: train sets
    y: train labels
    max_size: you can ignore this, we are not using it

    return two dictionaries: pos_vocab, neg_vocab
    pos_vocab:
        In data where labels are 1 
        keys: pairs of words
        values: number of times the word pair appears
    neg_vocab:
        In data where labels are 0
        keys: words 
        values: number of times the word pair appears 
    """

    pos_vocab = count_words(X, y, 1)
    neg_vocab = count_words(X, y, 0)

    newX = []

    for i in range(len(X)):
        newX.append([])
        for j in range(len(X[i]) - 1):
            newX[i].append(X[i][j] + ' ' + X[i][j + 1])
    
    pos_bigram = count_words(newX, y, 1)
    neg_bigram = count_words(newX, y, 0)

    pos_vocab.update(pos_bigram)
    neg_vocab.update(neg_bigram)

    return dict(pos_vocab), dict(neg_vocab)


# Keep this in the provided template
def print_paramter_vals(laplace,pos_prior):
    print(f"Unigram Laplace {laplace}")
    print(f"Positive prior {pos_prior}")


"""
You can modify the default values for the Laplace smoothing parameter and the prior for the positive label.
Notice that we may pass in specific values for these parameters during our testing.
"""

def naiveBayes(train_set, train_labels, dev_set, laplace=0.001, pos_prior=0.8, silently=False):
    '''
    Compute a naive Bayes unigram model from a training set; use it to estimate labels on a dev set.

    Inputs:
    train_set = a list of emails; each email is a list of words
    train_labels = a list of labels, one label per email; each label is 1 or 0
    dev_set = a list of emails
    laplace (scalar float) = the Laplace smoothing parameter to use in estimating unigram probs
    pos_prior (scalar float) = the prior probability of the label==1 class
    silently (binary) = if True, don't print anything during computations 

    Outputs:
    dev_labels = the most probable labels (1 or 0) for every email in the dev set
    '''
    # Keep this in the provided template
    print_paramter_vals(laplace,pos_prior)
    pos_prob, neg_prob = emailClassifier(train_set, train_labels, dev_set, 1, laplace, pos_prior)
    dev_labels = []

    for idx in range(len(dev_set)):
        if pos_prob[idx] > neg_prob[idx]:
            dev_labels.append(1)
        else:
            dev_labels.append(0)
    
    return dev_labels

# flag = 1 --> unigram, flag = 0 --> bigram
def emailClassifier(train_set, train_labels, dev_set, flag, laplace=0.001, pos_prior = 0.8):
    if flag == 1:
        pos_vocab, neg_vocab = create_word_maps_uni(train_set, train_labels)
    else:
        pos_vocab, neg_vocab = create_word_maps_bi(train_set, train_labels)
    
    pos_probs, oov_pos_prob = calcProf(pos_vocab, laplace)
    neg_probs, oov_neg_prob = calcProf(neg_vocab, laplace)

    pos_uni, neg_uni = [], []

    for email in dev_set:
        pos_p = 0
        neg_p = 0

        for word in email:
            if word in pos_probs:
                pos_p += pos_probs[word]
            else:
                pos_p += oov_pos_prob

            if word in neg_probs:
                neg_p += neg_probs[word]
            else:
                neg_p += oov_neg_prob
        
        pos_p += math.log(pos_prior)
        neg_p += math.log(1 - pos_prior)
        
        pos_uni.append(pos_p)
        neg_uni.append(neg_p)
    
    return pos_uni, neg_uni

def calcProf(word_count_map, smoothing):
    prob_map = {}

    type_of_words = len(word_count_map)
    num_of_words = 0

    for word in word_count_map:
        num_of_words += word_count_map[word]

    # evidence = 1 (as mentioned in the mp description)

    for word in word_count_map:
        likelihood = (word_count_map[word] + smoothing)/(num_of_words + smoothing * (1 + type_of_words))
        prob_map[word] = math.log(likelihood)

    oov_prob = math.log(smoothing/(num_of_words + smoothing * (1 + type_of_words)))

    return prob_map, oov_prob


# Keep this in the provided template
def print_paramter_vals_bigram(unigram_laplace,bigram_laplace,bigram_lambda,pos_prior):
    print(f"Unigram Laplace {unigram_laplace}")
    print(f"Bigram Laplace {bigram_laplace}")
    print(f"Bigram Lambda {bigram_lambda}")
    print(f"Positive prior {pos_prior}")


def bigramBayes(train_set, train_labels, dev_set, unigram_laplace=0.001, bigram_laplace=0.005, bigram_lambda=0.5,pos_prior=0.8,silently=False):
    '''
    Compute a unigram+bigram naive Bayes model; use it to estimate labels on a dev set.

    Inputs:
    train_set = a list of emails; each email is a list of words
    train_labels = a list of labels, one label per email; each label is 1 or 0
    dev_set = a list of emails
    unigram_laplace (scalar float) = the Laplace smoothing parameter to use in estimating unigram probs
    bigram_laplace (scalar float) = the Laplace smoothing parameter to use in estimating bigram probs
    bigram_lambda (scalar float) = interpolation weight for the bigram model
    pos_prior (scalar float) = the prior probability of the label==1 class
    silently (binary) = if True, don't print anything during computations 

    Outputs:
    dev_labels = the most probable labels (1 or 0) for every email in the dev set
    '''
    print_paramter_vals_bigram(unigram_laplace,bigram_laplace,bigram_lambda,pos_prior)

    max_vocab_size = None

    pos_probs_uni, neg_probs_uni = emailClassifier(train_set, train_labels, dev_set, 1, unigram_laplace, pos_prior)

    dev_labels = []
    newDevSet = []

    for i in range(len(dev_set)):
        newDevSet.append([])
        for j in range(len(dev_set[i]) - 1):
            newDevSet[i].append(dev_set[i][j] + ' ' + dev_set[i][j + 1])
    
    pos_vocab_bi, neg_vocab_bi = emailClassifier(train_set, train_labels, newDevSet, 0, bigram_laplace, pos_prior)

    for idx in range(len(dev_set)):
        pos_prob = (1-bigram_lambda) * pos_probs_uni[idx] + (bigram_lambda) * pos_vocab_bi[idx]
        neg_prob = (1-bigram_lambda) * neg_probs_uni[idx] + (bigram_lambda) * neg_vocab_bi[idx]

        if pos_prob > neg_prob:
            dev_labels.append(1)
        else:
            dev_labels.append(0)


    return dev_labels
