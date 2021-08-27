;
; The code given to you here implements the histogram calculation that 
; we developed in class.  In programming lab, we will add code that
; prints a number in hexadecimal to the monitor.
;
; Your assignment for this program is to combine these two pieces of 
; code to print the histogram to the monitor.
;
; If you finish your program, 
;    ** commit a working version to your repository  **
;    ** (and make a note of the repository version)! **

	.ORIG	x3000		; starting address is x3000

; Count the occurrences of each letter (A to Z) in an ASCII string 
; terminated by a NUL character.  Lower case and upper case should 
; be counted together, and a count also kept of all non-alphabetic 
; characters (not counting the terminal NUL).
;
; The string starts at x4000.
;
; The resulting histogram (which will NOT be initialized in advance) 
; should be stored starting at x3F00, with the non-alphabetic count 
; at x3F00, and the count for each letter in x3F01 (A) through x3F1A (Z).
;
; table of register use in this part of the code
;    R0 holds a pointer to the histogram (x3F00)
;    R1 holds a pointer to the current position in the string
;       and as the loop count during histogram initialization
;    R2 holds the current character being counted
;       and is also used to point to the histogram entry
;    R3 holds the additive inverse of ASCII '@' (xFFC0)
;    R4 holds the difference between ASCII '@' and 'Z' (xFFE6)
;    R5 holds the difference between ASCII '@' and '`' (xFFE0)
;    R6 is used as a temporary register
;

	LD R0,HIST_ADDR      	; point R0 to the start of the histogram
	
	;; fill the histogram with zeroes 
	AND R6,R6,#0		; put a zero into R6
	LD R1,NUM_BINS		; initialize loop count to 27
	ADD R2,R0,#0		; copy start of histogram into R2

	; loop to fill histogram starts here
HFLOOP	
	STR R6,R2,#0		; write a zero into histogram
	ADD R2,R2,#1		; point to next histogram entry
	ADD R1,R1,#-1		; decrement loop count
	BRp HFLOOP		; continue until loop count reaches zero

	; initialize R1, R3, R4, and R5 from memory
	LD R3,NEG_AT		; set R3 to additive inverse of ASCII '@'
	LD R4,AT_MIN_Z		; set R4 to difference between ASCII '@' and 'Z'
	LD R5,AT_MIN_BQ		; set R5 to difference between ASCII '@' and '`'
	LD R1,STR_START		; point R1 to start of string

	; the counting loop starts here
COUNTLOOP
	LDR R2,R1,#0		; read the next character from the string
	BRz PRINT_HIST		; found the end of the string

	ADD R2,R2,R3		; subtract '@' from the character
	BRp AT_LEAST_A		; branch if > '@', i.e., >= 'A'
NON_ALPHA
	LDR R6,R0,#0		; load the non-alpha count
	ADD R6,R6,#1		; add one to it
	STR R6,R0,#0		; store the new non-alpha count
	BRnzp GET_NEXT		; branch to end of conditional structure
AT_LEAST_A
	ADD R6,R2,R4		; compare with 'Z'
	BRp MORE_THAN_Z		; branch if > 'Z'

; note that we no longer need the current character
; so we can reuse R2 for the pointer to the correct
; histogram entry for incrementing
ALPHA	ADD R2,R2,R0		; point to correct histogram entry
	LDR R6,R2,#0		; load the count
	ADD R6,R6,#1		; add one to it
	STR R6,R2,#0		; store the new count
	BRnzp GET_NEXT		; branch to end of conditional structure

; subtracting as below yields the original character minus '`'
MORE_THAN_Z
	ADD R2,R2,R5		; subtract '`' - '@' from the character
	BRnz NON_ALPHA		; if <= '`', i.e., < 'a', go increment non-alpha
	ADD R6,R2,R4		; compare with 'z'
	BRnz ALPHA		; if <= 'z', go increment alpha count
	BRnzp NON_ALPHA		; otherwise, go increment non-alpha

