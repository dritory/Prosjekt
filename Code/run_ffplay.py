

import subprocess

port = 36363
sample_rate = "16k" #hertz
bit_rate = "8k"

compression_level = "5"

subprocess.run(["ffplay", "-err_detect", "ignore_err", "-loglevel", "verbose", "-vn", "-ab", bit_rate,"-ar",sample_rate,"-compression_level",compression_level, "-application", "audio", "-codec:a","libopus", "-i", "udp://127.0.0.1:"+ str(port) + "?listen", "-nodisp",])
#subprocess.run(["ffplay", "-err_detect", "ignore_err", "-vn", "-ab", bit_rate,"-ar",sample_rate, "-i", "udp://127.0.0.1:"+ str(port) + "?listen", "-nodisp",])
