clc; 
clear all; 
close all;
x=input('enter the sequence x='); 
N=length(x);
y=x; z=x;
for i=1:N-1
for i=N-1:-1:1
x(i+1)=x(i); 
end
x(1)=0;
z=[z;x]; 
end
m=[z]*[y'];
m=m/N 
stem(m);
 xlabel('time');
ylabel('amplitude');
 title('autocorrelation');