/**
 * @file anagram_dict.cpp
 * Implementation of the AnagramDict class.
 *
 * @author Matt Joras
 * @date Winter 2013
 */

#include "anagram_dict.h"

#include <algorithm> /* I wonder why this is included... */
#include <fstream>

using std::string;
using std::vector;
using std::ifstream;

/**
 * Constructs an AnagramDict from a filename with newline-separated
 * words.
 * @param filename The name of the word list file.
 */
AnagramDict::AnagramDict(const string& filename)
{
    /* Your code goes here! */
    ifstream wordsFile(filename);
    string myWord;
    if (wordsFile.is_open()) {
      while (getline(wordsFile, myWord)) {
        string s = myWord;
        sort(s.begin(), s.end());
        dict[s].push_back(myWord);
      }
    }
}

/**
 * Constructs an AnagramDict from a vector of words.
 * @param words The vector of strings to be used as source words.
 */
AnagramDict::AnagramDict(const vector<string>& words)
{
    /* Your code goes here! */
    for(size_t i = 0; i < words.size(); i++) {
      string myWord = words[i];
      sort(myWord.begin(), myWord.end());
      dict[myWord].push_back(words[i]);
    }
}

/**
 * @param word The word to find anagrams of.
 * @return A vector of strings of anagrams of the given word. Empty
 * vector returned if no anagrams are found or the word is not in the
 * word list.
 */
vector<string> AnagramDict::get_anagrams(const string& word) const
{
    /* Your code goes here! */
    string str = word;
    std::sort(str.begin(), str.end());
    if (dict.find(str) == dict.end() || dict.at(str).size() == 1) {
      return vector<string>();
    }
    return dict.at(str);
}

/**
 * @return A vector of vectors of strings. Each inner vector contains
 * the "anagram siblings", i.e. words that are anagrams of one another.
 * NOTE: It is impossible to have one of these vectors have less than
 * two elements, i.e. words with no anagrams are ommitted.
 */
vector<vector<string>> AnagramDict::get_all_anagrams() const
{
    vector<vector<string>> myAnagrams;
    for(std::pair<std::string, std::vector<std::string>> key_val : dict) {
      if(key_val.second.size() > 1) myAnagrams.push_back(key_val.second);
    }
    return myAnagrams;
}