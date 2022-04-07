clc;
close all;
clear all;
format long
rp=input('enter the passband ripple');
rs=input('enter stopband ripple');
wp=input('enter passband freq');
ws=input('enter stopband freq');
fs=input('enter sampling freq');
w1=2*wp/fs;
w2=2*ws/fs;
%Analog LPF
[n,wn]= buttord(w1,w2,rp,rs);
[b,a]=butter(n,wn,'s');
w=0:.01:pi;
[h,om]=freqs(b,a,w);
m=20*log10(abs(h));
an=angle(h);
figure(3)
plot(om/pi,m);
title('**** Analog Output Magnitude *****');
ylabel('gain in db...>');
xlabel('normalised freq..>');
figure(2)
plot(om/pi,an);
title('**** Analog Output Phase ****');
xlabel('normalised freq..>');
ylabel('phase in radians...>');
n
wn
%Digital LPF
[n,wn]= buttord(w1,w2,rp,rs);
[b,a]=butter(n,wn);
w=0:.01:pi;
[h,om]=freqz(b,a,w);
m=20*log10(abs(h));
an=angle(h);
figure(1)
plot(om/pi,m);
title('**** Digital Output Magnitude *****');
ylabel('gain in db...>');
xlabel('normalised freq..>');
figure(4)
plot(om/pi,an);
title('**** Digital Output Phase ****');
xlabel('normalised freq..>');
ylabel('phase in radians...>');
n
wn