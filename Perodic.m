fs=100;
t=0:1/fs:100;


first_signal=5*rectangularPulse(0,4,t);
subplot(2,2,1);
plot(t,first_signal);




attenuation=0.7;
T=32;
second_signal=attenuation*5*rectangularPulse(T,T+4,t);
subplot(2,2,2);
plot(t,second_signal);




noise=1;
receive_signal = awgn(second_signal,noise,'measured');
subplot(2,2,3);
plot(t,receive_signal);





[arrayCorr,delay] =xcorr(first_signal,receive_signal);


sample=length(first_signal);
R=arrayCorr(1:sample);
correlated_signal=fliplr(R);

subplot(2,2,4);
plot(t,correlated_signal);


[~,index] = max(abs(arrayCorr));
delay = delay(index);
timeDelay = abs(delay/fs);
display(timeDelay)



