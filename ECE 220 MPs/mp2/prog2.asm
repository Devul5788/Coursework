;in this MP, we implement the postfix calculator
;which takes an expression as given by the user and then calculates
;the corresponding result and displays it onto the screen if the 
;expression is valid, if not then a message saying "invalid expression"
;is displayed on the screen. Note that all the calculations are done by 
;pushing operands onto the stack and then popping 2 elements when operators
; are encountered and pushing the result back on the stack 

;partners: danahar2, sri4


.ORIG x3000

MAIN_LOOP	GETC				; gets char typed and stores it in R0
			OUT					; echos the char in R0 to screen
			JSR EVALUATE		; Jumps to subroutine EVALUATE
			BRnzp MAIN_LOOP		; loops back to MAIN_LOOP


FINAL 		LD R1, STACK_TOP	; We are checking of the stack is of size 1
			LD R2, STACK_START	; by subtracting STACK_START from STACK_TOP
			ADD R2, R2, #-1		; if it is of size 1, then it is valid, if not then it is invalid
			NOT R1, R1			
			ADD R1, R1, #1
			ADD R1, R2, R1
			BRnp INVALID
			LDI R5, STACK_START	; loades R5 with the value in x4000 (Start of stack)
			LDI R6, STACK_START	; loades R6 with the value in x4000 (Start of stack)
			JSR PRINT_HEX		; print the answer stored in R5 in hex
			BRnzp DONE

INVALID 	LEA R0, INVALID_ST	; prints that the expression is invalid
			PUTS

DONE		HALT

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;R0 - outer counter of 4
;R3 - inner counter of 4
;R4 - 4 bits that will be converted to hex
;R5 - value to print in hexadecimal

PRINT_HEX	ST R7, HEX_SAVER7	; callee save R7
			AND R3, R3, #0		; Initialize R3 as counter and set to 4 
			ADD R3, R3, #4;

HEX_CONVERT	AND R4, R4, #0		; Clear R4
			AND R0, R0, #0		; Initialize R0 as counter and set to 4
			ADD R0, R0, #4			
BIT_EXTRACT	ADD R4, R4, R4		; Left shift R4 to make space for next bit
			ADD R6, R6, #0		; Observe highest bit of R6
			BRzp SKIP			; If highest bit is zero then skip adding 1
			ADD R4, R4, #1		; Add 1 to R4
SKIP 		ADD R6, R6, R6		; Left shift R6
			ADD R0, R0, #-1		; Decrement counter
			BRp BIT_EXTRACT		; Repeat loop until counter reaches 0

			ADD R0, R4, #-9		; Compare digit with 9
			BRnz PRT_NUM		; if 0-9, go to PRT_NUM
			LD R0, ASCII_A		; Load Ascii Value of 'A'in R0
			ADD R0, R0, R4		; Store R4 + 'A'-10 in R0
			ADD R0, R0, #-10	
			BRnzp LOOP_DONE		; Skip to end of loop
PRT_NUM		LD R0, ASC_ZERO		; Load ascii value of '0' in R0
			ADD R0, R0, R4		; Store R4 + '0' in R0
LOOP_DONE	OUT					; Print character stored in R0
			ADD R3, R3, #-1		; Decrement Counter
			BRp HEX_CONVERT		; Loop until counter reaches 0 
			LD R7, HEX_SAVER7	; reload R7 with PC
			RET                 ; Return to main user program

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;R0 - character input from keyboard
;R6 - current numerical output

EVALUATE ST R7, EV_SAVER7		;callee save R7

;Check for '='
LD R1, EQUAL_ASC				;if the typed char is '=', then branch to 'FINAL'
ADD R1, R0, R1
BRz FINAL

;Check if space
LD R1, SPACE_ASC 				;if the typed char is space, then branch to end of subroutine
ADD R1, R0, R1 ;
BRz DONE_EV

;Check for '+'
LD R1, ADD_ASC					;if the typed char is +, then go to OPERATOR subroutine
ADD R1, R0, R1 
BRz OPERATOR

;Check for '-'
LD R1, SUB_ASC 					;if the typed char is -, then go to OPERATOR subroutine
ADD R1, R0, R1 
BRz OPERATOR 

;Check for '*'
LD R1, MULT_ASC 				;if the typed char is *, then go to OPERATOR subroutine
ADD R1, R0, R1 
BRz OPERATOR

