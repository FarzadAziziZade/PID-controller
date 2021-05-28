clc
clear all 
close all
Cc=1;
Cr=1;
R=6;
r=1;
M=3;
m=0.3;
k=1000;
%GH
A=[1 0];
B=[1];
C=[1];
D=[1];
E=[R-r];
F=[m-(7/5)*(M+m) -(M+m)*Cr/(m*r^2)-(7*Cc/5) -(7*k/5)-(Cc*Cr)/(m*r^2) -(k*Cr)/(m*r^2)];
G=[1];
H=[1];
f=conv(conv(conv(A,B),C),D);
b=conv(conv(conv(E,F),G),H);
GH = tf(f,b);
poless=roots(b);
zeros=roots(f);
sys=feedback(GH,1);
rlocus(GH)
grid on
figure
step(sys);
grid on
figure
bode(GH,'.-')
grid on
figure
nyquist(GH)
grid on
v=[-0.005 0.005 -0.008 0.008];axis(v)
info=stepinfo(sys);
% figure
% impulse(sys);
%controlSystemDesigner('rlocus',GH)
df=polyder(f);
db=polyder(b);
c1=conv(b,df);
c2=conv(f,db);
ss=-29.57+3.46i;
k=-polyval(b,ss)/polyval(f,ss);
ag=(180/pi)*angle(polyval(f,ss)/polyval(b,ss));