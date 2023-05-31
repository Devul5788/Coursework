# mp1.S - missile-command version
# Good luck, and have fun!

.data
	
    # Constants for accessing the fields of a struct missile, 
    # struct missile is defined in rtc.h and mp1.h

	NEXT 	  = 0
	X	  = 4
	Y	  = 8
	VX	  = 12
	VY	  = 16
	DEST_X	  = 20
	DEST_Y	  = 24
	EXPLODED  = 28
	C	  = 32
	
    # Character to draw for an explosion - '@'
	EXPLOSION = 64 

	# Character to draw for an explosion - ' ' (space)
	ERASE = 32

	# Character to draw for an explosion - '+'
	CROSSHAIR = 43

# Data shared between this file and rtc.c helper functions
# This '.globl' directive makes these symbols visible externally
.globl mp1_missile_list, base_alive, mp1_score

mp1_missile_list:	.long 0x0	# Head of list pointer
base_alive:		.long 0x0	# Array of 3 bytes, plus a padding byte
mp1_score:		.long 0x0	# Player's current score


# Data private to this  file

base_pic:     	    .string "/^^^\\"	# Picture of a live base
dead_base_pic: 	    .string "xxxxx"	# Picture of a dead base
crosshairs_x:		.long 0x0	# X-position of the crosshairs
crosshairs_y:		.long 0x0	# Y-position of the crosshairs
curr_char:			.long 0x0	# current character of city being printed

.text

# void mp1_poke(void);
# You can use this function to write to video memory.
#
# Interface: Register-based arguments (not C-style)
#    Inputs: %cl  - The byte you wish to write
#            %eax - Offset from the start of video memory that you wish
#                   to write to
#   Outputs: Text-mode video screen is written to at location %eax with
#            the byte in %cl
# Registers: Clobbers EDX

mp1_poke:
		movl    vmem_base_addr(,1),%edx
		movb    %cl,(%edx,%eax,1)
		ret

#   ----------------- Exported functions ---------------------

# void mp1_rtc_tasklet(unsigned long garbage);
# Performs three tasks:
#	(1) updates the list of missiles (implement this in update_missiles,
#           below, and call it from here).
#	(2) Redraw the bases - they may have been overwritten with missiles
#	(3) Redraw the crosshairs - it may have been overwritten with missiles
# Inputs   : none
# Outputs  : none
# Registers: Standard C calling convention

.globl mp1_rtc_tasklet
mp1_rtc_tasklet:
	# callee saved
	pushl %ebp
	movl %esp, %ebp
	pushl %ebx
	pushl %esi
	pushl %edi

	# call tasklet functions
	call update_missiles
	call redraw_cities
	call redraw_crosshairs
	jmp finish

# int mp1_ioctl(unsigned long arg, unsigned int cmd)
# The dispatch function for the MP1 ioctls - should use the cmd argument
# and a jumptable to execute one of the specific ioctls implemented below.
# Inputs   : unsigned long arg - parameter to the mp1_ioctl_....
#          : unsigned int cmd  - specifies which mp1_ioctl_... function 
#          :                     to execute
# Outputs  : Returns an integer - depends on which ioctl() function is called
# Registers: Standard C calling convention

.globl mp1_ioctl
mp1_ioctl:
	# get cmd and jmp to function accordingly
	movl 8(%esp), %eax
	cmpl $0, %eax
	jl fail
	cmpl $4, %eax
	jg fail
	jmp *jump_table(, %eax, 4)

fail:
	movl $-1, %eax
	jmp finish

jump_table :
	.long mp1_ioctl_startgame, mp1_ioctl_addmissile, mp1_ioctl_movexhairs, mp1_ioctl_getstatus, mp1_ioctl_endgame
# ----------------- Functions private to this file -------------------


