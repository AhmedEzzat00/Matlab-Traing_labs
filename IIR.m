clear all;
wp=.2*pi; rp=-20*log10(0.89125);
ws=.3*pi; rs=-20*log10(0.17783); Fs=1;
wap=wp*Fs; was=ws*Fs;
[n,wn]=buttord(wap,was,rp,rs,'s') ;
[z,p,k]=buttap(n);
[bp,ap]=zp2tf(z,p,k);
[bs,as]=lp2lp(bp,ap,wn);
%[bs,as] = butter(n,wn,'s');
[bz,az]=impinvar(bs,as,Fs);
[Hz,Wz] = freqz(bz,az,512);
subplot(311);plot(Wz,20*log10(abs(Hz)),'r');

grid on 
axis ([0 pi -100 20]);
set(gca,'XTick',0:0.2*pi:pi );
set(gca ,'XTickLabel',{'0','0.2?','0.4?','0.6?','0.8?','?'});
set(gca,'YTick',-100:20:20)
set(gca ,'YTickLabel',{' -100','-80',' -60',' -40',' -20','0','20'});
xlabel ('Frequency (Hz)'), ylabel ('Magnitude (dB)'); 
title('Log Magnitude Response '); 