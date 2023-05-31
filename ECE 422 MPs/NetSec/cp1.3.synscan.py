from scapy.all import *

import sys

def debug(s):
    print('#{0}'.format(s))
    sys.stdout.flush()

if __name__ == "__main__":
    conf.iface = sys.argv[1]
    ip_addr = sys.argv[2]

    my_ip = get_if_addr(sys.argv[1])
    
    # SYN scan
    # reference: https://santandergto.com/en/guide-using-scapy-with-python/ 

    for port in range(1, 1025):
        syn = IP(dst = ip_addr) / TCP(dport = port, flags = "S")
        synack = sr1(syn, timeout = 1, verbose = 0)

        if synack and synack.haslayer(TCP) and synack[TCP].flags == 0x12:
            rst = IP(dst = ip_addr) / TCP(dport = 1, flags = "R")
            send(rst, verbose = 0)
            print(ip_addr + ", " + str(port))