update_missiles:
	# callee save registers
	pushl %ebp
	movl %esp, %ebp
	pushl %ebx
	pushl %esi
	pushl %edi

	# ebx -> current node, esi -> prev node
	movl mp1_missile_list, %ebx
	movl $0, %esi

	# while loop that iterates through the linked list and frees
	# each node. The argument to the free node is a pointer to the node
	# in the kernel stack. Free has one parameter --> pointer to the node that is to be freed.
	walk_nodes:
		# check if the head is null
		cmpl $0, %ebx
		je finish

		# First step is to clear the missile from the screen (to prevent ghosting)
		# push arguments (x, y, char to draw) and call draw_char (helper function)
		# caller save regs
		pushl %eax
		pushl %ecx
		pushl %edx

		# draw space
		pushl $32
		movl Y(%ebx), %edi
		sarl $16, %edi
		pushl %edi
		movl X(%ebx), %edi
		sarl $16, %edi
		pushl %edi
		call draw_char
		addl $12, %esp

		# caller teardown
		popl %edx
		popl %ecx
		popl %eax

		# Second step is to check if missile is currently exploding. if it is not then
		# update x and y. Then there are three conditions.
		# When exploded == 0 it has not started exploding yet
		cmpl $0, EXPLODED(%ebx)
		jne keep_missile_bounded

		# Update by newX = oldX + velocityX
		movl VX(%ebx), %edi
		addl %edi, X(%ebx) 
		movl VY(%ebx), %edi
		addl %edi, Y(%ebx) 

		# now we start processing nodes
		# Step 1 -> check if missile is out of range, if it is to then remove missile
		keep_missile_bounded:
			# check (x < 0 and x > 79) then remove_missile
			# check (y < 0 and y < 24) then remove_missile
			# test if x < 0. 
			# edi -> x (top 16 bits)
			movl X(%ebx), %edi
			sarl $16, %edi

			# test if x < 0
			cmpl $0, %edi
			jl out_of_bound	

			# test if x > 79
			cmpl $79, %edi
			ja out_of_bound

			# edi -> Y (top 16 bits)
			movl Y(%ebx), %edi
			sarl $16, %edi

			# test if y < 0
			cmpl $0, %edi
			jl out_of_bound

			# test if y > 24
			cmpl $24, %edi
			ja out_of_bound
			jmp update_exploding_status

			out_of_bound:
				# caller save regs
				pushl %eax
				pushl %ecx
				pushl %edx
				call mp1_missile_remove

				# popping argument to function as well as caller registers
				popl %edx
				popl %ecx
				popl %eax

				# restart loop
				jmp walk_nodes
		
		# step 2 -> if the missile has reached its destination or is currently exploding, call missile explode with a
		# pointer to the missile’s struct missile as an argument.
		update_exploding_status:
			cmpl $0, EXPLODED(%ebx)
			jne exploding

			# check if missile has reached its destination x = dest_x and y = dest_y.
			# Note that we check the upper 16 bits of x and y
			movl X(%ebx), %ecx
			shrl $16, %ecx
			cmpl DEST_X(%ebx), %ecx
			jne draw_missile

			movl Y(%ebx), %ecx
			shrl $16, %ecx
			cmpl DEST_Y(%ebx), %ecx
			jne draw_missile

			# call missile explode with pointer to missile's struct missile.
			# The missile explode function (provided to you) checks
			# whether this missile’s exposion causes any other missiles or any 
			# of your cities to explode. If so, it returns a non-zero value.
			exploding:
				# caller save regs
				pushl %eax
				pushl %ecx
				pushl %edx

				# pushing arguments andd calling function
				pushl %ebx
				call missile_explode
				popl %ebx

				# caller teardown
				popl %edx
				popl %ecx

				# caller save regs for notify, call notify, and remove caller saved regs
				pushl %eax
				pushl %ecx
				pushl %edx
				call mp1_notify_user
				popl %edx
				popl %ecx
				popl %eax

				# pop eax value from when calling missile explode
				popl %eax

				# decrement the exploded field for this missile
				addl $-1, EXPLODED(%ebx)

				# check exploded is 0, then missile is finished and it must be erased.
				cmpl $0, EXPLODED(%ebx)
				jne draw_exploding

				# caller save regs
				pushl %eax
				pushl %ecx
				pushl %edx

				# pushing arguments
				call mp1_missile_remove

				# popping argument to function as well as caller registers
				popl %edx
				popl %ecx
				popl %eax

				jmp walk_nodes

			# draw exploding missile 
			draw_exploding:
				# caller save regs
				pushl %eax
				pushl %ecx
				pushl %edx

				# draw explosion
				pushl $64
				movl Y(%ebx), %edi
				sarl $16, %edi
				pushl %edi
				movl X(%ebx), %edi
				sarl $16, %edi
				pushl %edi
				call draw_char
				addl $12, %esp

				# caller teardown
				popl %edx
				popl %ecx
				popl %eax

				jmp restart_loop
		
		# Step 3 -> Finally, if the missile is simply moving toward its destination, 
		# is not exploding, and is still on the screen, you should check whether
		# its screen position has changed. If so, you should erase it from its old 
		# position and re-draw it in its new position.
		draw_missile:
			# caller save regs
			pushl %eax
			pushl %ecx
			pushl %edx

			# draw missile
			pushl C(%ebx)
			movl Y(%ebx), %edi
			sarl $16, %edi
			pushl %edi
			movl X(%ebx), %edi
			sarl $16, %edi
			pushl %edi
			call draw_char
			addl $12, %esp

			# caller teardown
			popl %edx
			popl %ecx
			popl %eax

		restart_loop:
			# set curr pointer to next and prev to current and restart loop
			movl %ebx, %esi
			movl NEXT(%ebx), %ebx
			jmp walk_nodes
	

