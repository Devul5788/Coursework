import sys

with open(sys.argv[1]) as encprypted, open(sys.argv[2]) as key, open(sys.argv[3], 'w') as output:
	alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" 
	encprypted_data = encprypted.read().strip()
	key_data = key.read().strip()
    
	for char in encprypted_data:
		if (char in key_data):
			output.write(alphabet[key_data.find(char)])
		else:
			output.write(' ')