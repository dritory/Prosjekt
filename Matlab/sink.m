function sink(data)

bits = reshape(data,8,[])';

binary = arrayfun(@(x)sprintf('%d',x), bits);
bytes = bin2dec(binary);
bytes = cast(bytes, 'uint8');

u = udp('', 'LocalHost', '', 'LocalPort', 36363);
u.EnablePortSharing = 'on';

fopen(u);

cleanupObj = onCleanup(@() cleanMeUp(u));


fwrite(u, bytes, 'uint8');

%fileID = fopen("rec.ogg", "w");

%fwrite(fileID, bytes,'uint8');

%fclose(fileID);

%[y,fs] = audioread("rec.ogg", "double");

%sound(y, fs);

%plot(y);

end
 % fires when main function terminates
function cleanMeUp(u)
    % Clean up
    fclose(u);
    delete(u);
    clear u;
end