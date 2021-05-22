import ctypes
import sys, os

from opuslib.api.encoder import encode
sys.path.append(os.getcwd() + "/opus")
import socket
import time
import opuslib
import wave
import simpleaudio as sa

IP = "127.0.0.1"
source_port = 46363
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

sample_rate = 8000
channels = 1
framesize = 160

encoder = opuslib.Encoder(sample_rate, channels, application=opuslib.APPLICATION_VOIP)

encoder.bitrate = 8000
encoder.complexity = 5
encoder.vbr = False

bitrate = 8000
period = 1/bitrate

t = time.time()

wav =  wave.open("RadioGaGa.wav", "r")
#%%
framestop = wav.getnframes() - framesize
decoder = opuslib.Decoder(sample_rate, channels)
encoded_data = b""

def mix_mono(pcm : bytes):
    assert len(pcm) % 2 == 0
    output = [0]*(len(pcm)//2)
    for i in range(0, len(output)):
        #ch1 = int.from_bytes(pcm[i*4:i*4 + 2], byteorder='little')
        #ch2 = int.from_bytes(pcm[i*2 + 2:i*2 + 3], byteorder='little')
        output[i] = pcm[i*4:i*4 + 2]#int.to_bytes(ch1,2, byteorder='little')
    output = b"".join(output)
    return output


def encode_data(wav_file):
    pcm = bytes(wav_file.readframes(framesize))
    pcm = mix_mono(pcm)
    encoded = encoder.encode(pcm, framesize)
    return encoded

#%%
while wav.tell() < framestop:
    t += period

    encoded = encode_data(wav)
    print(len(encoded))
    encoded_data += encoded

    sock.sendto(encoded, (IP, source_port))
