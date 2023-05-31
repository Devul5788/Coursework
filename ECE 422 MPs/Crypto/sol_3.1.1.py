with open('3.1.1_value.hex') as f:  
    file_content = f.read().strip()

integer_parsed = int(file_content,16)
print(integer_parsed)

print(bin(integer_parsed)[2:])