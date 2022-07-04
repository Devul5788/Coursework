/**
 * @file quackfun.cpp
 * This is where you will implement the required functions for the
 * stacks and queues portion of the lab.
 */

using namespace std;
#include <iostream>

namespace QuackFun {

/**
 * Sums items in a stack.
 *
 * **Hint**: think recursively!
 *
 * @note You may modify the stack as long as you restore it to its original
 * values.
 *
 * @note You may use only two local variables of type T in your function.
 * Note that this function is templatized on the stack's type, so stacks of
 * objects overloading the + operator can be summed.
 *
 * @note We are using the Standard Template Library (STL) stack in this
 * problem. Its pop function works a bit differently from the stack we
 * built. Try searching for "stl stack" to learn how to use it.
 *
 * @param s A stack holding values to sum.
 * @return  The sum of all the elements in the stack, leaving the original
 *          stack in the same state (unchanged).
 */
template <typename T>
T sum(stack<T>& s)
{
    //Method 1: change the stack
    // if(s.size() == 1){
    //     T sum = s.top();
    //     s.pop();
    //     return sum;
    // }
    // T a = s.top();
    // s.pop();
    // T b = s.top();
    // s.pop();
    // s.push(a + b);
    // return sum(s);

    //Method 2: dont change the stack
    if(s.size() == 0) return 0;

    T a = s.top();
    s.pop();
    T curr = a + sum(s);
    s.push(a);
    return curr;
}

/**
 * Checks whether the given string (stored in a queue) has balanced brackets.
 * A string will consist of square bracket characters, [, ], and other
 * characters. This function will return true if and only if the square bracket
 * characters in the given string are balanced. For this to be true, all
 * brackets must be matched up correctly, with no extra, hanging, or unmatched
 * brackets. For example, the string "[hello][]" is balanced, "[[][[]a]]" is
 * balanced, "[]]" is unbalanced, "][" is unbalanced, and "))))[cs225]" is
 * balanced.
 *
 * For this function, you may only create a single local variable of type
 * `stack<char>`! No other stack or queue local objects may be declared. Note
 * that you may still declare and use other local variables of primitive types.
 *
 * @param input The queue representation of a string to check for balanced brackets in
 * @return      Whether the input string had balanced brackets
 */
bool isBalanced(queue<char> input)
{
    std::stack<char> brackets;

    while(input.size() > 0){
        char a = input.front();
        input.pop();
        if(a == '[' || a == ']'){
            if(a == '['){
                brackets.push(a);
            } else if(a == ']' && brackets.size() > 0) {
                brackets.pop();
            } else {
                brackets.push(']');
                break;
            }
        }
    } 

    if(brackets.size() > 0){
        return false;
    }

    return true;
}

/**
 * Reverses even sized blocks of items in the queue. Blocks start at size
 * one and increase for each subsequent block.
 *
 * **Hint**: You'll want to make a local stack variable.
 *
 * @note Any "leftover" numbers should be handled as if their block was
 * complete.
 *
 * @note We are using the Standard Template Library (STL) queue in this
 * problem. Its pop function works a bit differently from the stack we
 * built. Try searching for "stl stack" to learn how to use it.
 *
 * @param q A queue of items to be scrambled
 */
template <typename T>
void scramble(queue<T>& q){
    unsigned long sum = 0;
    int num = 1;
    queue<T> scrambled;

    while(sum < q.size()){
        sum += num;
        num += 1;
    }
    
    int i = 0;
    while(i<num){
        ++i;
        stack<T> reverse;
        for(int j = 0; j < i; j++){
            if(q.size() > 0){
                if(i%2 == 0){
                    reverse.push(q.front());
                } else {
                    scrambled.push(q.front());
                }
                q.pop();
            }
        }
        while(reverse.size() > 0){
            scrambled.push(reverse.top());
            reverse.pop();
        }
    }
    q = scrambled;
}
}
