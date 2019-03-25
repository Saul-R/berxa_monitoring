import socket
import sys

UDP_IP = "192.168.1.44"
UDP_PORT = 8089
MESSAGE = "distance value=" + sys.argv[1]

sock = socket.socket(socket.AF_INET, # Internet
             socket.SOCK_DGRAM) # UDP
sock.sendto(MESSAGE, (UDP_IP, UDP_PORT))
