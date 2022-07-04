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

# print (list(islice(a.items(), 10)))

"""
Part 2: This is the simplest version of viterbi that doesn't do anything special for unseen words
but it should do better than the baseline at words with multiple tags (because now you're using context
to predict the tag).
"""

from collections import Counter
import math
from itertools import islice

def viterbi_1(train, test):
    '''
    input:  training data (list of sentences, with tags on the words)
            test data (list of sentences, no tags on the words)
    output: list of sentences with tags on the words
            E.g., [[(word1, tag1), (word2, tag2)], [(word3, tag3), (word4, tag4)]]
    '''
    #laplace parameter
    k = 0.0001

    #creating a set of unique words and tags
    words = set()
    tags = Counter()

    for sentence in train:
        for word_tag in sentence:
            word, tag = word_tag
            words.add(word)
            tags[tag] += 1

    #Initializing N, V, Number of sentences
    N = len(tags)
    V = len(words)
    num_of_sentences = len(train)

    #using a lapalce smoothed version of pi.Sstatically coding pi_j = P(Y1 = j) as start for this part.
    pi = {}
    for tag in tags.keys():
        pi[tag] =  math.log(k/(num_of_sentences + k*N))
    
    for sentence in train:
        first_word = sentence[0][1]
        pi[first_word] = math.log((tags[first_word] + k)/(num_of_sentences + k*N))

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
                a[pair] = math.log((a_count[pair] + k) / (tags[tag1] + k*N))
            else:
                a[pair] = math.log(k / (tags[tag1] + k*N))

    #creating a laplace smoothed version of b
    b_count = Counter()

    for sentence in train:
        for word_tag in sentence:
            b_count[word_tag] += 1
            
    b = {}

    for tag in tags.keys():
        for word in words:
            pair = (word, tag)
            if pair in b_count:
                b[pair] = math.log((b_count[pair] + k) / (tags[tag] + k*(V + 1)))
            else:
                b[pair] = math.log(k / (tags[tag1] + k*(V + 1)))

    #create a prediction 
    pred = []

    #predicting for each word in test
    for sentence in test:
        #creating vertex matrix
        vertices = {m:{tag:0 for tag in tags} for m in range(len(sentence))}

        #creating back_ptr matrix
        back_ptr = {m:{tag:None for tag in tags} for m in range(len(sentence))}

        #appending the predicted sentence to the matrix
        pred.append(predict(sentence, pi, a, b, vertices, back_ptr, num_of_sentences, k, N, V, tags))

    return pred

def predict(sentence, pi, a, b, vertices, back_ptr, num_of_sentences, k, N, V, tags):
    pred = []

    #setting initial values of vertices
    for tag in vertices[0].keys():
        pair_not_in_pi = math.log(k / (num_of_sentences + k * N))
        pair_not_in_b = math.log(k / (tags[tag] + k * (V + 1)))
        vertices[0][tag] = pi.get(tag, pair_not_in_pi) + b.get((sentence[0], tag), pair_not_in_b)

    #for each word do following calculations
    for i in range(1, len(sentence)):
        word = sentence[i]
        for curr_tag in vertices[i].keys():
            max_prob = -1 * math.inf
            max_tag = ""

            for prev_tag in vertices[i - 1].keys():
                pair_not_in_a = math.log(k / (tags[prev_tag] + k * N))
                pair_not_in_b = math.log(k / (tags[curr_tag] + k * (V + 1)))
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

def print_mat(vertices):
    for i in range(len(vertices)):
        print(vertices[i])
        print("\n")