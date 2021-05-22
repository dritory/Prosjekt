import socket
import time
from timeit import default_timer as timer
import opuslib
import wave
import simpleaudio as sa
import multiprocessing
IP = "127.0.0.1"
source_port = 46363

channels = 1
sample_rate = 48000
framesize = 960

def udp_sink (raw_queue):
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.bind((IP, source_port))


    raw_buffer_size = 2
    raw_buffer = [0]*raw_buffer_size
    raw_current_pos = 0
    last = b""
    while True:
        data, addr = sock.recvfrom(4096)
        if len(data) <= 0:
            continue
        raw_buffer[raw_current_pos] = data
        raw_current_pos += 1
        if raw_current_pos >= raw_buffer_size:
            raw_current_pos = 0

        raw = b"".join([last,data])

        raw_queue.put(raw)
        last = data



def decode(audio_queue, raw_queue):

    decoder = opuslib.Decoder(sample_rate, channels)

    audio_buffer_size = 200
    audio_buffer = [0]*audio_buffer_size
    audio_cur_pos = 0
    next = b''

    header = bytes.fromhex('012301230123012301230123').hex()
    msg_len = 500
    frame_len = 20

    h_len = len(header)//2
    while True:
        raw = raw_queue.get()
        frame_index = -1
        packet = b''
        for b in range(0, len(raw), 1):
            seq = raw[b:b+h_len].hex()
            if(seq == header):
                frame_index = b
                break
        if frame_index >= 0:
            packets = 0
            packet = raw[frame_index + h_len:frame_index + h_len + msg_len]
            print(frame_index, len(packet), len(next))
            next = raw[frame_index + h_len + msg_len:]

            for i in range(0, len(packet), frame_len):
                try:
                    decoded = decoder.decode(packet[i:i+frame_len], framesize)
                    audio_buffer[audio_cur_pos] = decoded
                    audio_cur_pos += 1
                except opuslib.exceptions.OpusError as e:
                    print(e)

                if audio_cur_pos >= audio_buffer_size :
                    audio = b"".join(audio_buffer)
                    print(len(audio))
                    audio_cur_pos = 0
                    audio_queue.put(audio)

        else:
            next = raw




def player(audio_queue):
        sound = audio_queue.get()
        while(True):
            play = sa.play_buffer(sound, channels, 2, sample_rate)
            sound = audio_queue.get()
            play.wait_done()

if __name__ == '__main__':

    audio_queue = multiprocessing.SimpleQueue()
    raw_queue = multiprocessing.SimpleQueue()
    multiprocessing.Process(target=udp_sink, daemon=True, args=(raw_queue,)).start()
    multiprocessing.Process(target=decode, daemon=True, args=(audio_queue,raw_queue)).start()

    player(audio_queue)

    #time.sleep(0.001)
