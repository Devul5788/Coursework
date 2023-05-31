import sys

with open(sys.argv[1]) as c, open(sys.argv[2]) as d, open(sys.argv[3]) as n, open(sys.argv[4], 'w') as output:	
	c = int(c.read().strip(), 16)
	d = int(d.read().strip(), 16)
	n = int(n.read().strip(), 16)

	plaintext = pow(c, d, n)

	output.write(hex(plaintext)[2:])

# with open("sol_3.1.5.hex") as decrypted:
# 	m = int(decrypted.read().strip(), 16)

# 	encrypted = pow(m, 65537, n)

# 	print(encrypted)