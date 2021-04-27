import socket

IP = "127.0.0.1"
source_port = 26363
sink_port = 36363
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

sock.bind((IP, source_port))

sock2 = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

while True:
    data, addr = sock.recvfrom(32)
    print(len(data),data.decode("ansi", errors = 'strict'))
    sock2.sendto(data, (IP, sink_port))