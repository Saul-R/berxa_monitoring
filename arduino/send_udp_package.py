import socket
import sys

UDP_IP = "35.246.55.79 "
UDP_PORT = 8089
MESSAGE = "distance value=" + sys.argv[1]

sock = socket.socket(socket.AF_INET, # Internet
             socket.SOCK_DGRAM) # UDP
sock.sendto(MESSAGE, (UDP_IP, UDP_PORT))
