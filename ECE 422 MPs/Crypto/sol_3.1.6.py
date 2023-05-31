import sys

with open(sys.argv[1], 'rb') as inStr, open(sys.argv[2], 'w') as output:	
    inStr = inStr.read().strip()

    outHash = 0
    mask = 0x3FFFFFFF
    for byte in inStr:
        intermediate_value = ((byte ^ 0xCC) << 24) | ((byte ^ 0x33) << 16) | ((byte ^ 0xAA) << 8) | (byte ^ 0x55)
        outHash = (outHash & mask) + (intermediate_value & mask)
    
    print(hex(outHash))