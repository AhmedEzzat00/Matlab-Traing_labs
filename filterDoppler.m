%%Ahmed Ezzat Said

close all
clear

%%%%%% Let's Start %%%%%
%%%% Genrating the Signal%%%

fs=500;
t=0:1/fs:1;

amplitude=2;
f1=20;
f2=200;
signal=amplitude*cos(2*pi*f1*t)+amplitude*0.7*cos(2*pi*f2*t);
figure 
subplot(4,1,1),plot(t,signal);

%%%% Adding noise %%%
%snr=1;  %%Signal to Noise Ratio
%stream_of_randoms=amplitude*0.5;
%noise_signal=awgn(signal,snr,stream_of_randoms); 
%subplot(4,1,2),plot(t,noise_signal);

%%% Viewing Noise at the Frequency Domain %%%

f = fftshift(fft(signal));
n= length(f);
power = f.*conj(f);%% multiplication one by one
x = (-n/2:n/2-1)*fs/n;
subplot(4,1,2),plot(x,f);

%% Adding BandPass Filter %%%
%width desired is between f1 to f2;
band_width=[0.01/(fs/2) f1/(fs/2)]; % [starting cut-off limit ,ending cut-off limit]
order=50; %where n is order of the filter
b=fir1(order,band_width,'low');%command to design a band pass filter


filtered_signal = filter(b,1,signal);
subplot(4,1,3),plot(t,filtered_signal);


%%% Viewing Noise at the Frequency Domain %%%

f = fftshift(fft(filtered_signal));
n= length(f);
power2 = f.*conj(f);%% multiplication one by one
x = (-n/2:n/2-1)*fs/n;
subplot(4,1,4),plot(x,f);



%%nice and clean =D %%