mp1_missile_remove:
	# callee save registers
	pushl %ebp
	movl %esp, %ebp
	pushl %edi

	# ebx -> current node, edx -> temp node (current), esi -> prev node
	movl %ebx, %edx

	# check if root is null
	cmpl $0, %ebx
	je finish

	# edi -> next node
	movl NEXT(%ebx), %edi

	# caller save regs
	pushl %eax
	pushl %ecx
	pushl %edx

	# pushing arguments
	pushl %ebx
	call mp1_free

	# popping argument to function as well as caller registers
	addl $4, %esp
	popl %edx
	popl %ecx
	popl %eax

	# Case 1 - if head (prev == NULL) then set new head
	case1:
		cmpl $0, %esi
		jne case2
		movl %edx, NEXT(%edx)
		movl %edx, mp1_missile_list
	
	# Case 2 - if middle node (prev != NULL and next != NULL) then set prev->next = next
	case2:
		movl %edi, %ebx
		movl %edi, NEXT(%esi)

	# case 3 - if end node (next == NULL) then set curr = prev
	# restoring edi
	popl %edi

	leave
	ret

# redrawing the cities to ensure any destroyed cities are drawn as destroyed
redraw_cities:
	# callee save registers
	pushl %ebp
	movl %esp, %ebp
	pushl %ebx
	pushl %esi

	# ebx -> base_array
	# ecx -> city counter
	# curr_char -> character array
	# esi -> mask and base_array & mask
	# edi -> dead or alive city char array
	# edx -> x coordinate (18/38/58)
	# eax -> (curr_char + edx)

	movl base_alive, %ebx
	movl $2, %ecx
	movl $0x000000FF, %esi
	movl $18, %edx

	city_loop:
		# check counter reaches 0 -> break loop
		cmpl $0, %ecx
		jl city_loop_done
		
		# because of a lack of registers, save esi and then see if the city is dead
		pushl %esi
		andl %ebx, %esi
		cmpl $0, %esi
		je dead

		# check the city is alive put the address of relevant picture in edi
		alive:
			leal base_pic, %edi
			jmp city_char_loop

		dead:
			leal dead_base_pic, %edi
			jmp city_char_loop
		
		# loop through each character in the character array and display on screen
		city_char_loop:
			# check if loop is done
			cmpl $4, curr_char
			ja char_loop_done
			
			# get the x value on the screen
			xorl %eax, %eax
			addl curr_char, %eax
			addl %edx, %eax

			# caller save regs
			pushl %eax
			pushl %ecx
			pushl %edx

			# draw the character on the screen
			pushl (%edi)
			addl $1, %edi
			pushl $24
			pushl %eax
			call draw_char
			addl $12, %esp

			# caller teardown
			popl %edx
			popl %ecx
			popl %eax

			addl $1, curr_char
			jmp city_char_loop

		char_loop_done:
			# reset character pointer
			movl $0, curr_char

			# get the mask back and shift it to the right by 8
			popl %esi
			shll $8, %esi

			# decrement city counter
			addl $-1, %ecx

			# add 20 to the x position of the city
			addl $20, %edx
			jmp city_loop

	city_loop_done:
		# callee teardown and return
		jmp finish

