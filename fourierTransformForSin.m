 Fs = 1000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1500;             % Length of signal
time = (0:L-1)*T;        % Time vector
 sinwave = 0.7*sin(2*pi*50*time) + sin(2*pi*120*time);
 subplot(2,1,1);
plot(1000*time(1:50),sinwave(1:50))
 xlabel('Time ')
ylabel('Amplitude') 
title('Sine Wave')


Y = fft(sinwave);     
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
subplot(2,1,2);
f = Fs*(0:(L/2))/L;
plot(f,P1) 
title('Amplitude ')
xlabel('f (Hz)')
ylabel('|P1(f)|')