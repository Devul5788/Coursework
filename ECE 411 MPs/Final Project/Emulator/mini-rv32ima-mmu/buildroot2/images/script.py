counter = 0
with open('qemu_output.txt', 'r') as f_in, open('qemu_output2.txt', 'w') as f_out:
    for line in f_in:
        if 'pc       ' in line:
            f_out.write(f'\nrt: {counter}\n')
            counter += 1

        f_out.write(line)