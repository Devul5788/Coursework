// Main.c - Lab 6.1
// for ECE 385 - University of Illinois - Electrical and Computer Engineering
// Author: Shubham The Great (STG)

int main()
{
	volatile unsigned int *LED_PIO = (unsigned int*)0x50;
	volatile unsigned int *SW_PIO = (unsigned int*)0x40;
	volatile unsigned int *RESET_PIO = (unsigned int*)0x30;
	volatile unsigned int *ACC_PIO = (unsigned int*)0x20;

	*LED_PIO = 0x0; //clear all LEDs

//start 1
	while (1) //infinite loop
	{
		if(*ACC_PIO == 0x0) {
			while(*ACC_PIO != 0x1) continue;
			*LED_PIO = *LED_PIO + *SW_PIO;
		} else if(*RESET_PIO == 0x0) {
			*LED_PIO = 0x0;
		}
	}
//end 1

//  start 2
//
//	int i = 0;
//	*LED_PIO = 0; //clear all LEDs
//	while ( (1+1) != 3) //infinite loop
//	{
//		for (i = 0; i < 100000; i++); //software delay
//		*LED_PIO |= 0x1; //set LSB
//		for (i = 0; i < 100000; i++); //software delay
//		*LED_PIO &= ~0x1; //clear LSB
//	}
//
// end 2

	return 1; //never gets here
}
