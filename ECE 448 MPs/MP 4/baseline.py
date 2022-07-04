# mp4.py
# ---------------
# Licensing Information:  You are free to use or extend this projects for
# educational purposes provided that (1) you do not distribute or publish
# solutions, (2) you retain this notice, and (3) you provide clear
# attribution to the University of Illinois at Urbana-Champaign
#
# Created Fall 2018: Margaret Fleck, Renxuan Wang, Tiantian Fang, Edward Huang (adapted from a U. Penn assignment)
# Modified Spring 2020: Jialu Li, Guannan Guo, and Kiran Ramnath
# Modified Fall 2020: Amnon Attali, Jatin Arora
# Modified Spring 2021 by Kiran Ramnath
"""
Part 1: Simple baseline that only uses word statistics to predict tags
"""

from collections import Counter
import math

def baseline(train, test):
    '''
    input:  training data (list of sentences, with tags on the words)
        test data (list of sentences, no tags on the words)
    output: list of sentences, each sentence is a list of (word,tag) pairs.
        E.g., [[(word1, tag1), (word2, tag2)], [(word3, tag3), (word4, tag4)]]
    '''
    predicts = []
    tag_counter = Counter()
    freq_word_tag = {}

    for i in range(len(train)):
        for j in range(len(train[i])):
            word = train[i][j][0]
            tag = train[i][j][1]
            if(word not in freq_word_tag):
                freq_word_tag.update({word : {}})
            
            if (tag not in freq_word_tag[word]):
                freq_word_tag[word].update({tag : 0})
            
            freq_word_tag[word][tag] += 1
            tag_counter[tag] += 1
    
    max_tag = max(tag_counter, key=(lambda key: tag_counter[key]))

    for sentence in test:
        tag_pred = []
        for word in sentence:
            if word in freq_word_tag:
                max_t = max(freq_word_tag[word], key=lambda tag:freq_word_tag[word][tag])
                tag_pred.append((word, max_t))
            else:
                tag_pred.append((word, max_tag))
        predicts.append(tag_pred)

    return predicts