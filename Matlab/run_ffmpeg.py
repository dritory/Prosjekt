
import subprocess

package_size_bytes = 32
sample_rate = "8k" #hertz
bit_rate = "8k"

file_name = "elsys.mp3"
port = 26363


subprocess.run(["ffmpeg", "-re", "-y", "-i",file_name,"-vn", "-b:a", bit_rate, "-ar",sample_rate, "-c:a","libopus","-f","ogg",  "udp://127.0.0.1:"+ str(port) + "?pkt_size="+str(package_size_bytes),])