GET_NEXT
	ADD R1,R1,#1		; point to next character in string
	BRnzp COUNTLOOP		; go to start of counting loop

PRINT_HIST

;;;;;;; DESCRIPTION ;;;;;;; 
; The program counts the occurrences of each letter (A to Z) in an ASCII string 
; terminated by a NUL character.  Lower case and upper case are 
; counted together, and a count also kept of all non-alphabetic 
; characters (not counting the terminal NULL) and indicated by '@'.
; The count of each occurrance is printed to the screen in Hexadecimal.
; partners: danahar2, ambala2, sg49

;;;;;;; REGISTER TABLE ;;;;;;;;;
; R0 is a temporary register/ printing register
; R1 stores the 4 digit binary value for letter count
; R2 counter of 4 
; R3 stores the letter count
; R4 stores the current letter in hex to be printed at the beginning of each loop
; R5 stores the memory address of the letter to be printed
; R6 keep the count of the program, 27 times

	LD R4, LETTER_BEGIN
	LD R5, CHAR_BEGIN
	LD R6, LOOP_COUNT

LOOP_START 
	ADD R6, R6, #0
	BRnz DONE
	ADD R0, R4, #0			; Store the character in R0 to be printed
	OUT				; print letter
	LD R0, SPACE			; Store space in R0
	OUT				; print spacebar
	LDR R3, R5, #0			; load the memory address value in R3

	AND R2, R2, #0			; reset R4 to #0
	ADD R2, R2, #4			; R2 = #4

OUTER_LOOP
	AND R1, R1, #0			; Clear R1
	AND R0, R0, #0			; Clear R0
	ADD R0, R0, #4			; R0 is set up as a bit counter of 4


COPY 	
	ADD R1, R1, R1			; Left shift R1
	ADD R3, R3, #0			; if the highest bit of R3 is positive, skip adding 1
	BRzp SKIP 
	ADD R1, R1, #1			; If highest bit is 1 then add R1 to it;

SKIP 	
	ADD R3, R3, R3			; Left shift R3
	ADD R0, R0, #-1			; Decrement counter
	BRp COPY       			; Repeat loop until counter reaches 0

CONVERT					; Loop to convert to hex
	ADD R0, R1, #-9	
	BRnz PRINT_NUM			; Jump to printing the ASCII
	LD R0, A
	ADD R0, R0, R1
	ADD R0, R0, #-10
	BRnzp DONE_LOOP

PRINT_NUM 				; Set up R0 to correct ASCII
	LD R0, ZERO
	ADD R0, R0, R1			; adding offset to R0

DONE_LOOP 
	OUT				; Print to the screen
	ADD R2, R2, #-1
	BRp OUTER_LOOP			; Looping back by checking R2 counter

	LD R0, NEWL			; stores newline in R0
	OUT				; prints a newline character

	ADD R4, R4, #1			; increment R4
	ADD R5, R5, #1			; increment R5
	ADD R6, R6, #-1			; decrement R6

	BRnzp LOOP_START

DONE HALT

;; the data needed by the program
NUM_BINS	.FILL #27		; 27 loop iterations
NEG_AT		.FILL xFFC0		; the additive inverse of ASCII '@'
AT_MIN_Z	.FILL xFFE6		; the difference between ASCII '@' and 'Z'
AT_MIN_BQ	.FILL xFFE0		; the difference between ASCII '@' and '`'
HIST_ADDR	.FILL x3F00     	; histogram starting address
STR_START	.FILL x4000		; string starting address
ZERO 		.FILL #48		; '0' ASCII code
A    		.FILL #65		; 'A' ASCII code
SPACE 		.FILL x0020		; ' ' ASCII code
NEWL 		.FILL x000A		; newline ASCII code
LOOP_COUNT 	.FILL x001B		; #27 for 27 loops
CHAR_BEGIN 	.FILL x3F00
LETTER_BEGIN .FILL x0040

.END

