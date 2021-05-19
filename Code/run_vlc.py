import os
os.environ['PATH'] = r'C:\Program Files\VideoLAN\VLC' + os.pathsep + os.environ['PATH']
import vlc


print("Starting vlc")
i = vlc.Instance("--file-caching=10000", "--network-caching=100","--live-caching=10000", "--clock-jitter=0", "-vv")

p = i.media_player_new()
p.set_mrl('udp://@:36363')
p.play()


while True:
    pass
