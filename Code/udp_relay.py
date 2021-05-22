import socket
import time

IP = "127.0.0.1"
source_port = 36363
sink_port = 46363
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

sock.bind((IP, source_port))

sock2 = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)


last = time.time()
while True:
    elapsed =  time.time() - last
    last = time.time()
    data, addr = sock.recvfrom(50000)
    #print(len(data),data.decode("ansi", errors = 'strict'))
    sock2.sendto(data, (IP, sink_port))
