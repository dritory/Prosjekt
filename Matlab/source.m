function data = source()

%fclose(fileID);

%[y,fs] = audioread("tada.mp3", [offset, offset+ length], "double");

%mono = y(:,1);


%fileID = fopen("temp.wav", "w");

%fwrite(fileID, data,'*ubit1', 'ieee-le');

%fclose(fileID);

%fs = 44100; % 1/s
%bitrate = 9600; % b/s


%offset_seconds = offset_bits/fs;
%length_seconds = length_bits/fs;

%cmd = sprintf('ffmpeg -ss %f -t %f -y -i tada.mp3 -b:a %i -c:a libopus temp.ogg', offset_seconds, length_seconds, bitrate); 

%system(cmd)

%fileID = fopen("temp.ogg");

% Move to correct position in file
%fseek(fileID, offset_bytes, 'bof');

% Read data
%data = fread(fileID,'*ubit1', 'ieee-le');

%fclose(fileID);
            
% Listen on all available Ethernet interfaces at local port 8000.
% Specify a LocalHost (host name or IP address) if known
u1 = udp('', 'LocalHost', '', 'LocalPort', 26363, 'DatagramTerminateMode', 'on');
u1.EnablePortSharing = 'on';

fopen(u1);
            
% create our clean up object
cleanupObj = onCleanup(@() cleanMeUp(u1));

% Receive a single UDP packet
packetData = fread(u1);

%fileID = fopen("rec3.ogg", "w");

%fwrite(fileID, packetData,'uint8');

%fclose(fileID);

%[y,fs] = audioread("rec2.ogg", "double");


%bytes = dec2bin(packetData);
%data =  str2num(reshape(bytes.',[],1));

data = cast(packetData, 'uint8');

end

 % fires when main function terminates
function cleanMeUp(u1)
    % Clean up
    fclose(u1);
    delete(u1);
    clear u1;
end

