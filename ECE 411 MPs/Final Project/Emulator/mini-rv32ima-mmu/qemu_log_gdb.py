import sys
import subprocess

# Get the argument from the command line
arg = sys.argv[1]

# Define the commands to execute on terminal
commands = [
    "cd ~/ece411/mini-rv32ima_mmu/buildroot/output/build/linux-6.1.14",
    "gdb-multiarch -nx ./vmlinux",
    "target remote localhost:1234",
    "b *0x80000000",
    "c",
    "set logging file /home/devul/ece411/mini-rv32ima_mmu/mini-rv32ima/qemu_out.txt",
    "set logging overwrite",
    "set logging redirect",
    "set logging on",
    f"set $i = 0\nwhile ($i < {arg})\nprintf \"rt: %ld\\n\", $i\ninfo registers\nstepi\nprintf \"\\n\"\nset $i = $i + 1\nend", # Use f-string to insert the argument
    "set logging off"
]

# Run the commands on terminal using subprocess module
for cmd in commands:
    subprocess.run(cmd, shell=True)
