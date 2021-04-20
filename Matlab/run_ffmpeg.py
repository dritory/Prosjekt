
import subprocess

package_size_bytes = 32
sample_rate = "8k" #hertz
bit_rate = "8k"

compression_level = "5"
page_duration = "100000"

file_name = "elsys.mp3"
port = 26363

subprocess.run(["ffmpeg", "-re", "-y", "-i",file_name,"-vn", "-b:a", bit_rate,"-ar",sample_rate,"-compression_level",compression_level, "-application", "voip","-page_duration", page_duration,"-c:a","libopus","-f","ogg","udp://127.0.0.1:"+ str(port) + "?pkt_size="+str(package_size_bytes),])
