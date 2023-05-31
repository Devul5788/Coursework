import binascii
import urllib.request, urllib.error 
from binascii import hexlify
import copy
import sys

base_url = "http://172.22.159.75:4000/mp3/danahar2/?"


def get_status(u): 
    try: 
        resp = urllib.request.urlopen(u) 
        print(resp.read()) 
    except urllib.error.HTTPError as e: 
        return e.code

with open(sys.argv[1]) as f:
    ciphertext = f.read().strip()

# We extract each byte from the hex ciphertext and put it in an array. 
# Each element of ciphertext stores 2 bytes
ciphertext = bytearray(bytes.fromhex(ciphertext))

def get_plaintext():
    # We divide by 32 as each block is 16 bytes and each byte is 2 hex characters
    plaintext = ""
    for block in range(0, len(ciphertext), 16):
        prev_block = ciphertext[block:block + 16]
        current_block = ciphertext[block + 16:block + 32]

        p_curr_block = bytearray(16)
        prev_block_copy = copy.deepcopy(prev_block)

        # Now starting from the last byte of the previous cipher text
        for byte_idx in range (15, -1, -1):
            for guess in range(0, 256):
                prev_block[byte_idx] = guess
                if(get_status(base_url + str(hexlify(prev_block).decode('ascii')) + str(hexlify(current_block).decode('ascii'))) == 404):
                    p_curr_block[byte_idx] = (0x10) ^ prev_block_copy[byte_idx] ^ guess
                    for pad_idx in range(15 - byte_idx, -1, -1):
                        prev_block[byte_idx + pad_idx] = prev_block_copy[byte_idx + pad_idx] ^ p_curr_block[byte_idx + pad_idx] ^ (15 - pad_idx)
                    break
        
        plaintext = plaintext + ''.join([chr(x) for x in p_curr_block])
    
    print(plaintext)
    
    output = open(sys.argv[2], 'w')
    output.write(plaintext)
    output.close()



get_plaintext()