;Check for '/'
LD R1, DIV_ASC 					;if the typed char is /, then go to OPERATOR subroutine 
ADD R1, R0, R1 
BRz OPERATOR

;Check for '^'
LD R1, EXP_ASC 					;if the typed char is ^, then go to OPERATOR subroutine
ADD R1, R0, R1 
BRz OPERATOR

;Check for 'over9'
LD R1, NINE_ASC					;if the typed char is over #9, then go to INVALID
ADD R1, R0, R1
BRp INVALID

;Check for 'under0'
LD R1, ZERO_ASC 				;if the typed char is under #0, then go to INVALID
ADD R1, R0, R1
BRn INVALID



OPERAND		
			LD R1, ZERO_ASC		;if the char typed is a number then push the number to stack, and go to end of subroutine
			ADD R0, R0, R1      ;Number needs to first be converted from ascii to its actual value by subtracting ascii zero
			JSR PUSH	
			BRnzp DONE_EV       


OPERATOR	ADD R2, R0, #0		;save the current char in R0 into R2 as the value in R0 is going to be changed

			JSR POP				;pop the topmost values on stack and store in R3 and R4
			ADD R4, R0, #0
			JSR POP
			ADD R3, R0, #0
			ADD R5, R5, #0      ; Check for underflow and accordingly branch to INVALID
			BRp INVALID
			

			;Check for '+'and accordingly branch to PLUS Subroutine		
			LD R1, ADD_ASC ;
			ADD R1, R2, R1;
			BRnp #1       
			JSR PLUS

			;Check for '-' and accordingly branch to MIN subroutine 
			LD R1, SUB_ASC ;
			ADD R1, R2, R1;
			BRnp #1
			JSR MIN

			;Check for '*'and accordingly branch to MUL subroutine
			LD R1, MULT_ASC ;
			ADD R1, R2, R1;
			BRnp #1
			JSR MUL

			;Check for '/'and accordingly branch to DIV subroutine
			LD R1, DIV_ASC ;
			ADD R1, R2, R1;
			BRnp #1
			JSR DIV

			;Check for '^' and accordingly branch to EXP subroutine
			LD R1, EXP_ASC ;
			ADD R1, R2, R1;
			BRnp #1
			JSR EXP

			JSR PUSH			;After the calculated value from the subrotine is stored in R0, push it on to stack

DONE_EV		LD R7, EV_SAVER7	;Load R7 back to what it was before subroutone was initiated
			RET                 ; Return to main user program

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;input R3, R4
;out R0
;operation R0 = R3 + R4

	PLUS	ADD R0, R3, R4
			RET
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;input R3, R4
;out R0
;operation R0 = R3 - R4

MIN			NOT R0, R4
			ADD R0, R0, #1
			ADD R0, R0, R3
			RET
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;input R3, R4
;out R0
;operation R0 = R3*R4

;R3 is being used as a counter of the number of times to add R4
;R0 stores the final value

MUL			ST R3, MUL_SaveR3	;callee save R3
			AND R0, R0, #0

MUL_LOOP 	ADD R0, R0, R4
			ADD R3, R3, #-1
			BRp MUL_LOOP
			LD R3, MUL_SaveR3	;load R3 back to pre-subroutine value
			RET
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;input R3, R4
;out R0
;operation R0 = R3/R4

;R4 is the counter of the number of times to subtract R4 from R3
;R0 stores the quotient


DIV		 	ST R3, DIV_SaveR3	;callee save R3
			ST R4, DIV_SaveR4	;callee save R4
			AND R0, R0, #0
			NOT R4, R4
			ADD R4, R4, #1

DIV_LOOP	ADD R3, R3, R4		;When R3-R4 becomes negative, branch to DIV_DONE
			BRn DIV_DONE
			ADD R0, R0, #1
			BRnzp DIV_LOOP

DIV_DONE	LD R3, DIV_SaveR3	;load R3 back to pre-subroutine value
			LD R4, DIV_SaveR3	;load R4 back to pre-subroutine value
			RET
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;input R3, R4
;out R0
;operation R0 = R3^R4

;R2 is the counter of the number of times to multiply R3
;R0 is the final answer


