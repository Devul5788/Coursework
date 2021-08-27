#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
	char* pool[] = {"Vader", "Padme", "R2-D2", "C-3PO", "Jabba", "Dooku", "Lando", "Snoke"};
	char solutions[4][10] = {"Vader", "Vader", "Dooku", "Dooku"};
	char mystr[] = "Padme Padme Lando Lando";

	char user_guesses[4][10];
	int match_found;

    if(sscanf(mystr, "%s %s %s %s", user_guesses[0], user_guesses[1], user_guesses[2], user_guesses[3]) != 4) {
		printf("make_guess: invalid guess\n");
		return 0;
	}

	for (int i = 0; i < 4; i++) {
		match_found = 0;
		for(int j = 0; j < 8; j++) {
			if(strcmp(user_guesses[i], pool[j]) == 0) {
				match_found = 1;
				break;
			}
		}
		if (match_found == 0) {
			printf("make_guess: invalid guess\n");
			return 0;
		}
	}

    int perfect = 0;
    int misplaced = 0;

    int solMatched[4];
    int userMatched[4];

    for(int i = 0; i < 4; i++){
        if(strcmp(user_guesses[i], solutions[i]) == 0){
            perfect++;
            solMatched[i] = 1;
            userMatched[i] = 1;
        }
    }

    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 4; j++){
            if(solMatched[i] != 1 && userMatched[j] != 1 && strcmp(user_guesses[j], solutions[i]) == 0){
                misplaced++;
                solMatched[i] = 1;
                userMatched[j] = 1;
            }
        }
    }
    printf("You got %d perfect matches and %d misplaced matches.\n", perfect, misplaced);

	return 0;
}