# draws the crosshairs on the screen
redraw_crosshairs:
	# callee save registers
	pushl %ebp
	movl %esp, %ebp
	pushl %ebx
	pushl %esi
	pushl %edi

	# push arguments (x, y, char to draw) and calling draw_char (helper function)
	pushl $43
	pushl crosshairs_y
	pushl crosshairs_x
	call draw_char

	# popping argument to function as well as caller registers
	addl $12, %esp

	# callee teardown and return
	jmp finish

# initializes the game and its initial values
mp1_ioctl_startgame:
	# callee save registers
	pushl %ebp
	movl %esp, %ebp
	pushl %ebx
	pushl %esi
	pushl %edi

	# initialize local variables. base_pic and dead_base_pic already defined in the start
	movl $0, mp1_missile_list

	# The base alive array indicates whether each city has been destroyed. It contains four bytes; each of the first three is zero if the corresponding base is dead and non-zero if it is alive. The fourth byte is padding.
	movl $0x00FFFFFF, base_alive
	movl $0, mp1_score
	movl $40, crosshairs_x
	movl $12, crosshairs_y

	# callee teardown and return
	jmp finish

# int mp1 ioctl addmissile (struct missile* user missile);
# This ioctl must add a new missile to the game. The parameter is a pointer to a struct missile in user space. This
# function needs to copy the user’s missile into a dynamically allocated buffer in kernel space. If either the dynamic
# memory allocation (see “Allocating and Freeing Memory” below) or the data copy (see “Moving data to/from the
# kernel”) fails, this function should return -1. If it does fail, it should be sure to free any memory it has allocated before
# returning. If it succeeds, it should add the new missile into the linked list and return 0
mp1_ioctl_addmissile:
	# callee save registers
	pushl %ebp
	movl %esp, %ebp
	pushl %ebx
	pushl %esi
	pushl %edi

	# ebx -> missile struct in user stack
	movl 8(%ebp), %ebx

	# we must now create space for the missile struct using malloc. malloc creates space in kernel 
	# caller save before calling malloc subroutine. eax is not popped as the return value from callee is important
	pushl %ecx
	pushl %edx

	# pushing parameter specifying the number of bytes of memory to allocate
	# missile struct is 36 bytes (4 + 32 + 4 = 36) n a 32 bit system -
	# - 1 struct pointer -> 4 bytes
	# - 7 integers -> 7 * 4 bytes = 28 bytes
	# - 1 char -> 1 byte + 3 bytes of padding = 4 bytes
	pushl $36
	call mp1_malloc

	# Check if malloc failed. malloc returns NULL when it fails. 
	cmpl $0, %eax
	je fail

	# popping argument to malloc function as well as caller registers
	addl $4, %esp
	popl %edx
	popl %ecx

	# now we need to copy the user’s missile into a dynamically allocated buffer in kernel space
	# unsigned long mp1 copy to user (void *to, const void *from, unsigned long n);
	# caller save regs
	pushl %eax
	pushl %ecx
	pushl %edx

	# pushing arguments
	pushl $36
	pushl %ebx
	pushl %eax
	call mp1_copy_from_user

	# popping argument to malloc function as well as caller registers
	addl $12, %esp
	popl %edx
	popl %ecx

	# Check if mp1_copy_from_user failed. mp1_copy_from_user returns returns the number of bytes that could not be copied.
	cmpl $0, %eax
	jne fail_free

	# pop eax so that we have a point back to the missle list
	popl %eax

	# finally we add the new missile into the linked list by setting it as the new head	
	movl mp1_missile_list, %edi
	movl %edi, NEXT(%eax)
	movl %eax, mp1_missile_list

	# return 0 as the operation was successful
	movl $0, %eax

	# callee teardown and return
	jmp finish

