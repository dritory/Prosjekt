function udp_relay ()
            
% Listen on all available Ethernet interfaces at local port 8000.
% Specify a LocalHost (host name or IP address) if known

u1 = udp('', 'LocalHost', '', 'RemotePort',36363);
u1.EnablePortSharing = 'on';

u = udp('', 'LocalHost', '', 'LocalPort', 26363, 'DatagramTerminateMode', 'on');
u.EnablePortSharing = 'on';

fopen(u);
fopen(u1);
% ffmpeg -re -y -i elsys.mp3 -vn -vbr off -ar 16000 -b:a 20k -compression_level 5 -packet_loss 10 -application voip -codec:a libopus -page_duration 10 -f ogg udp://127.0.0.1:36363?pkt_size=16
%ffmpeg -re -y -i elsys.mp3 -c:a aac -movflags +faststart -ar 8000 -b:a 10k -vn -f adts udp://127.0.0.1:26363
% create our clean up object
cleanupObj = onCleanup(@() cleanMeUp(u));
cleanupObj2 = onCleanup(@() cleanMeUp(u1));

while 1

% Receive a single UDP packet
packetData = fread(u, 16, 'uint8');
disp(char(packetData.'));
disp(numel(packetData));
fwrite(u1, packetData, 'uint8');

end

 % fires when main function terminates
function cleanMeUp(u)
    % Clean up
    fclose(u);
    delete(u);
    clear u;
end

end