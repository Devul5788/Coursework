#include <stdlib.h>
#include <stdio.h>

/*The first error in the code was that there was a missing semicolon
 *on line 26 of the main.c file. This did not allow the program to comply.

 *The second error was that the is_prime value was returning 0 when the num
 *was prime, and it was returning 1 when the number was not prime. This 
 *meant that the primt_semiprime function was not wroking correctly as 
 *it could not identify what numbers were prime.

 *The third error was that k was being set to i%j, instead of i/j. The reason we
 *use i/j is because we want to see if the other factor of i is a semiprime or 
 *or not. The reason i%j was wrong was because i%j is always going to be equal to
 *zero no matter the value of i or j. This is because we have already made sure
 *that j is a multiple of i in an if then statement earlier.

 *the fourth error was that the program was printing some numbers multiple times.
 *For instance, for a number like 6 the program double counted it as both 2, 3 and
 *and 3, 2 are semiprime factors of 6. To combat this issue, we simply added 
 *and break statement near the end of the for loop.

 *finally the fifth error was that the program was not returning 1 and 0 correctly
 *after doing all semiprime factors of a number. To fix this, I simply added 
 *a line setting ret to 1, when the program had found 2 semiprime factors.
 */


/*
 * is_prime: determines whether the provided number is prime or not
 * Input    : a number
 * Return   : 0 if the number is not prime, else 1
 */
int is_prime(int number)
{
    int i;
    if (number == 1) {return 0;}
    for (i = 2; i < number; i++) { //for each number smaller than it
        if (number % i == 0) { //check if the remainder is 0
            return 0;
        }
    }
    return 1;
}


/*
 * print_semiprimes: prints all semiprimes in [a,b] (including a, b).
 * Input   : a, b (a should be smaller than or equal to b)
 * Return  : 0 if there is no semiprime in [a,b], else 1
 */
int print_semiprimes(int a, int b)
{
  int i, j, k;
  int ret = 0;
  
  if (a == b){
    printf("%d ", a);
    printf("\n");
    return 1;
  }

    for (i = a; i <= b; i++) { //for each item in interval
        //check if semiprime
        for (j = 2; j < i; j++) {
            if (i%j == 0) {
                if (is_prime(j)==1) {
		   k = i/j;
		   if (is_prime(k)==1) {
		     printf("%d ", i); // i = k * j
		     ret = 1;
		     break;
		    }
                }
            }
        }
    }
    printf("\n");
    return ret;

}
