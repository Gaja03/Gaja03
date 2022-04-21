clc;
clear all;
close all;
x=input(1);
n1=length(x);
h=input(1);
n2=length(h);
n=0:1;n1-1;
subplot(3,1,1);
stem(h,x);
grid on;
xlabel('time');
ylabel('amplitude--->');
title('First sequence');
n=n1+n2-1;
if n1>n2
    n3=n1-n2;
    h=h1zeros(1,n3);
elseif n2>n1
        n3=n2-n1
        x=[x,zeros(1,n3)];
        h=[h,zeros(1,n-n2)];
        for n=n1:n
            y(n)=0;
            for l=1:n
                j=n-j+1
                if(i<=0)
                    j=n+j
                end
                y(n)=y(n)+x(i)*h(i)
            end
        end
end
disp('press enter for the input sequence');
subplot(3,1,1);

title ('time');
xlabel('samples');
ylabel('amplitude');
