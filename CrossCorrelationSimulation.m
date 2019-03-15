%Ahmed Ezzat Saeed Hassan 


frequencySample=100;
t=0:1/frequencySample:100;

%the frist signal x(n)
%send with a width 4 sample,5 in amplitude starting from 0 

original_signal=5*rectangularPulse(0,4,t);
subplot(2,2,1);
plot(t,original_signal);
xlabel('Sample (n))')
ylabel('Amplitude') 
title('Original Signal( x(n) )')

%the second signal xd(n)
%received signal with attenuation factor of alpha and delay T
alpha=0.7;
T=32;
attenuated_and_delayed_signal=alpha*5*rectangularPulse(T,T+4,t);
subplot(2,2,2);
plot(t,attenuated_and_delayed_signal);
xlabel('Sample (n))')
ylabel('Amplitude') 
title('Attenuated with Delay signal( xd(n) )')


%the third signal 
%due to noise the signal will be added distortion signal with noise
%amplitude sigma(signal to noise ration)
sigma=1;
received_signal = awgn(attenuated_and_delayed_signal,sigma,'measured');
subplot(2,2,3);
plot(t,received_signal);
xlabel('Sample (n))')
ylabel('Amplitude') 
title('Received Signal with noise( r(n) )')

%the last signal
%cross-correlate the orignal signal with the received signal to find the
%delay

[arrayCorrValues,arrayCorrIndex] =xcorr(original_signal,received_signal);

%adjust to half size of the signal
N=length(original_signal);
R=arrayCorrValues(1:N);
Rrx=fliplr(R);

subplot(2,2,4);
plot(t,Rrx);
xlabel('Sample (n))')
ylabel('Amplitude') 
title('Cross-Correlation Sequence( Rxy(m) )')

%Given the  peak of the crossCorrelation sequence calculated the delay (Sample)
[~,indexOfPeak] = max(abs(arrayCorrValues));
delayDiff = arrayCorrIndex(indexOfPeak);
timeDelay = abs(delayDiff/frequencySample);
h = msgbox(['Time delay between the two signal will be at the max value : ' num2str(timeDelay) ],'Time Delay');




