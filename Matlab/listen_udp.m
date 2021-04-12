
            
% Listen on all available Ethernet interfaces at local port 8000.
% Specify a LocalHost (host name or IP address) if known
u = udp('', 'LocalHost', '', 'LocalPort', 26363);
u.EnablePortSharing = 'on';

fopen(u);
            
% create our clean up object
cleanupObj = onCleanup(@() cleanMeUp(u));
        
while 1
% Receive a single UDP packet
packetData = fread(u);
disp(size(packetData));
end

 % fires when main function terminates
function cleanMeUp(u)
    % Clean up
    fclose(u);
    delete(u);
    clear u;
end