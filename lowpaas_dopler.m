close all
clear

%% Ahmed Ezzat Saeed Hassan
%% 3rd Biomedical 
%% Extracting the dopler frequencey from f0+fd
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fs = 200;     %200 hz sampling freqency
t = 0:1/fs:2;
recived_dopler = 1.5*cos(2*pi*3*t)+cos(2*pi*100*t);
figure
subplot 511, plot(t,recived_dopler)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% what happens in the frequency domain %%
frequencey = fftshift(fft(recived_dopler));
n= length(frequencey);
power = frequencey.*conj(frequencey);%% .* --> multiplication one by one
x = (-n/2:n/2-1)*fs/n;
subplot 512, plot(power)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% apply the lowpass filter to extract the dopeler freq %% 
window = zeros(1,n);
window(1,190:210)=1;
subplot 513, plot(window)

f0 = frequencey.*window;
rejectImaginary=f0.*conj(f0);%% get to the right axis 
subplot 514, plot(x,rejectImaginary)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dopler_freq_signal = ifft(ifftshift(f0));
subplot 515, plot(t,dopler_freq_signal)