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
# Modified Spring 2021 by Kiran Ramnath (kiranr2@illinois.edu)

"""
Part 3: Here you should improve viterbi to use better laplace smoothing for unseen words
This should do better than baseline and your first implementation of viterbi, especially on unseen words
"""

from collections import Counter
import math
from itertools import islice

def viterbi_2(train, test):
    '''
    input:  training data (list of sentences, with tags on the words)
            test data (list of sentences, no tags on the words)
    output: list of sentences with tags on the words
            E.g., [[(word1, tag1), (word2, tag2)], [(word3, tag3), (word4, tag4)]]
    '''
    #laplace parameter
    k = 0.00001

    #creating a set of unique words and tags
    words = Counter()
    tags = Counter()
    word_tag_count = Counter()

    for sentence in train:
        for word_tag in sentence:
            word, tag = word_tag
            tags[tag] += 1
            words[word] += 1
            word_tag_count[word_tag] += 1

    #Initializing N, V, Number of sentences
    N = len(tags)
    V = len(words)
    num_of_sentences = len(train)

    #using a lapalce smoothed version of pi. Statically coding pi_j = P(Y1 = j) as start for this part.
    pi = {}
    for tag in tags.keys():
        pi[tag] =  math.log(k/(num_of_sentences + k * N))
    
    for sentence in train:
        first_word = sentence[0][1]
        pi[first_word] = math.log((tags[first_word] + k)/(num_of_sentences + k * N))

    #creating a laplace smoothed version of a
    a_list = []

    for sentence in train:
        tuple_list = list(zip(sentence, sentence[1:]))

        for t in tuple_list:
            a_list.append((t[0][1], t[1][1]))
            
    a_count = Counter(a_list)
    a = {}

    for tag1 in tags.keys():
        for tag2 in tags.keys():
            pair = (tag1, tag2)
            if pair in a_count:
                a[pair] = math.log((a_count[pair] + k) / (tags[tag1] + k * N))
            else:
                a[pair] = math.log(k / (tags[tag1] + k * N))

    # hapax calculations 
    hapax = []
    hapax_dict = {}

    for word in words:
        if(words[word] == 1):
            hapax.append(word)

    for tag in tags:
        #number of times each tag appears in your hapax word set
        tag_in_hapax = 0
        
        for word in hapax:
            #word_tag_count for hapax words will always be 1 or 0 (as hapax words are words that only appear once or twice, it cannot have more than 1 tag)
            tag_in_hapax += word_tag_count.get((word, tag), 0) 
        
        #apply laplace smoothing
        hapax_dict[tag] = (tag_in_hapax + k)/(len(hapax) + k * N)

    #creating a laplace smoothed version of b
    b = {}

    for tag in tags.keys():
        for word in words:
            pair = (word, tag)
            if pair in word_tag_count:
                b[pair] = math.log((word_tag_count[pair] + k * hapax_dict[tag]) / (tags[tag] + k * hapax_dict[tag] * (V + 1)))

    # create a prediction 
    pred = []

    for sentence in test:
        #creating vertex matrix
        vertices = {m:{tag:0 for tag in tags} for m in range(len(sentence))}

        #creating back_ptr matrix
        back_ptr = {m:{tag:None for tag in tags} for m in range(len(sentence))}

        #appending the predicted sentence to the matrix
        pred.append(predict(sentence, vertices, back_ptr, pi, a, b, hapax_dict, tags, num_of_sentences, k, V, N))

    return pred


def predict(sentence, vertices, back_ptr, pi, a, b, hapax_dict, tags, num_of_sentences, k, V, N):
    pred = []

    #setting initial values of vertices
    for tag in vertices[0].keys():
        pair_not_in_b = math.log((k * hapax_dict[tag])/(tags[tag] + k * hapax_dict[tag] * (V + 1)))
        start_not_in_pi = math.log(k / (num_of_sentences + k * N))
        vertices[0][tag] = pi.get(tag, start_not_in_pi) + b.get((sentence[0], tag), pair_not_in_b)

    #for each word do following calculations
    for i in range(1, len(sentence)):
        word = sentence[i]
        for curr_tag in vertices[i].keys():
            max_prob = -1 * math.inf
            max_tag = ""

            for prev_tag in vertices[i - 1].keys():
                pair_not_in_a = math.log(k / (tags[prev_tag] + k * N))
                pair_not_in_b = math.log((k * hapax_dict[curr_tag]) / (tags[curr_tag] + k * hapax_dict[curr_tag] * (V + 1)))
                curr_prob = a.get((prev_tag, curr_tag), pair_not_in_a) + b.get((word, curr_tag), pair_not_in_b) + vertices[i-1][prev_tag]
                if(curr_prob > max_prob):
                    max_prob = curr_prob
                    max_tag = prev_tag
                vertices[i][curr_tag] = max_prob
                back_ptr[i][curr_tag] = max_tag

    last_word_idx = len(vertices)-1
    max_word = max(vertices[last_word_idx], key=lambda key: vertices[last_word_idx][key])

    for i in range (last_word_idx, -1, -1):
        if max_word != '':
            pred.append((sentence[i], max_word))
            max_word = back_ptr[i][max_word]
        
    pred.reverse()

    return pred