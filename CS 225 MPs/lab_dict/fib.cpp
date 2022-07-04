/**
 * @file fib.cpp
 * Contains Fibonacci-number generating functions both utilizing and not
 * utilizing memoization.
 *
 * @author Matt Joras
 * @date Winter 2013
 */
#include "fib.h"
#include <map>
using std::map;
/**
 * Calculates the nth Fibonacci number where the zeroth is defined to be
 * 0.
 * @param n Which number to generate.
 * @return The nth Fibonacci number.
 */
unsigned long fib(unsigned long n)
{
    /* Your code goes here! */
    if(n == 1 || n == 2) return 1;
    else if(n == 0)return 0;
    return fib(n - 1) + fib(n - 2);
}
/**
 * Calculates the nth Fibonacci number where the zeroth is defined to be
 * 0. This version utilizes memoization.
 * @param n Which number to generate.
 * @return The nth Fibonacci number.
 */
unsigned long memoized_fib(unsigned long n)
{
    static map<unsigned long, unsigned long> myMap = {
        {0, 0}, {1, 1}, {2, 1}
    };
    map<unsigned long, unsigned long>::iterator lookup = myMap.find(n);
    if (lookup != myMap.end()) {
        return lookup->second;
    } else {
        unsigned long result = memoized_fib(n - 1) + memoized_fib(n - 2);
        myMap[n] = result;
        return result;
    }
}