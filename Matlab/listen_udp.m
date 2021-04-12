function listen_udp ()
            
% Listen on all available Ethernet interfaces at local port 8000.
% Specify a LocalHost (host name or IP address) if known
u = udp('', 'LocalHost', '', 'LocalPort', 26363);
u.EnablePortSharing = 'on';

fopen(u);
            
% create our clean up object
cleanupObj = onCleanup(@() cleanMeUp(u));
        
% Receive a single UDP packet
packetData = fread(u, 546, 'uint8');
data = reshape(dec2bin(packetData).',[],1);
disp(data);

 % fires when main function terminates
function cleanMeUp(u)
    % Clean up
    fclose(u);
    delete(u);
    clear u;
end

end