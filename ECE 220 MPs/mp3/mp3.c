//For this mp, we are trying to print a certain
//row of pascal's triangle by using the standard
//combinations formula. We do this using 2 forloops
//1 for row (n) and 1 for coefficients (k). As 
//instructed by the mp, our final answer does not overflow
//as long as the row is less then 40.

//partners: danahar2, sg49


#include <stdio.h>
#include <stdlib.h>

int main(){
    //Declaring the variables, n for row and k for coefficients
    int n, k;

    //Taking input from user
    printf("Enter the row index: ");
    scanf("%d", &n);
    
    //If n < 0 then throwing error message and exiting
    if(n < 0) {
        printf("Invalid row index entered!");
        return 0;
    }

    //Since n <= 40, we want the code to not overflow, initializing coef to 1
    int unsigned long long coef = 1;

    //Looping throw each value for k until k = n
    for (k = 0; k <= n; k++) {

        //Calculating value for the coefficient
        for(int i = 1; i <= k; i++) {
            coef *= (n + 1 - i);
            coef /= i;
        }

        //Printing to screen
        printf("%llu ", coef);

        //Resetting coef to 1
        coef = 1;
    }
    
    //print new line
    printf("%c", '\n');

    return 0;
}
