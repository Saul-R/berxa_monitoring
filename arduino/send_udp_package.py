import socket
import sys

UDP_IP = "monitoring.piscifactoriaberxa.com"
UDP_PORT = 8089
# TODO: Device tag should be auto fetched
MESSAGE = "sensor_data,device=yun1 distance=" + sys.argv[1]

sock = socket.socket(socket.AF_INET, # Internet
             socket.SOCK_DGRAM) # UDP
sock.sendto(MESSAGE, (UDP_IP, UDP_PORT))
