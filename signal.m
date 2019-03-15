fs=1;
t=0:1/fs:50;


original_signal=5*rectangularPulse(0,4,t);
subplot(2,2,1);
plot(t,original_signal);

a=0.7;
T=32;
ads=a*5*rectangularPulse(T,T+4,t);
subplot(2,2,2);
plot(t,ads);



sa=1;
received_signal = awgn(ads,sa,'measured');
subplot(2,2,3);
plot(t,received_signal);


%the last signal
%cross-correlate the orignal signal with the received signal to find the
%delay

[arrayCorr,delay] =xcorr(original_signal,received_signal);

%adjust to half size of the signal
N=length(original_signal);
R=arrayCorr(1:N);
Rrx=fliplr(R);

subplot(2,2,4);
plot(t,Rrx);

%Extracting the delayTime(sample)
[~,index] = max(abs(arrayCorr));
delayDiff = delay(index);
timeDelay = abs(delayDiff/frequencySample);
disp(timeDelay);


