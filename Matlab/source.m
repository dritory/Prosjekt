function data = source(offset_bits, length_bits)

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

fileID = fopen("temp.ogg");

% Move to correct position in file
%fseek(fileID, offset_bytes, 'bof');

% Read data
data = fread(fileID,'*ubit1', 'ieee-le');

fclose(fileID);


