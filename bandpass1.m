close all
clear

%%%%%% Let's Start %%%%%
%%%% Genrating the Signal%%%

fs=350;
t=0:1/fs:1;

amplitude=5;
signal=amplitude*1.2*sin(2*pi*25*t);
figure 
subplot(5,1,1),plot(t,signal);

%%%% Adding noise %%%
snr=1;  %%Signal to Noise Ratio
stream_of_randoms=amplitude*0.5;
noise_signal=awgn(signal,snr,stream_of_randoms); 
subplot(5,1,2),plot(t,noise_signal);

%%% Viewing Noise at the Frequency Domain %%%

f = fftshift(fft(noise_signal));
n= length(f);
power = f.*conj(f);%% multiplication one by one
x = (-n/2:n/2-1)*fs/n;
subplot(5,1,3),plot(x,f);

%w_desired is between 1200 to 2200;
w=[5/(fs/2) 30/(fs/2)]; %w= [starting cut-off limit ,ending cut-off limit]
n=50; %where n is order of the filter
b=fir1(n,w,'bandpass');%command to design a band pass filter
figure(1);
freqz(b,1,128,fs) %command to plot frequency response of filter
figure(2);

outlo = filter(b,1,noise_signal);
subplot(5,1,4),plot(t,outlo);