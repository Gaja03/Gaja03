clc; clear all; close all;
warning off;
disp('enter the IIR filter design specifications');
rp=input('enter the passband ripple');
rs=input('enter the stopband ripple');
wp=input('enter the passband freq');
ws=input('enter the stopband freq');
fs=input('enter the sampling freq');
w1=2*wp/fs;%normalized pass band frequency
w2=2*ws/fs;%normalized stop band frequency
[n,wn]=buttord(w1,w2,rp,rs);% Find the order n and cutoff frequency
ch=input('give type of filter 1:LPF,2:HPF');
 disp('Frequency response of Butterworth IIR LPF is:');
 [b,a]=butter(n,wn); % Find the filter coefficient of LPF
 [H,w]=freqz(b,a,512,fs);
 mag=20*log10(abs(H));
 phase=angle(H);
 subplot(211);
 plot(w,mag);grid on;
 ylabel('--> Magnitude in dB');
 xlabel('--> Normalized frequency in Hz');
 title('Magnitude Response of the desired Butterworh LPF');
subplot(212);

plot(w,phase);grid on;
 ylabel('--> Phase in radians');
 xlabel('--> Normalized frequency in Hz');
 title('Phase Response of the desired Butterworh LPF');