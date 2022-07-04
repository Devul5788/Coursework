/**
 * @file cartalk_puzzle.cpp
 * Holds the function which solves a CarTalk puzzler.
 *
 * @author Matt Joras
 * @date Winter 2013
 */

#include <fstream>

#include "cartalk_puzzle.h"

using namespace std;

/**
 * Solves the CarTalk puzzler described here:
 * http://www.cartalk.com/content/wordplay-anyone.
 * @return A vector of (string, string, string) tuples
 * Returns an empty vector if no solutions are found.
 * @param d The PronounceDict to be used to solve the puzzle.
 * @param word_list_fname The filename of the word list to be used.
 */
vector<std::tuple<std::string, std::string, std::string>> cartalk_puzzle(PronounceDict d,
                                    const string& word_list_fname)
{
    vector<std::tuple<std::string, std::string, std::string>> ret;

    /* Your code goes here! */
    ifstream wordsFile(word_list_fname);
    string myWord;

    if (wordsFile.is_open()) {
      while (getline(wordsFile, myWord)) {
          string mySubWord1 = myWord.substr(1);
          string mySubWord2;

          if(myWord.length() > 2) mySubWord2 = myWord.front() + myWord.substr(2);
          else mySubWord2 = myWord.substr(0, 1);
          if(d.homophones(myWord, mySubWord1) && d.homophones(myWord, mySubWord2)) ret.push_back({myWord, mySubWord1, mySubWord2});
      }
    }

    return ret;
}
