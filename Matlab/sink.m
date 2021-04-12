function sink(data)

fileID = fopen("temp.ogg", "w");

fwrite(fileID, data,'*ubit1', 'ieee-le');

fclose(fileID);

[y,fs] = audioread("temp.ogg", "double");

sound(y, fs);

plot(y);