EXP			ST R2, EXP_SaveR2	;callee save R2
			ST R3, EXP_SaveR3	;callee save R3
			ST R4, EXP_SaveR4	;callee save R3
			ST R7, EXP_SaveR7	;callee save R7
			AND R0, R0, #0		;clear R0
			ADD R2, R4, #0		;Copy the value of R4 to R2
			ADD R4, R3, #0		;Copy the value of R3 to R2
			ADD R2, R2, #-1		;if R2 is 1, then its just R0 = R2^1 = R2
			BRz EXP_1

EXP_LOOP 	JSR MUL				;go to the MUL subroutine
			ADD R4, R0, #0		;add R4 to R0
			ADD R2, R2, #-1		;decrement counter
			BRp EXP_LOOP		
			BRnzp #1			

EXP_1		ADD R0, R3, #0		;set R0 to R3, as R2 = 0
			LD R2, EXP_SaveR2	;load R2 back to pre-subroutine value
			LD R3, EXP_SaveR3	;load R3 back to pre-subroutine value
			LD R4, EXP_SaveR4	;load R4 back to pre-subroutine value
			LD R7, EXP_SaveR7	;load R7 back to pre-subroutine value
RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;IN:R0, OUT:R5 (0-success, 1-fail/overflow)
;R3: STACK_END R4: STACK_TOP
;
PUSH	
	ST R3, PUSH_SaveR3	;save R3
	ST R4, PUSH_SaveR4	;save R4
	AND R5, R5, #0		;
	LD R3, STACK_END	;
	LD R4, STACk_TOP	;
	ADD R3, R3, #-1		;
	NOT R3, R3		;
	ADD R3, R3, #1		;
	ADD R3, R3, R4		;
	BRz OVERFLOW		;stack is full
	STR R0, R4, #0		;no overflow, store value in the stack
	ADD R4, R4, #-1		;move top of the stack
	ST R4, STACK_TOP	;store top of stack pointer
	BRnzp DONE_PUSH		;
OVERFLOW
	ADD R5, R5, #1		;
DONE_PUSH
	LD R3, PUSH_SaveR3	;
	LD R4, PUSH_SaveR4	;
	RET


PUSH_SaveR3	.BLKW #1	;
PUSH_SaveR4	.BLKW #1	;


;OUT: R0, OUT R5 (0-success, 1-fail/underflow)
;R3 STACK_START R4 STACK_TOP
;
POP	
	ST R3, POP_SaveR3	;save R3
	ST R4, POP_SaveR4	;save R3
	AND R5, R5, #0		;clear R5
	LD R3, STACK_START	;
	LD R4, STACK_TOP	;
	NOT R3, R3			;
	ADD R3, R3, #1		;
	ADD R3, R3, R4		;
	BRz UNDERFLOW		;
	ADD R4, R4, #1		;
	LDR R0, R4, #0		;
	ST R4, STACK_TOP	;
	BRnzp DONE_POP		;
UNDERFLOW
	ADD R5, R5, #1		;
DONE_POP
	LD R3, POP_SaveR3	;
	LD R4, POP_SaveR4	;
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
POP_SaveR3	.BLKW #1	;
POP_SaveR4	.BLKW #1	;
EV_SAVER7	.BLKW #1
HEX_SAVER7	.BLKW #1
STACK_END	.FILL x3FF0	;
STACK_START	.FILL x4000	;
STACK_TOP	.FILL x4000	;


;Stores the additive inverse of the ascii values (easier to perform subtraction)
SPACE_ASC	.FILL xFFE0	;
EQUAL_ASC	.FILL xFFC3	;
MULT_ASC	.FILL xFFD6	;
ADD_ASC		.FILL xFFD5	;
SUB_ASC		.FILL xFFD3	;
DIV_ASC		.FILL xFFD1	;
EXP_ASC		.FILL xFFA2	;
ZERO_ASC	.FILL xFFD0	;
NINE_ASC	.FILL xFFC7 ;

ASCII_A		.FILL #65   ; Ascii for A
ASC_ZERO	.FILL #48	; Ascii for 0

INVALID_ST	.STRINGZ "Invalid Expression";

; reserve spaces in memory to store register values
MUL_SaveR3	.BLKW #1	;
DIV_SaveR3	.BLKW #1	;
DIV_SaveR4	.BLKW #1	;
EXP_SaveR2	.BLKW #1	;
EXP_SaveR3	.BLKW #1	;
EXP_SaveR4	.BLKW #1	;
EXP_SaveR7	.BLKW #1	;


.END
