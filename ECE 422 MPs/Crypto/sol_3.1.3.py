from Crypto.Cipher import AES  
import sys

with open(sys.argv[1]) as ct, open(sys.argv[2]) as k, open(sys.argv[3]) as iv_file, open(sys.argv[4], 'w') as output:	
	ciphertext = bytes.fromhex(ct.read().strip())
	key = bytes.fromhex(k.read().strip())
	iv = bytes.fromhex(iv_file.read().strip())
    
	cipher = AES.new(key, AES.MODE_CBC, iv=iv) 
	plaintext = cipher.decrypt(ciphertext) # ciphertext must be multiple of 16 bytes

	output.write(plaintext.decode())