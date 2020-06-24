close all;
clear all;

load train_bird.mat

x = [1:12880];

subplot(2,1,1), plot(x,y);
title('Original time-based plot');
Y = fft(y)/12880;
subplot(2,1,2), stem(x,abs(Y),'Marker','none');
title('Original frequency-based plot');

Q_low = zeros(12880,1);
Q_low(1:2880) = 1;
Q_low(10001:12880) = 1;
Y_low = Y.*Q_low;
subplot(2,1,2), stem(x,abs(Y_low),'Marker','none');
title('low pass filter frequency-based plot');
y_low = real(ifft(Y_low)*12880);
subplot(2,1,1), plot(x,y_low,'Marker','none');
title('low pass filter time-based plot');
audiowrite('train.wav',y_low,Fs);

Q_high = zeros(12880,1);
Q_high(4881:8000) = 1;
Y_high = Y.*Q_high;
subplot(2,1,2), stem(x,abs(Y_high),'Marker','none');
title('high pass filter frequency-based plot');
y_high = real(ifft(Y_high)*12880);
subplot(2,1,1), plot(x,y_high,'Marker','none');
title('high pass filter time-based plot');
audiowrite('bird.wav',y_high,Fs);
