/* tuxctl-ioctl.c
 *
 * Driver (skeleton) for the mp2 tuxcontrollers for ECE391 at UIUC.
 *
 * Mark Murphy 2006
 * Andrew Ofisher 2007
 * Steve Lumetta 12-13 Sep 2009
 * Puskar Naha 2013
 */
#include <asm/current.h>
#include <asm/uaccess.h>

#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/module.h>
#include <linux/fs.h>
#include <linux/sched.h>
#include <linux/file.h>
#include <linux/miscdevice.h>
#include <linux/kdev_t.h>
#include <linux/tty.h>
#include <linux/spinlock.h>

#include "tuxctl-ld.h"
#include "mtcp.h"
#include "tuxctl-ioctl.h"
#define debug(str, ...) \
	printk(KERN_DEBUG "%s: " str, __FUNCTION__, ## __VA_ARGS__);

// file's local variables
static uint8_t button_state;
static unsigned long led_state;
static uint8_t flag = 0;
static unsigned char led_buf[6];
static unsigned char init_buf[] = {MTCP_LED_USR, MTCP_BIOC_ON};

// hex to led displays map
static unsigned hex_led[] = {0xE7, 0x06, 0xCB, 0x8F, 0x2E, 0xAD, 0xED, 0x86, 0xEF, 0xAE, 0xEE, 0x6D, 0xE1, 0x4F, 0xEB, 0xE8};

// function declartion
int tux_init(struct tty_struct *tty);
int tux_buttons(unsigned long arg);
int tux_set_led(struct tty_struct* tty, unsigned long arg);

/************************ Protocol Implementation *************************/

/* tuxctl_handle_packet()
 * IMPORTANT : Read the header for tuxctl_ldisc_data_callback() in 
 * tuxctl-ld.c. It calls this function, so all warnings there apply 
 * here as well.
 */
void tuxctl_handle_packet (struct tty_struct* tty, unsigned char* packet) {
    unsigned a, b, c;

    a = packet[0]; /* Avoid printk() sign extending the 8-bit */
    b = packet[1]; /* values when printing them. */
    c = packet[2];

	switch (a) {
		case MTCP_BIOC_EVENT:
			// get the relevant button values and store it in button state. This keeps in mind that D and L are switched
			button_state = (b & 0x0F) | ((c & 0x1) << 4) | (((c & 0x4) >> 2) << 5) | (((c & 0x2) >> 1) << 6) | (((c & 0x8) >> 3) << 7);
			break;
		case MTCP_RESET:
			// reset the buttons
			button_state = 0x0;

			// check if flag is down then send it to TUX.
			if (!flag) {
				flag = 1;
				tuxctl_ldisc_put(tty, init_buf, 2);
			}

			// set the leds to previous state
			tux_set_led(tty, led_state);
			break;
		case MTCP_ACK:
			// set flag down when an ack is recieved
			if (flag) flag = 0;
			break;
		default:
			break;
	}
}

/******** IMPORTANT NOTE: READ THIS BEFORE IMPLEMENTING THE IOCTLS ************
 *                                                                            *
 * The ioctls should not spend any time waiting for responses to the commands *
 * they send to the controller. The data is sent over the serial line at      *
 * 9600 BAUD. At this rate, a byte takes approximately 1 millisecond to       *
 * transmit; this means that there will be about 9 milliseconds between       *
 * the time you request that the low-level serial driver send the             *
 * 6-byte SET_LEDS packet and the time the 3-byte ACK packet finishes         *
 * arriving. This is far too long a time for a system call to take. The       *
 * ioctls should return immediately with success if their parameters are      *
 * valid.                                                                     *
 *                                                                            *
 ******************************************************************************/
/* 
 * tuxctl_ioctl
 *   DESCRIPTION: this is a dispatcher for ioctls
 *   INPUTS: tty -- tty struct to interface with tux
 * 			 cmd -- cmd decides which ioctl function to go to
 * 			 arg -- arg is the relevant argument for the ioctl function
 *   OUTPUTS: none
 *   RETURN VALUE: 0 if successful or -EINVAL if unsuccessful
 */
int tuxctl_ioctl (struct tty_struct* tty, struct file* file, unsigned cmd, unsigned long arg){
    switch (cmd) {
		case TUX_INIT:
			return tux_init(tty);
		case TUX_BUTTONS:
			return tux_buttons(arg);;
		case TUX_SET_LED:
			return tux_set_led(tty, arg);
		default:
	    	return -EINVAL;
    }
}

/* 
 * tux_init
 *   DESCRIPTION: set the buttons and leds to zero.
 *   INPUTS: tty -- tty struct to interface with tux
 * 			 cmd -- cmd decides which ioctl function to go to
 * 			 arg -- arg is the relevant argument for the ioctl function
 *   OUTPUTS: none
 *   RETURN VALUE: 0 if successful
 */
int tux_init (struct tty_struct * tty) {
	button_state = 0x0;
	led_state = 0x000F0000;

	if (!flag) {
		flag = 1;
		tuxctl_ldisc_put(tty, init_buf, 2);
	}

	led_buf[0] = MTCP_LED_SET;
	led_buf[1] = 0xF;
	led_buf[2] = 0x0;
	led_buf[3] = 0x0;
	led_buf[4] = 0x0;
	led_buf[5] = 0x0;

	if (!flag) {
		flag = 1;
		tuxctl_ldisc_put(tty, led_buf, 6);
	}

	return 0;
}

/* 
 * tux_buttons
 *   DESCRIPTION: copies the tux button state to user.
 *   INPUTS: arg -- pointer to store buttons in user space
 *   OUTPUTS: none
 *   RETURN VALUE: 0 if successful or -EINVAL if unsuccessful
 */
int tux_buttons (unsigned long arg) {
	if (arg == 0 || copy_to_user((unsigned long*) arg, &button_state, 4) != 0)
		return -EINVAL;
	return 0;
}

/* 
 * tux_set_led
 *   DESCRIPTION: given an argument of 32 bits. The leds are set accordingly
 *   INPUTS: tty -- tty struct to interface with tux
 * 			 arg -- 32 bits of which leds to show
 *   OUTPUTS: none
 *   RETURN VALUE: 0 if successful
 */
int tux_set_led (struct tty_struct * tty, unsigned long arg) {
	unsigned i, led_mask, dec_mask, hex_num, num;
	
	led_mask = (arg >> 16) & 0xF; 
	dec_mask = (arg >> 24) & 0xF; 
	
	led_buf[0] = MTCP_LED_SET;
	led_buf[1] = 0xF;

	// Loop through led_mask and dec_mask to appropriately get and set leds
	for (i = 0; i < 4; i++){
		num = (arg >> 4 * i) & 0xF;
		hex_num = 0;
		if(led_mask & 0x1){
			hex_num = hex_led[num];
		}
		if (dec_mask & 0x1){
			if (led_mask & 0x1){
				hex_num = (((hex_led[num] >> 4) + 1) << 4) | (hex_led[num] & 0xF);
			} else {
				hex_num = 1 << 4;
			}
		}
		led_buf[i + 2] = hex_num;
		led_mask = led_mask >> 1;
		dec_mask = dec_mask >> 1;
	}

	// put the led information into the tux
	if (!flag) {
		flag = 1;
		tuxctl_ldisc_put(tty, led_buf, 6);
	}

	return 0;
}
