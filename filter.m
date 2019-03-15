close all
clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fs = 200;     %200 hz sampling freq
t = 0:1/fs:2;
signal = 1.5*sin(2*pi*20*t)+1.8*sin(2*pi*40*t);
figure
subplot 511, plot(t,signal)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f = fftshift(fft(signal));
n= length(f);
power = f.*conj(f);%% multiplication one by one
x = (-n/2:n/2-1)*fs/n;
subplot 512, plot(power)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
window = zeros(1,n);
window(1,150:250)=1;
subplot 513, plot(window)

f0 = f.*window;
rejectImaginary=f0.*conj(f0);
subplot 514, plot(x,rejectImaginary)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
signal1 = ifft(ifftshift(f0));
subplot 515, plot(t,signal1)