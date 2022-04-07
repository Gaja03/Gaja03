clc;
clear all;
close all;
% design of iir filter
% filter specification
% input wp,ws,sp,ss,t
% t=1,both ripple gains should be b/w .1to.3.
disp('butter lowpass filter usig impulse invariant method');
t=input('enter the sampling frequency in rad/sec :');
sp=input('enter the pass-band ripple gain:');
wp=input('enter the pass-band edge frequency in rad/sec:');
ss=input('enter the stop band ripple gain:');
ws=input('enter the stop band edge frequency in rad/sec:');
%calculation of ohmp,ohms,ap,as
ap=abs(20*log10(1-sp));
as=abs(20*log10(ss));                                                                                                  
ohmp=wp/t;                                          
ohms=ws/t;
clear all;
close all;
% design of iir filter
% filter specification
% input wp,ws,sp,ss,t
% t=1,both ripple gains should be b/w .1to.3.
disp('chebysher lowpass filter usig impulse invariant method');
t=input('enter the sampling frequency in rad/sec :');
sp=input('enter the pass-band ripple gain:');
wp=input('enter the pass-band edge frequency in rad/sec:');
ss=input('enter the stop band ripple gain:');
ws=input('enter the stop band edge frequency in rad/sec:');
%calculation of ohmp,ohms,ap,as
ap=abs(20*log10(1-sp));
as=abs(20*log10(ss));                                                                                                  
ohmp=wp/t;                                          
ohms=ws/t;
%chebysew filter
%butterworth filter
% calculation of order and cutoff frequency for the above filter specifications
[n,wc]=buttord(ohmp,ohms,ap,as,'s');
% low pass filter
[b,a]=butter(n,wc,'low','s');
[bz,az]=impinvar(b,a,t);
if[bz,az,t];
    o=linspace(-pi,pi,50);
    %0 is the freq coaxis
    h=freqz(bz,az,o);
    %magnitude response
    hm=20*log10(abs(h));
    subplot(2,1,1);
    semilogx(o,hm);
    xlabel('frequency');
    ylabel('magnitude');
    title('magnitude response or iir filter using impulse invariant method');
    %phase response
    wp= input('enter the pass-band edge frequency in rad/sec:');
    ss=input('enter the stop band ripple gain:');
ws=input('enter the stop band edge frequency in rad/sec:');
%calculation of ohmp,ohms,ap,as
ap=abs(20*log10(1-sp));
as=abs(20*log10(ss));
ohmp=wp/t;
ohms=ws/t;
%chebysew filter
%butterworth filter
% calculation of order and cutoff frequency for the above filter specifications
[n,wc2]=cheb1ord(ohmp,ohms,ap,as,'s');
% low pass filtering 
[b,a]=cheby1(n,0.5,wc2,'low','s');
[bz,az]=bilinear(b,a,1/t);
end
if[bz,az,t];
    o=linspace(-pi,pi,50);
    %0 is the freq coaxis
    h=freqz(bz,az,o);
    % magnitude response
    ha=angle(h);
    subplot(2,1,2);
    semilogx(o,ha);
    xlabel('frequency');
    ylabel('phase');
    title('phase response or iir filter using impulse invariant method');
end