fail_free:
	# assumes the top of the stack holds eax. Free the mallocced node and call finish
	call mp1_free
	addl $4, %esp
	movl $-1, %eax
	jmp finish

# int mp1 ioctl movexhairs (unsigned long xhair_delta_packed);
# This function moves the crosshairs. The parameter is a 32-bit integer containing two signed 16-bit integers packed into
# its low and high words. The low 16 bits contain the amount by which the x component of the crosshair position should
# change, and the high 16 bits contain the amount by which the y component should change. This function should not
# allow the crosshairs to be moved off of the screen—that is, it should ensure that the x component of its position stays
# within the range 0-79, and its y component stays within the range 0-24. If the position of the crosshairs does change,
# this function should redraw it at its new location. It should never fail, and always return 0.
mp1_ioctl_movexhairs:
    # callee save registers
	pushl %ebp
	movl %esp, %ebp
	pushl %ebx
	pushl %esi
	pushl %edi
		
	# push arguments (x, y, char to draw) and call draw_char (helper function)
	pushl $32
	pushl crosshairs_y
	pushl crosshairs_x
	call draw_char

	# popping argument to function as well as caller registers
	addl $12, %esp
	
	# ebx -> low 16 bits (sign extended)
	movw 8(%ebp), %bx
	shll $16, %ebx
	sarl $16, %ebx

	# esi -> high 16 bits (sign extended)
	movw 10(%ebp), %si
	shll $16, %esi
	sarl $16, %esi

	# check (x >= 0 and x <= 79) then do crosshairs_x += ebx
	# check (y >= 0 and y <= 24) then do crosshairs_y += esi
	# test if ebx + crosshairs_x < 0. 
	x_min: 
		movl %ebx, %edi
		addl crosshairs_x, %edi
		cmpl $0, %edi
		jl y_min

	# test if ebx + crosshairs_x > 79
	x_max: 
		cmpl $79, %edi
		ja y_max
		addl %ebx, crosshairs_x

	# test if esi + crosshairs_y < 0
	y_min:
		movl %esi, %edi
		addl crosshairs_y, %edi
		cmpl $0, %edi
		jb draw_new

	# test if esi + crosshairs_y > 24
	y_max:
		cmpl $24, %edi
		ja draw_new
		addl %esi, crosshairs_y

	#draw crosshair on new updated X Y
    draw_new:
		# push arguments (x, y, char to draw) and calling draw_char (helper function)
		pushl $43
		pushl crosshairs_y
		pushl crosshairs_x
		call draw_char

		# popping argument to function as well as caller registers
		addl $12, %esp

	# always return 0
	movl $0, %eax

	# callee teardown and return
	jmp finish

# This function allows the user to retrieve the current score and the status of the three cities. The argument is a pointer to
# a 32-bit integer in user space. This function should copy the current score into the low 16-bits of that integer, and the
# status of the three cities into bits 16, 17, and 18. The missile explode function maintains the user’s current score
# in the mp1 score variable declared in mp1.S. If a city is currently alive, the corresponding bit should be a 1; if it has
# been destroyed, the bit should be 0. The missile explode function maintains this information in the base alive
# array, as described above. This function should return 0 if the copy to user space succeeds, and -1 if it fails.
mp1_ioctl_getstatus:
	# callee save registers
	pushl %ebp
	movl %esp, %ebp
	pushl %ebx
	pushl %esi
	pushl %edi

	# ebx -> stores the pointer argument (pointer exists in user stack)
	movl 8(%ebp), %ebx

	# esi -> new status (gets information from kernel)
	# copy current score into low 16 bits of that integer
	movl mp1_score, %esi

	# Status of 3 cities into bits 16, 17, and 18 (alive -> 1, destroyed -> 0)
	check_city1:
		movl base_alive, %edi
		andl $0x00FF0000, %edi
		cmpl $0, %edi
		ja alive_1
	
	check_city2:
		movl base_alive, %edi
		andl $0x0000FF00, %edi
		cmpl $0, %edi
		ja alive_2
	
	check_city3:
		movl base_alive, %edi
		andl $0x000000FF, %edi
		cmpl $0, %edi
		ja alive_3
		jmp return

	alive_1:
		addl $0x00010000, %esi
		jmp check_city2
	
	alive_2:
		addl $0x00020000, %esi
		jmp check_city3
	
	alive_3:
		addl $0x00040000, %esi
		jmp return
	
	# Copy this information from kernel space to user space
	# unsigned long mp1 copy_to_user (void *to, const void *from, unsigned long n);
	return:
		# we need the address of esi. we can get this through stack pointer
		pushl %esi
		movl %esp, %eax

		# caller save regs
		pushl %eax
		pushl %ecx
		pushl %edx

		# pushing arguments
		pushl $4 
		pushl %eax
		pushl %ebx
		call mp1_copy_to_user

		# popping argument to malloc function as well as caller registers
		addl $12, %esp
		popl %edx	
		popl %ecx

		# Check if mp1_copy_from_user failed. mp1_copy_from_user returns returns the number of bytes that could not be copied
		# Return 0 if success otherwise return -1
		cmpl $0, %eax
		jne fail

		popl %eax
		popl %esi

		# always return 0
		movl $0, %eax

		# callee teardown and return
		jmp finish

