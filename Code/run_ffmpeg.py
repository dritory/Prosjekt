
import subprocess

package_size_bytes = 16
sample_rate = "16k" #hertz
bit_rate = "8k"

compression_level = "5"
page_duration = "500000"

file_name = "RadioGaGa.mp3"
port = 26363

subprocess.run(["ffmpeg", "-re", "-y", "-i",file_name,"-vn", "-ac", "1","-b:a", bit_rate,"-ar",sample_rate, "-compression_level",compression_level,"-vbr", "0","-application", "audio","-page_duration", page_duration,"-c:a","libopus","-f","ogg","udp://127.0.0.1:"+ str(port) + "?pkt_size="+str(package_size_bytes),])
#subprocess.run(["ffmpeg", "-re", "-y", "-i",file_name,"-vn", "-channels", "1","-b:a", bit_rate,"-ar",sample_rate,"-c:a","libmp3lame","-f","mp3","udp://127.0.0.1:"+ str(port)+ "?pkt_size="+str(package_size_bytes),])
