#%%

import ctypes
import sys, os

from opuslib.api.encoder import encode
sys.path.append(os.getcwd() + "/opus")
import socket
import time
import opuslib
import wave
#from reedsolo import RSCodec

IP = "127.0.0.1"
source_port = 26363
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

sample_rate = 48000
channels = 1
framesize = 960

encoder = opuslib.Encoder(sample_rate, channels, application=opuslib.APPLICATION_VOIP)

encoder.bitrate = 8000
encoder.complexity = 5
encoder.vbr = False

bitrate = 8000/(20*8)
period = 1/bitrate

t = time.time()

#rsc = RSCodec(4)

wav =  wave.open("RadioGaGa.wav", "r")
#%%
framestop = wav.getnframes() - framesize
decoder = opuslib.Decoder(sample_rate, channels)
encoded_data = b""
decoded_data = b""
next_packet = b""

def mix_mono(pcm : bytes):
    assert len(pcm) % 2 == 0
    output = [0]*(len(pcm)//2)
    for i in range(0, len(output)):
        #ch1 = int.from_bytes(pcm[i*4:i*4 + 2], byteorder='little')
        #ch2 = int.from_bytes(pcm[i*2 + 2:i*2 + 3], byteorder='little')
        output[i] = pcm[i*4:i*4 + 2]#int.to_bytes(ch1,2, byteorder='little')
    output = b"".join(output)
    return output


def take_one_channel(pcm, channel=0, bytes_per_sample=2):
    output = pcm[channel::2*bytes_per_sample]
    return output

def encode_data(wav_file):
    pcm = bytes(wav_file.readframes(framesize))
    pcm = mix_mono(pcm)
    encoded = encoder.encode(pcm, framesize)
    return encoded

encoded_data = b""
#%%
while wav.tell() < framestop:
    t += period

    encoded = encode_data(wav)
    encoded_data += encoded
    if(len(encoded_data) >= 20*25):
        #encoded_data = rsc.encode(encoded_data)
        encoded_data = bytes.fromhex('0123456789abcedfdecba987') + encoded_data
        sock.sendto(encoded_data, (IP, source_port))
        print(len(encoded), len(encoded_data))
        encoded_data=b""

    #time.sleep(max(0,t-time.time()))

# %%
