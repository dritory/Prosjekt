import socket






IP = "127.0.0.1"
sink_port = 46363
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

sock.bind((IP, sink_port))


while True:
    data, addr = sock.recvfrom(32)
    print(len(data),data.decode("ansi", errors = 'strict'))
