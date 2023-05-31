#!/usr/bin/python3

import sys
import os
import subprocess

# For terminal colors.
class clr:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'


if len(sys.argv) < 2 or (sys.argv[1][-3:] != "elf" and sys.argv[1][-2:] != ".s"):
    print("Usage: ./run_spike.py path/to/binary.elf")
    print("Compares CPU v. spike. Overwrites sim/spike.log and \
sim/spike_gold.log.")
    sys.exit(1)

if not os.path.isfile(sys.argv[1]):
    print(f"{clr.FAIL}{clr.BOLD}[run_spike.py] ELF file not found \
-- exiting.{clr.ENDC}")
    sys.exit(1)

print(f"{clr.OKBLUE}[run_spike.py] Running the CPU in simulation on {sys.argv[1]}.{clr.ENDC}")
if os.system(f"make run ASM={sys.argv[1]}"):
    print(f"{clr.FAIL}{clr.BOLD}[run_spike.py] make run failed \
-- exiting.{clr.ENDC}")
    sys.exit(1)


print(f"{clr.OKBLUE}[run_spike.py] Running spike on {sys.argv[1]}.{clr.ENDC}")

argument = sys.argv[1]
file = open("sim/spike.log")
count_spike_log = len(list(file)) + 100
file.close()

if sys.argv[1][-2:] == ".s":
    argument = sys.argv[1].split('/')[-1][:-2] + '.elf'

    proc = subprocess.call(f"bin/generate_memory_file.sh {sys.argv[1]} &> /dev/null && cp sim/bin/{argument} \
    . && /class/ece411/software/spike_new/bin/spike --isa=rv32ima \
    -m0x40000000:0x80000000 --log-commits {argument} 2>&1 | head -n {count_spike_log} &> \
    sim/spike_gold.log", shell = True, timeout = 1)

    if proc != 0:
        print(f"{clr.WARNING}Spike failed, check sim/spike_gold.log.{clr.ENDC}")
        sys.exit(1)

    os.system(f"rm {argument}")

else:
    if os.system(f"/class/ece411/software/spike_new/bin/spike --isa=rv32imc \
    -m0x40000000:0x80000000 --log-commits {argument} &>\
    sim/spike_gold.log"):
        print(f"{clr.WARNING}Spike failed, check sim/spike_gold.log.{clr.ENDC}")
        sys.exit(1)

print(f"{clr.OKBLUE}[run_spike.py] Stripping sim/spike_gold.log.{clr.ENDC}")
strip = int(os.popen('grep -n "3 0x80000000" sim/spike_gold.log').read().splitlines()[0].split(":")[0])
os.system(f"tail -n +{strip} sim/spike_gold.log > sim/tmp.log")
os.system("mv sim/tmp.log sim/spike_gold.log")

last_line = os.popen("tail -n 1 sim/spike.log").read()
cnt = 0
for line in reversed(list(open("sim/spike_gold.log", "r"))):
    if line == last_line:
        cnt += 1
os.system(f"head -n -{cnt-1} sim/spike_gold.log > sim/tmp.log")
os.system("mv sim/tmp.log sim/spike_gold.log")

if not os.system("cmp sim/spike.log sim/spike_gold.log&>/dev/null"):
    print(f"{clr.OKGREEN}{clr.BOLD}[PASS] {sys.argv[1]}: sim/spike.log and sim/spike_gold.log are identical.{clr.ENDC}")
else:
    print(f"{clr.FAIL}{clr.BOLD}[FAIL] {sys.argv[1]}: sim/spike.log and sim/spike_gold.log differed.{clr.ENDC}")
