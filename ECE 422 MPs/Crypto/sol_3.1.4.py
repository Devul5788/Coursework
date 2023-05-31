from Crypto.Cipher import AES 
import sys

with open(sys.argv[1]) as ct, open(sys.argv[2], 'w') as output:	
	ciphertext = bytes.fromhex(ct.read().strip())
	
	print(type(ct.read().strip()))

	iv_hex = "00" * 16
	iv = bytes.fromhex(iv_hex)

	for i in range(32):
		key_hex = format(i, 'x').zfill(64)
		key = bytes.fromhex(key_hex)
		
		cipher = AES.new(key, AES.MODE_CBC, iv)
		plaintext = cipher.decrypt(ciphertext)


		print("Plaintext " + str(i) + ": " + plaintext.decode("ascii", errors="ignore"))
		print("Key " + str(i) + ": " + key.hex())
		
		# if plain:
		# 	print("Key found: ", key_hex)
		# 	open("sol_3.1.4.hex", "w").write(key_hex)
		# 	break
    
	# cipher = AES.new(key, AES.MODE_CBC, iv=iv) 
	# plaintext = cipher.decrypt(ciphertext) # ciphertext must be multiple of 16 bytes

	# output.write(plaintext.decode())