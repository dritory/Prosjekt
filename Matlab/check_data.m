function check_data(signal)

%Convert from int16 to double
y = double(signal)/double(intmax('int16'));

sound(y, 44100);

plot(y);
