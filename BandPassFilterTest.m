%%Ahmed Ezzat Said

close all
clear

%%%%%% Let's Start %%%%%
%%%% Genrating the Signal%%%

fs=350;
t=0:1/fs:1;

amplitude=5;
f1=10;
f2=25;
signal=amplitude*sin(2*pi*f1*t)+amplitude*1.2*sin(2*pi*f2*t);
figure 
subplot(4,1,1),plot(t,signal);

%%%% Adding noise %%%
snr=1;  %%Signal to Noise Ratio
stream_of_randoms=amplitude*0.5;
noise_signal=awgn(signal,snr,stream_of_randoms); 
subplot(4,1,2),plot(t,noise_signal);

%%% Viewing Noise at the Frequency Domain %%%

f = fftshift(fft(noise_signal));
n= length(f);
power = f.*conj(f);%% multiplication one by one
x = (-n/2:n/2-1)*fs/n;
subplot(4,1,3),plot(x,f);

%% Adding BandPass Filter %%%
%width desired is between f1 to f2;
band_width=[f1/(fs/2) f2/(fs/2)]; % [starting cut-off limit ,ending cut-off limit]
order=50; %where n is order of the filter
b=fir1(order,band_width,'bandpass');%command to design a band pass filter


filtered_signal = filter(b,1,noise_signal);
subplot(4,1,4),plot(t,filtered_signal);

%%nice and clean =D %%