function data = load_data()

% Native will load the file with the orignal format, which is int16 for
% test.wav
[y,fs] = audioread("tada.mp3", "double");

%sound(y,fs);

y = y(:,1);

%data = int16(y*double(intmax('int16')));

data = y;

%Tror man kan bruke num2hex for å omgjort fra flyttal til heltall. 
%Prøvde splitte hexstrengen og lage uint16 array av det, men fikk det ikke
%til. Kanskje men kan prøve en annen audioread evt. Finnes en dsp variant.

%Kan også teste med elsys.mp3

%hexy = num2hex(y);