# int mp1 ioctl endgame (unsigned long ignore);
# Called when the game is over, this function must perform all the cleanup work. It should free all the memory being
# used by the linked list and then return success. When freeing the list, be careful to avoid accessing any memory that
# has already been freed.
mp1_ioctl_endgame:
	# callee save registers
	pushl %ebp
	movl %esp, %ebp
	pushl %ebx
	pushl %esi
	pushl %edi

	# ebx -> missile list head
	movl mp1_missile_list, %ebx

	# while loop that iterates through the linked list and frees
	# each node. The argument to the free node is a pointer to the node
	# in the kernel stack. Free has one parameter --> pointer to the node that is to be freed.
	loop_remove:
		# check if the head is null
		cmpl $0, %ebx
		je finish

		# store the pointer to the next node before free it and store it in esi
		movl NEXT(%ebx), %esi

		# assign new head
		movl %esi, mp1_missile_list

		# push the head to the stack and free it
		pushl %ebx
		call mp1_free

		# remove the head pointer from stack
		addl $4, %esp
		movl %esi, %ebx
		
		jmp loop_remove

	# callee teardown and return
	jmp finish

finish:
  # callee teardown
  popl %edi
  popl %esi
  popl %ebx

  # return value save in eax. leave pops and restores ebp. ret pops and restores return address.
  leave
  ret
  

# Helper functions

# To prevent ghosting we must first clear the canvas. We clear by setting the character as space.
# We draw on the screen by using mp1_poke. First argument is eax -> position. Second argument
# is cl -> character to draw.
# Inputs: (x, y, char to draw)
# Outputs: Nothing
draw_char:
	# callee save registers
	pushl %ebp
	movl %esp, %ebp
	pushl %ebx
	pushl %esi
	pushl %edi

	# EBX -> x, ESI -> is y, cl -> char
	movl 8(%ebp), %ebx
	movl 12(%ebp), %esi
	movb 16(%ebp), %cl

	# push arguments to get position
	pushl %esi
	pushl %ebx
	call position

	# # popping argument to function as well as caller registers
	addl $8, %esp
	
	# we caller save edx as mp1_poke clobbers it
	pushl %edx
	call mp1_poke
	popl %edx

	# callee teardown and return
	jmp finish

# calculate the positon on screen using the equation (2*80*y + 2*x)
# Input: x, y
# Output: position (eax)
position:
	# callee save registers
	pushl %ebp
	movl %esp, %ebp
	pushl %ebx
	pushl %esi
	pushl %edi

	# ebx -> x, esi -> y
	movl 8(%ebp), %ebx
	movl 12(%ebp), %esi

	# getting the position on the screen
	imull $160, %esi, %esi
	imull $2, %ebx, %ebx
	addl %ebx, %esi
	movl %esi, %eax

	# callee teardown and return
	jmp finish
